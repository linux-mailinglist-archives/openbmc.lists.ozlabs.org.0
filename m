Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413CD8F27
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:18:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tVCg2ZQbzDqQ0
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 22:18:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T6PKegPv"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tV6Q0CpdzDqx6
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:13:49 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id q21so14497206pfn.11
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZK9mAsCJVHeerV3BJ73ruIBsKFHzTXhPaU5kJjUwdnw=;
 b=T6PKegPvs4VllBTKnZ5Yy12GC2YtWZ7IjPbmUGJgZ8gm2jGI3UcaLxt5UDx66cIHoG
 qLIRu0PGw9FSKJF7hAYiWAX6PO7ZFRWIZmAD6tZkmCcMdb3yfdySc130fpDt+UJjlSxl
 cHl4b8mrbxyc0g4aWAXqkIQH7VPDOrzujE0qXgDyT0vXzBFWBA22VphIZb0E11tmDZtJ
 d1VJdiaWlSfPA8zR3f+EJV8nhSUIIEkznYWzzmqLiyYvIyH4HvY70+8OjnQvtFGyXuk6
 9m5KE4h4HGHzT7VvvVxYyS+gRoaGK22kYb53JsyyWReK00CNw/ZS9+yMGOafGezOvXTB
 /Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZK9mAsCJVHeerV3BJ73ruIBsKFHzTXhPaU5kJjUwdnw=;
 b=TvAvTL+1FEViQzMGrnsvbwdE4QYZzRaYCHVTkpFZx5zBcZ6dI9OI6g3ML6Td1KLIQi
 3DEeYGCa25bx5F6SsblPWgb1IYismTZUisC1also8vffZylQm4mhCiAwUO1S8X3M5+VL
 zrLoUUKK3W9WElDqKdH5Ru62BgsOwNmxkYux4N6NBwsk4esbxXCniqBln3WbDdSTiHJR
 4tKzBiPM0T5qCKnxod4F3olHJaE464dkEPE0EiBbHPBB0tsRelnboukebBO0jUCfRs6B
 oelR1LmTnrCJb+FkfUp3Z76mI7U0I+0CBQtqVxMPqVHAvMuVnnpyTzcyyNkMVVA3M7Fx
 FsDQ==
X-Gm-Message-State: APjAAAVKWFWGgki0DSaflgwjFTbJozvSjRsp/gapua/226nOVnF4QZAj
 cfxmCrJwUoMyRBFMEpEvtSzIRZe0
X-Google-Smtp-Source: APXvYqxwC/oFlOFc1VQIHgqEp9gAMY3qRAPcIXwu/azznwT9t0w52PigHvDKkSfg5jrqCmyubwhRBQ==
X-Received: by 2002:a65:4c03:: with SMTP id u3mr44208117pgq.440.1571224425716; 
 Wed, 16 Oct 2019 04:13:45 -0700 (PDT)
Received: from [9.202.11.106] ([129.41.84.95])
 by smtp.gmail.com with ESMTPSA id q71sm2741204pjb.26.2019.10.16.04.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 04:13:45 -0700 (PDT)
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
Subject: Re: Authorization of LDAP users in bmcweb
To: Ed Tanous <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
 <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
 <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
 <94be4d08-016d-4d51-1c18-b77281619db1@intel.com>
Message-ID: <d72f1519-a102-3b4c-3649-bba3b94444ed@gmail.com>
Date: Wed, 16 Oct 2019 16:43:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <94be4d08-016d-4d51-1c18-b77281619db1@intel.com>
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


On 09-10-2019 23:25, Ed Tanous wrote:
> On 10/3/19 6:30 AM, RAJESWARAN THILLAIGOVINDAN wrote:
>> I am sorry that the current implementation is as per the LDAP authorization
>> flow described in the design document :
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12091.
>> Unfortunately, this design document has been abandoned.
> I'm struggling a little here.  Pointing at an abandoned review that I've
> already left comments on that were unanswered and abandoned is causing
> me to repeat a little.  If that is truly the flow that you want, please
> unabandon that patch, and update it with what you're suggesting below.
The owner of this patch has restored and assigned it to me. I have 
re-based and
uploaded the next patch set.
>> I am still seeing gap between our understanding. I am sorry that I
>> didn't explain it properly
>> to you before. Ifmy explanation is still not clear, I would like to have
>> a webex meeting with you.
> I'd rather we discuss on the mailing list, so others can have input, and
> we've documented our conversation for archival later.  I appreciate the
> offer though.
I understand and agree with you that mailing list help us to document the
discussions. We shall have a webex meeting and then document the 
discussions in the
mailing list for future reference.
>> [Local User Management - A D-Bus object for each local user]
>> The user management module provides a way to create, delete, or modify a
>> local user.
>> When a new local user is created,a corresponding D-Bus object is
>> created. At the time of creating
>> a local user, the role of the user has to be defined.Subsequently, when
>> a local user is modified to
>> change the role, this D-Bus object is updated. When the user is deleted,
>> thecorresponding D-Bus object
>> is deleted.
> Correct me if I'm wrong, but all of this is what's documented in the
> user_management.md file, no changes, correct?
>
correct. It is as per the user management design document. I referred it 
here to
highlight the difference.
>> [LDAP Group Management - A D-Bus object for each LDAP Group. Only
>> members of this group has the
>> required privileges]
>> The LDAP user management is done at organization level from the LDAP
>> server. The applications, like bmcweb,
>> can make use of LDAP user management for authentication. When LDAP is
>> enabled in bmcweb, then LDAP users can
>> login to bmcweb. After login,to perform any task, they need privilege
>> which comes with role. As roles are
>> application specific, role management for LDAPusers are done by the
>> application itself.
> I found the disconnect.  That statement is where we disconnect.  Role
> management needs to be owned in one place in the BMC, not in every
> single daemon.  bmcweb has a mapping from BMC role (admin/operator/user)
> to privileges, but at the end of the day, the users role is owned by the
> system (in this case phosphor-user-manager), not bmcweb.
I am sorry that I could not understand your concerns regarding the role 
management
for LDAP users. Do you see an issue with role management for LDAP users 
at LDAP
group level ?

