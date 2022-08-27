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

    passengerContainer.setAttribute('id', `passenger_container_${currentTime}`);
    passengerRemoveButton.setAttribute('data-passenger-container', `passenger_container_${currentTime}`);

    passengerCount.textContent = `Passenger ${this.passengerCountValue}`;

    this.setUniqueValues(passengerLabels, 'for', currentTime);
    this.setUniqueValues(passengerInputs, 'id', currentTime);
    this.setUniqueValues(passengerInputs, 'name', currentTime);

    this.addPassengerButtonTarget.before(passengerForm);

    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      this.disableAddPassengerButton();
    }

    if (this.passengerCountValue === 1) {
      this.disableRemoveButton();
    } else if (document.querySelector('.remove_passenger_button.disabled')) {
      this.reenableRemoveButton();
    }
  }

  disableRemoveButton() {
    const removePassengerButton = document.querySelector('.remove_passenger_button');
    removePassengerButton.classList.add('disabled');
  }

  reenableRemoveButton() {
    const disabledRemoveButton = document.querySelector('.remove_passenger_button.disabled');
    disabledRemoveButton.classList.remove('disabled');
  }

  remove(e) {
    if (this.passengerCountValue === 1) {
      return;
    }

    const removeButton = e.currentTarget;
    const targetId = removeButton.dataset.passengerContainer;
    const passengerContainer = document.getElementById(targetId);

    passengerContainer.remove();

    this.passengerCountValue--;

    if (this.passengerCountValue === 1) {
      this.disableRemoveButton();
    }
  }
}
