/**
 * @description       : 
 * @author            : Abhishek Gupta
 * @group             : 
 * @last modified on  : 01-19-2025
 * @last modified by  : Abhishek Gupta
**/
public with sharing class UserPhoneUpdater {

    @future
    public static void updateUserPhone(Set<Id> ownerIds) {

        List<User> userLst = [SELECT Id, Name, phone FROM User WHERE Id IN : ownerIds];
        List<User> userList = new List<User>();

        for (User users : userLst) {
            User user = new User ();

            user.Id = users.Id;
            user.phone='887878';
            userList.add(user);
        }

        if (!userList.isEmpty()) {
            update userList;
        }
    }
}