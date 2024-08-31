/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 08-31-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class OpportunityDataGenerator {

    public static void generateOpportunities(Integer recordCount) {
        List<Opportunity> opportunities = new List<Opportunity>();

        for (Integer i = 0; i < recordCount; i++) {
            Opportunity opp = new Opportunity(
                Name = 'Opportunity ' + (i + 1),
                StageName = getRandomStage(),
                Amount = getRandomAmount(),
                CloseDate = Date.today().addDays(getRandomCloseDateOffset()),
                Probability = getRandomProbability(),
                AccountId = getRandomAccountId()
            );
            opportunities.add(opp);
        }

        insert opportunities;
    }

    private static String getRandomStage() {
        List<String> stages = new List<String>{'Prospecting', 'Qualification', 'Needs Analysis', 'Proposal/Price Quote', 'Negotiation/Review', 'Closed Won', 'Closed Lost'};
        return stages[Math.mod(Math.abs(Crypto.getRandomInteger()), stages.size())];
    }

    private static Decimal getRandomAmount() {
        return Math.mod(Math.abs(Crypto.getRandomInteger()), 100000) + 1000;
    }

    private static Integer getRandomCloseDateOffset() {
        return Math.mod(Math.abs(Crypto.getRandomInteger()), 365);
    }

    private static Decimal getRandomProbability() {
        return Math.mod(Math.abs(Crypto.getRandomInteger()), 101);
    }

    private static Id getRandomAccountId() {
        List<Account> accounts = [SELECT Id FROM Account LIMIT 1 OFFSET :Math.mod(Math.abs(Crypto.getRandomInteger()), 100)];
        return accounts.size() > 0 ? accounts[0].Id : null;
    }
}