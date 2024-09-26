/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-24-2024
 * @last modified by  : Abhishek Gupta
**/
trigger ContactTrigger on Contact (after delete, after insert, after update) {

    if (Trigger.isDelete) {
        if(Trigger.isAfter) {
            // AccountService.closeCasesOnContactDeletion(Trigger.old);
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert && Trigger.isUpdate) {
            ContactService.createAccount(Trigger.new);
        }
    }

}