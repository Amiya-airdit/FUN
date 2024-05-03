// using Pratham from '../db/schema';
service Dashboard{
entity lic{
deviceDetails:String;
loggedInTime:String;
assignedTo:String;
expiryDate:String;
}

entity inactiveusers{
    name:String;
    username:String;
    deviceDetails:String;
    lastLoggedInTime:Date;
    departments:String;
}
}