Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E7F868A
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 02:42:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Br8F0K81zF53m
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 12:42:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Br7G03qQzF4pG
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 12:41:13 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAC1WWZW118354
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 20:41:06 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w7k22raay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 20:41:05 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAC1LBt7026989
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2w5n36ajf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAC1f30t51904790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E7592805C
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 392752805A
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:03 +0000 (GMT)
Received: from demeter.local (unknown [9.85.203.161])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 01:41:03 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMCWeb auth primer
Message-ID: <98ab5fc7-60e7-3e90-1e9e-bf7e220a2a50@linux.ibm.com>
Date: Mon, 11 Nov 2019 19:41:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120009
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear OpenBMC community and BMCWeb maintainers,

I worked on BMCWeb, learned how it works, and put together this little 
primer on its authentication and authorization flows.  I think portions 
of it are generally useful to the community, and specifically useful to 
help guide BMC security work.  Certainly, I may want to refer back to it.

The material is more-or-less in markdown format, but no promises.

Take a peek, learn about auth security topics, correct my errors and 
omissions, and let me know your ideas how to incorporate this into the 
project.  Thank you!

- Joseph


# BMCWeb auth primer

This describes the BMCWeb server's authentication and authorization 
flows, showing how they relate to the usage shown in the [REDFISH 
cheatsheet][] and [REST cheatsheet][], to [Phosphor User Manager][], and 
to the [BMCWeb code][].

[REST cheatsheet]: 
https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md
[Redfish cheatsheet]: 
https://github.com/openbmc/docs/blob/master/REDFISH-cheatsheet.md
[Phosphor User Manager]: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md
[BMCWeb code]: https://github.com/openbmc/bmcweb

This first introduces UserSession objects, then described authentication 
and all of its related features and code flows, and then covers 
authorization flows.


## The SessionStore and UserSession objects

The SessionStore (a collection of UserSession objects) is a central 
feature in BMCWeb's authentication and authorization flows. 
Authenticated sessions are added to the session store and used to 
authenticate subsequent accesses.  The UserSession objects are then used 
to determine which operations are allowed.

A UserSession object has fields including:
  - username - the username of the account associated with this session.
  - sessionToken - the secret access token to authenticate to this 
session.  This token is given to clients during login and passed back to 
BMCWeb to authenticate access the session.
  - csrfToken - the secret token to prevent XSRF attacks; this is needed 
when SESSION cookies are used.
  - the sessionId - the ID for this session, such as available via 
/redfish/v1/SessionService/Sessions/${sessionId}.

The SessionStore and UserSession classes are in include/sessions.hpp.


## Authentication

Authentication establishes identity.  BMCWeb creates or locates an 
existing UserSession object and associates it with each HTTP request.

For background information about authentication in BMCWeb, refer to the 
"Redfish Spec > Security details > Authentication" 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.8.0.pdf

In BMCWeb, you can authenticate to either:
- create a session (such as via login)
- use a session (via the sessionToken returned from a previous login), or
- perform a single operation (such as via Basic Access Authentication).

Most URIs require authentication for access, with exceptions for 
whitelisted routes such as /redfish and /login.  UserSession objects 
created by login are added to the SessionStore and removed when either 
the operation completes, logout, or timeout, as described below.  
Temporary UserSession objects are created for login-less operations, 
such as via Basic Auth.

BMCWeb supports several usage patterns for session-less access and for 
logging in, using a session, and signing out.  The following sections 
give a simplified overview of the authentication credentials involved in 
each operation.  Specifically, every kind of authentication is shown 
along with a stylized list of the credentials provided in the request, 
and credentials returned in the response.  The credentials are:
  - ${u} is the username
  - ${p} is the password
  - ${base64_username_and_password} is the username and password base64 
encoded
  - ${S} is the session's sessionToken -- this secret is known only to 
the client who created the session
  - ${XSRF} is the session's csrfToken
  - ${uniqueId} is the session's uniqueId -- this is not a secret, but 
should not be predictable

The overview is simplified as follows: authentication is always 
successful, JSON syntax is simplified, some JSON request and response 
fields are omitted, and HTTP header syntax is simplified.

### Operations involving authorization
This shows all of BMCWeb's operations related to authorization.

#### Login APIs
Login creates a session and returns a sessionToken.  The client can then 
use the sessionToken for subsequent access to that session.

BMCWeb has two login APIs.  The general flow for login APIs is: take a 
username and password, validate them via Linux PAM, create a 
UserSession, and return credentials needed to access that session. The 
login APIs do not require authentication or authorization to invoke, 
which means anyone on the BMC's network is allowed to access the API; 
the login handler itself (as part of its function) authenticates the 
user, and if successful, creates a session and returns credentials for 
that session.

