import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ['passengerForm', 'addPassengerButton'];
  static values = { passengerCount: Number, maxPassengerCount: Number }

  initialize() {
    this.addPassengerFields();
  }

  addPassengerFields() {
    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      return;
    }

    this.passengerCountValue++;

    const passengerForm = this.passengerFormTarget.content.cloneNode(true);
    const passengerLabels = passengerForm.querySelectorAll('label');
    const passengerInputs = passengerForm.querySelectorAll('input');
    const passengerCount = passengerForm.querySelector('.passenger_index');
    const currentTime = Date.now();

    const generateUniqueValue = function(element, attribute) {
      const currentAttributeValue = element.getAttribute(attribute);
      return currentAttributeValue.replace('0', currentTime);
    };

    passengerCount.textContent = `Pasenger ${this.passengerCountValue}`;

    passengerLabels.forEach((label) => label.setAttribute('for', generateUniqueValue(label, 'for')));
    passengerInputs.forEach((input) => input.setAttribute('id', generateUniqueValue(input, 'id')));
    passengerInputs.forEach((input) => input.setAttribute('name', generateUniqueValue(input, 'name')));

    this.addPassengerButtonTarget.before(passengerForm);
  }
}
