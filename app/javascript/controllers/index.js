// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js or *_controller.ts.

import { Application } from "stimulus"

const application = Application.start()

import LikeController from "./like_controller"
application.register("like", LikeController)

import QrcodeController from "./qrcode_controller"
application.register("qrcode", QrcodeController)

import AdminLabelController from "./admin_label_controller"
application.register("admin-label", AdminLabelController)
