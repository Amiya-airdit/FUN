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


entity Departments{
key name : String;
// groupadminList : array of String;
// isMdpeQU : Boolean;
// isSteelQU : Boolean;
// isQUAssigned : Boolean;
postalcode : String;
applicationType : String;
// mapType : String;
createdDateTime : String;
isDeleted : Boolean default false;
description : String;
isActive : Boolean default true;
createdBy : String; //This field we added extra to match like MockUp.
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

entity Users {
  key username                  : String;
  vendor                       : Association to Vendors;
  type                         : Integer;
  privilege                    : Privilege;
  numberOfAttemptsWithWrongPassword : Integer;
  isAccountLocked              : Boolean;
  adminRole                    : String;
  userType                     : String;
  lastLoggedInTime             : Timestamp;
  deviceDetails                : String;
  isFirstLogin                 : Boolean;
  createdByMailID              : String;
  createdBy                    : String;
  adminlist                    : String;
  createdDateTime              : Timestamp;
  selectedGroupList            : String;
  isUserLocatorActive          : Boolean;
  signurl                      : String;
  imageurl                     : String;
  adminType                    : String;
  isDeleted                    : Boolean;
  departments                  : Association to many Departments;
  phone                        : String;
  email                        : String;
  name                         : String;
  password                     : String;
  accountLockedOn              : Timestamp;
  __v                          : Integer;
}

entity Vendors {
key _id               : String;
departmentId          : String;
   departmentName        : String;
   createdByEmailID      : String;
   isDeleted             : Boolean; 
  img                   : String; 
  type                  : String; 
  name                  : String;  
 shortname             : String;  
 __v                   : Integer;
}

entity Privilege {
  downloads                    : Boolean;
  catalog                      : Boolean;
  privilegeList                : String;
}




