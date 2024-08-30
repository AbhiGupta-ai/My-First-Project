/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 08-31-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class OpportunityController {

    /**
    * @description: getting the list of opportunity
    * @author Abhishek Gupta | 08-31-2024 
    * @return List<Opportunity> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList() {
        return [Select Id, StageName from Opportunity];
    }
}