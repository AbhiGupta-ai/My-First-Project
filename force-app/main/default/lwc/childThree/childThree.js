import { api, LightningElement } from 'lwc';

export default class ChildThree extends LightningElement {

    messageForChildThree;
    @api messageSendingToChildThree;

    handleClick() {
        const event = new CustomEvent('messagefromchildthree', {
            detail: { message: 'Hello from Child Three!' },
            bubbles: true, composed: false
        });
        this.dispatchEvent(event);
    }
}