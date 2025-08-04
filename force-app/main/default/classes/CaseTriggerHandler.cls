/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 04-15-2025
 * @last modified by  : Abhishek Gupta
**/
public with sharing class CaseTriggerHandler {

    public static void createCaseUpdateAccountDescription(List<Case> lstCase) {

        Set<Id> accountIds = new Set<Id>();
        List<Account> lstAccountToBeUpdated = new List<Account>();

        for (Case cases : lstCase) {
            if (cases.AccountId != null) {
                accountIds.add(cases.AccountId);
            }
        }

        if (!accountIds.isEmpty()) {
            Map<Id, Account> accountToBeUpdated = new Map<Id, Account>();

            List<Account> lstAccount = [SELECT Id, Name, Description FROM Account WHERE Id IN :accountIds];

            for (Account account : lstAccount) {
                Account acc = new Account();
                acc.Id = account.Id;
                acc.Description = 'New Case Has been Created';
                lstAccountToBeUpdated.add(acc);
            }
        }

        if (!lstAccountToBeUpdated.isEmpty()) {
            update lstAccountToBeUpdated;
        }

    }
}