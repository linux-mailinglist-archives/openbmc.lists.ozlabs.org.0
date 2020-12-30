Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BA2E7801
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 12:23:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5TRj47rBzDqJH
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 22:23:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=cdikZx6n; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KgDzxPlS; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5TQL09BgzDqH5
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 22:22:00 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 698015C0105;
 Wed, 30 Dec 2020 06:21:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 30 Dec 2020 06:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3YD70A1Azh8qghWVLmjzHIZx0tt
 M4CyDsF3SwtTUi9o=; b=cdikZx6nyjz8ltYiGRHMQATndTk8h1rupYezeT7dwls
 o0Vr8rQ9mMJcxbKGnlO73iPzGF0Zx7KdwznGikrJA9WzpTTb/EFSCtKJGi7W9J0v
 Z6mR8VwW7v19Gaaby68GxlBT96558x1syPhlLXfd/wkyNJCI23ozUFjwEg1uW229
 LgfMjO0BsyyZw86vEDPrvX+ud9QrIJGX6BwlWzK1l1lXFBSy6b4Swnzkd7AGJi8c
 qAgCC5r7eoIxsJc23IZI2Gsk8amIo3M3jutIVlNpQ54aMo4sGnKnIyqtjca0VqPc
 FZlQsvT2iqKUhERsLMtuSEHI1QcYvpkLQQ68hpboQSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3YD70A
 1Azh8qghWVLmjzHIZx0ttM4CyDsF3SwtTUi9o=; b=KgDzxPlSHGCdC3m0hgetnT
 5W0qMssc1bR5h32ylDdgTZuWWb0C+9O6v0IbkOn79kYRl7P5P9c2RTSEPH5rT1Hr
 GxniRSNbuVUo5WZKhTp/yBrjfBnppQnd/dcOTTY3JDweAmSngBbRjnisVhwdrsXV
 HwcNwTfa9U/s+RVR8kX9dahSTISf32KPhngfVuTTm6P3Hqwi7468zXtAm/CxK6P5
 g8Q2LuzFPDyIXRVd4UQ9T6sWWdO7BTF+S1f32FfQ7kdJHs7l2U8Im7HRIm+CxpZ7
 h7+rQEbCbTl5BE5n44ex9hit4XwZzbRzDYr6QX/cJEX5OFim0rxkQFBVKAvd15hw
 ==
X-ME-Sender: <xms:02LsXyRrDx2Eqa98fILO5QEXxgcrMVSFCKJRTEeEdQwzAYqrhlSkzQ>
 <xme:02LsX3t3eJ8A-fm3Ly4d81dAoIAa2w0X4DcuJz0qOiW36CCwgRDAWjyGTjWsJZgxY
 w5vavekVaCtlTCMgaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvfedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkedvheduveekhfeuvdettefhfeelhfdvheeigfdugedvgffgteffveektedugedunecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:02LsX8tWLJIxhbNxXJ2VtNp6IThqNApIGd2In0XuRcb2b0WMTO3qRw>
 <xmx:02LsX1xDquF4DD_vrprmN-SkwM5BDmPBmPZ54XR4HkVZUoV67sFl1Q>
 <xmx:02LsX6hf0v2UNBRQiqXcm13YJyKjcj1viZGK6eR6IFFS-niVd-NrUQ>
 <xmx:1GLsX67pKOzL1GiDM3HztC4biib4Btq2ozSwg7gKtzfYsj-FPg7TDg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B6031240057;
 Wed, 30 Dec 2020 06:21:55 -0500 (EST)
Date: Wed, 30 Dec 2020 05:21:54 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?5YiYIOmUoeS8nw==?= <liuxiwei1013@outlook.com>
Subject: Re: Does the `Notify` method of phosphor-inventory-manager support
 the `com.ibm...` interface?
Message-ID: <X+xi0rCICoXHUnPq@heinlein>
References: <SYBPR01MB52261EC1E2173DCA08BEE56CC5D70@SYBPR01MB5226.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8dctGOoFTEdevIlF"
Content-Disposition: inline
In-Reply-To: <SYBPR01MB52261EC1E2173DCA08BEE56CC5D70@SYBPR01MB5226.ausprd01.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8dctGOoFTEdevIlF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 09:12:33AM +0000, =E5=88=98 =E9=94=A1=E4=BC=9F wrot=
e:
> I pushed an issue related to the Notify method of the `phosphor-inventory=
-manager` repo.
>=20
> https://github.com/openbmc/openpower-vpd-parser/issues/3
>=20
> I am not sure whether the Notify method supports the `com.ibm` interface.
>=20
> Could everyone help me, looking forward to everyone reply.
> Thanks.

I have replied on github.  Likely you need to add 'com/ibm' to
OBMC_ORG_YAML_SUBDIR in your machine layer if you want the IBM
interfaces.

--=20
Patrick Williams

--8dctGOoFTEdevIlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/sYtIACgkQqwNHzC0A
wRmMVg/+KKQpXx61+QUon43ItCAGpLiJRqJS+AE74ml9HjIgnbG8ZTYuqyGr/GBI
DWZd+2BZ4TdRsmMFLCvsub+DYqjsCq3rcgWNnlpuMlOPpaPynILlq2C51Mw+GI5b
ii+BKfWgNZwCRsXNCnY+wNtK/AdfYcayTyZ8pMcmVk/O6X/3U46rwy8wLA2MtqEc
LNNohqPTaIlIbknCm0/Urc1Diq+AWYcFYSBjuUn+vI6YCbwPCFF+X8bcAvF0NHHD
lVxCCMsJBwXqLGXuhIbRyz5dZVaBeD4NdY0s5juVcriKLxtxb0KNI8CA5gMR/eQo
pTXNlOuanLrS+RqzjTNcZ0iC6Jqao7yqJOQu+TU4JTkGhppKrb/FJihzyahJFAAx
k4qUk0OlOVyW9Cbp/7+VXs6lrmUsJAYPnoY5rytLh3oRZ3tLJI1KZXEyxBTxQoYB
e4TvjTT2MjLDB7knU7+KI/aFdrQuUY31wl18LsUT+fBt2DfZvO1VqkLNL3pP5s8k
NtZVIei7+ZndL6HMlxiegWnJts1gXqA84ord0UZS9AECJ4uCADjeuwdb8edyT+3O
cNqsDuixa+d1aZBZWHGEkwe6I91OCmnVVSYKGqzOLaR5spjr0fs3HJ3zzYv3/dCi
GFZpQpmYDsHSXQASJokRFmnY3DsUBO2d636zN2j74p1zgdIA5JE=
=NX99
-----END PGP SIGNATURE-----

--8dctGOoFTEdevIlF--
