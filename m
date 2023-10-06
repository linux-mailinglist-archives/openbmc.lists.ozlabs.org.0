Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8ED7BBFC3
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 21:39:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ijF8WEDG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kmWIFUZD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2Jdq0RjBz3vXy
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 06:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ijF8WEDG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kmWIFUZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2Jd66kNwz3cVF
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 06:38:34 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E12D75C01F0;
	Fri,  6 Oct 2023 15:38:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 06 Oct 2023 15:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696621110; x=1696707510; bh=Wq
	99yzTg8TLnZyNNH2nuhKPRsOGsLrRu+C3+auANfWM=; b=ijF8WEDGuwN/bBJCe3
	orTgn/EzJMdQuYwkA1GMbJyDwZvJVQkQhyYpBf6EZnWm6sf32aqxU5hXUNkBg3Cn
	v4Q5pNiiRDlYsvDsFIpul8mMAC2tZ4OV0hi27x5lvx96HOrbrL7VEzT0lUhtK51P
	qm2+hds0QcqfCDLgmKivBaBFGMs9ME3U+NT1+rYwON39LrpOd9FdJhKUyaFN4O2v
	vKtJ9/IVNxT6lZH7HOkqctutpzf2TLGwNN0WFHBZw8Qv9HSGwsNM/HNxy+uEPTVL
	R/m7RNVbeW3/LpFmatJuNVkhkqvhQgcr/UxHgNl/gFapluSJV6CJl/WZy8lmE6Rn
	LVuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696621110; x=1696707510; bh=Wq99yzTg8TLnZ
	yNNH2nuhKPRsOGsLrRu+C3+auANfWM=; b=kmWIFUZDsi5C6DL9YxQm4lTgzv1m8
	cKtw/UT+ToTOSfKXakZWYY8wU7pSuuVnMQZ5f6WH/Qxn9bzpS0mk6TdX3GGu2Hv4
	EGStNydn/5oBhQGJa4IysApQyTq0pACpeZvgB8iMqWaNutfCFxOVKuNEw98TYPVj
	kgo6uwEFkDSb6ABBZl1tY7jQlLFNgHhZ7yZVc9F7rPFrcn6SLtbrV1NBTatarL70
	5lYAvD1O61Zeqt0qcBDx9qOzS06lezxugSDvqmVnVwfZ6XXLKs0xTLWcXsQwU0RT
	LKKu8Vqr6SAYG/bZi1MP144vzqIQ2ejkNiVYZLmR80bCN/cy96bvUZVwA==
X-ME-Sender: <xms:NmIgZfc8dn7ypmg-TZ0x0wa3t9xyAEFkzxXXwrkefwY7PzuZ3HT8Gw>
    <xme:NmIgZVP7x8ASua73kQfhoRmsyVG9-cebLCCHvCh3M6w1SLo084lDpZKrNObe5S-du
    PC1h4B53icGJfiAs-8>
X-ME-Received: <xmr:NmIgZYjs1mIrb4h8UaC1QvwtPsxDgQxe_MeO6nRo9DA0EdZ8FS00rDBNENsPHyIdWGXup_1TbDI1D-QSgLLRa0Rn_3udraEY63s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddufeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddvmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedthfellefhvdehuedvjeevkefh
    hfefgfeifefgjeehudeuiedtkeeigfekkeetjeenucffohhmrghinhepghhovhhinhhfoh
    drghhovhdpshhftghonhhsvghrvhgrnhgthidrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
    ii
X-ME-Proxy: <xmx:NmIgZQ9SSHB8nNLitQzEoqQDC3jM8iCDBg4nmlOTtBYgxBFpAfFA1w>
    <xmx:NmIgZbsunKwV429AS8G1E7oxA9XFTIrVVEJi36tn2WrIbFPnA8Y79w>
    <xmx:NmIgZfGDxo9g8guPKmAEauBGIMbQPwZ-b7OjVG6rPfx1p5aieQuo0g>
    <xmx:NmIgZRVWY3UM6bf5cycQbeMZ3J8K4RDk2W_sB4V_a0JnBZE880D3uw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 15:38:29 -0400 (EDT)
