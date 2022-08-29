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

  getPassengerElements() {
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

  addPassengerFields() {
    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      return;
    }

    this.passengerCountValue++;

    const passenger = this.getPassengerElements();
    const currentTime = Date.now();

    passenger.container.setAttribute('id', `passenger_container_${currentTime}`);
    passenger.removeButton.setAttribute('data-passenger-container', `passenger_container_${currentTime}`);

    passenger.count.textContent = `Passenger ${this.passengerCountValue}`;

    this.setUniqueValues(passenger.labels, 'for', currentTime);
    this.setUniqueValues(passenger.inputs, 'id', currentTime);
    this.setUniqueValues(passenger.inputs, 'name', currentTime);

    this.addPassengerButtonTarget.before(passenger.form);

    if (this.passengerCountValue >= this.maxPassengerCountValue) {
      this.disableAddPassengerButton();
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

  remove(e) {
    if (this.passengerCountValue === 1) {
      return;
    }

    const removeButton = e.currentTarget;
    const targetId = removeButton.dataset.passengerContainer;
    const passengerContainer = document.getElementById(targetId);
    const passenger = passengerContainer.querySelector('.passenger_index').textContent;
    const confirmation = window.confirm(`Are you sure you want to delete ${passenger}?`);

    if (confirmation) {
      passengerContainer.remove();
    } else {
      return;
    }

    if (document.querySelector('.add_passenger_button:disabled')) {
      this.reenablePassengerButton();
    }

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
