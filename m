Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119C8F77B
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 01:15:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468j3M2XlXzDr8V
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 09:15:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468j222YcczDr7d
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 09:14:00 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 16:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="184755333"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2019 16:13:55 -0700
Subject: Re: BMCWeb changes for expired password design
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
 <21bdc6a1-2397-c115-cdb6-201ebf3041b2@intel.com>
 <c1fba479-a81c-bd63-0157-42143ffab08a@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <67a0677e-0ef8-663b-8d6a-9be7141606a9@intel.com>
Date: Thu, 15 Aug 2019 16:13:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1fba479-a81c-bd63-0157-42143ffab08a@linux.ibm.com>
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

On 8/15/19 3:46 PM, Joseph Reynolds wrote:
> 
> Here are some low level design ideas:
> 
> Enhance bmcweb/include/pam_authenticate.hpp - pamAuthenticateUser() like:
>   inline bool pamAuthenticateUser(const std::string_view username,
>     const std::string_view password,
>     bool &passwordChangeRequired)
> so that if the password is correct but expired, the function will return
> true and set passwordChangeRequired=true.
> 
> This change will get the passwordChangeRequired status to where it is
> needed.  As you mentioned, each of those will respond differently:
> - Basic Auth will fail when passwordChangeRequired=true
> - POST /login will fail when passwordChangeRequired=true, with an
> additional message
> - POST /redfish/v1/SessionManager/Sessions will succeed when
> passwordChangeRequired=true

Sounds good.

> 
> Naturally, the crow::persistent_data::UserSession will store the new
> passwordChangeRequired field, with all the changes that requires.

This is what I meant about using the existing privilege system and not
hardcoding it.  I suspect when we hit this, we need to give the user a
"OnlyCanChangePassword" privilege, then tag some routes appropriately
with that flag.  In this way, we will still properly handle all the
routes that don't require auth (like ServiceRoot) but can reject any
requests that require any privileges if the password hasn't been set.

You would amend this function to handle the case where the users
password needs changed, and to apply the correct Privilege.
https://github.com/openbmc/bmcweb/blob/a2730f017069aeb39ea5d3bf4c1403965b2ba2f9/redfish-core/include/privileges.hpp#L180


> 
> Skipping ahead a bit, I think
> crow::token_authorization::Middleware.beforeHandle() should have the
> following logic after it successfully locates a session:
>   if (req.session.passwordChangeRequired &&
>       !isOnPasswordChangeRequiredWhitelist(req))
>   then fail with HTTP status 403 and an explanation in the payload

See above statement, use the privileges module to do this.
This would mechanically look like going here:
https://github.com/openbmc/bmcweb/blob/a2730f017069aeb39ea5d3bf4c1403965b2ba2f9/crow/include/crow/routing.h#L1245

and adding something like
        if (!rules[ruleIndex]->checkPrivileges(userPrivileges))
        {
            // if the user was only granted the ability to change the
password, print the correct message.
            if (userPrivileges.isSupersetOf({"OnlyCanChangePassword"}){
		// res.result.jsonValue = ...... appropriate error message for the type.
            } else {
                //While we're here, and we're implementing error codes
properly, we might as well fix the normal 403 handler.
            }
            res.result(boost::beast::http::status::forbidden);
            res.end();
            return;
        }


> 
> Where new function isOnPasswordChangeRequiredWhitelist returns true in
> the following cases:
>   isOnWhitelist(req) || GET or DELETE mySession || GET or PATCH myAccount

This is exactly what I meant when I said "do not have a fixed "go/no-go"
url list".  We already have a privilege system that can tag handlers,
and has more information about the route map than can be provided in a
single if statement.  Lets use it as it was intended.

Also, I'm not sure what you meant by mySession and myAccount.   I'm
assuming you meant AccountService and SessionService?

Another thing to realize:  With the last round of per-verb router
registrations that went in several months ago, isOnWhitelist is likely
going away, as it's redundant to the existing privilege mechanisms (and
super inefficient to boot).  It's only still there because I have a
healthy paranoia of removing security features whitelists like that
without testing the hell out of the changeset ahead of time.

> 
> Doing it this way seems the most clear and only adds a few cycles in the
> usual case.  It seems like having a new whitelist for this situation is
> correct because Redfish specifies that these interfaces are needed for
> PasswordChangeRequired handling.  And this way avoids having to change
> the authority model.

What I suggested above does not require any changes to the authority
model, aside from adding a privilege type which is supported already,
and shouldn't require any code changes to the privileges module itself.
