Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53F2B76B0
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 08:12:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbYsM2N2JzDqgN
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 18:12:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbYrT4K6nzDqZX
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 18:11:20 +1100 (AEDT)
IronPort-SDR: uZETwOt9ajc2z//z1L9RFeXavk1DCHlo2jviJUr5p+E2qFRjmKWuYV7sp2Z8YQJtwl6MPh4eLO
 4Ack4lAJlF2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168503882"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168503882"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 23:11:16 -0800
IronPort-SDR: /Gkt1pEsFGhKX1rQNWACmoz8jS9eEC5lj7JMkl6/B7H/rorsU3DT04cKHQRxlbOziAnOr9ZRGb
 nvNiuvisGixg==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="368364861"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.213.100.227])
 ([10.213.100.227])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 23:11:14 -0800
Subject: Re: User-manager default group roles
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 Ed Tanous <ed@tanous.net>
References: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
 <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
 <77e2e674-23a9-1d2f-7cdd-88a3f5535e1c@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <2a47d048-7b27-7aa6-f813-18e985976c0a@linux.intel.com>
Date: Wed, 18 Nov 2020 12:41:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <77e2e674-23a9-1d2f-7cdd-88a3f5535e1c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 11/18/2020 12:47 AM, Joseph Reynolds wrote:
> On 11/17/20 11:21 AM, Thomaiyar, Richard Marian wrote:
>> Hi Joseph, For SSH to work fine, user must be part of priv-admin...
>> This Message Is From an External Sender
>> This message came from outside your organization.
>>
>> Hi Joseph,
>>
>> For SSH to work fine, user must be part of priv-admin and must have 
>> command/shell as /bin/sh under /etc/passwd file instead of 
>> /bin/nologin. Note: There is no direct group called ssh under 
>> /etc/group, instead it is just emulated one from 
>> phosphor-user-manager to add corresponding shell binary to the user.
>> usermod --shell /bin/sh -G priv-admin ${USER}
>>
>> If requirement is SSH to be allowed based on group and allowed for 
>> all user privileges, then user shell can be updated using usermod 
>> --shell /bin/sh itself, but need to remove EXTRA_ARGS from the 
>> dropbear.default 
>> <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default>
>
> Richard,
>
> Thanks for the info.  I do intend to separate the "ssh" group role 
> from the "priv-admin" privilege role.  My use case for the admin to 
> NOT have ssh privilege, but the service user account does have ssh 
> privilege.  I think this is cleaner and applicable to multiple use cases.
In this case, need to remove the -G priv-admin from dropbear.defaults 
(but all users who have sh command/shell, will be able to login) and ssh 
doesn't provide any authorization for commands based on privileges.
>
> For the OpenBMC project defaults, I propose that when a new user is 
> dynamically created with the "priv-admin" role, they also get the 
> "ssh" group role.  After the user account is created, I do not intend 
> for "priv-admin" and "ssh"  be be tied together, meaning you can 
> change one and not the other, and you will get the results you expect.
>
Yes, i see your use case and user must be able to ssh irrespective of 
privilege role he is in.
> I understand the full set of work for this includes:
> 1. Create the "ssh" Linux group to represent the "ssh" group role.

Not needed (unless we really require to support usermod command - 
"usermod -G "ssh" ${USER}). Won't usermod --shell /bin/sh ${USER} won't 
be enough for covering the same. Assuming this is not the way we are 
going to ask end-user to create a user.

> 2. Change the dropbear.defaults to "-G ssh" (was "-G priv-admin"). 
> There may be forward compatibility concerns: for example, when this 
> changes, everyone in the priv-admin group should be added to the "ssh" 
> group.
> 3. Change phosphor-user-manager [6] to re-swizzle the login shell path 
> when a user is added or removed from the "ssh" group.
> 4. Implement BMCWeb REST APIs [7], if desired.

We don't require any change in bmweb rest API's for this, as these are 
build time configurable (i.e. for ssh priv-admin). phosphor-user-manager 
already provided D-Bus property to support different account groups, 
i.e. for AccountTypes (Redfish,Ipmi etc.)(for the schema update you are 
working with redfish forum). Once the schema is defined, we just need to 
update the bmcweb to update the property accordingly.

Let me know if you have any other reason / usecase, which will not work 
with this approach. If needed, we can even discuss this in security WG.

Regards,

Richard

>
> - Joseph
>
> P.S. I intend to repeat this exercise for the ipmi group role.
>
> [6]: 
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml
> [7]: 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp
>
>> Regards,
>>
>> Richard
>>
>> On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
>>>
>>> What is the right way to assign default phosphor-user-manager "group 
>>> roles" to dynamically created users?
>>>
>>> Background: Currently, when a new local user is created via Redfish 
>>> API POST /redfish/v1/AccountService/Accounts you have to specify a 
>>> Redfish RoleId.  BMCWeb maps the RoleId to a phosphor user manager 
>>> "Privilege Role" [1] and assigns ALL of the "group roles" to the new 
>>> user [2].  Per [3] this is not intended, and I need to fix this for 
>>> my use case.
>>>
>> usermod --shell /bin/sh -G priv-admin ${USER} is the correct command 
>> for per[3].
>>> IMHO, the correct approach is for the project to define a mapping 
>>> from "role" to "privilege role" that can be used when dynamically 
>>> creating a new user.  For example, the admin role maps to "ssh ipmi 
>>> redfish web" whereas the readonly role maps to "ipmi redfish web" 
>>> (omits "ssh"). Then images can customize this as needed.
>>>
>>> But where should this mapping be applied?  Does it belong in BMCWeb 
>>> or in phosphor-user-manager [4]?  Should we have another D-Bus 
>>> property [5] to give this mapping?
>> As of today, we are not separating user groups. All users created in 
>> OpenBMC belongs to the build time configured groups.
>>>
>>> - Joseph
>>>
>>> [1]: 
>>> https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>>> [2]: 
>>> https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
>>> [3]: https://github.com/openbmc/openbmc/issues/3643
>>> [4]: 
>>> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
>>> [5]: 
>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml
>>>
>
