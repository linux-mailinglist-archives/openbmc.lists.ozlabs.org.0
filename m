Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4536FC02
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvcC4jdMz2yyv
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:18:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=imTB6opU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RNQW/wyo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=imTB6opU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RNQW/wyo; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvbz1bdRz2xb2
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:18:23 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 134675C005B;
 Fri, 30 Apr 2021 10:18:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Apr 2021 10:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=PkwPH9qBiVosftLilz8BUb4EnlI
 Kxyr0j/Cxfej0GHo=; b=imTB6opU4Xw8s1OglpK6OpMUrNRLdQLzcti6tXba2yN
 ci6aO7lI4k9EwT04iU0L2rPHgKCyFwDa2lyf2HJhSOQ5X/hTxpEY49XOup7twPNg
 DL0ofgKpHvYNRP3V3zmbQrPBONxwQr2Yxe6ccCf/aqxH9RMAZ0jX7SfNeSTxj0CU
 0KRJSNv+9KybhcRk+MY8Rho/cibUCWUmxbE2y+i36qD+hKJbKEyJePDRe2dGWGBA
 RAMMMqkqpfxMoYYU7c5JSqw4Tbz6H0/j6x77sABBR6eIoeNdVZxpfb3pq5jN9cNT
 Kxkkjk2q2/mSbG0dS6UKGYbN5yE028EfBonfAvQkqIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PkwPH9
 qBiVosftLilz8BUb4EnlIKxyr0j/Cxfej0GHo=; b=RNQW/wyoYU1kutvPlVCYpN
 bKsKPB4AhGHUWAHnaHoiYm+mCVYT0AWm8QnrEyJQyY+6tJmXEjdGD+gtg2pANPWK
 Sco7lDyhpJarM34SQpgfc5L7ST9KXh3tIdJGXh08rGOY4vb9XccxZoj9tLGGqGcQ
 yp/ZSXBYT0tBL7zojE6bUA3jYUq1TKyd7R5kdgyQtqGXS/O8GY6dBCn29jcn1+X/
 joZkZLDlAYoBNVth6S6N67pYeiDp4pQzTrg0RFCOhNA7Z046cpo/GgGgv9KCAFmy
 a3+bZtFQJhfgQdqLtNO3uCVNITeTMqdi8bp7SFRF6b3wGQiE/Iil0ZfyuJcJXsIQ
 ==
X-ME-Sender: <xms:rBGMYPlbgDFnCW6xiYuhhwa1W_w_RtCbeK2z2cdrfU-xIX_1eDlljw>
 <xme:rBGMYC37ymWWDuHLgmft_rUZCN1EZu4A0YSnbmDzhFY_ZfNM6kMUpb1HaiNkCb2J0
 YRskbLxa2drrg_LGAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:rBGMYFq48z_aZnEpx8qkl41ajADuxKmEfE49BJqUffQnSlSvP6DcnA>
 <xmx:rBGMYHnGQXbYr01MOU69XK7ptwKU2-xBqy62EWOMdL8SlDLif3N32Q>
 <xmx:rBGMYN37IZQLWIbfz3b_UpyTj3rykX5c20wBKS1WKAi8cdqG0VpZmg>
 <xmx:rRGMYKiGcOGY5UfVKI2rcMuTl5WNzqxzSRPROxfyJMLGivqI49kq4g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 10:18:19 -0400 (EDT)
Date: Fri, 30 Apr 2021 09:18:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jason Ling <jasonling@google.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Message-ID: <YIwRqzb/50Yk9hZa@heinlein>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Our5IQh5mXLNmSIG"
Content-Disposition: inline
In-Reply-To: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Our5IQh5mXLNmSIG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 03:22:35PM -0700, Jason Ling wrote:
> Hi all,
>=20
> What started as an attempt to create a simple command line tool to perform
> pmbus device upgrades over i2c has turned into the start of a user-space
> i2c library (with some pmbus support).
>=20
> I've already reused this library in some other obmc applications and it's
> been fairly well unit-tested. It also comes with all the public interfaces
> mocked (so you can unit test your own code).

I assume you mean "internal to Google applications"?

> The idea is that more and more classes get added that will support
> different pmbus devices.
> General idea is that each device that gets support can expose methods to
> allow device upgrade, black box retrieval, etc..

I have two questions that come to mind:

    1. Why was the library provided by i2c-tools not good enough?
       (ie. What are you bringing to the table that should make people
       want to use your library rather than a widely used existing
       library?)

    2. How does the availability (and potential recommendation of usage
       by our community) affect the effort to ensure that all i2c and
       pmbus drivers are upstreamed?

       To further clarify this question, we've generally said we want to
       see code using and contributing to upstream Linux subsystems when
       those subsystems already exist.  We don't want a reimplementation
       of the i2c and pmbus subsystem in userspace when those are
       already well-supported upstream by the kernel.

       What is it that makes you want to write your code using low-level
       i2c and PMBus APIs directly in userspace instead of writing or
       updating drivers and using the various high-level user APIs
       provided by kernel subsystems?

       I see you mentioned "pmbus device upgrades" and I know the PMBus
       subsystem doesn't currently support firmware upgrade paths.  But,
       there has been LKML threads about it and what I recollect was
       that it wasn't "not allowed" but just "not implemented".
       Shouldn't we be focusing our efforts on enhancing features for
       the whole OSS community rather than building our own different
       library?

--=20
Patrick Williams

--Our5IQh5mXLNmSIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMEaoACgkQqwNHzC0A
wRmoyw//cEGt3+uObUqBAO1gDrbouDyVac0IfMnc1cgXYhb0PAFo7FpQl4ytLGB0
vD9Ru2Pg3PEIwLab/e6Vd1dW5es35ohc4ReDllaUIrUub23ekT0t0nPeCZAtq6eC
5CCIVI492LhgvM2h8PfgvDk1UP1QpytN2W7Wkztzb0jxePQnmpbzeXgj9+3fBWew
pGFZWxq13LUZYFQ/kOvj/BZQXbzg8hmVAwgROZOTJVcI33oFUrEVyJ8VmvBO0xaK
JUIHAE9vlA6SH9ZmjKVX7w5WUKpwojEkLsfgauOfsBbn9dC9nAHi3ngJPdc1Gmqm
+6OXDKJeMtJerTNg+O1UUrC2oFmlY6us6lWdet0XJCY/BojcstfFU9Vigsr+lmdK
lJNQKgIBw4H3VoOGokB7JHrC7lb+ZxkGdmuLkC38x/xSSNZ9J2F1+QnW6/9qpwX9
a96gGF/kvMHsZgBsHiI0va/CTqV/1ydMMVbzFpMyKn19PAn872n627azZZOfhfRx
683vBsbjJmdrxt4t7G5A9eUU1dbohqezjLoqec6pB73RnNcHPzbSO4QdJTso9u6R
lBJg7agDPaWTowwI/ZnIIDsJ7XrngeEoBlnrjh8qGWbAKUYz5SWkRP32P9ey4wM+
58vhxQihK6weqkPJhMuROONseoZG9ayVW85P2u1PES5saqJyTT8=
=lkqI
-----END PGP SIGNATURE-----

--Our5IQh5mXLNmSIG--
