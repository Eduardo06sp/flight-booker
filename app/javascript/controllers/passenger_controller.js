import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ['passengerForm', 'addPassengerButton'];
  static values = { passengerCount: Number, maxPassengerCount: Number }

  initialize() {
    this.addPassengerFields();
  }

  setUniqueValues(elements, attribute, value) {
    elements.forEach((element) => {
      const currentAttributeValue = element.getAttribute(attribute);
      const newAttributeValue = currentAttributeValue.replace('0', value);

      element.setAttribute(attribute, newAttributeValue);
    });
  }

  disableAddPassengerButton() {
    this.addPassengerButtonTarget.disabled = true;
  }

  addPassengerFields() {
    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      return;
    }

    this.passengerCountValue++;

    const passengerForm = this.passengerFormTarget.content.cloneNode(true);
    const passengerContainer = passengerForm.querySelector('.passenger_container');
    const passengerRemoveButton = passengerForm.querySelector('.remove_passenger_button');
    const passengerLabels = passengerForm.querySelectorAll('label');
    const passengerInputs = passengerForm.querySelectorAll('input');
    const passengerCount = passengerForm.querySelector('.passenger_index');
    const currentTime = Date.now();

    passengerContainer.setAttribute('id', `passenger_container_${this.passengerCountValue}`);
    passengerRemoveButton.setAttribute('data-passenger-container', `passenger_container_${this.passengerCountValue}`);

    passengerCount.textContent = `Passenger ${this.passengerCountValue}`;

    this.setUniqueValues(passengerLabels, 'for', currentTime);
    this.setUniqueValues(passengerInputs, 'id', currentTime);
    this.setUniqueValues(passengerInputs, 'name', currentTime);

    this.addPassengerButtonTarget.before(passengerForm);

    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      this.disableAddPassengerButton();
    }
  }

  remove(e) {
    const removeButton = e.currentTarget;
    const targetId = removeButton.dataset.passengerContainer;
    const passengerContainer = document.getElementById(targetId);

    passengerContainer.remove();
  }
}
