window.$ = window.jQuery = require('jquery');
require("jquery-mask-plugin");

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-employee"
export default class extends Controller {
  connect() {
    this.maskFields();
  }

  static targets = [ 'salary', 'discountInss' ]

  salary() {
    return parseFloat(this.salaryTarget.value || 0)
  }

  discountInss() {
    return parseFloat(this.discountInssTarget.value || 0)
  }

  updateDiscountInss() {
    const salariesLimit = [
      { limit: 1412.00, aliquota: 0.075 },
      { limit: 2666.68, aliquota: 0.09 },
      { limit: 4000.03, aliquota: 0.12 },
      { limit: 7786.02, aliquota: 0.14 }
    ];

    let discount = 0;
    let auxSalary = this.salary();

    for (let i = 0; i < salariesLimit.length; i++) {
      const { limit, aliquota } = salariesLimit[i];
      const lastLimit = i === 0 ? 0 : salariesLimit[i - 1].limit;

      if (this.salary() > lastLimit) {
        const base = Math.min(auxSalary, limit - lastLimit);
        discount += base * aliquota;
        auxSalary -= base;
      }
    }

    if (this.salary() > salariesLimit[salariesLimit.length - 1].limit) {
      discount += (this.salary() - salariesLimit[salariesLimit.length - 1].limit) * salariesLimit[salariesLimit.length - 1].aliquota;
    }

    this.discountInssTarget.value = discount.toFixed(2);
  }
  
  maskFields() {
    $('[data-masks-target="phone"]').mask('(00) 00000-0009');
    $('[data-masks-target="cpf"]').mask('000.000.000-00');;
    $('[data-masks-target="zip_code"]').mask('00000-000');;
  }
}
