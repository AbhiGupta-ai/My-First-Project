import { LightningElement } from 'lwc';

export default class LifeCycleHooksDemo extends LightningElement {

    connectedCallback() {
        console.log('component inserted to the DOM ....');
    }

    renderedCallback() {
        console.log('component rendered....');
        
    }
}