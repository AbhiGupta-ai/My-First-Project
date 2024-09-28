import { LightningElement } from 'lwc';

export default class LifeCycleHooksDemo extends LightningElement {

    // 1. constructor:  called when component is created
    constructor() {
        super(); // Always call super() in constructor at the first time itself. it calls LightningElement class constructor.
        console.log('constructor call when component is created....!');
    }

    // 2. connectedCallback: called when the component is inserted into the DOM . It executes from parent to child.
    connectedCallback() {
        console.log('component inserted to the DOM ....');
    }

    // 3. renderedCallback: called after every rendered of the component. Use this hook to execute logic after a component has completed rendering on the UI.
    // it runs from child to parent component. use properties in renederedCallback() as it can cause infinite loop in renderedCallback.
    renderedCallback() {
        console.log('component rendered....');
    }

    // 4. disconnectedCallback: called when the component is removed from the DOM. it also run from parent to child.c/chartJsChildTest
    // Use disconnectedCallback() to undo tasks done in connectedCallback(), such as removing event Listeners. we can also use this to unsubscribe
    disconnectedCallback() {
        console.log('disconnected called back...!!!');   
    }

    // 5. errorCallback: called if an error occurs in the compoent or its children
    errorCallback(error, stack) {
        console.error('error occured:: ', error);
        console.error('Error stack :: ', stack);
    }
}