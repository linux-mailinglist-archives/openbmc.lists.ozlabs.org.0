Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB728565C
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5cSZ2L7mzDqGF
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:39:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=NfyoLPDY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=B394w/YH; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5cRs4T2vzDqC9
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 12:38:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 99959CA7;
 Tue,  6 Oct 2020 21:38:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Oct 2020 21:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vC7RorddrTtkl5XSu3EQ82emoF/
 2EGkkHGpE5i/5kjs=; b=NfyoLPDYoa96bboRUPy1qa0UQqVr0FlpG+VuGahJNA1
 cI8Go3rYzeyK7q1dQsxRh+GdVTig9Y5CvKiqAaz/qkxyMADIDCAhrGlKFlFMUpot
 22Cp4bc+n5QTDJdhoWlzsFq1dbBqxPHbpFmvz2sCJ6W3ribYjPQY2/1/6uR5lQ//
 JB02c7HCb6l+2Udju2V4Ii+s6177j4A3fdbNmU8FsVTGcR+mOoIshirnc/VeQQBz
 DMtDBtDVSsaLsBX0ayAqCZwFMEWYQo4ays43OFkUJXJYlPdZvXydj4IFRphrsUxp
 rlTAoNCfILoT2KevAxeCbwjS/+0RLBCGkM8/a03dpJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vC7Ror
 ddrTtkl5XSu3EQ82emoF/2EGkkHGpE5i/5kjs=; b=B394w/YH++uV7RvrmQshj0
 3mZkTBjA6iqCR3Kp72ZV9SeDwlpncHfZXrUrKmpkeoy41WnjjHAzInZGaRE2Dan3
 A4QYIAz/gW90lzVq2RyCkIxpJLanRZR5gAz3R2oS8TPYy5T+h5a0srVLbKDV9PYh
 295DvUrt5Brs9in6MmwMfMhHO7YUW3dw47D09gdaMfS/3LhqIF241SEbOEE0S+QQ
 R3ibeW9dVDYDBiP3NhAwBqrCxTFTWwSg9b+HVqJDz8A1OvS0fcQ8Z/ptkV7/GnCa
 UIR6JeGdUHzQuFKNnclGYs6ioXqDzajBfhFob2XMC3OEdSaSo154jMYpwH6QbRfw
 ==
X-ME-Sender: <xms:Ehx9XzsAUvSPu_uVnJ4Bj4JKX1MPTu1Y7rWejebGvf9WdHzHFMX78w>
 <xme:Ehx9X0c3eVumqolnhmcRnSyKPA33SpasKigqcMn0yjZe-XStm1d_fCgrSOusjJcuh
 ORb8tMWrovptFqrX04>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeuieevgefgffdugefhvdffheetgfff
 ffettdeitddtkeevteffvdelgfegkeehhfenucffohhmrghinheptghlohhuughflhgrrh
 gvrdgtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
 ihii
X-ME-Proxy: <xmx:Ehx9X2yrGlmZbq-U4raeEyPM5zWtGJWLsfBHAyNJ5D-LMNQd1kKG8A>
 <xmx:Ehx9XyNx0dp_wmw01lZIcMDsaGSuoXStHmjj8_ZLj6hj4lvJgTadsQ>
 <xmx:Ehx9Xz9iWjnNIU2r5K42dPSb2r0AIAMVpaHaewsEn0sc96DQXAGohg>
 <xmx:Fhx9X9ldqnw38XjWRtwt5JkiPiIoBAuzU1UdbOH-zuEtm2ZG7HzLoA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA3A1328005D;
 Tue,  6 Oct 2020 21:38:25 -0400 (EDT)
Date: Tue, 6 Oct 2020 20:38:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Hanley <rhanley@google.com>
Subject: Re: adding sync method in phosphor-time-manager
Message-ID: <20201007013824.GF6152@heinlein>
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <CAH1kD+b=4NhQ=XUmtGXov2WErqLB1T=ZZBYgYBkuVLT=-hdfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E0GIYtSzp7Op5bZW"
Content-Disposition: inline
In-Reply-To: <CAH1kD+b=4NhQ=XUmtGXov2WErqLB1T=ZZBYgYBkuVLT=-hdfvw@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--E0GIYtSzp7Op5bZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 02:41:29PM -0700, Richard Hanley wrote:
> While we're on the subject, has anyone ever taken a look at using roughti=
me
> on a BMC? I imagine it could a really valuable extension to
> phosphor-time-manager some time in the future.
> https://blog.cloudflare.com/roughtime/

One of the problems I see is that there are a few different proposals
for "next generation time" protocols beyond NTP.  Unless a project
member has an explicit requirement for one of them, it doesn't seem like
we should go out of our way to pick one of them.  If someone is
especially interested in implementing one of them in their spare time
though, they're more than welcome.

--=20
Patrick Williams

--E0GIYtSzp7Op5bZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl99HBAACgkQqwNHzC0A
wRnoKw//b8f/0znpPoxgTsS9DEMFbFFB8Aw+aKt/a5S3vGbWIiR5GiP+ZhIIElzb
BcAD6kwO1AYKjfNaJQf3k6x4NdS62TuPtm8jfRHLQg7FkPDRio06256ie+CJTUPW
3l7uCv+QxFhS4MWRugJrdxX09O0ORMXPteduNEHa82INYAHuhur1Vo7OyUR1httR
eqSQsTcIaWiFFMgQXZZQyGNz5OgOuJk/26ffDgE4GEedyG+as6RP86t0VgU174us
j8jY3v50V0Zjn3BfBBUruPk+dTm/9I8jk8UUtmwfOE6CHvwj5i/VYGkJhhzFL1G0
UaOKoPDn4ebTk1Vp9mYNqD2E5RbgfLvbeayUs69W6xpMNpfLWIuUjsRYMwI7eVZr
doBGz3X1DXSFiBKyF044mmd85UhAViyaNQUKHdX1L4C8SKLI/5dQCJFVhy+Y3S5X
QD6NoRPiiPzIxN5KnVsk4jmOvVnbe+Mwo4CpRHwbuAJWFvgW9fXy4lP7XWUnjkJE
dIR9t1zge7SRSeSL85cVBvtA4p9Wi8qrk2wDObP+5hXD93UKBkGO3iTXTZUoZHAD
9ztPzuc3eNws6ZlHF//BTcjfY/LeCxKrFPndw9qUfAYQLXQKYKLesePq91UsAUZp
x1mHBGiPYsw4d23E6eywv0gezCQcbpIPbL1Cl6R/uzCOBYJXQS0=
=7ZfG
-----END PGP SIGNATURE-----

--E0GIYtSzp7Op5bZW--
