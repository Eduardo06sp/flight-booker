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

  reenablePassengerButton() {
    this.addPassengerButtonTarget.disabled = false;
  }

  passengerFieldsClone() {
    const formClone = this.passengerFormTarget.content.cloneNode(true);

    return {
      form: formClone,
      container: formClone.querySelector('.passenger_container'),
      removeButton: formClone.querySelector('.remove_passenger_button'),
      labels: formClone.querySelectorAll('label'),
      inputs: formClone.querySelectorAll('input'),
      count: formClone.querySelector('.passenger_index')
    };
  }

  updatePassengerFields(passenger) {
    const currentTime = Date.now();

    passenger.container.setAttribute('id', `passenger_container_${currentTime}`);
    passenger.removeButton.setAttribute('data-passenger-container', `passenger_container_${currentTime}`);

    passenger.count.textContent = `Passenger ${this.passengerCountValue}`;

    this.setUniqueValues(passenger.labels, 'for', currentTime);
    this.setUniqueValues(passenger.inputs, 'id', currentTime);
    this.setUniqueValues(passenger.inputs, 'name', currentTime);
  }

  newPassengerFields() {
    const passenger = this.passengerFieldsClone();
    this.updatePassengerFields(passenger);
    return passenger.form;
  }

  maxPassengersReached() {
    return this.passengerCountValue >= this.maxPassengerCountValue;
  }

  addPassengerFields() {
    if (this.maxPassengersReached()) return;

    this.passengerCountValue++;

    const passengerFields = this.newPassengerFields();
    this.addPassengerButtonTarget.before(passengerFields);

    if (this.maxPassengersReached()) this.disableAddPassengerButton();
  }

  disableRemoveButton() {
    const removePassengerButton = document.querySelector('.remove_passenger_button');
    removePassengerButton.classList.add('disabled');
  }

  reenableRemoveButton() {
    const disabledRemoveButton = document.querySelector('.remove_passenger_button.disabled');
    disabledRemoveButton.classList.remove('disabled');
  }

  reorderPassengers() {
    const passengerHeadings = document.querySelectorAll('.passenger_index');

    passengerHeadings.forEach(
      function(heading, i) {
        const currentCount = i + 1;
        const reorderedHeading = `Passenger ${currentCount}`;

        if (heading.textContent === reorderedHeading) {
          return;
        } else {
          heading.textContent = reorderedHeading;
        }
      }
    );
  }

  passengerToRemove(removeButton) {
    const targetId = removeButton.dataset.passengerContainer;
    const passengerContainer = document.getElementById(targetId);

    return {
      container: passengerContainer,
      name: passengerContainer.querySelector('.passenger_index').textContent
    };
  }

  removalConfirmed(passenger) {
    return window.confirm(`Are you sure you want to delete ${passenger.name}?`);
  }

  lastPassengerLeft() {
    return this.passengerCountValue === 1;
  }

  addPassengerButtonDisabled() {
    return document.querySelector('.add_passenger_button').disabled;
  }

  remove(e) {
    if (this.lastPassengerLeft()) return;

    const passengerToRemove = this.passengerToRemove(e.currentTarget);

    if (this.removalConfirmed(passengerToRemove)) {
      passengerToRemove.container.remove();
    } else {
      return;
    }

    if (this.addPassengerButtonDisabled()) this.reenablePassengerButton();

    this.passengerCountValue--;
    this.reorderPassengers();
  }

  passengerCountValueChanged() {
    if (this.passengerCountValue === 1) {
      this.disableRemoveButton();
    } else if (document.querySelector('.remove_passenger_button.disabled')) {
      this.reenableRemoveButton();
    }
  }
}
