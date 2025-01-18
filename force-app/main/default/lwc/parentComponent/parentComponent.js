import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {

    messageFromChildThree;

    handleMessage(event) {
        this.messageFromChildThree = event.detail.message;
    }
}