POST /login
This takes credentials in the HTTP request, either in the header or in 
the body.  The supported forms are shown below.  Similarly this returns 
credentials to the created session in various forms in the HTTP 
response.  The forms are:
  - request body {username:${u}, password:${p}}
       -> response body {token: ${S}}
  - request body {data: {username:${u}, password:${p}}}
       -> response body {token: ${S}}
  - request headers "username: ${u}" and "password: ${p}"
       -> response body {token: ${S}}
  - request body {data: [${u},${p}]}
       -> response header Set-Cookie: SESSION=${S} and XSRF-TOKEN=${XSRF}
       This form corresponds to the REST cheatsheet /login example using 
session cookies.

POST /redfish/v1/SessionService/Sessions/
  - request body {username: ${u}, password:${p}}
       -> response header contains: X-Auth-Token=${S} and response body 
contains: {Id: ${uniqueId}}

#### Using a session
Creating a login session returns a sessionToken to the requesting 
client.  To use that session to perform an operation, token ${S} must be 
provided in the request header.  This token is used to locate the 
UserSession in BMCWeb's SessionStore.  The sessionToken can be provided 
in one of these forms:
  - request header X-Auth-Token: ${S}
  - request header Authorization: Token ${S}
  - request headers Cookie: SESSION=${S} and Cookie: XSRF-TOKEN=${XSRF}
  -> No credentials are returned in the response.

Notes:
- Mix and match: No matter how a session is created, it can be used by 
any of the supported mechanisms described here.  The client may need to 
copy session credentials from their login response into subsequent 
requests.  For example, you can create a session with the /login API, 
read the sessionToken from the SESSION cookie, and supply it as the 
X-Auth-Token on subsequent requests.
- BMCWeb has Cross Site Request Forgery (XSRF) protection for its 
SESSION cookies.  The only way to get the required XSRF-Token is to use 
the login form that returns cookies.
- Although all of BMCWeb sessions appear as Session objects (under 
/redfish/v1/SessionService/Sessions) and can be manipulated there, only 
the Redfish login returns the session's uniqueId to the session's client.

#### Basic auth
Basic access authorization lets a client perform an operation without 
having to first login.  The username and password are provided as http 
request headers and checked via PAM.  BMCWeb creates a temporary session 
and does not return any session credentials.
  - request header Authorization: Basic $(base64_username_and_password}
       -> No credentials are returned in the response.

#### Ending a session and timeout
Sessions can be explicitly terminated (aka logout) or can timeout.

The timeout duration and mechanism are in include/sessions.hpp / 
SessionStore members timeoutInMinutes, applySessionTimeouts, etc.

The POST /logout operation terminates the current session; its handler 
is in include/token_authorization_middleware.hpp / requestRoutes.

The DELETE /redfish/v1/SessionService/Sessions/${uniqueId} operation 
deletes the specified session; its handler is in 
redfish-core/lib/redfish_sessions.hpp / SessionCollection.doDelete().

#### Changing user passwords
A user account password can be changed via PATCH to 
/redfish/v1/AccountService/Accounts/{useraccount} with JSON data 
{Password: NEWPASSWORD}.  The legacy API 
/xyz/openbmc_project/user/root/action/SetPassword is no longer used.

### Restarting BMCWeb
BMCWeb preserves its SessionStore between restarts.  This means that 
when BMCWeb restarts, current sessions may experience a delay in 
service, but will not have to login again and can use their existing 
session.   Specifically, BMCWeb writes its SessionStore to a file when 
it exits, and reads it back in when it starts.  The mechanism is 
provided by include/sessions.hpp / SessionStore and 
include/persistent_data_middleware.hpp / Middleware.

### Expired password - PENDING
The Redfish PasswordChangeRequired handling implementation is pending.
The approved design is here 
https://github.com/openbmc/docs/blob/master/designs/expired-password.md
Pending implementation: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/25146
This design allows a user to login when their password is expired. When 
authentication is successful but the account has an expired password, 
the session is created with PasswordChangeRequired handling which means 
it will have limited authority: it can change the password and log off.

### mTLS certificate-based authentication - PENDING
A mTLS certificate-based authentication implementation is pending.
The approved design is here: 
https://github.com/openbmc/docs/blob/master/designs/redfish-tls-user-authentication.md 

Pending implementation: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/23588
mTLS certificate-based authentication has the admin upload a user's 
certificate to the BMC, then whenever that user contacts BMCWeb, the TLS 
connection validates the certificate, thus both establishing the user's 
identify and authenticating the user.  BMCWeb uses a temporary session 
for the operation.
  - No credentials are provided in the request.
  -> No credentials are returned in the response.

The mTLS certificate-based authentication has priority over other 
authentication methods.  Specifically, if TLS auth is successful where 
there is an expired, password, the session will NOT be restricted by the 
PasswordChangeRequired handling.

### Implementation

HTTP requests flow into token_authorization_middleware.hpp / 
beforeHandle() which detects the authentication technique used and tries 
to attach a UserSession object to the request.  This function defines 
the order in which authentication methods are attempted. Note that the 
login URIs are on the whitelist, so their handlers are called 
unauthenticated (with no UserSession object).

The POST /login operation handler is in 
include/token_authorization_middleware.hpp / requestRoutes.

