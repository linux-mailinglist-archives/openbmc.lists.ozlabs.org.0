Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4B212E1E3
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 04:16:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pCr86ZGwzDqCB
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 14:16:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pCqJ3bMczDq9L
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jan 2020 14:16:11 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00237Evp112636; Wed, 1 Jan 2020 22:16:05 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x87mqj1ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jan 2020 22:16:05 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00237HVC112834;
 Wed, 1 Jan 2020 22:16:05 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x87mqj19x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jan 2020 22:16:05 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0023FxSI002157;
 Thu, 2 Jan 2020 03:16:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2x5xp6xp1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jan 2020 03:16:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0023G3ig44433842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jan 2020 03:16:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A77EAC065;
 Thu,  2 Jan 2020 03:16:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0404BAC059;
 Thu,  2 Jan 2020 03:16:02 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.130.66])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jan 2020 03:16:02 +0000 (GMT)
Subject: =?UTF-8?Q?Re=3a_Re=ef=bc=9a_How_can_I_add_a_user_for_openbmc_and_re?=
 =?UTF-8?Q?move_the_default_root_user=3f?=
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, =?UTF-8?B?5Y2X6YeO44Og44Or44K3?=
 =?UTF-8?B?44Ko44Op44K0?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
 <4b32b6d0-da99-62c1-52f2-c2a7d4221dec@linux.intel.com>
 <tencent_74FD2ECBC3FF44DE65AAF884C881E0C34D05@qq.com>
 <a0e57fe5-e616-a0c2-a07a-a58407bebdfd@linux.intel.com>
 <7ff949ae-3292-09cf-071b-99385232e637@linux.vnet.ibm.com>
 <57829175-6ea3-8ed0-7e63-a36aa919f035@linux.intel.com>
 <0899a69e-ee7f-2fed-557b-5d2f1eca5066@linux.ibm.com>
 <0461171c-51c1-8528-89e9-8a2ced195e9c@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <b3cafdec-fb95-48d7-0040-d302d00b25ee@linux.ibm.com>
Date: Wed, 1 Jan 2020 21:16:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0461171c-51c1-8528-89e9-8a2ced195e9c@linux.intel.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-01_08:2019-12-30,2020-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001020028
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



