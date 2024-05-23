namespace my.company;

entity DeptViews {
    key ID              : UUID;
    postalcode          : String;
    createdDateTime     : DateTime;
    isDeleted           : Boolean;
    description         : String;
    email               : String;
    name                : String;
}

entity Users {
    key ID                           : UUID;
    name                             : String;
    email                            : String;
    phone                            : String;
    departments                      : Association to many Departments on departments.ID = $self.departments.ID;
    isDeleted                        : Boolean;
    adminType                        : Integer;
    // privilege                        : Privilege;
    imageurl                         : String;
    isUserLocatorActive              : Boolean;
    selectedGroupList                : array of String;
    isUserUpdatePermissionActive     : Boolean;
    admingroup                       : String;
    assignedLayers                   : array of String;
    zone                             : String;
    vender                           : String;
    adminlist                        : array of String;
    createdBy                        : String;
    createdByMailID                  : String;
    isFirstLogin                     : Boolean;
    deviceDetails                    : array of String;
    lastLoggedInTime                 : DateTime;
    username                         : String;
    type                             : Integer;
    password                         : String;
    doj                              : DateTime;
    dob                              : DateTime;
    createdDateTime                  : DateTime;
    accountLockedOn                  : DateTime;
    numberOfAttemptsWithWrongPassword: Integer;
    isAccountLocked                  : Boolean;
}

entity UserViews {
    key ID              : UUID;
    name               : String;
    email              : String;
    departments        : Association to many Departments on departments.ID = $self.departments.ID;
    isDeleted          : Boolean;
    adminType          : Integer;
    imageurl           : String;
    username           : String;
    type               : Integer;
    createdDateTime    : DateTime;
}
entity Departments {
    key ID             : UUID;
    // settings           : Settings;
    departmentAdmins   : Association to many Users;
    departmentUsers    : Association to many Users;
    groupadminList     : array of String;
    isMdpeQU           : Boolean;
    isSteelQU          : Boolean;
    isQUAssigned       : Boolean;
    postalcode         : String;
    applicationType    : String;
    mapType            : String;
    createdDateTime    : DateTime;
    isDeleted          : Boolean;
}

