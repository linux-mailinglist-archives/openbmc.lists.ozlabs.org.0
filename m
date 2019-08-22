Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF79A3AF
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 01:21:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F0sm4X5JzDrZC
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 09:21:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F0rx5ySbzDrRc
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 09:21:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MNH7hY063377; Thu, 22 Aug 2019 19:20:58 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uj1amem5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 19:20:58 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7MNJwUn013909;
 Thu, 22 Aug 2019 23:20:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2ue976tshp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 23:20:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MNKunA44302652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 23:20:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10BC4C605B;
 Thu, 22 Aug 2019 23:20:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF350C605D;
 Thu, 22 Aug 2019 23:20:55 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 22 Aug 2019 23:20:55 +0000 (GMT)
Subject: Re: BMCWeb changes for expired password design
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
 <21bdc6a1-2397-c115-cdb6-201ebf3041b2@intel.com>
 <c1fba479-a81c-bd63-0157-42143ffab08a@linux.ibm.com>
 <67a0677e-0ef8-663b-8d6a-9be7141606a9@intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <40cb4914-80e8-486b-8300-3ee72c3d31d8@linux.ibm.com>
Date: Thu, 22 Aug 2019 18:20:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67a0677e-0ef8-663b-8d6a-9be7141606a9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220204
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


On 8/15/19 6:13 PM, Ed Tanous wrote:
> On 8/15/19 3:46 PM, Joseph Reynolds wrote:
>> Here are some low level design ideas:
>>
>> Enhance bmcweb/include/pam_authenticate.hpp - pamAuthenticateUser() like:
>>    inline bool pamAuthenticateUser(const std::string_view username,
>>      const std::string_view password,
>>      bool &passwordChangeRequired)
>> so that if the password is correct but expired, the function will return
>> true and set passwordChangeRequired=true.
>>
>> This change will get the passwordChangeRequired status to where it is
>> needed.  As you mentioned, each of those will respond differently:
>> - Basic Auth will fail when passwordChangeRequired=true
>> - POST /login will fail when passwordChangeRequired=true, with an
>> additional message
>> - POST /redfish/v1/SessionManager/Sessions will succeed when
>> passwordChangeRequired=true
> Sounds good.
>
>> Naturally, the crow::persistent_data::UserSession will store the new
>> passwordChangeRequired field, with all the changes that requires.
> This is what I meant about using the existing privilege system and not
> hardcoding it.  I suspect when we hit this, we need to give the user a
> "OnlyCanChangePassword" privilege, then tag some routes appropriately
> with that flag.  In this way, we will still properly handle all the
> routes that don't require auth (like ServiceRoot) but can reject any
> requests that require any privileges if the password hasn't been set.

Agreed.  The OnlyCanChangePassword privilege is exactly the Redfish 
ConfigureSelf privilege.  (I learned about that after I wrote my first 
email.)

>
> You would amend this function to handle the case where the users
> password needs changed, and to apply the correct Privilege.
> https://github.com/openbmc/bmcweb/blob/a2730f017069aeb39ea5d3bf4c1403965b2ba2f9/redfish-core/include/privileges.hpp#L180
>
>
>> Skipping ahead a bit, I think
>> crow::token_authorization::Middleware.beforeHandle() should have the
>> following logic after it successfully locates a session:
>>    if (req.session.passwordChangeRequired &&
>>        !isOnPasswordChangeRequiredWhitelist(req))
>>    then fail with HTTP status 403 and an explanation in the payload
> See above statement, use the privileges module to do this.
> This would mechanically look like going here:
> https://github.com/openbmc/bmcweb/blob/a2730f017069aeb39ea5d3bf4c1403965b2ba2f9/crow/include/crow/routing.h#L1245
>
> and adding something like
>          if (!rules[ruleIndex]->checkPrivileges(userPrivileges))
>          {
>              // if the user was only granted the ability to change the
> password, print the correct message.
>              if (userPrivileges.isSupersetOf({"OnlyCanChangePassword"}){
> 		// res.result.jsonValue = ...... appropriate error message for the type.
>              } else {
>                  //While we're here, and we're implementing error codes
> properly, we might as well fix the normal 403 handler.
>              }
>              res.result(boost::beast::http::status::forbidden);
>              res.end();
>              return;
>          }
>
>
>> Where new function isOnPasswordChangeRequiredWhitelist returns true in
>> the following cases:
>>    isOnWhitelist(req) || GET or DELETE mySession || GET or PATCH myAccount
> This is exactly what I meant when I said "do not have a fixed "go/no-go"
> url list".  We already have a privilege system that can tag handlers,
> and has more information about the route map than can be provided in a
> single if statement.  Lets use it as it was intended.
>
> Also, I'm not sure what you meant by mySession and myAccount.   I'm
> assuming you meant AccountService and SessionService?
Close.  I meant the actual account and session resource within the 
collection.  I've clarified this in my discussion below.
>
> Another thing to realize:  With the last round of per-verb router
> registrations that went in several months ago, isOnWhitelist is likely
> going away, as it's redundant to the existing privilege mechanisms (and
> super inefficient to boot).  It's only still there because I have a
> healthy paranoia of removing security features whitelists like that
> without testing the hell out of the changeset ahead of time.

