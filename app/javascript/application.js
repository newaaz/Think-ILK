// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import './custom/add_jquery'

import * as bootstrap from "bootstrap"
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

import "cocoon-js-vanilla";

import { Fancybox } from "@fancyapps/ui/src/Fancybox/Fancybox.js";

// functions of theme
import "./custom/theme_functions"

// Fotorama
import "./custom/plugins/fotorama"

// Parallax
import "./custom/plugins/parallax"

// LightPicker
import "./custom/plugins/litepicker"

// work with yandex map
import "./custom/custom_functions"
