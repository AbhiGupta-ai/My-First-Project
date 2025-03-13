/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 09-26-2024
 * @last modified by  : Abhishek Gupta
**/
public class ContactService {

    public static void createAccount(List<Contact> lstContact) {
        // List to store accounts to be created
        List<Account> accountToBeCreated = new List<Account>();
        // Map to link created accounts to corresponding contacts
        Map<Id, Contact> contactsToUpdate = new Map<Id, Contact>();

        for (Contact con : lstContact) {
            if (con != null && String.isNotBlank(con.LastName)) {
                Account acc = new Account();
                acc.Name = con.LastName + ' Account';
                accountToBeCreated.add(acc);

                // Add contact reference in the map (storing the contact)
                contactsToUpdate.put(con.Id, con);
            } else {
                System.debug('Contact is null or LastName is blank for Contact: ' + con);
            }
        }

        if (!accountToBeCreated.isEmpty()) {
            try {
                // Insert the accounts and assign them back to contacts
                insert accountToBeCreated;
                System.debug('Accounts created: ' + accountToBeCreated);

                // After account creation, prepare for contact update
                List<Contact> contactsForUpdate = new List<Contact>();

                for (Integer i = 0; i < accountToBeCreated.size(); i++) {
                    Contact contact = contactsToUpdate.get(lstContact[i].Id);
                    if (contact != null) {
                        // Update contact's AccountId with newly created account ID
                        contact.AccountId = accountToBeCreated[i].Id;
                        contactsForUpdate.add(contact);
                    }
                }

                // Perform the update outside of the trigger context
                if (!contactsForUpdate.isEmpty()) {
                    update contactsForUpdate;
                    System.debug('Contacts updated with AccountId.');
                }

            } catch (Exception e) {
                System.debug('Exception occurred while creating accounts: ' + e.getMessage());
            }
        } else {
            System.debug('No accounts to create.');
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}
