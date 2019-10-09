Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B35BD1730
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 19:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pMN32yJ2zDqSl
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 04:56:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pMMC67DhzDqP9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 04:55:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 10:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,277,1566889200"; d="scan'208";a="206925435"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2019 10:55:29 -0700
Subject: Re: Authorization of LDAP users in bmcweb
To: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
 <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
 <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <94be4d08-016d-4d51-1c18-b77281619db1@intel.com>
Date: Wed, 9 Oct 2019 10:55:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 10/3/19 6:30 AM, RAJESWARAN THILLAIGOVINDAN wrote:
> 
> I am sorry that the current implementation is as per the LDAP authorization
> flow described in the design document : 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12091.
> Unfortunately, this design document has been abandoned.

I'm struggling a little here.  Pointing at an abandoned review that I've
already left comments on that were unanswered and abandoned is causing
me to repeat a little.  If that is truly the flow that you want, please
unabandon that patch, and update it with what you're suggesting below.

> 
> I am still seeing gap between our understanding. I am sorry that I 
> didn't explain it properly
> to you before. Ifmy explanation is still not clear, I would like to have 
> a webex meeting with you.

I'd rather we discuss on the mailing list, so others can have input, and
we've documented our conversation for archival later.  I appreciate the
offer though.

> 
> [Local User Management - A D-Bus object for each local user]
> The user management module provides a way to create, delete, or modify a 
> local user.
> When a new local user is created,a corresponding D-Bus object is 
> created. At the time of creating
> a local user, the role of the user has to be defined.Subsequently, when 
> a local user is modified to
> change the role, this D-Bus object is updated. When the user is deleted, 
> thecorresponding D-Bus object
> is deleted.

Correct me if I'm wrong, but all of this is what's documented in the
user_management.md file, no changes, correct?


> 
> [LDAP Group Management - A D-Bus object for each LDAP Group. Only 
> members of this group has the
> required privileges]
> The LDAP user management is done at organization level from the LDAP 
> server. The applications, like bmcweb,
> can make use of LDAP user management for authentication. When LDAP is 
> enabled in bmcweb, then LDAP users can
> login to bmcweb. After login,to perform any task, they need privilege 
> which comes with role. As roles are
> application specific, role management for LDAPusers are done by the 
> application itself.

I found the disconnect.  That statement is where we disconnect.  Role
management needs to be owned in one place in the BMC, not in every
single daemon.  bmcweb has a mapping from BMC role (admin/operator/user)
to privileges, but at the end of the day, the users role is owned by the
system (in this case phosphor-user-manager), not bmcweb.

> As there may be thousands
> of LDAP users, role management at LDAP user level will bedifficult. By 
> defining role at LDAP group level, we can
> simplify the operation. Also, organizations can make use of 
> theirexisting LDAP group to define the role.

All of this sounds great, and useful to organizations that have a
deployed LDAP presence.

> So,
> bmcweb user management module provides a way to add, remove, or modify 
> LDAP groups.When a LDAP group is added,
> a corresponding D-Bus object is created. Here, we assume that LDAP group 
> has been already created
> in the LDAP server. At the time of adding a LDAP group, the role of that 
> group has to be defined.
> Subsequently, when the groupis modified to change the role, this D-Bus 
> object gets updated.
> When the LDAP group is removed, then the corresponding D-Busobject is 
> also deleted. The LDAP group created
> in the LDAP server will continue to exist.

I'm struggling a little to read this, as you've jumped directly into
implementation, skipping completely over the flow of how a user would
authorize.

1. User provides credentials to Redfish/IPMI/Rest/SSH
2. BMC queries LDAP server, and validates credentials are valid
3. BMC queries users LDAP group membership, and maps the roles to a.....
Local user created on the fly?
Local fixed user ("ldap_user" for example)?
Local group?
Dbus item?

4. User is instantiated with the given privilege (admin/operator/user)
and retains their credentials until the session expires.

Have you walked through the above flow for SSH?  What user does bash get
started when logging into the SSH console in your design?


My point is that LDAP is definitely not the last remote
authentication/authorization mechanism that's coming.  Setting the
precedent that we need to add code to every single external facing
daemon seems like a problem.


> 
> The bmcweb user management module provides a common function to get the 
> information of the give user.
> This user can bea local or LDAP user. This function, internally makes a 
> synchronous D-Bus call.

This statement is incorrect.  bmcweb manages a cache of user/role
mappings, and keeps it up to date by watching for changes, so that when
a request comes in, no dbus call is required.
Relevant code:
https://github.com/openbmc/bmcweb/blob/ca0c93bb09587903a6dd43926799a967f10bafcd/include/sessions.hpp#L32

Also, to my knowledge there are no synchronous DBus calls in bmcweb.

> Hence, we could not make use of this function inthe bmcweb code.
> 
> I hope the above justifies for the existence of two types of D-Bus 
> object based on local or LDAP user. The
> authentication for both local and LDAP user is done by PAM module.

It doesn't for me.  I've read the above statements several times, and
I'm seeing no reason why the existing interface makes any difference.

What it really sounds like is that you'd rather authorization be handled
completely by the PAM module, and not DBus, which sounds completely
reasonable to me, and probably simpler than the dbus stuff we have now,
but if you're going to do it that way, I'd like to see the local user
authorization moved that direction as well so we're not duplicating the
authorization schemes in every single daemon.

> 
> I have also investigated BMC stack implemented by SuperMicro and AMI.In 
> both cases, for LDAP users,
> the role is defined at LDAP group level. This is similar to what we are 
> doing in bmcewb now.
> Also, we see a use-case for the customers to make use of their existing 
> LDAP group to define the role.

At no point have I debated the user impact of the feature as a whole, I
think it would be a great addition, I'd just like to see it built in a
sustainable way.

