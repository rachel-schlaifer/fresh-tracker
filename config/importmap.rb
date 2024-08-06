# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@maslick/koder", to: "https://cdn.jsdelivr.net/npm/@maslick/koder@1.3.2/index.mjs" # @1.3.2
pin "fs" # @2.0.1
pin "path" # @2.0.1
pin "process" # @2.0.1
pin "@zxing/browser", to: "@zxing--browser.js" # @0.1.5
pin "@zxing/library", to: "@zxing--library.js" # @0.21.2
pin "ts-custom-error" # @3.3.1
