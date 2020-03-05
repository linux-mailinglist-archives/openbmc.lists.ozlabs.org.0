Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B678179CCE
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 01:27:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xs4y2M2MzDqjk
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 11:26:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xs4H5lZkzDqYL
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 11:26:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0250KaY3123609; Wed, 4 Mar 2020 19:26:20 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhrye7kb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 19:26:20 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0250LwJu028228;
 Thu, 5 Mar 2020 00:26:19 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 2yffk6q2jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 00:26:19 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0250QIpt53215646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 00:26:18 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9003E124052;
 Thu,  5 Mar 2020 00:26:18 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F01A124053;
 Thu,  5 Mar 2020 00:26:18 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Mar 2020 00:26:18 +0000 (GMT)
Subject: Re: New Redfish roles for ServiceRep and OemRep
From: Joseph Reynolds <jrey@linux.ibm.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <a0c457af-88a5-08dd-91fa-357f47dfe93d@linux.ibm.com>
 <6bb93465-ee23-ee6b-3d82-bfd944ea0706@linux.intel.com>
 <209acd02-17ac-a6eb-c11e-0b945db8cf7c@linux.ibm.com>
Message-ID: <8a09ee43-ce28-29e0-2d79-6e03f861417e@linux.ibm.com>
Date: Wed, 4 Mar 2020 18:26:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <209acd02-17ac-a6eb-c11e-0b945db8cf7c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050000
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

Team,

This email is to gather information needed to give me the confidence to 
propose to DMTF Redfish to add two new roles and privileges to support 
use cases for manufacturing and support.  You feedback is requested.  
Any feedback at all.

The problem I'm trying to solve is:
- When the BMC owner/admin, manufacturer, and service agent are 
different, and
- the admin has access to parts of the system they have no business 
going into, and
- the service organization and the manufacturer have a legitimate 
interest in keeping the admin out of trouble, but
- while allowing legitimate service agents into more sensitive areas of 
the system.

The following (excepted) discussion goes into more detail.  This is from 
the recent security working group ~ the 2020-03-04 entry here: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

- Joseph

_________

The OpenBMC security working group agreed that ServiceRep and 
ManufacturingRep Privileges are useful to articulate.

For reference: See the Redfish spec DSP0266 > Security details > 
Authentication > Privilege model/Authorization > Roles:

https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.8.0.pdf


There are two use cases:


Use case 1: The BMC admin is also the ServiceAgent and the 
ManufacturingRep.  In this use case, the Administrator role could 
include the ServiceRep and ManufacturingRep Privileges.


Use case 2: The system manufacturer, service organization, and 
owner/admin are all separate entities.  This design is an attempt to 
articulate these separate roles.

- The Administrator role does not include either the ServiceRep or 
ManufacturingRep Privileges.  The admin should be locked out of service.

- The new ServiceRep role includes the same privileges as the Operator 
role, plus the ServiceRep privilege.

- The new ManufacturerRep role includes the same privileges as the 
Operator role, plus the ServiceRep and ManufacturingRep privileges.


In both use cases, the BMC admin retains the ConfigureUsers privilege 
which means they have control over all accounts on the BMC, and the new 
roles do NOT have this privilege.


The ServiceRep privilege is required to perform the following operations:

- Operations involving FRU replacement, for example, calling an API to 
re-enable a locked out field replaceable unit (FRUs) after replacing a 
defective unit.

- The ServiceRep may be called upon to restore access to an admin who is 
locked out of their account.  For this to work, the admin would set up a 
ServiceRep account and leave it enabled all the time. (Naturally, this 
may be a way for the ServiceRep to escalate privilege to Admin.)

- The ServiceRep may need to diagnose and recover a malfunctioning BMC 
which may involve more than merely factory reset.


The ManufacturingRep privilege is required to perform the following 
operations:

- Put the system into stop-on-error mode, so the manufacturing process 
can validate the system had no errors (as contrasted with tolerating 
errors or failed-but-still functional units) at the time the system was 
manufactured, or similar testing modes.

- Set Media Access Control (MAC) addresses, and similar data.


An open issue/problem with the approach outlined here is well-known to 
Redfish: the BMC admins can create a ServiceRep account for themselves, 
and thus escalate their privilege.

A good solution for that was not proposed.  One idea is to allow 
ServiceRep access only via mTLS where the BMC admin installs the public 
cert in the BMC which accepts only certificates that have a signature 
accepted by the BMC firmware.  Since the Manufacturer controls the 
firmware image, it also controls who gets ServiceRep access. (This idea 
is not yet fully formed.)


Nevertheless, separating the Service and Manufacturing Roles and 
Privileges seems like a step in the right direction.


