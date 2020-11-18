Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F72B8269
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 17:55:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbppJ1sXSzDqcQ
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 03:55:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JYESmzrk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbpmv27TLzDqJf
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 03:54:06 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AIGdO7H174506; Wed, 18 Nov 2020 11:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z5hWiGo2S2HqFE3rQWj1Euq6WSx/o8dhUbRnG2XBkAI=;
 b=JYESmzrkHZIZ+XFpwi64lT8uEFZxJA+ECyM8tu9OcBwnWAD+nsFp3A0O2UBtdojrZ1h5
 lNbGIfnN8LlTskYcrOse5dw3BwgQnJIsJn3BiIRKjWrvYk7FtSaiwIw/SHMHxthqFhpy
 GSXiTwb5qpLVDfIX355jok1Kt8pFGLf2vcK+OFvC2MN5ubBW+4VWoS8NePRpz+w1WAv6
 oGmeRjSWs02CpDjSzryq3tgK6JvGBgkL8t5FufgE9LC0VA6posXLGy+G0+EV1lgAm6F9
 IvhNhlshWTI2QkrJezcqPkpJVlzwv0AEXM4ow5pGeR6yLKfGKpz66up79TTQ0lg8u1GG AA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w4xbcy8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 11:54:02 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AIGmpu3027206;
 Wed, 18 Nov 2020 16:54:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 34uttrmkpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 16:54:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AIGs0Od2753156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 16:54:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBE7AAE05C;
 Wed, 18 Nov 2020 16:53:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72FEAAE067;
 Wed, 18 Nov 2020 16:53:59 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Nov 2020 16:53:59 +0000 (GMT)
Subject: Re: User-manager default group roles
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
References: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
 <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
 <77e2e674-23a9-1d2f-7cdd-88a3f5535e1c@linux.ibm.com>
 <2a47d048-7b27-7aa6-f813-18e985976c0a@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com>
Date: Wed, 18 Nov 2020 10:53:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <2a47d048-7b27-7aa6-f813-18e985976c0a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_04:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180113
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

