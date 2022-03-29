Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB54EB25D
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 18:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSbQ04dLNz2yZB
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 03:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=q1atB1fN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SrmQdJTw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=q1atB1fN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SrmQdJTw; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSbPX0nWKz2x9T
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 03:58:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0A124320217A;
 Tue, 29 Mar 2022 12:58:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 29 Mar 2022 12:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=O8MUzT7qQRg6Cb+J3o8w6QGG+FO31L5HJ3aDXH
 nBdfY=; b=q1atB1fNdqomIu2jL6B+niQUwIdACO+iO3VPOr859SAwqpY8/0+GN6
 mktPPcFbW2SR4v8CD9MeUi1PBucZGLZ0MHLwPQSsS/KBG5z/LlIPekzHdbICuuS7
 1d8yjKXSkBgf7UxghTgNeTEan0j0wE4JBAT5B1S2q6j8/Qze2RFVK0Oa0J+WGqo1
 weI5+yUUEryqr3gTqcfWcpotzLwAXxkNDCoyGan4AyzeAii/+BmLzGNW/t4tDC6M
 YoXzcb7UK9Q/JMMckkgvJfqkJlvfoKdWWs3uzBJjBelX6d80ihNgICON9HAUHeHb
 mL681KdAJPdycIYXY0M44uZUSn4zakQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O8MUzT7qQRg6Cb+J3
 o8w6QGG+FO31L5HJ3aDXHnBdfY=; b=SrmQdJTwRicELdyab/bSWascPRECLXiom
 RWrNsOsxE2/vXzYGASm9Og9+D+cc2joMqxnwoStfC2x1AGMjKVMGCDrexzhoolHE
 oqv6XpC0P6YjFgC27zWZfjAL4a/0AtnqNAKkuKZ9/8nZinxpxHSi79ezFUjTtFYR
 1F0d7YrDlYYOR/OiCce4oH/rSA29dOom7cBXFLKsek3u6X29jFGY5AOVtmz4vEuH
 1PSqyv8SgkBzXnrKp9FjrBZR4Q+f6Jg/+rdTmwG07vFlR16mhiAMFqfOhVJYLbhB
 DPiJg7OgBS51otVh3kt2cBqSwrM1ODzSyBmQ+JJiUB7Lo5H4PMtLA==
X-ME-Sender: <xms:yjpDYiKK35reLafyqRmOXmtDyXYeNUMVIlT9CN3IJl8u8tval60ASA>
 <xme:yjpDYqJ4luIu2c8-GZmYP26dBmZInSZ6eQ8Scn6gjwlfscS_tHU3i9JZrAspfx2Ij
 Y9t9l6O18bASMHjjyQ>
X-ME-Received: <xmr:yjpDYitBK1MyvrPMQaFsU_FvIMcHj43fKeLZmqhrJ0cngXzDoVSvc7Ckr8QNZlD_gFUU2nwmJHgWp63LUAdS1a6u8sk3N3seEmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yjpDYnbNfuh59SCqtA7fsTerDcBLrDxDOlQaAlr2nXzGQvY-2ydwHA>
 <xmx:yjpDYpZDoeOLUhemDlCECjUNC3RDoQ-fMZ7I0JV2TjhVZpkjp25l_Q>
 <xmx:yjpDYjAnkbH0W6ryslw9-ocO0QlNSTQ0-0lYG5eB9-XMunZnHShh9g>
 <xmx:yjpDYsyknEIVmXSLDkYOEOavRMK1j7o5TVnRuqplYpiDXn7CsbfnGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Mar 2022 12:58:49 -0400 (EDT)
Date: Tue, 29 Mar 2022 11:58:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
Message-ID: <YkM6yAHSWubX7Nh1@heinlein>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <YkKYdecCGm4vGMUa@heinlein>
 <5ff7a5e4-1c8d-4707-906f-efb3b40b8d48@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qrE6hwzXRvOHWWnU"
