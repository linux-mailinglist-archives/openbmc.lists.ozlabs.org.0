Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C24489B4C
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXbt93CLBz2yph
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:33:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=nXO/dOV7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AFjFuS8Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=nXO/dOV7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AFjFuS8Q; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXbsp2VVDz2x9b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:33:34 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3EBCE3201DBF;
 Mon, 10 Jan 2022 09:33:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 Jan 2022 09:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bqDQHk9uzPPMRBCORNgenqdrWHo
 QMt6/4wfLaDkdHHI=; b=nXO/dOV7DhlJ3CHfK+sJGb1sDtAK2OcTcZ4BERIHCfM
 xXk1S2lUPBcRD8KI6xmtyY4wEMm808CmRoKHOfvxOLq/FqJAozW+ISBNo6Xi89t2
 gYm+70npNTQpPpayCnbX9eib8Yn1LyLQVfHyddo/KvnwuVS+YfIhVwspe+Nup6KU
 Hhx4a9LhGypPwa5upwDbcRjXf5zXZLnAn+bH2cg0tRXq9T1lkJkeS+YtVDvPh7V3
 EEtqidpeR/obKOrfD8DYLBFFyP6kqc/0EMymg+4FaEtRt9giknx8pVufT6uXvM9p
 QnOFeEXSAIE0bn/iC0h0XoiiUK+08qf38kILNezkjbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bqDQHk
 9uzPPMRBCORNgenqdrWHoQMt6/4wfLaDkdHHI=; b=AFjFuS8QozWsnrnM2rMFdm
 myP3O7Oi3WlPGFNBnHIF+vzEJ+B6zHR/fxHWNME1FeaHQ7tB3lRuxY4ckx17VeA6
 /zVdiKOBdtVBh3GwP1H1JaBkuFLXOpzmihXzw/Z7h99lYjEM0eSOcTV2oO1U5fvd
 UevrFvugXqg81b4xXtUyr6SbcGnaMF8CyhiQzwx6UgPx7CO1l2psNJ4qT/YN8TSe
 iD8Rd82Szev9N8l5wxONAW/9eoWBkBMLkoGI2piDVY1yVBLWsl+3NZVLLe1wTyyn
 WhKq6DWjwB+tmqyH24EJPvBM2gQwzSavqQK0BEx0vWHwfbnZL7/75vrUYduCOJyA
 ==
X-ME-Sender: <xms:u0PcYTBApJcpwPCrDqBObXi7M5yLyh0CoMN3-J7QXHUWfylTj3PUbw>
 <xme:u0PcYZiQ0DbxnEAfFpEZavOL09HcJD9A7YIAzdN57YXQlaqAWFIOQce_srsj-u1uM
 s814ehPxZnRboaszLE>
X-ME-Received: <xmr:u0PcYel4NszqAzPrFqcQVL0zBeJxRHkJ4EqF3Ht3FFaBdNv2nezWm1shFxRMp-3rStIyQEkCWH0eoC-8RqguOMFbqa1rrouJ0gdZMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkedvheduveekhfeuvdettefhfeelhfdvheeigfdugedvgffgteffveektedugedunecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:u0PcYVw9gq3DP3WFzROfYFt16k4x4T4OTVmk_iSSenpxtgW2n4UGnw>
 <xmx:u0PcYYSMqHiDB4hY29fTFg_EkmVVbs0nTidqfREdCZZaudMT22EpTw>
 <xmx:u0PcYYYImVBckN8Vyfc7fSQIqSoWcwWxYaiz1Pk9atHhCfNW9JSXDw>
 <xmx:u0PcYR5qGIHdEXdQLp8qd8UrcBT-Y8sluCChOhZj_19ETR8GtYZU-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 09:33:31 -0500 (EST)
Date: Mon, 10 Jan 2022 08:33:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: Sensor Whitelist
Message-ID: <YdxDuatxZZiAP1yP@heinlein>
References: <9F164585-0D50-47A9-AE4C-54695769F02B@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CvIwHdEB1ocYiAtq"
Content-Disposition: inline
In-Reply-To: <9F164585-0D50-47A9-AE4C-54695769F02B@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--CvIwHdEB1ocYiAtq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 10:09:29AM -0700, Mike Jones wrote:
> Hi,
>=20
> I=E2=80=99m getting an error from psusensor saying my driver is not found=
 in sensor whitelist.
>=20
> What defines this whitelist?

Probably this?

https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L=
74

>=20
> Note that the driver name is ltc3888, which is part of hwmon module ltc29=
78. In case the white listed name must refer to the module name instead of =
the driver name the module supports.

--=20
Patrick Williams

--CvIwHdEB1ocYiAtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHcQ7kACgkQqwNHzC0A
wRkDPhAAm7Ua8b6apQf3T+NyPMJDilMm+W2AHXG44Bk/IfR7hf3kH48Wdhr+mHqm
i/iM60p3URSrpqmy/LUzBpQq8RFq8SUZ6Qe3bmZIT3zdRzDwgOR982pLqPdUqeBi
A5GSto+BASgf7PdMkBeK0ZQYfPZ/k6e527iYgaRE4a1rS4jg7Vu0rWzAZmKRkHui
1/507WxUwe+UEkVCdQ5X75Y7j8Jc7xu6xfKXSfxj2rlSKB0GRDkz3s7wgVimCC+c
QYH1m4NblPk0/Ua0WZiJSOfjR3xa/1Qk3IygnFFycPsGptH6jBZlC0zl0jEC4cyh
0fOR5tGmZQBL3aKFP+WKg1vQGjFtgppQDLvpAqgA5Ry8bLfaS0XZTz6dusF5Cg5B
A9m38kJ7t7EeKndb0eqlFSYTPLb+sFy8wd9Ml3BECZUYl/Fa1p9BbR6Svscl4RK+
GG8QqSlQvkIhLpvh0p446kZuw45bXxyUuTlyjeR4Qqan6+oeSsTcykpaZFvUAlom
6xEVKxhGbrAOuTM/Cw30NHjouLN03B10c4orxtWAnLkclCNPAZoK1hQR1KbNY0xO
YSCatK0Dl43OANM/Tey4xdfabGnZShYBagGWqIeQbl8t+aBEY0pH35QbBKqzi5yf
Gt9rjftDnvJ1pj8309qX7ymvbjQyiAztyNKBdvI9RdVpmuqgCA4=
=MIiX
-----END PGP SIGNATURE-----

--CvIwHdEB1ocYiAtq--
