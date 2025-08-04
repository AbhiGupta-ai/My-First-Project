import { LightningElement, track } from 'lwc';

export default class ParentComponentOneCommunication extends LightningElement {

    @track dataChild;

    renderedCallback() {
        if (!this._listenerAttached) {
            const child = this.template.querySelector('.child-comp');
            if (child) {
                child.addEventListener('select', this.handleChildData.bind(this));
                this._listenerAttached = true; // Prevent duplicate listeners
            }
        }
    }

    handleChildData(event) {
        this.dataChild = JSON.stringify(event.detail);
        console.log('details :: ', JSON.stringify(event.detail));
    }
}