// import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"

// import TextareaAutogrow from "stimulus-textarea-autogrow"
// import CharacterCounter from "stimulus-character-counter"

// const application = Application.start()
// const context = require.context("../controllers", true, /\.js$/)
// application.load(definitionsFromContext(context))

// application.register("textarea-autogrow", TextareaAutogrow)
// application.register("character-counter", CharacterCounter)



import { Application } from "@hotwired/stimulus";
const application = Application.start();

// Configure Stimulus development experience
application.warnings = true;
application.debug = false;
window.Stimulus = application;

export { application };

import TextareaAutogrow from "stimulus-textarea-autogrow";
application.register("textarea-autogrow", TextareaAutogrow);

import CharacterCounter from "stimulus-character-counter";
application.register("character-counter", CharacterCounter);

// import HelloController from "./hello_controller";
// application.register("hello", HelloController);