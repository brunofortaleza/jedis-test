
window.$ = window.jQuery = require('jquery');
require("jquery-mask-plugin");

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.maskFields();
    }

    maskFields() {
        $('[data-masks-target="phone"]').mask('(00) 00000-0009');
        $('[data-masks-target="cpf"]').mask('000.000.000-00');
        $('[data-masks-target="cns"]').mask('000000000000000');
        $('[data-masks-target="cep"]').mask('00.000-000');
    }
}
