Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB0C6814BF
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 16:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5BhJ74t4z3cQV
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 02:20:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=nDToqI5+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R/jDO4fN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=nDToqI5+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R/jDO4fN;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5BgZ1QfBz3bck
	for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 02:19:52 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 67F8F5C0153;
	Mon, 30 Jan 2023 10:19:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 10:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675091988; x=1675178388; bh=0w5XALXKVc
	bJQR51pkicI4ute49xEUXeWc2fzMPYq5c=; b=nDToqI5+bAJh8zY1rdkDwzMs9q
	lGzQckQLsgvODt5vesK8udxb7abqPmstGl180wBZvvfns79QmZrwzuodHxKA400Z
	i7ZJ7qav++8zwTnr4FlDoCNYjYj1E3Hk4vII5VRjzqFAykJPGxcFg6+2eUW0BrnU
	OP80i1QRQClF1TMEhauydoUa1h9QYNoXadvV3Xp2JVt58OqpSYXX2LHxHBvIDCyr
	sGVHyX2HyMGrBnVeOhFDx/nxNnaQA/OlkVylMnyQeVNmOdiAaiSO5xnl3/sAMaMw
	2WsRrZLDb9hJ8s70Vt5dOPq0z1YnHECLdgrKxAv5mdluyEdi+XqWn7mcfyuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675091988; x=1675178388; bh=0w5XALXKVcbJQR51pkicI4ute49x
	EUXeWc2fzMPYq5c=; b=R/jDO4fNu86lUnh9zgH8BHqT/oAW0o41/8WA3tIql+Mr
	VbOdPcCQNaFN0KADMZzElITF61UyXDwAg1Iw3X1n1dsLdyZXN2anc5TSeNuPSg9g
	0sIcs6Oc7kDZwIdSh/eCVDyKYCpp/CWz1jcVzPYh5RVLhzX+lDzT6IVgwQEeFUse
	H95dmAZc4Q15Hb6N4pVxvJ++RaQOG6mdDnuK1XL1fq9bWx5TjBj8HpiZCDIXk/pD
	ZCcUBIQpYJi0UWvBIk4ycKDTo3wbYbhNSOBLXJlsHzM9UwuIwg/8l+AInALYWGKb
	3Cn1n4ftrYdRhtiETCEN2V64WEANamcx+I4rxJfK3A==
X-ME-Sender: <xms:E-DXY85e0MTDc-5TW009t4IMqtixxxxweCMULh83cCLFFsIFQEsQMg>
    <xme:E-DXY96Nw1ORg8OeN5oMzgy_qi_HIWoAQqZuACck_imnFmjsWuGSaM3DkOZ-Gzuuc
    xamsNyRu9Hy5duTFHo>
X-ME-Received: <xmr:E-DXY7czwZ-1bBtiFmVgeMAVNUuDlhvmyLdfMXPZfy3dxR1wzhCsmOK-NAu9YhiWQUyu-jFFEEJuDH9Rh0hnQ5d-rWiIGvUPmnI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetteeigfefgeetffdtteeuledt
    udevgeelgeekvdekgedukedufefhhfettddutdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:E-DXYxLbUD1pErOvqwETTa-7-zO2K0Qd25id-nqgLDwnHdyIWEp__A>
    <xmx:E-DXYwI3G41jCGsW5z7nbtTTtjT8UPzzCya6-lra2Ud3rSr3MmalKg>
    <xmx:E-DXYyzUwHrWTuGLIl3EWALWw8ojAORubqwfwWj3cn4OzOPQTqPmjg>
    <xmx:FODXY3ViwQW5l3I3HbTSS3isJPjavc-d0L_M3c2-rmG9ls2058aniQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 10:19:46 -0500 (EST)
Date: Mon, 30 Jan 2023 09:19:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Agnes Amreetha Joseph Arulraj <agnes.amree@hcl.com>
Subject: Re: Sdbus++ tool : asio support
Message-ID: <Y9fgEdigX0aTiM0d@heinlein.taila677.ts.net>
References: <SG2PR04MB4009E27C238E53350F83CC93FCC99@SG2PR04MB4009.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V5eIL+4WaV8bwcbZ"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB4009E27C238E53350F83CC93FCC99@SG2PR04MB4009.apcprd04.prod.outlook.com>
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
Cc: "andrew@geissonator.com" <andrew@geissonator.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--V5eIL+4WaV8bwcbZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 01:53:37AM +0000, Agnes Amreetha Joseph Arulraj wro=
te:
> Hi all,
>=20

Hello.

I'm one of the maintainers of sdbusplus and probably the person who did
the presentation you screen-shotted from.

> I got the below information from one of the OpenBMC upstream sources. It =
says, currently this tool doesn=E2=80=99t support ASIO bindings. But they h=
ad a plan to add the same in future. Any ideas on this? Does the support pr=
esent already?

This status is still accurate.  There is neither ASIO nor Client
bindings from the `sdbus++` tool.  I have no plans to add Boost::ASIO
support; someone else is more than welcome to take up the effort.

I did do some development last half to add C++20 Co-routine support to
the library.  I intend to use this as the basis for asynchronous server
and client binding support in `sdbus++`.  I'm hoping to be able to spend
some time starting in March to work on this, but like all things in the
open source world this is not intended to be read as a commitment to
deliver on a specific date.

--=20
Patrick Williams

--V5eIL+4WaV8bwcbZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPX4A8ACgkQqwNHzC0A
wRkt3RAAgEFf7KlTM7trdRzWqUt/sgtYhDiP7aoI+88CxGpNoyHZR//HnNSj4hm0
TGJqy5+WlL/9Guzp4qw0ZytAuH9B1KGuflm0e/ZPZUGN0kJYWei/A36pwElUuP+C
zJ1P/ettVZO4jBBDS469LHoXS/NjpNI8hHCnGBxatMOg1zxyCtEkIFTXvh2CmdSl
XUND4LAXNUkbxMolt9GWwzO/T44iA3Dnt8KBeYWs6qwDGi7RVBCGcyBHNvxhm9CJ
X7IPNaKS99lk/4DCEQ1UXu0y1m8DPTkNxWeQ/Tvc1WGfBlns9z9Uw1EEC9vSU/86
X3cHxiyYzCW4RpqxAQQhoZ8hBgZpM4AhVSuxhM1Tpyzd9efFKWFeoNaomdUlQPA9
y2ewQuWpuqBgRiFrt4hjh0pjz+MQiSOfoKFKa881ypu6PHT6VIwyTi1mpza2Qx7j
3ng2jRqpkGxhHFcm2BzbaCCEaKvp6FmwWJWVj+b/6Nrtmp6kJNQLm1aivC066RyJ
avGVQRy+cv4UcGHkaxSAEjVO9fxKZg6pjiJyWqOvIq/pXR5NqVmVBKoTf6rCKzr8
GQ1w0gwvCWP5cHXw7bHCDCIeJzmLU4sQjsdPPISsev2NfciTn2Fp5W7DgnAJTKZh
D9uupTSk1ytOcS2NCXolO1ABPoNK8Liwo7TGSMiUsrksG2FW1Dg=
=bpFc
-----END PGP SIGNATURE-----

--V5eIL+4WaV8bwcbZ--