On 12/19/19 3:09 AM, Thomaiyar, Richard Marian wrote:
>
> On 12/19/2019 12:06 PM, Joseph Reynolds wrote:
>> On 12/18/19 6:42 AM, Thomaiyar, Richard Marian wrote:
>>> Hi Gunnar,
>>>
>>> Yes root user can't be deleted (basically uid 0), can't be deleted. 
>>> The method works for other users only, like in case Liu, he wants to 
>>> delete the newly created user.
>>
>> FWIW, I am interested in moving the OpenBMC project away from having 
>> root login access enabled by default, and specifically disabling SSH 
>> access in general, and root access to the BMC's shell.  I also want 
>> to have a secure way to re-enable this when needed.  See 
>> https://github.com/ibm-openbmc/dev/issues/1528 Please let me know if 
>> you have any ideas on this topic.
>>
> Currently you will be. Remove debug-tweaks & allow-root-login from 
> IMAGE_FEATURES, then the build will make sure that root user looses 
> group permissions, and OpenBMC is with no user accounts. Any new user 
> accounts must be created from Host interface through IPMI interface 
> (that's the logic we currently have).
>
> Note:
>
> 1. This will not remove the root user (uid 0, which is needed as you 
> mentioned below), but will not have any password (In order to remove 
> the password in the OpenBMC it needs one line change to remove usermod 
> in phosphor-defaults.inc & the /etc/ipmi_pass file, currently we have 
> a patch in the down-stream for the same, as community still needs root 
> user account, but OpenBMC has been updated to remove root user from 
> Admin & other group privileges, when debug-tweaks / allow-root-logins 
> are not defined.

Nice!  Thank you for referencing that (I missed that review).  It seems 
to me that phosphor-defaults.inc should  set the root user password only 
when IMAGE_FEATURES includes allow-root-login, and otherwise not allow 
login.  My bitbake is weak, but something like this:

# Set the root password to '0penBmc' if IMAGE_FEATURES contains 
allow-root-login,
# otherwise use "!" so root cannot login.
EXTRA_USERS_PARAMS_pn-obmc-phosphor-image = " \
usermod -p \
${@bb.utils.contains("IMAGE_FEATURES", 'allow-root-login', "", "!", d}\
'\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
"
(except use correct bitbake syntax).


BTW, we ought to update the [password hash algorithm][], currently 
$1$=MD5 to $5$=SHA-256 or $6$=SHA-512.
[password hash algorithm]: https://en.wikipedia.org/wiki/Passwd


>
>>
>> I had understood the original question in this email thread as a 
>> request to "disable root access" so "root cannot login".  (Note that 
>> one consequence of disabling root login is that once you remove root 
>> access, it is hard to get back.  You'll have to use the sudo comand 
>> or su command from another user account, and I don't think sudo is 
>> present on OpenBMC systems.)
>>
>> I understand that deleting the root user is not advisable because the 
>> system will break.  Instead the alternative is to disable access to 
>> the root account, for example, by doing one of:
>> - Change root's login shell to /sbin/nologin
>> - Change the root password to empty or lock the root password
>> - Change Linux-PAM to deny root account access
>> - Expire the root account (chage -E0 root)
>>
>> Any idea which approach works best for OpenBMC?
>
> If you have removed the password, then it can't be used. But if you 
> need to enable it for debug or on special use case, then it requires a 
> method to set a password. We enable setting the root
> password using Set special user password OEM Command 
> (https://github.com/openbmc/intel-ipmi-oem/blob/master/src/oemcommands.cpp#L1130).
>
> Let me know your thoughts, As i see a decision can be made, i think we 
> can write a document (with community feedback), and move to a common 
> solution.

That sounds right to me.  I think various OpenBMC users have these use 
cases:

Use case 1: remove root access by default

We share the use case of removing root access by default which we can do 
by removing 'allow-root-login' from IMAGE_FEATURES.

I would like to see the OpenBMC project should move toward this as the 
default.  That bring me to use case 2...


Use case 2: have a way to re-enable root access

We also need a way to re-enable root access to the BMC's shell. I 
suggest we design a phosphor D-Bus API as the common way to enable and 
disable root login access.

I see divergent use cases for root shell access.  OpenBMC developers 
will continue to need root login (for example, SSH to the BMC using 
default root credentials) on a regular basis.  They will also need that 
access when they are called upon to debug systems currently running a 
workload.

However, users with sensitive data on their host system will want to 
lock out the root user, all SSH access, and especially root SSH access 
because of the additional capabilities root has compared with regular 
Administrator users and because of the difficulty in monitoring and 
auditing shell commands.  Specifically, I think root login access and 
SSH access must both be addressed.  In my opinion, if we give any users 
SSH access to the BMC shell, it is too easy for them to escalate that 
privilege to root, so we should have a way to lock out SSH access.

The solution you presented is an IPMI OEM command. Another idea is a 
Phosphor REST or Redfish API to control these items (root login and SSH 
server capability), and limit that to the BMC Administrator role.  Those 
APIs would use the D-Bus API as the underlying implementation.

I think OpenBMC needs an easy way to re-enable root access before we can 
remove root access.


Use case 3: create an admin user by default

A related topic is the use cases for the "genesis experience", that is, 
the first time a BMC admin uses their newly-installed BMC.  The options 
include:
A. The BMC has no default users.  When needed, they are created via 
unauthenticated host access.
B. The BMC has no default users.  An Administrator account is created by 
the initial user to access the system.  This would make OpenBMC behave 
like other operating systems (such as Ubuntu) and devices.
C. The BMC has a user with username=admin and role=Administrator and a 
default password.  This is close to what OpenBMC has now and what I 
would propose for the project default.  (Naturally, we would add 
'no-admin-user' to IMAGE_FEATURES for use cases that do not want this user.)

The options above all assume the current genesis & provisioning 
experience.  It would be possible to provision the BMC with its firmware 
image, custom user access credentials, an IP address, etc., before 
powering on the BMC for the first time.  I would like to explore the 
possibilities in that space, but the remainder of this note assumes the 
traditional genesis experience described in the options above.

In any case, the admin user will have a way to gain root login access 
for themselves and to lock out root access by non-admin users.

I think OpenBMC needs to document how to access and provision the BMC, 
including details such as how to login as root and how to lock out root 
access.

___

As usual, I've written too much.  I would be happy to hear your ideas, 
review your solution, and help where I can.

- Joseph


TL;DR: More ramblings for the use cases above: Have a way for a BMC 
Administrator to gain root access to the BMC shell.

What is the use case to allow a non-root user to use the BMC shell (via 
SSH or other access)?  What will that let them do?  I think you need to 
have sudo access for commands like journalctl and systemctl, or to 
invoke D-Bus APIs.  I mean I think what you can do with the BMC's shell 
is extremely limited without sudo access.  Are we thinking we should set 
up sudo?

If we have sudo access (so I can, for example: `ssh admin1@${bmc_ip} 
sudo`) then why would I need to login as root.  Would root login be 
needed?  I think we can do without root logins, but we would need to get 
sudo working...and havde a way to control when sudo is enabled. (In 
other words, I don't have good idea how to handle this.)

Note: Per the [phosphor user management group roles][], should the 
[access via SSH][] be changed to the "ssh" group?  It is currently 
restricted to the priv-admin group.

[phosphor user management group roles]: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-group-roles
[Access via SSH]: 
https://github.com/openbmc/openbmc/blob/adb78181f2183a3b0aa016cfd5d754710b828f30/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default


>
>>
>> - Joseph
>>
>>>
>>> Regards,
>>>
>>> Richard
>>>
>>>
>>> On 12/18/2019 2:38 AM, Gunnar Mills wrote:
>>>>
>>>> On 12/16/2019 7:44 AM, Thomaiyar, Richard Marian wrote:
>>>>>
>>>>> Delete interface is exposed as part of the user object itself. 
>>>>> Sample busctl command to do the delete of an user under 
>>>>> phosphor-user-manager
>>>>>
>>>>> busctl call xyz.openbmc_project.User.Manager 
>>>>> /xyz/openbmc_project/user/<username> 
>>>>> xyz.openbmc_project.Object.Delete Delete
>>>>>
>>>>>
>>>>
>>>> I am missing something here.. This does not work for me. I didn't 
>>>> think we allowed removing the root user, which is why it is 
>>>> disabled on the WebUI? If we do allow deleting the root user, 
>>>> should this be allowed from the WebUI?
>>>>
>>>> When sshed as root:
>>>> busctl call xyz.openbmc_project.User.Manager 
>>>> /xyz/openbmc_project/user/root xyz.openbmc_project.Object.Delete 
>>>> Delete
>>>> Call failed: The operation failed internally.
>>>>
>>>> In the journal I see
>>>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: userdel: user root 
>>>> is currently used by process 1
>>>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation 
>>>> failed internally.
>>>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: User delete failed
>>>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation 
>>>> failed internally.
>>>>
>>>>
>>>> When sshed as an "Administrator" role account,  with the same call:
>>>> Call failed: Access denied
>>>>
>>>> NOTE: As an "Administrator" role I can't delete a user using 
>>>> "busctl call" only from the Redfish/WebUI, am I able to.
>>>>
>>>> Thanks!
>>>> Gunnar
>> Regards,
> Richard