>> As there may be thousands
>> of LDAP users, role management at LDAP user level will bedifficult. By
>> defining role at LDAP group level, we can
>> simplify the operation. Also, organizations can make use of
>> theirexisting LDAP group to define the role.
> All of this sounds great, and useful to organizations that have a
> deployed LDAP presence.
>
>> So,
>> bmcweb user management module provides a way to add, remove, or modify
>> LDAP groups.When a LDAP group is added,
>> a corresponding D-Bus object is created. Here, we assume that LDAP group
>> has been already created
>> in the LDAP server. At the time of adding a LDAP group, the role of that
>> group has to be defined.
>> Subsequently, when the groupis modified to change the role, this D-Bus
>> object gets updated.
>> When the LDAP group is removed, then the corresponding D-Busobject is
>> also deleted. The LDAP group created
>> in the LDAP server will continue to exist.
> I'm struggling a little to read this, as you've jumped directly into
> implementation, skipping completely over the flow of how a user would
> authorize.
>
> 1. User provides credentials to Redfish/IPMI/Rest/SSH
> 2. BMC queries LDAP server, and validates credentials are valid
> 3. BMC queries users LDAP group membership, and maps the roles to a.....
Correct. The above three steps are performed.
> Local user created on the fly?
No. We don't create local user for LDAP accounts.
> Local fixed user ("ldap_user" for example)?
No. Can you please explain what we can do by creating a local
fixed user?
> Local group?
> Dbus item?
Yes. Local groups corresponding to the LDAP groups are created and a 
role is assigned at
the group level.
>
> 4. User is instantiated with the given privilege (admin/operator/user)
> and retains their credentials until the session expires.
As per the initial design, the role was stored in the user session 
object with an
intention to retain the credentials until the session expires. I think, 
now, it has
been changed. I have investigated the BMC stack implemented by Super 
Micro and
AMI. In both cases, the role change is not applied to the existing 
session. I think it
is up to the application to decide.
> Have you walked through the above flow for SSH?  What user does bash get
> started when logging into the SSH console in your design?
LDAP users are not allowed to login via ssh as login is restricted to 
the 'priv-admin' group.
OS will see only the LDAP group.
> My point is that LDAP is definitely not the last remote
> authentication/authorization mechanism that's coming.  Setting the
> precedent that we need to add code to every single external facing
> daemon seems like a problem.
I understand. The existing implementation takes care of ipmi, Redfish, 
and Webserver. The
only missing thing is ssh.
>> The bmcweb user management module provides a common function to get the
>> information of the give user.
>> This user can bea local or LDAP user. This function, internally makes a
>> synchronous D-Bus call.
> This statement is incorrect.  bmcweb manages a cache of user/role
> mappings, and keeps it up to date by watching for changes, so that when
> a request comes in, no dbus call is required.
> Relevant code:
> https://github.com/openbmc/bmcweb/blob/ca0c93bb09587903a6dd43926799a967f10bafcd/include/sessions.hpp#L32
>
> Also, to my knowledge there are no synchronous DBus calls in bmcweb.
I am sorry that I was not clear here. I meant that 
phosphor-user-management application
provides a function called getUserInfo() :
https://github.com/openbmc/phosphor-user-manager/blob/7c6e7cffaf061aabfe5489ef52442e2f7cbd0fb7/user_mgr.cpp#L938
This function can be used to get the group name and the role for the 
given user. The user can be a local or LDAP user.  This function
makes a synchronous D-Bus call. I am not sure whether we can call that 
function in bmcweb. The caller of this function need not
worry whether the user is a local or LDAP user.
>> Hence, we could not make use of this function inthe bmcweb code.
>>
>> I hope the above justifies for the existence of two types of D-Bus
>> object based on local or LDAP user. The
>> authentication for both local and LDAP user is done by PAM module.
> It doesn't for me.  I've read the above statements several times, and
> I'm seeing no reason why the existing interface makes any difference.
>
> What it really sounds like is that you'd rather authorization be handled
> completely by the PAM module, and not DBus, which sounds completely
> reasonable to me, and probably simpler than the dbus stuff we have now,
> but if you're going to do it that way, I'd like to see the local user
> authorization moved that direction as well so we're not duplicating the
> authorization schemes in every single daemon.
I am sorry that the PAM module is used only for authentication of local 
and LDAP user.
For authorization, D-Bus is used.
>> I have also investigated BMC stack implemented by SuperMicro and AMI.In
>> both cases, for LDAP users,
>> the role is defined at LDAP group level. This is similar to what we are
>> doing in bmcewb now.
>> Also, we see a use-case for the customers to make use of their existing
>> LDAP group to define the role.
> At no point have I debated the user impact of the feature as a whole, I
> think it would be a great addition, I'd just like to see it built in a
> sustainable way.

