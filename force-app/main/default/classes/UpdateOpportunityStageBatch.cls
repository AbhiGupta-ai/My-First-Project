/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 10-16-2024
 * @last modified by  : Abhishek Gupta
**/
global class UpdateOpportunityStageBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name, CloseDate, StageName FROM Opportunity');
    }

    global void execute(Database.BatchableContext BC, List<Opportunity> oppLst) {

        List<Opportunity> opp = new List<Opportunity>();
        for (Opportunity oppObj : oppLst) {
            if (oppObj.CloseDate < Date.today()) {
                oppObj.StageName = 'Closed Won';
            } else {
                oppObj.StageName = 'Prospecting';
            }

            opp.add(oppObj);
        }

        update opp;
    }

    global void finish(Database.BatchableContext BC) {
        
    }
}