We discussed an alternate design (also referenced in the email thread) 
where the BMC is put into a mode that allows additional operations 
related to servicing and manufacturing the system.  This is already 
implemented in OpenBMC. My feeling is this design does not follow the 
Redfish spec and is not as clean. For example, who controls what mode 
the system is in?


We discussed an alternate approach.  Create a super-admin role that can 
create regular Admin accounts and ServiceRep accounts.  This design 
separates the user world from the service world. However, then you have 
the problem of who controls the super-admin account: the customer or the 
manufacturer.  My feeling is that security sensitive customers (for 
example, processing HIPPA or PCI-DSS data) would not want an account on 
their system they could not control.




On 2/17/20 6:48 PM, Joseph Reynolds wrote:
> On 2/17/20 1:29 AM, Thomaiyar, Richard Marian wrote:
>> We need to make sure user account are not getting created in this 
>> role by end-user. i.e. when creating a new user, these options must 
>> not be provided. We need to have a separate way of selecting this 
>> role or instead of not defining as role, we can add this as some mode 
>> in redfish.
>
> Yes, I am looking for a solution to this: I don't want a BMC admin to 
> be able to create a user account and escalate their privilege to the 
> ServiceRep or OemRep role.  Only the Oem and Service organizations 
> (which may be different) should be able to access the BMC with these 
> roles.
> Redfish offers no help here and simply notes that the BMC admin can 
> become whatever role they want.  It's up to us to define what we need.
>
> Some options are:
>
> 1. Don't define the role (or disable it in your distro).  ==> This 
> doesn't help us.
>
> 2. Have a predefined user with that role, and don't give those 
> credentials to the BMC admin.  ==> This doesn't let us change the 
> credentials, and relies on the credentials remaining secret, which 
> violates best practices.
>
> 3. Have a special mode that makes additional operations available. ==> 
> This requires you to do one of:
> (A) Permanently disable that special mode (like FieldMode or some 
> other process during the manufacturing process).
> (B) Have a way turn the mode back on ... but how to do that securely 
> so the OEM or service can do it, but not the Admin. Maybe have the 
> admin install a certificate?
> (C) Have a secret way to toggle the mode, which violates best practices.
>
> 4. Bake a special OemRep and ServiceRep certificate into the BMC 
> firmware image and use that to authenticate the ServiceRep.  I tried 
> to explain in an IBM issue 
> (https://github.com/ibm-openbmc/dev/issues/1530), with the relevant 
> parts cut & pasted & edited here:
> > To ensure the admin cannot assume the ServiceAgent and 
> ManufacturerRep roles, I think we would need to:
> >  * Have a certificate baked into the firmware image.
> >  * Use the baked-in certificate to validate the certificate the 
> ServiceAgent would have to uploads as part of their authentication. 
> The certificate is rejected if it wasn't signed by the baked-in 
> certificate. In this way, the service agent could gain access, but the 
> Admin will not have access.
> >  * Note the Admin will still have full control over the service 
> agent's account. In this way, the admin and service agent would have 
> to agree before the ServiceSystem privilege could be used to perform a 
> sensitive operation.
>
>
> Despite the challenges, I think it is valuable to begin to create the 
> ServiceRep role, even if we don't have a good way to lock out the admin.
>
>> Note: Currently we are using SpecialMode 
>> (https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Security/SpecialMode.interface.yaml) 
>> called Manufacturing mode, and certain activity can be done, when we 
>> are in this mode (i.e. Administrator role user in this mode will be 
>> able to do certain operations).
>
> Thanks for explaining.  I had not considered using a special mode for 
> this.
>
> - Joseph
>
>
>> Regards,
>>
>> Richard
>>
>> On 2/15/2020 1:51 AM, Joseph Reynolds wrote:
>>> This is to propose two new Redfish roles:
>>>
>>> The BMC Administrator should not have access to operations involving 
>>> the manufacturing process or servicing the host because these 
>>> operations can damage the system or cause unintended operation.
>>>
>>> Examples of access needed:
>>> 1. ServiceRep - Needs to access BMC operations to service the 
>>> system, such as re-enabling locked out field replaceable units 
>>> (FRUs) after replacing a defective unit.
>>> 2. OemRep - Needs to access BMC operations to test the host system, 
>>> such as how the system responds to overheating.
>>>
>>> I believe these roles are clearly distinct from role=Administrator 
>>> or any other role.
>>>
>>> The roles should NOT have access to the BMC's configuration or user 
>>> management.  For example, the BMC admin will be able to lock out any 
>>> service agent or OemRep using the regular user management functions.
>>>
>>> Does anyone else need for these roles?  If so, I will try to get 
>>> them into Redfish.
>>>
>>>
>>> - Joseph
>>>
>>> This topic was discussed briefly in the OpenBMC security working 
>>> group, 2019-11-27: 
>>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>>>
>>> See also: https://github.com/ibm-openbmc/dev/issues/1529
>>>
>

