Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E346511C59
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 18:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP8X1zZwz3dxT
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 02:19:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=NyqIXgpM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IvZaya0v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=NyqIXgpM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IvZaya0v; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpP1R4nTGz3dyF
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 02:13:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2D732320097C;
 Wed, 27 Apr 2022 12:13:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 27 Apr 2022 12:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651075988; x=1651162388; bh=VHUu/vM8XO
 aL18DiyQ6j/8MAK7fvaarovQM7OyVnHpc=; b=NyqIXgpMRm5SIP0wADc6PtOzf4
 jVmMGftBYWFGF7cMV9264ieD0iMdFILFaRuOoDztwo7Svnmc4M6geULnlw7SPQBa
 DFKI+vKd0XHEbASnfQqStgp4+AaR2yWG8d7GgXq9ZtALJqpDjKdnVt3uHXVlD/AU
 YNX86aPUbDGiIuzbd1xKPKaIPcqEJbQ1eXx0McU7nnclL85be/yKtzcQCg3R2EX8
 0TgMAYTW8gPRtb91b/BZMqBbKxA4GpVPjtEMTURnO+TeJN5ZCqtxErnfptATCSnD
 zrF/uPxtgL8BCp8KqcScSTa75Amjft6Meb2evLh1ShND/OjodPSkR8u8NaUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651075988; x=
 1651162388; bh=VHUu/vM8XOaL18DiyQ6j/8MAK7fvaarovQM7OyVnHpc=; b=I
 vZaya0vlZDGchuJKY0Eg0CnGoj6GdLnD4oazGexv7IgeCQUj8K4oVSAjbZDy0tMD
 5E0FQhYVHSnyUyQfa4VtXS839KYyC8KgU4Kc/Ez+CLCbmGMIGW7b1LX6DPUoGNou
 aSR75dJ64hWhOla1qHjL4HqWuFnQqH9fO1RCRGauy/HZnKtw0U//ooRwI0U8R+/d
 HrpyM+yK/09of7zbC19ObeeQShYE3vtJfztZHSg5vm8FftyMizXY6ZDFt3E4udc3
 XUcGbfyiyTuPdPEQ0BNnEIP9grYLRnZoNgVJ7uwmQaPsUzOcuD+yOTF2JYwXe9wj
 KqvqtXUE7sFHz4pzv/EWg==
X-ME-Sender: <xms:lGtpYmBQFkky_uky0jnqjFw0fmwbeWsyIgbNS8kM5K9QLg43YqN1LQ>
 <xme:lGtpYgiVLMsiVgyWxXv59ZVCi9OcAF9cRmaXyOsnbX7lCO6u-IT0cc1JAmQkcWmLq
 2_pP-8JFx-ihja8JWg>
X-ME-Received: <xmr:lGtpYpn8oNpF64Z58e54XfDzkmzrx0UCzulAS6D77kt6zBNcI99qZcq_PTZukdxgrxNb_s3UK4RyY__hF7kDDhhhhUREgfCypow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdetudeujeehjedutdfgffekfeel
 heeguedvvdeviefhueekffdugffgueevgeegnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpfhhorhhmrghtqdgtohguvgdrshhhnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:lGtpYkxvbIk3omXdmvrEpZAAfkJihPnKUElN0Tj4w0EMEyTXf5jQRA>
 <xmx:lGtpYrRvfa1rwFkx7DXeYB-KiINh-v0dL2BTuozbynZ4MxF2lLx3Ow>
 <xmx:lGtpYvbjmiNMXH6Oi_Aeeca_K0impyMf6w-bZ-7N2tcVdFpJfYvsOw>
 <xmx:lGtpYiKYbXWWXuIKWhWk-Y3irM4e_LFAbyRo8In_yXdkyIXMpo-0nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 12:13:07 -0400 (EDT)
Date: Wed, 27 Apr 2022 11:13:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "i.kononenko" <i.kononenko@yadro.com>
Subject: Re: phosphor-misc: CI Build failure
Message-ID: <Ymlrkt3HmnHuY1Ag@heinlein.stwcx.org.github.beta.tailscale.net>
References: <7a071d50-b581-2623-d439-d134f805f228@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bpMPcvgU3O/qvVSe"
Content-Disposition: inline
In-Reply-To: <7a071d50-b581-2623-d439-d134f805f228@yadro.com>
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
Cc: "Brad Bishop \(Code Review\)" <gerrit@openbmc-project.xyz>,
 OpenBMC MailList OZLabs <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bpMPcvgU3O/qvVSe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 04:39:01PM +0300, i.kononenko wrote:
> Hello.                                                                 =
=20
>=20
> Today I was received notice of the phosphor-misc CI build failed due to=
=20
> many `shellcheck` verify failed.  The last build (where CI fail was    =
=20
> found) related to the gerrit change [1] according add support RNDIS and=
=20
> EEM network feature, but `shellchek` raise too many error about another=
=20
> code that hasn't been changed.                                         =
=20

I took a look at the failure and it is not due to shellcheck.  We run
shellcheck every where but it only fails the build if the .shellcheck
file is present, which this repo does not have[1].

The failure here is that a more recent version of Meson is upset if
options are passed which are not supported.  This appears to be the case
in this repo:

```
/data0/jenkins/workspace/ci-repository/openbmc/phosphor-misc > meson config=
ure build -Db_sanitize=3Daddress,undefined -Db_lundef=3Dfalse

ERROR: Unknown options: "b_lundef, b_sanitize"
```

We'll need to clean up whatever is going on with the meson calls here.

1. https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f22=
4c85477763ca7fe893dcc2/scripts/format-code.sh#L64

--=20
Patrick Williams

--bpMPcvgU3O/qvVSe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJpa5EACgkQqwNHzC0A
wRkylQ//RSMAWHnknKxzUZ+76RIBIM+SIkeGPuevYq438iKbbrTZXUkYoBOVtP8N
mYYanMPzARMmDyeM816XpLV4KWULuqkCFtBdxbq3Vf536j3FPuvGev7cYw7J4DDX
VWeP6GjVuJIQdY+6HpBqgRs1VTgOLN2bii4qE9BwL7ythU3pghvXAFib2fPaRe6i
q4BexV/XRC6AIcG/ukfuL1IKVY5TLiVcBA/oT5gRRf6sVfmoc7KFnH4JNbjoo5O2
0FDOKsRubgdNNRIVqNDFAHg++hlxrHeXCdR3mT+F9JP9gnhICzuKD7/E2ZHbrVsx
/LWsiIguosG13lsz2HJ3Mt6jUgD40YWVzcXzuhJQpw7Kd/lSXwgLZX7YIKjTK8jk
+B5IraXmPctu8Q2zbfOiCBrW8IqevbEDk2qTYdY+KX6HgYuuO8s8aouB4we2gQwj
84+pLCDgtMyUB6cotbWTQWZY3Seb4+2LAOaA9W+gY2TAWXYGULfCcOBtFoJjvSQT
ksl7iD7VblOw6nnB9TQ+dtwLXKFu/0ABoaOM2yQ4/ZI8ONZBeDLZMZJ+Oyg9xo4u
GZ8GD7aT1trdmTo87/9uNYeSfamXF+bZrp8utbEHCs1aO0xfH18W+2UWvGpcAp1c
enIhVkdMoVUKLjvJHGmJKgmexWZX73WjSo1u/zUxnuTDvTZuCyI=
=fW86
-----END PGP SIGNATURE-----

--bpMPcvgU3O/qvVSe--
