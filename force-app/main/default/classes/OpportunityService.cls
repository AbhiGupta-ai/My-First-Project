/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 12-26-2024
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

    public static void createTaskOnOpportunityDelete(List<Opportunity> lstOpportunity) {

        // Ensure the opportunity list is not empty
        if (!lstOpportunity.isEmpty()) {
            Set<Id> accountIds = new Set<Id>();
            List<Task> tasksToBeCreated = new List<Task>();
    
            // Collect all AccountIds associated with the opportunities
            for (Opportunity opp : lstOpportunity) {
                accountIds.add(opp.AccountId);
            }
    
            // Query accounts related to the collected AccountIds
            List<Account> queriedAccounts = [SELECT Id, Name, OwnerId FROM Account WHERE Id IN :accountIds];
            Map<Id, Account> accountMap = new Map<Id, Account>();
    
            // Create a map of Account Id to Account records
            for (Account acc : queriedAccounts) {
                accountMap.put(acc.Id, acc);
            }
    
            // Create tasks for each opportunity with a valid AccountId
            for (Opportunity oppObj : lstOpportunity) {
                if (oppObj.AccountId != null && accountMap.containsKey(oppObj.AccountId)) {
                    Task newTask = new Task();
                    newTask.WhatId = oppObj.AccountId; // Associate Task with Account
                    newTask.Subject = 'Task created on Opportunity deletion';
                    newTask.Description = 'A task is created after the opportunity is deleted.';
                    newTask.OwnerId = oppObj.OwnerId; // Assign task to Opportunity owner
                    newTask.Priority = 'Normal';
                    newTask.Status = 'Not Started';
    
                    tasksToBeCreated.add(newTask);
                }
            }
    
            // Insert tasks if there are any to be created
            if (!tasksToBeCreated.isEmpty()) {
                insert tasksToBeCreated;
            }
        }
    }
    
}