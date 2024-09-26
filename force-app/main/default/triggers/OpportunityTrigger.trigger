/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-22-2024
 * @last modified by  : Abhishek Gupta
**/
trigger OpportunityTrigger on Opportunity (after insert, after update, after delete) {

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            OpportunityService.onafterInsert(Trigger.new);
        }
    }
}