class Booking < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  after_create :send_booking_creating_email

  belongs_to :property  
  belongs_to :guest, class_name: 'Partner', foreign_key: 'guest_id', inverse_of: :as_guest_bookings

  has_one :hoster, through: :property, source: :owner

  validates :guest_name, :guest_phone, presence: true
  validates :check_out, :check_in, presence: true, if: -> { room_id.present? }
  validates :guest_email, presence: true,
                          length: {maximum: 255, minimum: 6},
                          format: {with: VALID_EMAIL_REGEX}
  validate  :check_dates, if: :dates_present?  
  
  private

  def dates_present?
    check_in.present? && check_out.present?
  end

  def check_dates
    errors.add(:check_in, "должна быть раньше даты оконачания") if check_in >= check_out
  end

  def send_booking_creating_email
    ListingMailer.booking_created(self).deliver_now
  end  
end
