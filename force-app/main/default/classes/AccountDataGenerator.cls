/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 08-31-2024
 * @last modified by  : Abhishek Gupta
**/
public with sharing class AccountDataGenerator {

    public static void generateAccounts(Integer recordCount) {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < recordCount; i++) {
            Account acc = new Account(
                Name = 'Account ' + (i + 1),
                Industry = getRandomIndustry(),
                AnnualRevenue = getRandomAnnualRevenue(),
                Type = getRandomType(),
                Phone = getRandomPhoneNumber(),
                Website = 'www.account' + (i + 1) + '.com'
            );
            accounts.add(acc);
        }

        insert accounts;
    }

    private static String getRandomIndustry() {
        List<String> industries = new List<String>{'Technology', 'Finance', 'Healthcare', 'Education', 'Manufacturing', 'Retail', 'Consulting'};
        return industries[Math.mod(Math.abs(Crypto.getRandomInteger()), industries.size())];
    }

    private static Decimal getRandomAnnualRevenue() {
        return Math.mod(Math.abs(Crypto.getRandomInteger()), 100000000) + 100000;
    }

    private static String getRandomType() {
        List<String> types = new List<String>{'Customer', 'Partner', 'Prospect', 'Reseller'};
        return types[Math.mod(Math.abs(Crypto.getRandomInteger()), types.size())];
    }

    private static String getRandomPhoneNumber() {
        String phone = '1-';
        for (Integer i = 0; i < 3; i++) {
            phone += String.valueOf(Math.mod(Math.abs(Crypto.getRandomInteger()), 1000)).leftPad(3, '0') + '-';
        }
        phone += String.valueOf(Math.mod(Math.abs(Crypto.getRandomInteger()), 10000)).leftPad(4, '0');
        return phone;
    }
}