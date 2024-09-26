/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-22-2024
 * @last modified by  : Abhishek Gupta
**/
trigger AccountTrigger on Account (before insert, before update, after insert, after update, before delete, after delete) {

    // if (Trigger.isInsert) {
    //     if (Trigger.isBefore) {
    //         AccountService.saveRecords(Trigger.new);
    //     } else if(Trigger.isAfter) {
    //         AccountService.createRelatedOpportunity(Trigger.new);
    //     }
    // }

    // if (Trigger.isUpdate) {
    //     if (Trigger.isBefore) {
    //         AccountService.updatePhoneDescription(Trigger.new, Trigger.oldMap);
    //     } else if(Trigger.isAfter) {
    //         AccountService.updateRelatedOpportunity(Trigger.new, Trigger.oldMap);
    //         AccountService.updateRelatedOpportunityDescription(Trigger.new, Trigger.oldMap);
    //     }
    // }

    // if (Trigger.isDelete) {
    //     if (Trigger.isBefore) {
    //         AccountService.preventAccountDeletion(Trigger.old);
    //     }
    // }

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            AccountService.createAccountSetDescription(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountService.updateDescriptionwhenPhoneAdded(Trigger.new, Trigger.oldMap);
        }
        if (Trigger.isDelete) {
            AccountService.addErrorWhenPhoneNumberPresent(Trigger.old);
        }
    }
}