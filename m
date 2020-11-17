Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD92B6EBB
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 20:34:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGNF2YxPzDqLX
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 06:34:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pqrKAixB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbG270LkgzDqX3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 06:18:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ43qX041719; Tue, 17 Nov 2020 14:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J4T88+adGbMLITRRMlGrPoy8M6SV69eikY8lZy2yFiI=;
 b=pqrKAixBxWrmmr/LFGQ4TmYDFrxPg3bqk4917dI3RscGEpNSCx4Gy/fi2QP1HXQeZJoN
 blsYBa0dQAOOVDVYdJiQs3F58Ug6Maxd1uFSo3GvzLOhAPV4W1ovhg5xXxTrAUNqV25p
 ZOD5TV8bdxZDc6kI6vClZK2FNcVv8PM5fPWwmv92hpsZ1w4cgBxz1E5Nvc4TLFbhuMeW
 W6SSX29Sl/U0dmTKGMbzCyvsbx/cyQMi9aMzgw4o+IZo/quMcVzDAWzONj6qm41CDjXN
 pwcMigfl2PWfu9dy2RzA887AisMNiOnk4wnd1zF9BaC9TCQb4jL5C4+jPkpiWhIvTTGJ xw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34veevd6w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:17:34 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJGds3030270;
 Tue, 17 Nov 2020 19:17:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 34uttrbq58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:17:33 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJHXQa23069288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:17:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DABFAE063;
 Tue, 17 Nov 2020 19:17:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4514AE05C;
 Tue, 17 Nov 2020 19:17:32 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Nov 2020 19:17:32 +0000 (GMT)
Subject: Re: User-manager default group roles
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
References: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
 <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <77e2e674-23a9-1d2f-7cdd-88a3f5535e1c@linux.ibm.com>
Date: Tue, 17 Nov 2020 13:17:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
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

On 11/17/20 11:21 AM, Thomaiyar, Richard Marian wrote:
> Hi Joseph, For SSH to work fine, user must be part of priv-admin...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi Joseph,
>
> For SSH to work fine, user must be part of priv-admin and must have 
> command/shell as /bin/sh under /etc/passwd file instead of 
> /bin/nologin. Note: There is no direct group called ssh under 
> /etc/group, instead it is just emulated one from phosphor-user-manager 
> to add corresponding shell binary to the user.
> usermod --shell /bin/sh -G priv-admin ${USER}
>
> If requirement is SSH to be allowed based on group and allowed for all 
> user privileges, then user shell can be updated using usermod --shell 
> /bin/sh itself, but need to remove EXTRA_ARGS from the 
> dropbear.default 
> <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default>

Richard,

Thanks for the info.  I do intend to separate the "ssh" group role from 
the "priv-admin" privilege role.  My use case for the admin to NOT have 
ssh privilege, but the service user account does have ssh privilege.  I 
think this is cleaner and applicable to multiple use cases.

For the OpenBMC project defaults, I propose that when a new user is 
dynamically created with the "priv-admin" role, they also get the "ssh" 
group role.  After the user account is created, I do not intend for 
"priv-admin" and "ssh"  be be tied together, meaning you can change one 
and not the other, and you will get the results you expect.

I understand the full set of work for this includes:
1. Create the "ssh" Linux group to represent the "ssh" group role.
2. Change the dropbear.defaults to "-G ssh" (was "-G priv-admin"). There 
may be forward compatibility concerns: for example, when this changes, 
everyone in the priv-admin group should be added to the "ssh" group.
3. Change phosphor-user-manager [6] to re-swizzle the login shell path 
when a user is added or removed from the "ssh" group.
4. Implement BMCWeb REST APIs [7], if desired.

- Joseph

P.S. I intend to repeat this exercise for the ipmi group role.

[6]: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml
[7]: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp

> Regards,
>
> Richard
>
> On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
>>
>> What is the right way to assign default phosphor-user-manager "group 
>> roles" to dynamically created users?
>>
>> Background: Currently, when a new local user is created via Redfish 
>> API POST /redfish/v1/AccountService/Accounts you have to specify a 
>> Redfish RoleId.  BMCWeb maps the RoleId to a phosphor user manager 
>> "Privilege Role" [1] and assigns ALL of the "group roles" to the new 
>> user [2].  Per [3] this is not intended, and I need to fix this for 
>> my use case.
>>
> usermod --shell /bin/sh -G priv-admin ${USER} is the correct command 
> for per[3].
>> IMHO, the correct approach is for the project to define a mapping 
>> from "role" to "privilege role" that can be used when dynamically 
>> creating a new user.  For example, the admin role maps to "ssh ipmi 
>> redfish web" whereas the readonly role maps to "ipmi redfish web" 
>> (omits "ssh").  Then images can customize this as needed.
>>
>> But where should this mapping be applied?  Does it belong in BMCWeb 
>> or in phosphor-user-manager [4]?  Should we have another D-Bus 
>> property [5] to give this mapping?
> As of today, we are not separating user groups. All users created in 
> OpenBMC belongs to the build time configured groups.
>>
>> - Joseph
>>
>> [1]: 
>> https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>> [2]: 
>> https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
>> [3]: https://github.com/openbmc/openbmc/issues/3643
>> [4]: 
>> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
>> [5]: 
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml
>>