On 11/18/20 1:11 AM, Thomaiyar, Richard Marian wrote:
>
> On 11/18/2020 12:47 AM, Joseph Reynolds wrote:
>> On 11/17/20 11:21 AM, Thomaiyar, Richard Marian wrote:
>>> Hi Joseph, For SSH to work fine, user must be part of priv-admin...
>>> This Message Is From an External Sender
>>> This message came from outside your organization.
>>>
>>> Hi Joseph,
>>>
>>> For SSH to work fine, user must be part of priv-admin and must have 
>>> command/shell as /bin/sh under /etc/passwd file instead of 
>>> /bin/nologin. Note: There is no direct group called ssh under 
>>> /etc/group, instead it is just emulated one from 
>>> phosphor-user-manager to add corresponding shell binary to the user.
>>> usermod --shell /bin/sh -G priv-admin ${USER}
>>>
>>> If requirement is SSH to be allowed based on group and allowed for 
>>> all user privileges, then user shell can be updated using usermod 
>>> --shell /bin/sh itself, but need to remove EXTRA_ARGS from the 
>>> dropbear.default 
>>> <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default>
>>
>> Richard,
>>
>> Thanks for the info.  I do intend to separate the "ssh" group role 
>> from the "priv-admin" privilege role.  My use case for the admin to 
>> NOT have ssh privilege, but the service user account does have ssh 
>> privilege.  I think this is cleaner and applicable to multiple use 
>> cases.
> In this case, need to remove the -G priv-admin from dropbear.defaults 
> (but all users who have sh command/shell, will be able to login) and 
> ssh doesn't provide any authorization for commands based on privileges.
>>
>> For the OpenBMC project defaults, I propose that when a new user is 
>> dynamically created with the "priv-admin" role, they also get the 
>> "ssh" group role.  After the user account is created, I do not intend 
>> for "priv-admin" and "ssh"  be be tied together, meaning you can 
>> change one and not the other, and you will get the results you expect.
>>
> Yes, i see your use case and user must be able to ssh irrespective of 
> privilege role he is in.
>> I understand the full set of work for this includes:
>> 1. Create the "ssh" Linux group to represent the "ssh" group role.
>
> Not needed (unless we really require to support usermod command - 
> "usermod -G "ssh" ${USER}). Won't usermod --shell /bin/sh ${USER} 
> won't be enough for covering the same. Assuming this is not the way we 
> are going to ask end-user to create a user.

Thanks for explaining!  Yes, using /bin/nologin works just as well...and 
does not need a new Linux group.

>
>> 2. Change the dropbear.defaults to "-G ssh" (was "-G priv-admin"). 
>> There may be forward compatibility concerns: for example, when this 
>> changes, everyone in the priv-admin group should be added to the 
>> "ssh" group.
>> 3. Change phosphor-user-manager [6] to re-swizzle the login shell 
>> path when a user is added or removed from the "ssh" group.
>> 4. Implement BMCWeb REST APIs [7], if desired.
>
> We don't require any change in bmweb rest API's for this, as these are 
> build time configurable (i.e. for ssh priv-admin). 
> phosphor-user-manager already provided D-Bus property to support 
> different account groups, i.e. for AccountTypes (Redfish,Ipmi 
> etc.)(for the schema update you are working with redfish forum). Once 
> the schema is defined, we just need to update the bmcweb to update the 
> property accordingly.
>
> Let me know if you have any other reason / usecase, which will not 
> work with this approach. If needed, we can even discuss this in 
> security WG.

My only other customized use case is to disable SSH access for all 
roles, including the builtin root/admin user.  To be clear, the SSH 
service will be present on my BMC, but only my special pre-created 
"service" account will be allowed to access a BMC command shell via SSH, 
and the BMC customer/admin has no way to cange who is authorized to use 
SSH.  <-- I think I get this for free because there are not REST APIs 
for the admin to control who has SSH access.  (Does SSH authentication 
use LDAP?)

- Joseph

>
> Regards,
>
> Richard
>
>>
>> - Joseph
>>
>> P.S. I intend to repeat this exercise for the ipmi group role.
>>
>> [6]: 
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml
>> [7]: 
>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp
>>
>>> Regards,
>>>
>>> Richard
>>>
>>> On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
>>>>
>>>> What is the right way to assign default phosphor-user-manager 
>>>> "group roles" to dynamically created users?
>>>>
>>>> Background: Currently, when a new local user is created via Redfish 
>>>> API POST /redfish/v1/AccountService/Accounts you have to specify a 
>>>> Redfish RoleId.  BMCWeb maps the RoleId to a phosphor user manager 
>>>> "Privilege Role" [1] and assigns ALL of the "group roles" to the 
>>>> new user [2].  Per [3] this is not intended, and I need to fix this 
>>>> for my use case.
>>>>
>>> usermod --shell /bin/sh -G priv-admin ${USER} is the correct command 
>>> for per[3].

Got it.  Thanks for explaining.  I understand: membership in the 
phosphor group-role "ssh" correlates exactly with the user account's 
login shell being "/bin/sh" (as opposed to "/bin/nologin").  In this 
way, any user who successfully authenticates to SSH then faces two 
additional blocks:
  - User must be a member of the "priv-admin" group.  I intend to remove 
this check.
  - User's login shell is used.  If /bin/sh then the user gains access.  
If /bin/nologin then the SSH session exits.

I think that works for me.

>>>> IMHO, the correct approach is for the project to define a mapping 
>>>> from "role" to "privilege role" that can be used when dynamically 
>>>> creating a new user.  For example, the admin role maps to "ssh ipmi 
>>>> redfish web" whereas the readonly role maps to "ipmi redfish web" 
>>>> (omits "ssh"). Then images can customize this as needed.
>>>>
>>>> But where should this mapping be applied?  Does it belong in BMCWeb 
>>>> or in phosphor-user-manager [4]?  Should we have another D-Bus 
>>>> property [5] to give this mapping?
>>> As of today, we are not separating user groups. All users created in 
>>> OpenBMC belongs to the build time configured groups.

Should SSH access only be given to "admin" users?  More generally, what 
is the intended design to provide the default group roles? Should all 
dynamically created local user accounts be given "ssh" access?  Or 
should ssh access only be given to "admin" users?

To control the defaults and provide a general mechanism, I propose a new 
D-Bus property for [5]:
     - name: DefaultGroups
       type: dict[string, array[string]]
       flags:
           - const
       description: >
           Maps from each privilege in AllPrivileges to the default 
groups for
           that privilege role (a subset of AllGroups) in a form 
suitable for
           CreateUser.GroupNames.

with implementation [4] in:
     /** @brief Maps from privilege to default set of groups */
     std::map<std::string,std::vector<std::string>> privToGroupsMgr =
     {
         {"priv-admin", {"web", "redfish", "ipmi", "ssh"}},
         {"priv-operator", {"web", "redfish", "ipmi"}},
         {"priv-user", {"web", "redfish", "ipmi"}},
         {"priv-noaccess", {}}
     };

Then when BMCWeb creates a new local account [7], it can use the new 
DefaultGroups property (indexed by the role) instead of AllGroups.

- Joseph

>>>>
>>>> - Joseph
>>>>
>>>> [1]: 
>>>> https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>>>> [2]: 
>>>> https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
>>>> [3]: https://github.com/openbmc/openbmc/issues/3643
>>>> [4]: 
>>>> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
>>>> [5]: 
>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml
>>>>
>>

