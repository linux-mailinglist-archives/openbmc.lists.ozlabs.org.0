Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A673842CC6F
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 22:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV4fG1H3fz2ypb
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 07:59:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV4dz5wDJz2yPP
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 07:59:19 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="250962392"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="250962392"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:51:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="442438437"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:51:19 -0700
Date: Wed, 13 Oct 2021 13:51:18 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: SPAKE, DTLS and passwords + aPAKE and SCRAM
Message-ID: <20211013205118.GB2951@mauery.jf.intel.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
 <a9a07a2a-c093-affa-9d90-bb04d82b9b05@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a9a07a2a-c093-affa-9d90-bb04d82b9b05@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 05-Oct-2021 10:24 AM, Joseph Reynolds wrote:
>On 10/4/21 4:47 PM, Michael Richardson wrote:
>>Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>     > The planned IPMI over DLTS function will have certificate-based
>>     > authuentication.
>>
>>Do you mean that the server will be authenticated with a certificate, or =
that
>>it will use mutual authentication?
>>
>>     > For our use cases, we would like to add password-based
>>     > authentication, and we want to do so as securely as possible, mean=
ing what
>>     > protocol we should use.=C2=A0 In particular, we want to know if we=
 should avoid
>>     > sending a =E2=80=9Ccleartext=E2=80=9D password (tunneled over DTLS=
) to the server.
>>
>>If it can be avoided, yes.
>>
>>https://www.rfc-editor.org/rfc/rfc8125.html#section-3.1 suggests that all
>>the PAKE candidates (whether balanced or augmented) satisfy this.
>>I strongly suggest that a PAKE be used.
>>The CHIP/MATTER IoT people are using
>>    https://datatracker.ietf.org/doc/draft-bar-cfrg-spake2plus/
>>although the IRTF CFRG hasn't adopted that document yet.  I don't know
>>exactly where they are with it.  But, I expect you will find many librari=
es
>>going forward.
>>
>Michael, thanks for your reply.=C2=A0 I got feedback from my people (but m=
y=20
>skillset is too weak to interpret it):
>
>Weakness of SRP (Secure Remote Password):
>=C2=A0- Server spoofing, there is nothing that prevents a server from bein=
g=20
>spoofed.
>=C2=A0- Widely adopted with very little proof of being cryptographically=
=20
>secure and has been shown vulnerable to=C2=A0pre-computation attacks=E2=80=
=A8
>=C2=A0- No feasible way to check for password complexity in the protocol=
=20
>(true for most aPAKE - asymmetric Password Authenticated Key Exchange)
>=C2=A0- Some debate over if actually provides forward secrecy.
>
>Recommendation to look at at OPAQUE aPAKE:=20
>https://blog.cloudflare.com/opaque-oblivious-passwords/
>
>Suggestion to use SCRAM https://en.wikipedia.org/wiki/Salted_Challenge_Res=
ponse_Authentication_Mechanism

I will add SCRAM and PAKE to my list of things to investigate.

--Vernon
