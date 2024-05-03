using UserManagement as service from '../../srv/user-group';
annotate service.BTPUser with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'id',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'userName',
                Value : userName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'givenName',
                Value : givenName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'middleName',
                Value : middleName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'familyName',
                Value : familyName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emails',
                Value : emails,
            },
            {
                $Type : 'UI.DataField',
                Label : 'active',
                Value : active,
            },
            {
                $Type : 'UI.DataField',
                Label : 'userId',
                Value : userId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mobileNo',
                Value : mobileNo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mailVerified',
                Value : mailVerified,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'id',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'userName',
            Value : userName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'givenName',
            Value : givenName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'middleName',
            Value : middleName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'familyName',
            Value : familyName,
        },
    ],
);

