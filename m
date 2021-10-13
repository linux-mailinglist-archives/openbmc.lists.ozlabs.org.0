Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3142CC72
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 23:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV4gt55vjz2yHX
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 08:00:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Thu, 14 Oct 2021 08:00:43 AEDT
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV4gb4wy3z2xXc
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 08:00:43 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207650409"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="207650409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:51:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="717482265"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:51:32 -0700
Date: Wed, 13 Oct 2021 13:51:31 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Michael Richardson <mcr@sandelman.ca>
Subject: Re: SPAKE, DTLS and passwords
Message-ID: <20211013205131.GC2951@mauery.jf.intel.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17277.1633384075@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04-Oct-2021 05:47 PM, Michael Richardson wrote:
>
>Joseph Reynolds <jrey@linux.ibm.com> wrote:
>    > The planned IPMI over DLTS function will have certificate-based
>    > authuentication.=C2=A0
>
>Do you mean that the server will be authenticated with a certificate, or t=
hat
>it will use mutual authentication?

Both. There will be host certificate authentication for all connections=20
and then the possibility to authenticate with either password or client=20
certificates.

>    > For our use cases, we would like to add password-based
>    > authentication, and we want to do so as securely as possible, meanin=
g what
>    > protocol we should use.=C2=A0 In particular, we want to know if we s=
hould avoid
>    > sending a =E2=80=9Ccleartext=E2=80=9D password (tunneled over DTLS) =
to the server.
>
>If it can be avoided, yes.
>
>https://www.rfc-editor.org/rfc/rfc8125.html#section-3.1 suggests that all
>the PAKE candidates (whether balanced or augmented) satisfy this.
>I strongly suggest that a PAKE be used.
>The CHIP/MATTER IoT people are using
>   https://datatracker.ietf.org/doc/draft-bar-cfrg-spake2plus/
>although the IRTF CFRG hasn't adopted that document yet.  I don't know
>exactly where they are with it.  But, I expect you will find many libraries
>going forward.
>
>    > However note the Redfish password authentication passes in the clear=
text
>    > password to the Redfish/HTTP server (tunneled over HTTPS). Does not =
need the
>    > existing ipmi_pass file, or will at least store the password securel=
y in it.
>
>When the password is set, it can be set into two different hashed forms if=
 necessary.

Whatever password scheme is used, one requirement is that the password=20
must be hashed or somehow encrypted securely on the BMC.

I did see PAKE show up in my research on this, but I don't yet=20
understand it well enough to make a call on whether to use it or not.=20
This is why we are reaching out to the experts. :)

>There are two concerns that I think this description deals with.
>
>The first is:
>  a) possibility that a cleartext password will be intercepted via
>     Onpath active attack to the connection. (a "MITM")
>
>The second is:
>  b) possibility that a cleartext password will be recovered from the
>     target system's authentication database.
>
>
>Whether or not (a) is likely depends very much on whether or not the BMC w=
ill
>be provisioned or onboarded with useful certificates that the clients can
>actually validate.   If the operational uses of IPMI-DTLS and HTTPS APIs
>are regularly skipping certificate validation, then it's probably important
>that this does not result in a password capture.

This is a huge issue, given how few people really understand how=20
certificates work and the difficulty of working with a pki. We should=20
definitely do everything we can to reduce the complexity/difficulty of=20
getting a valid host key/certificate in place. But in reality, option a)=20
is a valid concern.

>{I said in summer 2020 that I would be writing a BRSKI, RFC8995 client for
>BMC. Sometime in fall 2020... but now I'm actually close to saying Winter
>2022.  I have many questions about testing this that I'll come back to}
>
>(b) wouldn't be a huge problem if all the passwords are unique.
>Afterwall, if an attacker can get a password out of the system, then the
>attacker already has access to that system.  If the passwords are unique,
>then retrieving that password gets the attacker nothing.
>
>Now, if none of the mechanisms require that a cleartext password be stored=
 on
>the system, then (b) is moot.

Even if we do end up sending a tunneled password, I think there is=20
consensus that we will not be storing it in the clear. That is one of=20
the biggest problems with the current RMCP+ protocol, it requires use=20
of the cleartext password on the host side.

--Vernon
