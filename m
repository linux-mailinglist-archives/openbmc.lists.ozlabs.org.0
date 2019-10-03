Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03091C9F77
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 15:31:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kYnP339tzDqZX
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 23:31:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fzStaQbH"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kYly2tVgzDqY4
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 23:30:22 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id d26so1791946pgl.7
 for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2019 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:from:to:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=4+NqMG7GFNG4fN+vgql49+9HcY0zSuJ0GYbCi2/oZHM=;
 b=fzStaQbH5fDX2U0HO2E6aMkznY2PJHt4egi4G1c0BpAzyPULxkHJyug7xRW1/6owJj
 5TRl/C/uR01czXnr2EOXJOIe1RV347ond7trPoppm8FRtzr1v7/hnI8vc3s8P3o+f9kd
 6f1ItAz0QsbjB38Y1MsOpSboDriAdu+juvOgGrF/1XiEGHWv/n1xIL7olrOnIUJwvVI2
 j3oyH5lLFaId5LChyjDridDDo2pCOPAD+zYznvsL2znb4nwrIctkf2/pa1krkQohAYph
 ax1cJAm4AC4GKeAnBc4sN1ffGsEdzikCzCV07auRcVyqpOYCTNoQ9f0L85SX5tMCrAT7
 xkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:from:to:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4+NqMG7GFNG4fN+vgql49+9HcY0zSuJ0GYbCi2/oZHM=;
 b=NN/ZEyu7hCLcM5CAD7gDrgrIa2lbn30azhuioQM5qdWJRH5WXNZcXG8KzPMNx1LP6/
 FUuJYFBjrT/qyNnSbFxlLBGMtqup3tsApnizGNd2Zhc+tf6K3ef3vwxKpr3ljXY2BHiu
 ZPzR6N+S2TwP8QagsegzEjQ7tRl33fuVS+mlEAK+eMS4OCct9aJDYssics4X5Z5rbYz5
 wSNE0PTfS+RMdqDbUF1jd9UceShuJbfvZaYSU4f+TZU7/+3TK4tCCCGznJXTGE1588/i
 mJ//VMeAi2Gk/bspLoz91mPmAs/yiI2HyllskSWrX+BKMwYGbcOQ4F7sQCFWpYHiVqq7
 adWA==
X-Gm-Message-State: APjAAAV3HPL5U5xnV2deAbnTFMCPZRkhRoXT2HpjrmBYYHUw7QiiWnR7
 nMc8ra5ltkWBDc4T3jOg2n7jDgV1kig=
X-Google-Smtp-Source: APXvYqx7KiVTwLBWz9nUud8K93OqoUnflFlWgfp/jyFzQJsrlOHXu78pSqPJr5LyxN16gswU/CfqOQ==
X-Received: by 2002:aa7:910c:: with SMTP id 12mr10796831pfh.166.1570109418005; 
 Thu, 03 Oct 2019 06:30:18 -0700 (PDT)
Received: from [9.202.11.106] ([129.41.84.87])
 by smtp.gmail.com with ESMTPSA id o64sm2944989pjb.24.2019.10.03.06.30.16
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 06:30:17 -0700 (PDT)
Subject: Re: Re: Authorization of LDAP users in bmcweb
References: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
 <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
To: openbmc@lists.ozlabs.org
Message-ID: <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
Date: Thu, 3 Oct 2019 19:00:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
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

Ed,

I am sorry that the current implementation is as per the LDAP authorization
flow described in the design document : 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12091.
Unfortunately, this design document has been abandoned.

I am still seeing gap between our understanding. I am sorry that I 
didn't explain it properly
to you before. Ifmy explanation is still not clear, I would like to have 
a webex meeting with you.

[Local User Management - A D-Bus object for each local user]
The user management module provides a way to create, delete, or modify a 
local user.
When a new local user is created,a corresponding D-Bus object is 
created. At the time of creating
a local user, the role of the user has to be defined.Subsequently, when 
a local user is modified to
change the role, this D-Bus object is updated. When the user is deleted, 
thecorresponding D-Bus object
is deleted.

