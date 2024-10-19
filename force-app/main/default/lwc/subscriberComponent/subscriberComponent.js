import { MessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import messageChannelDemo from '@salesforce/messageChannel/messageChannelDemo__c';

export default class SubscriberComponent extends LightningElement {

    name;
    subscription = null;

    @wire (MessageContext) messageContext;

    connectedCallback() {
        this.handleSubscribe();
    }

    disconnectedCallback() {
        this.handleUnSubscribe();
    }

    handleSubscribe() {

        if (!this.subscription) {
            this.subscription=subscribe(this.messageContext, messageChannelDemo, (parameter) =>{
                this.name=parameter.name; // in this parameter.name -- name is that field which is defined in meta xml file
            });
        }
    }

    handleUnSubscribe() {
        unsubscribe(this.subscription);
        this.subscription=null;
    }
}