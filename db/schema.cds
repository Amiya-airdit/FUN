using {uuid} from '@sap/cds/common;
namespace my.company;

entity DeptViews: cuid {
    postalcode          : String;
    createdDateTime     : DateTime;
    isDeleted           : Boolean;
    description         : String;
    email               : String;
    name                : String;
}

entity Users: cuid {
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

entity UserViews: cuid {
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
entity Departments : cuid {
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

entity Assets {
    UniqueId                : String(36);
    key name                    : String;
    type                    : String;
    applicationType         : String;
    objectType              : String;
    isMediaAvailable        : Boolean;
    references              : String;
    workInstruction         : String;
    lastModifiedDate        : Timestamp;
    lastModifiedBy          : String;
    description             : String;
    geoFields               : String;   
    isAllowMap              : Boolean;
    mandatoryFields         : String;   
    dependentFields         : String;   
    allocatedcategories     : String;   
    allocatedDepartments    : String;   
    displayField            : String;
    templateoriginalName    : String;
    locationField           : String;   
    shareGroup              : String;   
    generatedIdForFileAttachment : String; 
    formzCategory           : String;  
    allocatedUsers          : String;   
    alternativeMailid       : String;
    category                : String;
    isVisible               : Boolean;
    createdBy               : String;
    createdTime             : Timestamp;
    formType                : String;
    version                 : Integer;
    isRuleDefined           : Boolean;
    maxZoomLevel            : Integer;
    minZoomLevel            : Integer;
}
entity formviews {
    key name                    : String;
    applicationType         : String;
    departmentId            : String(36);
    objectType              : String;
    dependentFields         : String;   
    allocatedDepartments    : String;   
    displayField            : String;
    formzCategory           : String;   
    category                : String;
    isVisible               : Boolean;
    createdTime             : Timestamp;
    formType                : String;
    type                    : String;
}



