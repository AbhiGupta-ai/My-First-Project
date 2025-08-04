/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 03-13-2025
 * @last modified by  : Abhishek Gupta
**/
trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, before insert) {

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            OpportunityService.onafterInsert(Trigger.new);
        }
    }
    if (Trigger.isBefore && Trigger.isInsert) {
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : Trigger.new) {
            if (opp.AccountId != null) accountIds.add(opp.AccountId);
        }

        if (!accountIds.isEmpty()) {
            Set<Id> recentOppAccounts = new Map<Id, Opportunity>(
                [SELECT AccountId FROM Opportunity 
                 WHERE AccountId IN :accountIds AND CreatedDate >= :Date.today().addDays(-7)]
            ).keySet();

            for (Opportunity opp : Trigger.new) {
                if (recentOppAccounts.contains(opp.AccountId)) {
                    opp.addError('An Opportunity was already created in the last 7 days for this Account!');
                }
            }
        }
    }
}