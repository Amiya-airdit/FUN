service UserManagement {
    entity BTPUser{
        key id:String;
        userName :String;
        givenName:String;
        middleName:String;
        familyName:String;
        emails : String;
        active:Boolean; 
        userId:String;
        mobileNo:String;
        mailVerified:Boolean;
   }
  entity Groups {
    key id : String;    
    groupName : String;
    description : String;
    members:array of Member; //Array of String;    
}
type Member {
  value: String;
}
}