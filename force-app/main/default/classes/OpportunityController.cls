/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-01-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList()
    {
        return [Select Id, StageName from Opportunity];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Amount,Name,StageName FROM Opportunity WHERE CloseDate >= LAST_N_DAYS:30 AND StageName = 'Closed Won'];
    }
}