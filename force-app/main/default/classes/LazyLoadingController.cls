/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 10-20-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class LazyLoadingController {
    
    @AuraEnabled(Cacheable = true)
    public static List<Account> loadDataById() {

        List <Account> accQueryLst = [SELECT Id, Name, Industry FROM Account ORDER BY Name,Id LIMIT 200];
        return accQueryLst;
    }

    @AuraEnabled(Cacheable = true)
    public static List<Account> loadMoreData(String lastName, String lastId){
        List<Account> accQueryLst = [ SELECT Id, Name, Industry FROM Account 
                                      Where (Name > :lastName) OR (Name =:lastName AND Id > :lastId)
                                      ORDER BY Name,Id LIMIT 200];
        return accQueryLst;
    }

    @AuraEnabled
    public static Integer AccountRecordCount(){

        AggregateResult agr = [SELECT Count(Id) recordCount FROM Account];

        return (Integer) agr.get('recordCount');
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer limitSize, Integer offset){
        List<Account> accountList = [SELECT Id, Name, Industry, Rating
                                     FROM Account
                                     ORDER BY CreatedDate
                                     LIMIT :limitSize
                                     OFFSET :offset
                                     ];
        return accountList;
    }
}