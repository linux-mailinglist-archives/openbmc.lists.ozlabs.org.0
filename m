Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F2C28CC
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 23:29:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hwXX6b1czDqPK
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 07:29:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hwWx4BdnzDqLt
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 07:29:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 14:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; d="scan'208";a="390971750"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2019 14:29:10 -0700
From: Ed Tanous <ed.tanous@intel.com>
Subject: Re: Authorization of LDAP users in bmcweb:
To: openbmc@lists.ozlabs.org
References: <5ea56cca-3575-a1dc-06a8-aefe6be3031e@gmail.com>
Message-ID: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
Date: Mon, 30 Sep 2019 14:29:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5ea56cca-3575-a1dc-06a8-aefe6be3031e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

It should be noted, when the LDAP user management document changes were
pushed, this topic was one of the first question I asked, given that
it's a difficult problem.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/12091

"How do you map LDAP users to BMC users?  Does LDAP create the users, or
simply log them in?"

The answer I was given was:
"The privilege roles map to the existing user privilege roles mentioned
in this document."

Maybe it's my misunderstanding that the above statement meant the intent
was to map it to the same interfaces that existed, but that was how I
read it.

That review was later abandoned, and so far as I'm aware no changes have
superseded that review for the LDAP case.

-Ed


On 9/27/19 11:59 AM, RAJESWARAN THILLAIGOVINDAN wrote:
> We would like to discuss the following points raised in the gerrit
> commit 23538 (https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/23538).
> 
> 1. Why is LDAP any different than non-ldap in phosphor-user-manager?  Do
> LDAP users not get registered with the system?  That seems odd.
> 
> LDAP users are not managed by OpenBMC. Unlike local users, privileges
> are assigned directly to the LDAP user.
> For LDAP user, it is a two step process:
> - Get the Group Name
> - Look for the privilege for the group
> 
> For local users
> - Each user is directly part of group(priv-admin/priv-user/priv-callback).

Both of these are internal to the system, and don't really have anything
to do with the dbus interfaces.  So far as bmcweb is concerned (today)
these could be stored as files, or could be bypassing the local users
altogether, or could be running through something that enforced 2
factor.  So long as the interfaces are maintained, the rest of the
system doesn't care.

> 
> Why D-Bus objects are not created for LDAP users?
> 
>    There is no use-case for it. Few reasons are listed below:
>    -> LDAP is used for authentication and not for user management
>    -> If we show LDAP users, OpenBMC admin cannot do anything for those
> users

The use case is exactly what I'm pointing out:  Applications in the
system that need to understand a users role, and possibly expire
sessions if any of the settings change.
That's fine that they logged in from outside the system, but having a
session for a user that we have no way to control or verify sounds
dangerous.  Also, certain daemons maintain user sessions through a
reboot;  How would you recommend we verify that the ldap credentials are
still valid through a reboot?  Should we just ignore that in this case?

>    -> LDAP notifications are not there. So, we cannot update the LDAP
> user object.
> https://www.openldap.org/lists/openldap-technical/201008/msg00175.html
> https://lists.arthurdejong.org/nss-pam-ldapd-users/2019/msg00035.html
>       We can look for sync option by using some other opensource tool;
> but do we require that much complexity?

I'm not asking for an LDAP notification, nor was I ever.  I'm asking why
we can't come up with a standard interface for users, so the client code
doesn't have to have specific code to support every single login type we
might want.
I'm really not following why this is more complex.  We're building
effectively 2 methods into the same interface (LDAP, and local).
Nothing in the system would have to change except for the
LDAP/user-management daemon itself.  That seems simpler to me?  Maybe
I've missed something?

> 
> 2. All of the matches you've listed seem to already be present in
> bmcweb.  I'm confused what exactly you're adding.
> 
> We have added matches only for local users, who have D-Bus objects>
> For LDAP users, D-Bus objects are not created. Hence, they will not be
> found in the live user-role map.

I see this as an issue, and breaking the interface guarantees of the
User dbus interface.

> 
> For LDAP users, we need to make the call for getpw, getgr, getgr_name
> using (ldap_nss module)
> which internally makes a call to the LDAP and get the group name.
> 
> OpenBMC manages LDAP role group and privileges and a D-Bus object is
> created for each such role group. Like live user-role map for local
> users, we need a live role group - privilege map for LDAP users.

I'll mention again.... The thing I'm not liking here is that you've
taken an interface that works perfectly fine, and should be able to
handle what you're trying to do, and essentially created an alternative
one, now it's been alluded to (but hasn't happened yet) that someone
will attempt to push code to the individual daemons that specializes
LDAP (IMO unnecessarily).
> 
> 3. The above makes me think that we're logging in users that don't
> necessarily have a username on the system, which seems really contrary
> to the design, where PAM is used to interchange user privileges.  What
> you suggest above seems to be breaking that?
> 
> I am sorry that I could not understand what you mean by "PAM is used to
> interchange user privileges". PAM is used only for authentication.
> 
> For getting the privileges, we shall call getpw_nam and getgr_id. For
> local users, these APIs are not used as D-Bus object has this info.

See above, you're breaking the existing interface.  Is there a reason
that phosphor-user-manager can't call getpw_nam and getgr_id when those
dbus requests for roles come in?  Isn't that what it does already?

If we wanted to drop the dbus role interface  entirely in leiu of PAM I
could probably get behind it, but as-is, we're just unnecessarily
bifurcating for (I suspect) the sake of making things easier.

> 
> For LDAP users, we call getpw, getgr, getgr_name using (ldap_nss module)
> which internally calls LDAP and get the results.
> 
> The user management application provides the method GetUserInfo() to get
> the local and LDAP user privileges. This method abstracts how the
> privileges are stored and retrieved. This is as per the user-management
> design.
> 
> We have discussed this in the community call around a year back.
> 

I don't recall discussing that we would be pushing LDAP specific login
routines into each individual node that needs to be able to log in.

If I were to summarize this;  It seems like we're duplicating the roles
system here, both in PAM and in DBus, and now we have conflicts because
LDAP seems to only want to use PAM, and not expose the DBus roles at
all, and bmcweb (today) is based on dbus to expire sessions properly and
track user role changes through the system.  Saying we're not going to
publish the DBus interface in the LDAP case means there's now 2
authorization flows that we need to maintain and track.

If we really want to only use PAM for authorization, we should drop the
dbus interfaces entirely.
