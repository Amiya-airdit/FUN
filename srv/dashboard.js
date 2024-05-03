const cds = require('@sap/cds');
const { MongoClient } = require('mongodb');
const uri = "mongodb://Amiya:Amiya1999@74.225.222.62:27017/";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

module.exports = cds.service.impl(async function() {
    const db = await client.connect().then(() => client.db("AGPUATDB"));
    this.on('READ', 'lic', async (req) => {

        const result = await db.collection('lic').aggregate([
            {
                $lookup: {
                    from: 'users',
                    localField: 'assignedTo',
                    foreignField: '_id',
                    as: 'assignedUser'
                }
            },
            {
                $unwind: '$assignedUser',
                // preserveNullAndEmptyArrays: true
            },
            {
                $project: {
                    _id: 0,
                    expiryDate: 1,
                    deviceDetails: 1,
                    loggedInTime: 1,
                    logoutTime: 1,
                    assignedTo: '$assignedUser.name'
                }
            }
        ]).toArray();
        return result;
    });
    this.on('READ', 'inactiveusers', async (req) => {
        const currentDate = new Date();
    const ninetyDaysAgo = new Date(currentDate.getTime() - (90 * 24 * 60 * 60 * 1000));

        const results = await db.collection('users').aggregate([
            {
                $match: {
                    lastLoggedInTime: { $lte: ninetyDaysAgo }
                }
            },
            {
                $lookup: {
                    from: 'departments',
                    localField: 'departments',
                    foreignField: '_id',
                    as: 'departmentpostalcode'
                }
            },
            {
                $unwind: '$departmentpostalcode',
                // preserveNullAndEmptyArrays: true
            },
            {
                $project: {
                    _id: 0,
                    name:1,
                    username:1,
                    deviceDetails: 1,
                    lastLoggedInTime: 1,
                    departments: '$departmentpostalcode.postalcode'
                }
            }
        ]).toArray();
        console.log(results);
        return results;
    });
    
    this.on('stopped', () => client.close());
});
