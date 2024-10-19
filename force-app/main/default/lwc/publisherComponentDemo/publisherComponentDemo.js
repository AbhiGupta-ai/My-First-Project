import { MessageContext, publish } from 'lightning/messageService';
import { LightningElement, track, wire } from 'lwc';
import messageChannelDemo from '@salesforce/messageChannel/messageChannelDemo__c';

export default class PublisherComponentDemo extends LightningElement {

    @track name;

    @wire (MessageContext) messageContext; 

    handleChange(event) {
        this.name = event.target.value;
        console.log('name :: ', this.name);
        
    }

    handleSubmit() {

        // code pass to subscriber component
        let payload = {name:this.name};
        publish(this.messageContext, messageChannelDemo, payload);
    }
}