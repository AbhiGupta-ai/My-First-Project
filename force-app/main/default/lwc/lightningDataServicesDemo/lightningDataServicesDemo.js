import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountService.getAccountList';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';

export default class LightningDataServicesDemo extends LightningElement {

    accounts;
    nameField = NAME_FIELD;
    phoneField = PHONE_FIELD;

    @wire(getAccountList)
    wiredAccounts({ error, data }) {
        if (data) {
            console.log('data ::' , JSON.stringify(data));
            
            this.accounts = data;
        } else if (error) {
            console.error(error);
        }
    }
}