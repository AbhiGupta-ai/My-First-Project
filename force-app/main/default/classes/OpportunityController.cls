/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 08-31-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList()
    {
        return [Select Id, StageName from Opportunity];
    }
    
}