Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7A392E0C
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 14:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrS0z4B1sz2ykG
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 22:33:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=h9RbRz56;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JefJ70Nf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=h9RbRz56; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JefJ70Nf; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrS0c55hfz2yXv
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 22:33:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 572115C00C9;
 Thu, 27 May 2021 08:33:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 27 May 2021 08:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=e3F5up9F0HWhwDgeYcxCNvf8GlP
 ArHo4d76tapl+W3o=; b=h9RbRz56Z84NStq9K6BwYxp1oA5iytVpk0Mb5MXCcN1
 EG0H54E992I7hIZGuNiYGCapMmW0NceT7PtcKMg1b3ZuFDT4pH5Jx7Z0WiCb4hWj
 Jubf+PZjdYNHw84WiVxxmgULCfuOBPlrHeXIS1gZHEgEvEzRcbhTc/jMQgEMoaLt
 9Kxa69sw/Ib337IdWJB73LrMv27k5NLg2buRvJaNNVrV71ruipkwccQ49v6Kpx0P
 WiStX0C868Y75Iio/Tt89g4+p5ph8yNcYxhRCSjxH4WvamVTZzoIFOsqJG3RJLw5
 pFjO/h6CscJNAPaREhldF/coJYlf/KDE19AcztUxQAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e3F5up
 9F0HWhwDgeYcxCNvf8GlPArHo4d76tapl+W3o=; b=JefJ70Nfy5sFErFgldsSCB
 J2LanA5HjA/yVVBLN5hVtc8fqRjaRYr6kZZe5hvgeTQfYqqV8DzvqPWTq12yXIKM
 mILAJs4CmUGr/0vccX74v/m2crEQEpdh31WOQ1kvYien3vZHUALEOKDx3LoPmHVb
 nUCx9+gL4dZ/972lEz2o8mHuQyZTo0O8qQAgQ+Bj/E7ZelpiTPOwSgCNu7lQgKBA
 I0b4TSLCEop32QIKO77E93KV3QTzF4nKfS7MiZX4F2OL+3GQuzTjEEFcT7xIst8U
 ynh/Tn8+86SiRIaxrqH7YoPcz7iDCvbsR5u7Hqa95DOeM5SIZHxEPYrYGwJ0xn1g
 ==
X-ME-Sender: <xms:mpGvYK2lhDrBj6gsCepnMJ50TZ8hGSdlEioIohZ7Kh6sDO0WUDtbbA>
 <xme:mpGvYNEUxiBojLDBlJ2Wd-6uVaRbl5dQHUbk9rwBF0NmaNp8xKJvPxgstVbLotD_n
 w7Uk72yMWCd9CTdPWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mpGvYC77FlFf1g2GyRuzz0Jp1Lg58HybFzX581QZQN7il0ZpU-KbfA>
 <xmx:mpGvYL2yv-NQjctN4UmGwlP-95g4FNf4PJZyH9wruhrtYust5dkOtQ>
 <xmx:mpGvYNGstBuCutBO-2e8bI4xP9_4WZ6iKj5hqO24eM5phAo9yfD0Lw>
 <xmx:m5GvYMywb4FoxJcDrszRze33eN-rxyu9Fw7cQpgTwM7QUrinSoVGAA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:33:30 -0400 (EDT)
Date: Thu, 27 May 2021 07:33:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Unify the 64MiB flash layout
Message-ID: <YK+RmDRspsfjeTp2@heinlein>
References: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N/cei+nrvetBN/3u"
Content-Disposition: inline
In-Reply-To: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
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


--N/cei+nrvetBN/3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:13:44PM +0800, Lei Yu wrote:
=20
> With the above changes, g220a system works fine with the new u-boot
> and the updated flash layout.

Does it work for the flash0 u-boot to be able to boot flash1's system?
Maybe this doesn't affect g220a but in general we've found issues with
changing these kind of layouts and not updating both flash banks.  Due
to our secureboot implementation, we're not able to update the primary
flash bank (since it is write-protected).

This change doesn't currently affect us right now, but if we're making
a breaking change anyhow should we increase the u-boot partition
sufficiently that it won't become an issue later on as ast2600 systems
go into production?  We've found that over time the size tends to get
bigger with newer (more optimizing?) compilers, so I think we should
ensure there is some buffer there.

--=20
Patrick Williams

--N/cei+nrvetBN/3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCvkZYACgkQqwNHzC0A
wRkTVw//avGUBG0+jwXSqlWuBrf9GxJUC8n/w+lkPNeot7gNQfUXOTgEJfnu4sDe
z3LWhq84V+wMa9KXQkk63YFkAMJ4hB7Rko5Wv3mfxKTv+ojl/DtXzq9eBFS6Np5i
KsdcSNWnk3+BUa8mWYTmQwiyVXBGYcFfN2m/F7KkC9+ohE0XT/xyskCF11p/0Fwh
MgVAx7WqlRE6VtYbqvrwjXsqWpal4MIiRfY8P4RF3RIaEJAdIjNAqgUgWzXfGbuG
YlnTiWUlGc6KdIBtlhj0YCIFjRdiB00SMAu4vlHQiCpv7iauAXuTShns0AdSBBVS
3KQPOqyyvhMjQVcu56tnx7jimJfXy6Zqbf3CkuxPg5z5lwn75/NaOQ9tHpRHgbAR
/71+jg+6tRmzdH9QfIcRNMxWb1uXf0bKcXlqwQIAICyu3uvga07KP2P2wpeMvqeB
hU0tJOheKtU4PEyEqJP5wQR8ftdGDxw2qLYmeH/p6QOtPtVs6Mqu/BLd1baLZ3so
Jvc4/EM4rMiS3q92N+OhdpqdWcFapgsHn0LX6ISP9I6PFR/w4y17XVO7yuiZF30w
FgG1Pjd5xvZVXxnWteSKHuRLfIGqhZW0N2mQVfnp8DFpayk/zZ68NoLy4pMDRdOs
O2fZ1SJ9SbSaz376F2StJ62x6clAwrOEme/VctUi0Nf3n4R38iY=
=Oe5O
-----END PGP SIGNATURE-----

--N/cei+nrvetBN/3u--
