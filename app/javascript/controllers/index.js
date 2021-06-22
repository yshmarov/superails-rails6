import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

import TextareaAutogrow from "stimulus-textarea-autogrow"
import CharacterCounter from "stimulus-character-counter"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

application.register("textarea-autogrow", TextareaAutogrow)
application.register("character-counter", CharacterCounter)
