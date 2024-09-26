/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-22-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class OpportunityService {

    public static void onafterInsert(List<Opportunity> lstOpp) {
        
        List<Account> accountToBeCreated = new List<Account>();

        for (Opportunity opp : lstOpp) {
            Account acc = new Account();
            acc.Id = opp.AccountId;
            acc.Description = 'account updated description';

            accountToBeCreated.add(acc);
        }

        if (!accountToBeCreated.isEmpty()) {
            update accountToBeCreated;
        }
    }
}