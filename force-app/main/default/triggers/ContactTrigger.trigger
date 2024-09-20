/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-20-2024
 * @last modified by  : Abhishek Gupta
**/
trigger ContactTrigger on Contact (after delete) {

    if (Trigger.isDelete) {
        if(Trigger.isAfter) {
            AccountService.closeCasesOnContactDeletion(Trigger.old);
        }
    }

}