import { LightningElement } from 'lwc';
import LightningModal from 'lightning/modal';

export default class LightningModalStandard extends LightningElement {
    showModal = false;
    content = 'The lightning-modal-header and lightning-modal-footer components are optional, but recommended. The lightning-modal-* components render in the order they appear in the template. Place the lightning-modal-body component after lightning-modal-header and before the lightning-modal-footer component.';

    handleModal() {
        this.showModal = true;
    }

    handleOkay() {
        this.close('okay');
    }
}