import { api, LightningElement } from 'lwc';

export default class ChildTwo extends LightningElement {


    @api messageSendingToChildTwo;
    messageSendingToChildThree = 'Hey I am calling you from child two component';

    handleMessage(event) {
        console.log('called.... child two');

        const events = new CustomEvent('messagefromchildtwo', { detail: event.detail.message });
        this.dispatchEvent(events);
    }
}