The POST /redfish/v1/SessionService/Sessions/ operation handler is in 
redfish-core/lib/redfish_sessions.hpp / SessionCollection.doPost().

Authentication is performed via functions in 
include/pam_authenticate.hpp such as pamAuthenticate.


## Authorization

Authorization determines if access to an operation is allowed. BMCWeb 
first performs authentication then uses resulting UserSession object to 
perform the authorization check.  The user's Privilege Role is mapped to 
a Redfish Role, then to Redfish Privileges which are compared against 
the privilege required by the requested operation.

According to [OpenBMC User Management][], each user has a Privilege 
Role.  BMCWeb maps this to a Redfish Role, which then follows the 
Redfish privilege model/Authorization subsystem which maps Users to 
Roles, Roles to Privileges, and Operations to Privileges (where an 
operation is an HTTP verb and URI).  See the "Redfish Service 
operation-to-privilege mapping" section of the spec.  BMCWeb's 
implementation is described in the next sections.

[OpenBMC User Management]: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md
[Redfish Spec]: 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.8.0.pdf 


### Basic flow

HTTP requests flow into http/routing.hpp Router.handle() (and 
handleUpgrade()) which looks up two things:
- the user's Privilege Role (via sessions.hpp class UserRoleMap function 
getUserRole), maps that to a Redfish Role, and maps that to the Redfish 
Privileges.  If there is no session (such as during a login request), 
the request has no Privileges.
- the operation (the URI together with the verb or method); this 
includes the Privileges required to perform that operation.  Note that 
the privileges required for Redfish operations use the Redfish 
"Privilege AND and OR syntax".

The function checks the user's privileges against the privileges 
required.  Functions in redfish-core/include/privileges.hpp implement 
the Redfish "Privilege AND and OR syntax".

The privilege checking in routing.hpp implements the Redfish 
OperationMap, except:
- Does not implement property overrides.
- Does not implement subordinate overrides.
- Does not implement resource URI overrides.
- Does not properly implement the limitations of the ConfigureSelf 
privilege which allows a user to operate only on their own account or 
session.  (See the proposal below.)

Note about unauthenticated requests.  Certain whitelisted routes such as 
"/redfish" and "/login" do not require authentication. There is no 
UserSession object associated with these requests (the session field 
contains the nullptr value even if authentication credentials were 
provided).  This request carries no privileges and is only allowed by 
operations which do not require any privilege (such as the whitelisted 
routes, including login).

PROPOSAL: This is a proposal to implement the Redfish ConfigureSelf 
privilege, as implemented in the pending expired password design mention 
above.  The gist of the proposal is: Change the OperationMap for 
operations such as PATCH ManagerAccount to  be more permissive, allowing 
any user who has ConfigureSelf privilege.  This allows control to flow 
into the handler where more information is available, where proper 
authority checking can be performed.

Here's an example of how the ConfigureSelf privilege works.  Per the 
Redfish Privilege Registry, to PATCH a ManagerAccount requires the 
ConfigureUsers privilege.  Redfish also defines a Password Property 
override: to PATCH the Password property of an account requires the 
ConfigureSelf privilege.  And the ConfigureSelf privilege itself applies 
only to a user's own Account or Session.  The overall effect is intended 
to allow a user with the ConfigureUsers privilege to configure any user, 
and all users to work with specific aspects of their Account.

BMCWeb's authorization mechanism handles the basic Redfish OperationMap, 
but does not handle overrides or the ConfigureSelf privilege.  
Continuing the example from the previous paragraph, BMCWeb allows any 
user with ConfigureSelf privilege to access the handler to PATCH a 
ManagerAccount.  This is apparently violates of the Redfish spec.  But 
the handler itself then performs a more specific check, where it can 
determine if the ConfigureSelf privilege should apply (only when the 
session user is the same as the account's user) and can apply the 
Password property override correctly.

The implementation re-uses parts of the authorization mechanism that was 
performed in routing.hpp.  Specifically, function 
isAllowedWithoutConfigureSelf() defined in node.hpp uses the same 
functions in privileges.hpp.

### User to Privilege Role mapping

The user's role is retrieved by function UserRoleMap.getUserRole in 
sessions.hpp.  This class uses D-Bus to dynamically get changes to User 
Privilege Roles.  That means each time a session is used, it uses the 
then-current User role.  (Note that versions before 10/2019 stored the 
UserRole in the UserSession.)

### Flows to init the OperationMap

BMCWeb initializes all the URIs, verbs, and privilege required for each 
when it starts running (in src/webserver_main.cpp / main()). The URI is 
also referred to as an "entity" or a "route".

The Node class in redfish-core/include/node.hpp brings together a URI, 
handlers for each verb, and an OperationMap.  The OperationMap (as 
Node.entityPrivileges) maps from an HTTP verb to the privileges 
required.  In the context of the Node, this defines the privileges 
required for each operation.

The Node objects are all set up by the webserver_main.cpp, such as by 
calls to various requestRoutes() functions and invocations of the 
BMCWEB_ROUTE macro.

