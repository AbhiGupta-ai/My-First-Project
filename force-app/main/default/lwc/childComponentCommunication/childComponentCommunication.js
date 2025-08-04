import { LightningElement, track } from 'lwc';

export default class ChildComponentCommunication extends LightningElement {

    @track data = { name: 'John', age: 30 };

    handleSelect() {
        console.log('selecting button');

        const event = new CustomEvent('select', {
            detail: this.data,
            bubbles: true,
            composed: true
        });

        this.dispatchEvent(event);
    }
}