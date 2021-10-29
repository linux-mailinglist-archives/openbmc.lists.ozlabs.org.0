Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBDE4402E3
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 21:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgsPl1Ffcz3bZj
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 06:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WxehgYFY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=i5bUvTKm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=WxehgYFY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=i5bUvTKm; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgsPJ2LSxz2xCW
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 06:07:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 693BF3201D2E;
 Fri, 29 Oct 2021 15:07:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 29 Oct 2021 15:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=LV4SKcw+eGyrFwZPeyGo8uVehh0
 W4MDbO0ItkQZNemc=; b=WxehgYFYWXpi+UbOZAawfoOH8NoLftPhENIlMEw7afe
 0k5/LzRpw+URyQtXhgOdFNfHopFtivFOeajr5HeMMC7DOadLdlvdPjN7snS7nnDT
 7UAVylIYBxOkVmZfM6r/eEhKtuDe/AUUWKjm+JAoAjoD2NTTAEGdJZw0wdREKhz7
 ldeuOTxBdGH8EpCFaWvQbFVQRXu9RXoXtDxQXQ5TOXCM1Se5ESZYDcxofp871s27
 DX/FRgpSGO1EvcQPlLKobUpln7PukEH6LQ1bZRKvoRzqJHWDkbRh2sNxdWafjsz4
 0To+EcVG2FdftEkaWtUSSDlVe2j0G55/odYxLcH3Kug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LV4SKc
 w+eGyrFwZPeyGo8uVehh0W4MDbO0ItkQZNemc=; b=i5bUvTKm7z1tGL3Fmy9dkI
 k5kOzyg72M9bqnT8uXMxI3zizyOMyYVnDt/QMKe4JhmIjk/Mt0mUX3Khii98PLT4
 NwAAQCQ0wJqLcjNqE47/5uNqN4gwc3xzLGrGcUanN6J9BRqZd7T9/PhEZ7vptSkq
 HMkOvnigcdbZh76df2Q1mzySzGqqC6Ug7GITM8+BmIEBqQtTdmA0Ns3zb3tc09Gg
 C4WL62boE7k2bxmX32xiAfOvicxk5slefr4UNSkYtBjI+vFKc0ldPfs1LN/LBPZl
 es9jNPA9RiYrJJzeaa8YihUHdW1Z0DFHoBcnwTV8MHiS+Kaj1NDzErhDnlLfmm+A
 ==
X-ME-Sender: <xms:YUZ8YQk-7Ct0NMp0Mq_jnSxCQrJpfRSFh_68qAws7GdQGfOTGeVDRA>
 <xme:YUZ8Yf2blDlH6jIw61HQsUzLX-4EbRpQ00A6LDFRfYP8fW6Xc4j8-WHEzFs9H8ole
 KGo2ANcmvBES0pMnQo>
X-ME-Received: <xmr:YUZ8YeoQCDMNxt79OsJYxKwlrvz09T3LMA__wY9uVhZQHGWAGnotj36iUUgU2P9LCDwN1AsvU41sZN4hGAbEpysIi_Dt8fOlxyvwp9wwxzt4Og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:YUZ8YcnbPMKFrflYXQSHByThmAIaSaZAV6Z5uJKzndjN5AIHPa3f8Q>
 <xmx:YUZ8Ye3u74iX7ZDOXUYIqZHlEVwRz9fqNynCz7Gh2YmdvAgbjpaIqA>
 <xmx:YUZ8YTtFNCjMfFj06ycWrbcwcFRw9dYo3bd1xpff1X-KvV20S47HxQ>
 <xmx:YUZ8YT-hqoZ9oamU54uudvmCeJOhhVuopKYoQkjk8mYEZ2WXgFu90Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 15:07:13 -0400 (EDT)
Date: Fri, 29 Oct 2021 14:07:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <YXxGYJbw1CDlWIp7@heinlein>
References: <YXDtrwHhUcxwtlij@heinlein>
 <20211029163720.ztct456rqf7tmezj@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3hqv7m0aSmmWreAA"
Content-Disposition: inline
In-Reply-To: <20211029163720.ztct456rqf7tmezj@cheese>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3hqv7m0aSmmWreAA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 12:37:20PM -0400, Brad Bishop wrote:
> On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:
>=20
> >## Definitions
> >
> >* OTP: An "OpenBMC TOF Proposal".  Any request to the TOF should be fram=
ed as
> >  an OTP as documented by this process.
> >
> >* Author: The individual(s) who write the initial draft of the OTP.
> >
> >* Champion: A member of the TOF, confirmed by the current TOF chair, who=
 will
>=20
> What does confirmed mean here?  The chair will document the champion=20
> somewhere?  Also what if nobody on the TOF wants to volunteer to=20
> champion the proposal?  One will be appointed and try their hardest to=20
> represent the interests of the person making the proposal?

This might need to be worded differently.

I anticipated a few scenarios:

    1. Multiple individuals are all so excited about a proposal that they w=
ant
       to volunteer to be the champion.
    2. Only one individual is excited enough to volunteer to be a champion.
    3. No one is excited enough to volunteer.

In #2, the "confirmation" is easy.  In #1, the chair should pick one of the=
m.
In #3, the chair should pick someone, yes, and as you said: try their harde=
st to
represent the interests of the person making the proposal.  I recollect we'=
ve=20
discussed that others would be invited to the TOF discussions for their own
proposals, but I don't see where that is documented.  If that is so, acting=
 as
champion shouldn't even require buy-in to the proposal itself and means mor=
e of
coordinating the after-effects of the decision(s).

>=20
> >  work with the Author while this process is being followed to ensure th=
at
> >  appropriate updates to the OTP are being made.  If the Author is a mem=
ber of
> >  the TOF it is expected that they will also act as Champion to their ow=
n OTP.

--=20
Patrick Williams

--3hqv7m0aSmmWreAA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF8Rl4ACgkQqwNHzC0A
wRluaxAAgqDkYt2aSVKDrYg+5A40zQymI5p9PO+Gezw/CquZEpCOOJkejVQc6iNF
UPP0sHxCQVQh2AjJc3uJi6X3n2hvo2nzMCmKVctse6+hFKdEA5UUOYHih2s7r6BN
GCLzNnkVGVQKXGIFQZ2ZlsQnP5h/2hvE7wiythXRcZUWnDgIFytiudvVsRN5ZGpg
GjXlUwxk8CgG6BjCPWU8EF0cGPIAcyJ1UlGWLNdlVKyGc4Bwmhw1jns7a8LFtdXN
6bsAIJSFqsZSXm0xqGBsq/X0GtTfYMYMRrsB7gIs4hI89RuCqQ00A5xQv/7NwPtT
Wz/gAbYzUXGMUpsIO16JsEuoyJM2YcPRPhoAQyhkQSnHiaqlZ/N2JAD+Zcsof4wV
LmY4FuAp+ebh9WTrkrjuFq+8G7uo7k0c/puCff1NR4hh5B6703zvT+h709I3ty90
flo/CAnTQkeuNuIn37rsg5ShXX/d8qtUMH/loxb+UF9HDKgitiY9rGDIWk3iPbdz
/w5pNF/9BKTuM8heDLWftmmDSPNefaMLQU0gAFAP/A2nx6GbfYFtfy+nu7vfdu1l
gpOrrr5h3a/6CfBlvOHVJSbq8TyGNRHdH2le/cIsARp9rgOKx3XcF8U8LlVxVZQI
ptkbW3TVd40Q2ODywVgLimam3zIaG2zg9aWxBFbedPylGDsahXI=
=m1nt
-----END PGP SIGNATURE-----

--3hqv7m0aSmmWreAA--