Thanks for your response and the links into BMCWeb code.

I think BMCWeb needs tweaks to its authority model to match the Redfish 
spec for the ConfigureSelf privilege.  (And I apologize in advance for 
the C++ish code in this email.)

The key parts of the Redfish spec are below. An understanding of these 
sections is required to understand the BMCWeb authority changes I am 
proposing.

The Redfish spec 1.7.0
http://redfish.dmtf.org/schemas/DSP0266_1.7.0.html
   Section 13.2.6.1 ("Password change required handling")
   Section 13.2.10.5 ("Property override example")

DSP2046 The Redfish Resource and Schema Guide, version 2019.1
http://redfish.dmtf.org/schemas/DSP2046_2019.1.html
   search for "ConfigureSelf"


Change 1: When a user establishes a session where 
PasswordChangeRequired=True, that session should only have the 
ConfigureSelf privilege; the user's normal role should be disregarded 
for that session.

One way to handle this is to create a new user role 
"priv-configure-self" (used only internally within BMCWeb) which grants 
only the Redfish ConfigureSelf privilege.  Then when creating the 
UserSession:
   if (pamAuthenticateUser() indicated passwordChangeRequired==true)
     session.userRole = "priv-configure-self";  // override

This sets up the idea (mentioned in your email) that you can use the 
following code in routing.h:Router.handle() to detect if the current 
session is for password change only:
     userPrivileges.isSupersetOf({"ConfigureSelf"})

[routing.h]: 
https://github.com/openbmc/bmcweb/blob/master/crow/include/crow/routing.h

Change 2: In routing.h:Router.handle(), when 
(userPrivileges.isSupersetOf({"ConfigureSelf"}) == true) add the:
    "@Message.ExtendedInfo object containing the PasswordChangeRequired 
message from the Base Message Registry"
to the HTTP 403 response.  (The quoted language is from the Redfish 
spec, section 13.2.6.1.)

Change 3: Ignore the user's ConfigureSelf privilege when accessing an 
account or session which is not theirs.  Details:

I think we need to change routing.h:Router.handle() to implement the 
Redfish ConfigureSelf privilege.
The Redfish ConfigureSelf privilege 
(http://redfish.dmtf.org/schemas/DSP2046_2019.1.html) is defined as, 
"Able to change the password for the current user Account."  I 
understand this privilege should also allow the user to terminate their 
session.  The relevant routes and verbs which should be allowed are:
   /redfish/v1/AccountService/Accounts/<account>/  GET
   /redfish/v1/AccountService/Accounts/<account>/  PATCH (only Password, 
see change 4 below) and GET
   /redfish/v1/SessionService/Sessions/<session>/   DELETE

Specifically, in routing.h:Router.handle():
if
   (((rules[ruleIndex].rule matches
       "/redfish/v1/AccountService/Accounts/<account>/")
   and
     ("<account>" does not match session.username))
or
     (((rules[ruleIndex].rule matches
     "/redfish/v1/SessionService/Sessions/<session>/")
   and
     ("<session>" does not match session.uniqueId)))
then
     // if we got here, the user is accessing an account
     // or session not their own, so the ConfigureSelf
     // privilege does not apply.
     // remove the ConfigureSelf privilege:
     userPrivileges = userPrivileges.remove({ConfigureSelf});
endif
...perform the authority check against userPrivileges as usual ...

Change 4: ConfigureSelf should only apply to PATCH 
/redfish/v1/AccountService/Accounts/<account> Password, not to the 
entire ManagerAccount resource.
This special case is seen in the example in section 13.2.10.5 referenced 
above.  It is needed because ConfigureSelf applies specifically to the 
ManagerAccount Password property, and no other properties in that resources.

To handle this make two changes to: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp 
class ManagerAccount:
A. For this resource, boost::beast::http::verb::patch should allow 
{ConfigureSelf}.
B. Add an additional check to doPatch() to ensure ConfigureSelf 
privilege only allows the the Password property to be patched.
If we are trying to PATCH something other than the Password property, 
re-check authority like this:
if ((newUserName or enabled or roleId or locked) and
   (!check user privileges with ({ConfigureSelf}) removed))
then
   fail the request with HTTP 403

Whew.  I think that covers the authority changes needed for BMCWeb to 
implement the PasswordChangeRequired design.  It seems like the design 
is getting closer.  What do you think?

- Joseph

>
>> Doing it this way seems the most clear and only adds a few cycles in the
>> usual case.  It seems like having a new whitelist for this situation is
>> correct because Redfish specifies that these interfaces are needed for
>> PasswordChangeRequired handling.  And this way avoids having to change
>> the authority model.
> What I suggested above does not require any changes to the authority
> model, aside from adding a privilege type which is supported already,
> and shouldn't require any code changes to the privileges module itself.
>

