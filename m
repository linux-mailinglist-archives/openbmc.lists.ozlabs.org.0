Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B268C23A
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 22:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Pk90gfZzDqQn
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 06:40:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Ph51Kl7zDqQn
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 06:38:59 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 13:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="183985201"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 13:38:56 -0700
Subject: Re: BMCWeb changes for expired password design
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <21bdc6a1-2397-c115-cdb6-201ebf3041b2@intel.com>
Date: Tue, 13 Aug 2019 13:38:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
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

On 8/13/19 1:09 PM, Joseph Reynolds wrote:
> Ed,
> 
> Please review the "expired password" design:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
> 

Richard would likely be a better person to poke, as he wrote the user
management design doc originally.

My main concerns are around the requirements.  I would like to see
mentioned that we:
1. Intend to implement something in compliance with California bill
SB-327 Information privacy: connected devices, and document the relevant
requirements from that bill.
2. We intend to implement the Redfish initial password mechanism as the
spec has defined, to ensure interop with other Redfish devices.

I think the details on the second one seem to be lacking at bit.  I see
a lot of design elements and flows, but I would've expected most of it
to simply be "we intend to implement the Redfish flow for default
passwords" then only provide details where it's missing or optional in
the spec.

If we're building something that's redfish, but unique to OpenBMC , or
counter to the spec, I'm going to have a tough time supporting it, as it
will cause confusion, and somewhat defeat the purpose of having an
industry standard.

> Implementing this requires a few BMCWeb changes:
> - For the `/login` URI: when a correct but expired password is given,
> indicate the password was expired via HTTP response body:
> "Unauthorized.  Password expired.  Use Redfish APIs to change the
> password.", and do not create a session.
> - For Basic Auth (https://user:password@host): when a correct but
> expired password is given, give HTTP response code 403 or similar.
With what content in the response?  This will need to differ for
Redfish, the rest dbus apis, and HTML responses, as they all expect
different error handling.  Simply mentioning that you intend to support
the correct error codes for all 3 would be fine.

> - For Redfish sessions: when a correct password is given, create the
> session as usual, but set the PasswordChangeRequired field (based on
> PAM_NEW_AUTHTOK_REQD).
> - Limit access from sessions which have PasswordChangeRequired=True as
> follows:
>     + The session can only be used to GET its own account and session
> information, PATCH its own account's password, and log out.
>     + Successfully changing the password terminates the session. That
> is, the session does not change from PasswordChangeRequired=True to
> PasswordChangeRequired=False.

I'm interested to see how this will be executed in practice, as we only
have a fixed-at-compile-time privilege to url map.  This would need to
be adjusted, and we would either need to define a new OEM privilege type
(that we may or may not hide) or come up with a way to dynamically
adjust privileges on the fly.

>     + Other uses get HTTP response code 403 (or similar).
> - The existing password changing mechanism would be used, with the
> additional behavior that when ((PasswordChangeRequired=True) and (the
> password was successfully changed)), the session will terminate.
> 
> These changes are based on the design and the Redfish
> PasswordChangeRequired handling specifications (referenced by the
> design).  Would you take a BMCWeb patch to implement this?

I typed the above having looked at an old version of your document.  You
seem to have adjusted it a bit to cover the redfish stuff, which is
excellen.

Yes, I would have no problem with a patchset to do this.  Some important
design points to consider.

1. Please do not recreate the existing privileges module to do the
above.  Your design should be able to fit into what's there.
2. Please do not have a fixed "go/no-go" url list separate from the
other 2 we already have.  Please keep your changes inside the existing
url routing infrastructure by tagging your "ok without auth" routes
appropriately.

I suspect overall, this is going to be difficult, but worthwhile, and
I'd be happy to help review your changes when they're ready.
