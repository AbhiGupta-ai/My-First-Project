/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 04-15-2025
 * @last modified by  : Abhishek Gupta
**/
trigger CaseTrigger on Case (after insert) {


    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            CaseTriggerHandler.createCaseUpdateAccountDescription(Trigger.new);
        }
    }
}