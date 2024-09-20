/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-20-2024
 * @last modified by  : Abhishek Gupta
**/
trigger AccountTrigger on Account (before insert, before update, after insert, after update, before delete, after delete) {

    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            AccountService.saveRecords(Trigger.new);
        } else if(Trigger.isAfter) {
            AccountService.createRelatedOpportunity(Trigger.new);
        }
    }

    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            AccountService.updatePhoneDescription(Trigger.new, Trigger.oldMap);
        } else if(Trigger.isAfter) {
            AccountService.updateRelatedOpportunity(Trigger.new, Trigger.oldMap);
            AccountService.updateRelatedOpportunityDescription(Trigger.new, Trigger.oldMap);
        }
    }

    if (Trigger.isDelete) {
        if (Trigger.isBefore) {
            AccountService.preventAccountDeletion(Trigger.old);
        }
    }
}