Date: Fri, 6 Oct 2023 14:38:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <ZSBiMpchEETgUOU2@heinlein.vulture-banana.ts.net>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7GcCuQRguV6Ew+zb"
Content-Disposition: inline
In-Reply-To: <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Sunitha Harish <sunithaharish04@gmail.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7GcCuQRguV6Ew+zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 01:17:46PM -0400, Brad Bishop wrote:

> The legal/DMCA concerns are interesting.  I do wonder if the concerns=20
> could be generalized to all the code, though, and not just a license=20
> service.  Licensing features may not be in every OpenBMC users business=
=20
> model, but doesn't every business have just as much incentive to go=20
> after developers for public disclosure of -anything- that could impact=20
> its business?  What makes the DMCA applicable to a license service only,=
=20
> and not, for example, any old security vulnerability in foocorp-ipmi-oem=
=20
> or foocorp-misc?

I'm not a lawyer and you'll need to talk to your own legal team for
advice on this matter.

In the broad sense, DMCA was suppose to be about copyright
circumvention (such as what the license server is protecting) but it has
been used in ways greatly beyond that scope.  I previously linked to the
EFF's "Unintended Consequences: 16 years under DMCA" article that
describes many of the ways they feel DMCA has been applied well beyond
that scope.

The Library of Congress publishes all of the exceptions to the DMTF in a
(currently) 15 page regulation[1].  There is generally an exception
documented here for "good-faith security research".  My understanding is
that "any old security vulnerability" would fall under this exception as
long as the security vulnerability isn't primarily used for copyright
circumvention.

Applicable to this discussion is some work the Software Freedom
Conservancy has done[2].  Jailbreaking [some] devices is now a covered
exemption.  It is possible that circumventing license keys in a way that
allows you to run a raw open source image *might* be a DMCA-exempted
activity.  Where it becomes more of a grey area is if the method to
jailbreak would also allow you to install an unpaid copy of the
hypothetical BMC security update images.

[1] https://www.govinfo.gov/content/pkg/FR-2021-10-28/pdf/2021-23311.pdf
[2] https://sfconservancy.org/news/2021/oct/28/2021-DMCA-final-exemptions-w=
in

There are a lot of grey areas here.  To me, the farther we stay away
=66rom licensing and copyright protection the less likely we are to run
afoul of the DMCA.

--=20
Patrick Williams

--7GcCuQRguV6Ew+zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUgYjEACgkQqwNHzC0A
wRkhZRAAj8Hirs9WpzFehu7ruqoxUfvFkeWpo/vyvCRMDYIdys4BsqhNhAtJgIWc
NrFSIUdGne1gNz2iowNjnj8qOBEYxEkljVtLpXpF2DGDoxWBsPCKHztrryWVWRcg
RADEl/yiz5SGC3vLXw1TY/ogU6gVXmCtTcuOUdI8v7Nvn9needaTSYf9shMR/zTC
mACzti3Cet4po8fS5qQ2vw0RmKA9y7kePDtFYRKcld3chsk/Z9MfvrYWemCt+9+4
vBq1y/IfebU4XD/OwevxYTzSHq9iRXJdlRauVA6WMFmSciE3Xfd4QRqOSBvVJ5wl
ZOSwUQVgy42FrbxTg5A51ee+ec1SD97vostlq3tDE5R/EPkbioGz0WuJMQuwrJ3J
V5s3O+wleto3CPmFRDUUQ20X4yKx0mRO2t90jLEvkhSPAb80OeKWnumwXPiUn9kU
LEfxVhWTbue/6Haiu8vOdgzvqVUAcjWFz0Vxo5mpNWz+2BmLYE3ZBnVhHLaV+ZsO
iYzdE8aA2HAcR2JAjhalGi86r2iz5J4YDW0Msuy4I+dgV4qQEtmh68fU2hW0KI3X
CvLEp+6B+6AATPfQNZvSDWQDcfLv3AME0+nTfxbHAlCcdUK23khcJrFxaYJ2yBfh
5XsZzJVVQUvQkYYuemzDXavoSPmt5XPEBvv5FM/pph4c+yCEW4E=
=V146
-----END PGP SIGNATURE-----

--7GcCuQRguV6Ew+zb--
