/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 12-20-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class AccountService {
    
    // public static void saveRecords(List<Account> accountLst) {

    //     for (Account acc : accountLst) {
    //         acc.Description = 'Test Description'; 
    //     } 
    // }

    // public static void updatePhoneDescription(List<Account> lstAccount, Map<Id, Account> oldMap) {
        
    //     for (Account acc : lstAccount) {
    //         if (acc != null && oldMap != null && acc.phone != oldMap.get(acc.Id).phone) {
    //             acc.Description = 'phone number has been added on this account';
    //         }
    //     }
    // }

    // public static void createRelatedOpportunity(List<Account> lstAccount) {
    //     List<Opportunity> oppTobeInserted = new List<Opportunity>();

    //     for (Account acc : lstAccount) {
    //         Opportunity opp = new Opportunity();
    //         opp.Name = acc.Name;
    //         opp.AccountId = acc.Id;
    //         opp.StageName = 'Qualification';
    //         opp.closeDate = System.today();
    //         oppTobeInserted.add(opp);
    //     }

    //     if (!oppTobeInserted.isEmpty()) {
    //         insert oppTobeInserted;
    //     }
    // }

    // public static void updateRelatedOpportunity(List<Account> lstAccount, Map<Id, Account> oldMap) {

    //     Map<Id, Account> mapAccount = new Map<Id, Account>();
    //     List<Opportunity> oppList = new List<Opportunity>();
    //     List<Opportunity> oppTobeInserted = new List<Opportunity>();

    //     for (Account acc : lstAccount) {
    //         if (oldMap != null && acc != null && acc.phone != oldMap.get(acc.Id).phone) {
    //             mapAccount.put(acc.Id, acc);
    //         }
    //     }

    //     oppList = [SELECT Id, Name, AccountId, Account_phone__c FROM Opportunity WHERE AccountId IN : mapAccount.keySet()];

    //     for (Opportunity oppObject : oppList) {
    //         if (mapAccount != null && mapAccount.containsKey(oppObject.AccountId)) {
    //             Opportunity opp = new Opportunity();
    //             opp.Id = oppObject.Id;
    //             opp.Account_phone__c = mapAccount.get(oppObject.AccountId).phone;
    //             oppTobeInserted.add(opp);
    //         }
    //     }

    //     if (!oppTobeInserted.isEmpty()) {
    //         update oppTobeInserted;
    //     }
    // }

    // public static void updateRelatedOpportunityDescription(List<Account> lstAccount, Map<Id, Account> oldMap) {

    //     Map<Id, Account> mapAccount = new Map<Id, Account>();
    //     List<Opportunity> oppToBeUpdated = new List<Opportunity>();

    //     for (Account accObject : lstAccount) {
    //         if (oldMap != null && accObject != null && accObject.Description != oldMap.get(accObject.Id).Description) {
    //             mapAccount.put(accObject.Id, accObject);
    //         }
    //     }

    //     List<Opportunity> queryOpp = [SELECT Id, AccountId, Description FROM Opportunity WHERE AccountId IN : mapAccount.keySet()];

    //     for (Opportunity oppObj : queryOpp) {
            
    //         if (mapAccount != null && mapAccount.containsKey(oppObj.AccountId)) {
    //             Opportunity opp = new Opportunity();
    //             opp.Id = oppObj.Id;
    //             opp.Description = mapAccount.get(oppObj.AccountId).Description;
    //             oppToBeUpdated.add(opp);
    //         }
    //     }

    //     if (!oppToBeUpdated.isEmpty()) {
    //         update oppToBeUpdated;
    //     }
    // }

    // public static void preventAccountDeletion(List<Account> lstAccount) {

    //     Set<Id> accountIds = new Set<Id>();

    //     for (Account acc : lstAccount) {
    //         accountIds.add(acc.Id);
    //     }

    //     Map<Id, List<Opportunity>> accounttoOpenOpps = new Map<Id, List<Opportunity>>();
    //     List<Opportunity> openOppLst = [SELECT Id, AccountId FROM Opportunity WHERE AccountId IN:accountIds];

    //     for (Opportunity opp : openOppLst) {
    //         if (!accounttoOpenOpps.containsKey(opp.AccountId)) {
    //             accounttoOpenOpps.put(opp.AccountId, new List<Opportunity>());
    //         }

    //         accounttoOpenOpps.get(opp.AccountId).add(opp);
    //     }

    //     // check if any account has open opportunities and prevent deletion
    //     for (Account acc : lstAccount) {
    //         if (accounttoOpenOpps.containsKey(acc.Id) && accounttoOpenOpps.get(acc.Id).size() > 0) {
    //             acc.addError('you cannot delete this account because it has an open opportunities');
    //         }
    //     }
    // }

    // public static void closeCasesOnContactDeletion(List<Contact> lstContact) {
    //     Set<Id> contactIds = new Set<Id>();

    //     for (Contact con : lstContact) {
    //         if (con.AccountId != null) {
    //             contactIds.add(con.AccountId);
    //         }
    //     }

    //     List<Account> accountToDelete = [SELECT Id FROM Account WHERE Id IN :contactIds];

    //     if (!accountToDelete.isEmpty()) {
    //         delete accountToDelete;
    //     }
    // }

    public static void createAccountSetDescription(List<Account> lstAccount) {

        for (Account acc : lstAccount) {
            acc.Description = 'account is created by Abhishek!!';
        }
    }

    public static void updateDescriptionwhenPhoneAdded(List<Account> lstAccount, Map<Id, Account> mapAccount) {

        // List<Account> accountToBeUpdated = new List<Account>();

        for (Account acc : lstAccount) {
            
            if (acc != null && mapAccount != null && acc.phone != mapAccount.get(acc.Id).phone) {
                acc.Description = 'phone number is updated on this account';
            }
        }
    }

    public static void addErrorWhenPhoneNumberPresent(List<Account> lstAccount) {

        for (Account acc : lstAccount) {
            if (acc != null && acc.phone != null) {
                acc.addError('sorry You cant delete this account phone number is already added please contact on phone first then try to delete!!');
            }
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account];
    }

    public static void insertRecord(List<Account> lstAccount) {
        List<Contact> contactTobeInserted = new List<Contact>();
        for (Account accObj : lstAccount) {
            Integer i = 1;
            Contact con = new Contact();
            con.lastName = 'New contact ' + i;
            i++;
            con.AccountId = accObj.Id;
            contactTobeInserted.add(con);

        }

        if (!contactTobeInserted.isEmpty()) {
            insert contactTobeInserted;
        }
    }

    // public static void updateContactRecord(List<Account> lstAccount, Map<Id, Account> oldMap){

    //     Map<Id, Account> mapAccount = new Map<Id, Account>();
    //     List<Contact> conToBeUpdated = new List<Contact>();

    //     for (Account accObj : lstAccount) {
            
    //         if (accObj != null && accObj.phone != oldMap.get(accObj.Id).phone) {
    //             mapAccount.put(accObj.Id, accObj);
    //         }
    //     }

    //     List<Contact> contactLst = [SELECT Id, lastName, AccountId FROM Contact WHERE AccountId IN: mapAccount.keySet()];

    //     for (Contact con : contactLst) {
    //         if (mapAccount != null && mapAccount.containsKey(con.AccountId)) {
    //             Contact conObj = new Contact();
    //             conObj.lastName = 'Updated last name';
    //             conObj.AccountId = con.AccountId;
    //             conToBeUpdated.add(conObj);
    //         }
    //     }

    //     if (!conToBeUpdated.isEmpty()) {
    //         update conToBeUpdated;
    //     }
    // }

    public static void updateContactRecord(List<Account> lstAccount, Map<Id, Account> oldMap) {
        // Map to hold Accounts where the phone number has changed
        Map<Id, Account> mapAccount = new Map<Id, Account>();
        List<Contact> conToBeUpdated = new List<Contact>();
    
        // Identify Accounts with a changed phone number
        for (Account accObj : lstAccount) {
            if (accObj != null && accObj.Phone != oldMap.get(accObj.Id).Phone) {
                mapAccount.put(accObj.Id, accObj);
            }
        }
    
        // Query related Contacts for these Accounts
        if (!mapAccount.isEmpty()) {
            List<Contact> contactLst = [
                SELECT Id, LastName, AccountId
                FROM Contact
                WHERE AccountId IN :mapAccount.keySet()
            ];
    
            // Update Contact's LastName
            for (Contact con : contactLst) {
                if (mapAccount.containsKey(con.AccountId)) {
                    con.LastName = 'Updated Last Name'; // Customize update logic as needed
                    conToBeUpdated.add(con);
                }
            }
        }
    
        // Perform bulk update on Contacts
        if (!conToBeUpdated.isEmpty()) {
            try {
                update conToBeUpdated;
            } catch (DmlException e) {
                System.debug('Error updating Contacts: ' + e.getMessage());
            }
        }
    }
    
}