Content-Disposition: inline
In-Reply-To: <5ff7a5e4-1c8d-4707-906f-efb3b40b8d48@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 jiaqing.zhao@intel.com, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qrE6hwzXRvOHWWnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 09:22:01PM +1030, Andrew Jeffery wrote:
> On Tue, 29 Mar 2022, at 15:56, Patrick Williams wrote:
> > There has been talk previously about making something like
> > `.openbmc/config.json` as a further configuration file where we could
> > enable / disable all these check.  I think it would be worthwhile as a
> > way to eliminate many of the "search for special file X" checks we have
> > where we simply touch an empty file, but I suspect we really shouldn't
> > be using the "touch a magic empty file" mechanism anyhow.
>=20
> This is related but is starting to feel a little tangential. I think we=
=20
> can get away without trying to switch things to a json config for now?

I wasn't sure the scope of what you wanted to tackle right now so I was
giving you the full-spectrum of my thoughts.  We could certainly make a
tactical solution that resolves the issue in EM, but I think we still
have a mess on our hands w.r.t. specifying what linters and formatters
are ran in CI.  Random dot files, deviations in formatting rules between
languages, and undocumented combinations of testing are all artifacts of
the mess, but that mess doesn't necessarily need to be cleaned up today.

(*) I'll make the argument once again that having to support autotools,
CMake, and Meson in our CI additionally makes this mess even bigger.
You'll notice there are actually deviations in what gets tested and how
between the 3.

> Thanks for the feedback. Should I push a patch to capture this as a=20
> design doc?

If all we're doing is making it so that `format-code` always runs, I
don't think this warrants a design document.  If you're looking to
tackle something larger that probably does belong in a design document.
Documenting the as-is shouldn't be in a design document, in my opinion,
and trying to frame it as a design is probably going to generate a lot
more discussion on ideal vs present than is useful if we're not going to
make much investment in the implementation.

--=20
Patrick Williams

--qrE6hwzXRvOHWWnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJDOsYACgkQqwNHzC0A
wRmMzA/+OUcNMM29R4itAqT5gRkG01kSpbPcoldL6EeyPpGoqcsbM1cLKwp/fNp1
LYkSgy3nfn7jhSbuIWE8u0Dar1ep8dbWkeTcwxgIjajmAi9kBzeTeMKSNmHWiAiC
ML2YaV1U4Fn6jpsVjCJqVpzCoUZLDoRvUGghYD2Yq7ISun6rjxjYAiyRC2dEQzjz
gVC3sOndNVzehF0tikcsg1HW9/Qvwp9OcNylk0KSkX5TXbki3OxE4cWmTlkeqMm5
w5x8jrTUv1SIL2fJK9WEcOhC/YjmWO3sa0qSxIN93PdSZKAZKcEhrX0fcgma4Fuo
tNX8RhRIfs2/heiHLvzqv3ZTvQe+Ht4ClyVsz0PPfPSBG7ZrFaVbIZmrB6di4Vns
OjnP6y7qdmDIbdjtBHmwM8VlOHMzZIyUvBCzNyHfnWMJNd8UFnR3sEwC4oVNs/xt
x1spBsk6rNPbfhTmYS1QIVXA5I/5roWdHbSSK+8AUVFZi9HdAGL+Jc0RfrWp+U2S
J0vR9z/eijRAAx6QuEcFbDjCC7eaUnuRMi/3aWKQ90f6feCN0Pfhe7zZlCwAz84M
Eyi00QA6X1qgcfBm5z0nWOhj9aMQF09y3NM3cMcwafvDqquX4OiQqB3VbsjEcVE7
89EATjJ8MQmtWrrCkgSVVs296bDRV9Mex+FXKq8Oqtn+n3C2nGA=
=2902
-----END PGP SIGNATURE-----

--qrE6hwzXRvOHWWnU--
