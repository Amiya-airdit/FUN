const axios = require("axios");
// var cfenv = require("cfenv")

// var appEnv = cfenv.getAppEnv()
const IDP_USERNAME='858b5457-bbe5-4fff-9b15-400baf0afe64';
const IDP_PASSWORD='h:98.ZZl1e[KKCI3ZWfuOOsY26cJebUyCg4';
const IDP_ENDPOINT='https://a8emy1lrr.accounts.ondemand.com';
module.exports = (srv) => {
  srv.on("READ", "BTPUser", async (req) => {
    try {
      const base64Credentials = Buffer.from(`${IDP_USERNAME}:${IDP_PASSWORD}`, 'utf-8').toString('base64');
      const headers = {
        'Authorization': `Basic ${base64Credentials}`
      };

      const response = await axios.get(`${IDP_ENDPOINT}/scim/Users`, {
        headers: headers
      });
      console.log(response.data.Resources);
      // const users = response.data.Resources.map(user => ({
      
      //   name: `${user.name.givenName} ${user.name.middleName} ${user.name.familyName}`,
      //   userName: user.userName,
      //  emails: user.emailId && user.emailId.length > 0 ? user.emailId[0].value : null

      // }));

      // return users;
      response.data.Resources['$count']=response.data.Resources.length;
      return response.data.Resources;
    } catch (err) {
      console.error('Error fetching data:', err);
      throw err; 
    }
  });
 
  srv.on("CREATE", "BTPUser", async (req) => {
    try {
      const {
        userName,
        givenName,
        middleName,
        familyName,
        emails,
        status,
        mobileNo,
      } = req.data;
      const userData = {
        schemas: ["urn:ietf:params:scim:schemas:core:2.0:User"],
        userName,
        name: {
          givenName: givenName,
          middleName: middleName,
          familyName: familyName,
        },
        emails: [{ value: emails, type: "work", primary: true }],
        active: status, 
        phoneNumbers: [{ value: mobileNo, type: "mobile" }], 
      };
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type": "application/scim+json",
      };
 
      const response = await axios.post(
        `${IDP_ENDPOINT}/scim/Users`,
        userData,
        { headers }
      );
      console.log("User created successfully:", response.data);
      return response.data;
    } catch (err) {
      console.error("Error creating user:", err.message);
      req.reject(500, "Failed to create user");
    }
  });
  srv.on("PUT", "BTPUser", async (req) => {
    try {
      const { id,userName, emails } = req.data;
      console.log("Data received:", id, userName, emails);
  
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type": "application/scim+json",
      };
  
      const updateData = {
        schemas: [
          "urn:ietf:params:scim:schemas:core:2.0:User",
          "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User",
          "urn:sap:cloud:scim:schemas:extension:custom:2.0:User"
        ],
        userName: userName,
        emails: [
          {
            value: emails,
          },
        ],
      };
      const response = await axios.put(
        `${IDP_ENDPOINT}/scim/Users/${id}`,
        updateData,
        { headers }
      );
  
      console.log("User updated successfully:", response.data);
      return response.data;
    } catch (err) {
      console.error("Error in processing UpdateBTPUsers request:", err);
      throw err;
    }
  });
  srv.on("DELETE", "BTPUser", async (req) => {
    try {
      const { id } = req.params[0];
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type":'application/scim+json'
      };
 
      await axios.delete(`${IDP_ENDPOINT}/scim/Users/${id}`, {
        headers: headers,
      });
      console.log(`User ${id} deleted successfully`);
      return { message: `User ${id} deleted successfully` };
    } catch (err) {
      console.error("Error deleting user:", err);
      throw err;
    }
  });
  srv.on("CREATE", "Groups", async (req) => {
    try {
      const { groupName } = req.data;
      console.log(
        req.data,
        "Incoming request data----------------------------"
      );
      const groupData = {
        schemas: ["urn:ietf:params:scim:schemas:core:2.0:Group"],
        displayName: groupName,
      };
      console.log(groupData);
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type": "application/scim+json",
      };
 
      const response = await axios.post(
        `${IDP_ENDPOINT}/scim/Groups`,
        groupData,
        { headers }
      );
 
      console.log("Group created successfully:", response.data);
      return response.data;
    } catch (err) {
      console.error("Error creating group:", err.message);
      req.reject(500, "Failed to create group");
    }
  });
 
  //READ Groups--------------------------------------------------------------------------:-
 
  srv.on("READ", "Groups", async (req) => {
    try {
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
      };
 
      // Make the GET request to the SCIM API for groups
      const response = await axios.get(
        `${IDP_ENDPOINT}/scim/Groups`,
        { headers }
      );
      const groups = response.data.Resources.map((group) => ({
        id: group.id,
        groupName: group.displayName,
        description:
          group["urn:ietf:params:scim:schemas:extension:custom:2.0:Group"]
            ?.description || "",
        members:
          group.members?.map((member) => ({ userId: member.value })) || [],
      }));
      // console.log(groups);
      console.log(JSON.stringify(groups, null, 2));
      return groups;
    } catch (err) {
      console.error("Error fetching groups:", err.message);
      req.reject(500, "Failed to fetch groups");
    }
  });
 
 //DELETE GRoup:------------------------------------------------------------------------
  srv.on("DELETE", "Groups", async (req) => {
    try {
      const { id } = req.data;
      console.log(
        req.data,
        "Incoming delete request id---------------------------"
      );
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type": "application/scim+json",
      };
 
      const response = await axios.delete(
        `${IDP_ENDPOINT}/scim/Groups/${id}`,
        { headers }
      );
 
      console.log(`Group ${id} deleted successfully`);
      return { message: `Group ${id} deleted successfully` };
    } catch (err) {
      console.error("Error creating group:", err.message);
      req.reject(500, "Failed to create group");
    }
  });
  srv.on("PUT", "Groups", async (req) => {
    try {
      const { id, groupName, members } = req.data;
 
      console.log("Data received for group update:", id, groupName, members);
 
      const base64Credentials = Buffer.from(
        `${IDP_USERNAME}:${IDP_PASSWORD}`,
        "utf-8"
      ).toString("base64");
 
      const headers = {
        Authorization: `Basic ${base64Credentials}`,
        "Content-Type": "application/scim+json",
      };
 
      const updateData = {
        schemas: ["urn:ietf:params:scim:schemas:core:2.0:Group"],
        id: id,
        displayName: groupName,
        members: members.map((member) => ({
          value: member.value,
          type: "MemberRef",
        })),
      };
 
      console.log(updateData, "updatedData---------------------");
      const response = await axios.put(
        `${IDP_ENDPOINT}/scim/Groups/${id}`,
        updateData,
        { headers }
      );
 
      console.log("Group updated successfully:", response.data);
      return response.data;
    } catch (err) {
      console.error("Error in processing UpdateBTPGroups request:", err);
      throw err;
    }
  });
};
 