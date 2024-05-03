namespace Pratham;

entity licmanagements {
    expiryDate      : String;
    deviceDetails   : String(255); 
    loggedInTime    : String;
    assignedTo      : Association to users;

}
entity users{
    name                                : String;
    username:String;
    email                               : String;
    phone                               : String;
    deviceDetails:String;
    lastLoggedInTime:DateTime;
    departments:Association to departments;
}
entity departments{
    postalcode:String;
}