[LDAP Group Management - A D-Bus object for each LDAP Group. Only 
members of this group has the
required privileges]
The LDAP user management is done at organization level from the LDAP 
server. The applications, like bmcweb,
can make use of LDAP user management for authentication. When LDAP is 
enabled in bmcweb, then LDAP users can
login to bmcweb. After login,to perform any task, they need privilege 
which comes with role. As roles are
application specific, role management for LDAPusers are done by the 
application itself. As there may be thousands
of LDAP users, role management at LDAP user level will bedifficult. By 
defining role at LDAP group level, we can
simplify the operation. Also, organizations can make use of 
theirexisting LDAP group to define the role. So,
bmcweb user management module provides a way to add, remove, or modify 
LDAP groups.When a LDAP group is added,
a corresponding D-Bus object is created. Here, we assume that LDAP group 
has been already created
in the LDAP server. At the time of adding a LDAP group, the role of that 
group has to be defined.
Subsequently, when the groupis modified to change the role, this D-Bus 
object gets updated.
When the LDAP group is removed, then the corresponding D-Busobject is 
also deleted. The LDAP group created
in the LDAP server will continue to exist.

The bmcweb user management module provides a common function to get the 
information of the give user.
This user can bea local or LDAP user. This function, internally makes a 
synchronous D-Bus call.
Hence, we could not make use of this function inthe bmcweb code.

I hope the above justifies for the existence of two types of D-Bus 
object based on local or LDAP user. The
authentication for both local and LDAP user is done by PAM module.

I have also investigated BMC stack implemented by SuperMicro and AMI.In 
both cases, for LDAP users,
the role is defined at LDAP group level. This is similar to what we are 
doing in bmcewb now.
Also, we see a use-case for the customers to make use of their existing 
LDAP group to define the role.

