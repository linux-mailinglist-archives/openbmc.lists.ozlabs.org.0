Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D58AF40C9F8
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 18:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8ls05pLmz2yS9
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 02:23:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=npqg0MpF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rLsC8Cy7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=npqg0MpF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rLsC8Cy7; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8lrW3kQgz2yJV
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 02:23:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B65BE320090A;
 Wed, 15 Sep 2021 12:23:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Sep 2021 12:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=L02d1p67EFpNUOleCmwCABfAJaF
 sqVIG5Pm5cnYaT40=; b=npqg0MpFq0Ws21hhBwHxOz8gp2V94FVJNZjNZcNFMDM
 eZJijCAS0yhJiRtZ5SmeALagN7z2k1C8u/JhW+XK81xTfmwoKbeeLB52bPhVXvh4
 ErPpOZLcQz5tjJyj0WeyHPJd8E1L8QbB+4I5ikQDZLapGHr0XiKRnSofiCBmGXit
 frxhPBadaXeMUYEeqJKYNkks6iiP+f99kRR1YPFuO438BUyqJcnnSmkrwUK+lS2v
 z3RxeqJUlm+iBXDxj1jpH1T6z2VJ67Tva2zHI7D7GD5ZwjxUwkoxMcW4MkxuPSA2
 gmRDOzuU6pZ8I+iy05RzYZeVSiopfNF0N/2t9A5Enhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=L02d1p
 67EFpNUOleCmwCABfAJaFsqVIG5Pm5cnYaT40=; b=rLsC8Cy7ch/fzTIiETvC/5
 kdP2x5lhsnzx+tOHQEwh2jviueHevZMNF4DF6h0KAE1KCXPEcV3J98EocBzNh3IA
 /+ARsJAYKYQLXuibZ0gMPL/i133AfXWlY2DDe9qv0Q/KXDQy8hZeRMYAYf5hvAZh
 2DYk/jD0dwLkHm5Dh3gMgRhbDMzHdX9/v4jpQO2j29tpnReiyqIdG8nMGSBG0rwf
 gGWLnhrcfkJUYpy9ORmdxU8/f+HMurcC2+pZXAXTKTMWAr0Ofk/BHbghuukMQUSI
 jJLuQPhgngGBnV7zAG0DAoekWjAasNAtsoKLIn2sBFlOmGm+dWLiWBBvgYsdy3mQ
 ==
X-ME-Sender: <xms:8x1CYVuAKFgCmNQ8En0FeslgUuyOT5rVMIlwNKs1QouBYDYY4GIKCA>
 <xme:8x1CYeeEanIFmUdLt7bM3kOwv2empWGWOh4Sx28rfgth-7qsopVjNniecevsJO0A1
 FVZvTTlQ3tkUD8tRQU>
X-ME-Received: <xmr:8x1CYYx4Fjlsyp2id1kXvSXo1K8gA_vzPTmgQoYOVA1kYk3JwgGwxaBANh6ce2c6K_SB_5z9G9YjOvAAaiE6vGQdJSZ58OpGldIPEUZvszZABA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehuddgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8x1CYcOH0kwKQ7h4KLNLR71vfUOcDWCgRMjeeDr3eEj50VZUdbHajA>
 <xmx:8x1CYV_EpFnYU_XnXoPDreteAMx-FI3AzRWye9DWbFbCPweNycK9jw>
 <xmx:8x1CYcWSDx4uLY-Ar_AZwAkCrezwpRVBHcePzhhBE0iFckOdaqrGqA>
 <xmx:9R1CYYnd2RYz3rlqI2tyeoBoAmI2t5LMldzQaTJLzr2EfLCPdEF7Bw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Sep 2021 12:23:15 -0400 (EDT)
Date: Wed, 15 Sep 2021 11:23:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Oskar Senft <osk@google.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
Message-ID: <YUId8mvBHn6DOzHu@heinlein>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
 <CABoTLcTznKtVLT1LdXKiGRO0Gnov=kSJfTDTe2bfeVGHCRdPHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I/sdLA7w7d8fU/lg"
Content-Disposition: inline
In-Reply-To: <CABoTLcTznKtVLT1LdXKiGRO0Gnov=kSJfTDTe2bfeVGHCRdPHw@mail.gmail.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Tom Joseph <rushtotom@gmail.com>, Heyi Guo <guoheyi@linux.alibaba.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--I/sdLA7w7d8fU/lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 09:54:47AM -0400, Oskar Senft wrote:
> +1 to using something more explicit, like %20 instead of "_" for
> replacing " " for D-bus names.

Ed had previously added code to sdbusplus to consistently do conversions li=
ke
this, in the same way that systemd tends to do conversions.  I think we just
need to convert the affected repositories here to use these sdbusplus
object_path types rather than creating their own strings.

https://github.com/openbmc/sdbusplus/blob/master/src/message/native_types.c=
pp#L53

If paths are encoded this way, we are able to clearly differentiate between=
 a
desired space and an underscore because the spaces become encoded as someth=
ing
like `_20`, similar to the proposal here.

--=20
Patrick Williams

--I/sdLA7w7d8fU/lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFCHfAACgkQqwNHzC0A
wRlkLBAAjjBtuQLqjwpYaoqWFnn3MvLvyAZfr2e4vFgSEbTFNqW1hiJIIIacP9Q/
MzgRuKsF7J7eh7U5yK2inMUYv/xoEW7gjRPNRxF/AxTDLrLVQv1PGdzogZI4KgE6
HHhaqW/3ralE+dnQ810NiAEu4MD3vUMvh/Phxzp0JT30SsTFUY7KC+xGaM/RIGBu
NcYHD6eyFYKINE9SgJvlZrmxy/2VQXLA1nRnSCO2MFRSOR+ji61IYWtrEwHOiKvn
AyMd22cxDWQXFV6JFW5/sUY21uY2BdqOlImVpTldR342oT6CN+28pF3NKxS/8vdL
qONnE9eGpvjDuqtEJfS6P+9oNC5YcCZGhNUZeE/5DfK8Sh+hZhpjsGrqqQ2ByueT
GFubG1rnb/QXlK2eKaUhBsXcHWSBqFfsluTXeNK5UcUDTC9cO40mJx2Uo+Icr6Gg
TZY8B1u6Pnwa38pE8+qbQ8iwvGmwwk+vI0smVxAdLJnd1O7xHitpQtYxgK9S69b+
OXGVGGZDedqShHTHVqyBjHCv3DGrYztV+zo7Dg5aUL6+W1kA4+7r+hHVxoRnCh/0
jslB2kA/yrROS7+RRck1DOwCcRg3hANaYFyXuqopXyATzIyFgNtfThGMv0YsEYCZ
l0BbiHCqf5tzbJZk/JJNW7KBi27FuU9+Yk3wlyqg/dxsNjlThl8=
=xqi4
-----END PGP SIGNATURE-----

--I/sdLA7w7d8fU/lg--
