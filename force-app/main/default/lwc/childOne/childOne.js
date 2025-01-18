import { api, LightningElement } from 'lwc';

export default class ChildOne extends LightningElement {

    messageFromChildThree;
    messagesendingtochildtwo = 'hey i am sending you gift from child one';

    handleMessages(event) {
        this.messageFromChildThree = event.detail;
    }
}