Yours sincerely,
T.Rajeswaran
>
> It should be noted, when the LDAP user management document changes were
> pushed, this topic was one of the first question I asked, given that
> it's a difficult problem.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12091
>
> "How do you map LDAP users to BMC users? Does LDAP create the users, or
> simply log them in?"
>
> The answer I was given was:
> "The privilege roles map to the existing user privilege roles mentioned
> in this document."
>
> Maybe it's my misunderstanding that the above statement meant the intent
> was to map it to the same interfaces that existed, but that was how I
> read it.
>
> That review was later abandoned, and so far as I'm aware no changes have
> superseded that review for the LDAP case.
>
> -Ed
>
>
> On 9/27/19 11:59 AM, RAJESWARAN THILLAIGOVINDAN wrote:
>> We would like to discuss the following points raised in the gerrit
>> commit 23538 
>> (https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/23538).
>>
>> 1. Why is LDAP any different than non-ldap in phosphor-user-manager?  Do
>> LDAP users not get registered with the system?  That seems odd.
>>
>> LDAP users are not managed by OpenBMC. Unlike local users, privileges
>> are assigned directly to the LDAP user.
>> For LDAP user, it is a two step process:
>> - Get the Group Name
>> - Look for the privilege for the group
>>
>> For local users
>> - Each user is directly part of 
>> group(priv-admin/priv-user/priv-callback).
>
> Both of these are internal to the system, and don't really have anything
> to do with the dbus interfaces. So far as bmcweb is concerned (today)
> these could be stored as files, or could be bypassing the local users
> altogether, or could be running through something that enforced 2
> factor. So long as the interfaces are maintained, the rest of the
> system doesn't care.
>
>>
>> Why D-Bus objects are not created for LDAP users?
>>
>>    There is no use-case for it. Few reasons are listed below:
>>    -> LDAP is used for authentication and not for user management
>>    -> If we show LDAP users, OpenBMC admin cannot do anything for those
>> users
>
> The use case is exactly what I'm pointing out: Applications in the
> system that need to understand a users role, and possibly expire
> sessions if any of the settings change.
> That's fine that they logged in from outside the system, but having a
> session for a user that we have no way to control or verify sounds
> dangerous. Also, certain daemons maintain user sessions through a
> reboot; How would you recommend we verify that the ldap credentials are
> still valid through a reboot? Should we just ignore that in this case?
>
>>    -> LDAP notifications are not there. So, we cannot update the LDAP
>> user object.
>> https://www.openldap.org/lists/openldap-technical/201008/msg00175.html
>> https://lists.arthurdejong.org/nss-pam-ldapd-users/2019/msg00035.html
>>       We can look for sync option by using some other opensource tool;
>> but do we require that much complexity?
>
> I'm not asking for an LDAP notification, nor was I ever. I'm asking why
> we can't come up with a standard interface for users, so the client code
> doesn't have to have specific code to support every single login type we
> might want.
> I'm really not following why this is more complex. We're building
> effectively 2 methods into the same interface (LDAP, and local).
> Nothing in the system would have to change except for the
> LDAP/user-management daemon itself. That seems simpler to me? Maybe
> I've missed something?
>
>>
>> 2. All of the matches you've listed seem to already be present in
>> bmcweb.  I'm confused what exactly you're adding.
>>
>> We have added matches only for local users, who have D-Bus objects>
>> For LDAP users, D-Bus objects are not created. Hence, they will not be
>> found in the live user-role map.
>
> I see this as an issue, and breaking the interface guarantees of the
> User dbus interface.
>
>>
>> For LDAP users, we need to make the call for getpw, getgr, getgr_name
>> using (ldap_nss module)
>> which internally makes a call to the LDAP and get the group name.
>>
>> OpenBMC manages LDAP role group and privileges and a D-Bus object is
>> created for each such role group. Like live user-role map for local
>> users, we need a live role group - privilege map for LDAP users.
>
> I'll mention again.... The thing I'm not liking here is that you've
> taken an interface that works perfectly fine, and should be able to
> handle what you're trying to do, and essentially created an alternative
> one, now it's been alluded to (but hasn't happened yet) that someone
> will attempt to push code to the individual daemons that specializes
> LDAP (IMO unnecessarily).
>>
>> 3. The above makes me think that we're logging in users that don't
>> necessarily have a username on the system, which seems really contrary
>> to the design, where PAM is used to interchange user privileges.  What
>> you suggest above seems to be breaking that?
>>
>> I am sorry that I could not understand what you mean by "PAM is used to
>> interchange user privileges". PAM is used only for authentication.
>>
>> For getting the privileges, we shall call getpw_nam and getgr_id. For
>> local users, these APIs are not used as D-Bus object has this info.
>
> See above, you're breaking the existing interface. Is there a reason
> that phosphor-user-manager can't call getpw_nam and getgr_id when those
> dbus requests for roles come in? Isn't that what it does already?
>
> If we wanted to drop the dbus role interface entirely in leiu of PAM I
> could probably get behind it, but as-is, we're just unnecessarily
> bifurcating for (I suspect) the sake of making things easier.
>
>>
>> For LDAP users, we call getpw, getgr, getgr_name using (ldap_nss module)
>> which internally calls LDAP and get the results.
>>
>> The user management application provides the method GetUserInfo() to get
>> the local and LDAP user privileges. This method abstracts how the
>> privileges are stored and retrieved. This is as per the user-management
>> design.
>>
>> We have discussed this in the community call around a year back.
>>
>
> I don't recall discussing that we would be pushing LDAP specific login
> routines into each individual node that needs to be able to log in.
>
> If I were to summarize this; It seems like we're duplicating the roles
> system here, both in PAM and in DBus, and now we have conflicts because
> LDAP seems to only want to use PAM, and not expose the DBus roles at
> all, and bmcweb (today) is based on dbus to expire sessions properly and
> track user role changes through the system. Saying we're not going to
> publish the DBus interface in the LDAP case means there's now 2
> authorization flows that we need to maintain and track.
>
> If we really want to only use PAM for authorization, we should drop the
> dbus interfaces entirely.
