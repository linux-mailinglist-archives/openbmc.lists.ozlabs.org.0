Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C3258DD9
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 14:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgm3r68kTzDqZB
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 22:05:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Fn1UTufb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IsZkIrTr; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgm2y6872zDqJq
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 22:04:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B59AD5C029C;
 Tue,  1 Sep 2020 08:04:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 08:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zgwSaZI352lrWIAKmkrRBKNGzzT
 0N/ef3ASo+70zt8E=; b=Fn1UTufb742ofxwEX9PefwlKaiV1NqPgUnnr8vERRP4
 JZKU4zRTzHstAv3QfLQQXuBNKuME/oHurvM1oAx1TgtRzMzM+POAlAqyk3EvY3b4
 3Dc2SC/T62oY5DNCU7lIEhmLJWxiyq5XKV85DiIrvTnXd3JwZT6ZGMcXQ2g7ixA4
 2mK58VPsxS0SdyQ5l311jD/22Vs9wZDBvKr5fygpFxO8bRDTVVYeteNzNgDcp4Tu
 53zfLd1PZk+bGvHO2wk6TeVchWcKCw/ayXsK+EHuBq7FqQGwkadStOaLODbgtvO2
 DtxWJBBRRWSQrzihZBHBinCC/G3Wr8rRGARXvAfXyAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zgwSaZ
 I352lrWIAKmkrRBKNGzzT0N/ef3ASo+70zt8E=; b=IsZkIrTrCBsl26PBhqqX34
 LycPVu5z5ID/fR5P3Ywr9AyRgzqjucaAXyenCmyDQdA3FaLNmovwosOKtArMw85K
 DmRdwK0h9kRWwVtYiCK7s2G9+2bDJWV4I2Rd0nGsq1bbwNgjKnEDGo4/zIZdAlk5
 Vk8AvJelOuTT3HKxgcDPYHvdP81z+1qsE4Bo7OJxn739cqWLyTlaLZ6kSNpCIxWp
 DsmgAacSXddYzbNBhzMhqjItZbEhfp49VbXZCYhBfjmzJNwgSa2KVL2N18wJ8hud
 Bb+GqScBsWXdMDy+mUMsL/ApJxU+7Zn8teeK31tzVzBri6yj4Gpv+UmlclbFUuuA
 ==
X-ME-Sender: <xms:1ThOX6MYOEUWnCWP2VfjV55_x6PkY1lUsRH6Tm8oc2w272D7lhvKHA>
 <xme:1ThOX48LPzdri8KLIY9A0ColjCVBcmrRx1vE6JhHJpuQYKJ6qs-xhNJUivzXRzYdF
 MV9ROENhYBHmIRw9nY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epffegjeffueeutedutdelgfejiefhgfdtjeefueethfefhefhgfdvhfefiedvhfdtnecu
 ffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppeejiedrvd
 ehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:1ThOXxS-bss0bcKgepSlOWN2x9JixMGin8ZhtSp_7TFv71i8Pk0BlA>
 <xmx:1ThOX6tSQPTOR71Wf96os0BPiTztRX9XUKHofHCvawrQ_pYWAw-9Sw>
 <xmx:1ThOXyeZkIXjMK5b0X9R1NU8lNhcXaYy7Y0gALQ2Xx4UI0cJD6qA2Q>
 <xmx:1ThOX6kJhg41zaQ-NlDqxAV6zQuO5AbSdgsAW6-u5xJl6S2fZfwGcw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB0A03280065;
 Tue,  1 Sep 2020 08:04:36 -0400 (EDT)
Date: Tue, 1 Sep 2020 07:04:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "yugang.chen" <yugang.chen@linux.intel.com>
Subject: Re: ipmibridge CI build failure
Message-ID: <20200901120435.GP3532@heinlein>
References: <mailman.267.1598923326.20471.openbmc@lists.ozlabs.org>
 <b9b17673-9028-cc63-6a66-87ae6fbdba9b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b5sSX5qSQrSInIHt"
Content-Disposition: inline
In-Reply-To: <b9b17673-9028-cc63-6a66-87ae6fbdba9b@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--b5sSX5qSQrSInIHt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Looks like Ed put up a fix for this:

https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/36127

We'll need that merged and then we can rebase your commits onto it.

On Tue, Sep 01, 2020 at 01:38:28PM +0800, yugang.chen wrote:
> Hi Bishop,
>=20
> ipmibridge CI build is failure=A0 recently,=A0 for example,=A0 the follow=
ing=20
> error information for code review #36128,=A0 could you please check if=20
> it's needed to update CI build? thanks.
>=20

--=20
Patrick Williams

--b5sSX5qSQrSInIHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OONEACgkQqwNHzC0A
wRno3g//TqSjOrIas8LxBbhj2XqXwcsIey+tRInT9AQc+542cQzrcRiC1RqFtFWl
APZ/J3eVimawSIHkdEP6AZoIN310pLsP12866pbhOuYMLG7HbT/027vN6KTzH+in
T2tPjWgXMLN2saMdzEtGmiovxSbAID7ErAI83xinxuGHnOKpZVo7bSiaBdudkW2d
CkI3/WkanhmRk/Y2Me7AWwcxwICYqQBQEpyWa87y+cdprz8ES1LYJx7hZobcmtUC
vjeszvC7yuqYXDjv72TPJNbwR/6ETNkuHS6tpCy0wTjYQVmK8xXfHajdegwozWAl
CpM4W9lIOdMxn9r4TNeShSpgtYrLjHTR1pwmwwqfZHR9Mz/WZqcXvwx0ZH6NuEMd
UkskJyeDYrdbSwQMc/JWRjPC0ZBiyf4awRu+yU1Mdvpo/ACUjQm7EyQF8IBI1gQ3
RTXyDiHH6Zz+tQ+4UXGQEhseZtupY5UHTpUvtDnLwykaQlA5s2wX1OGOI6RKyvGL
NiNN0QuzIKdcvglbnvKYFuNr7voeSrKfrPAwKmw66Cln/4r44sQ57XsNIlWSKiEB
pdBxrK9Nx2su+1IF2yXV+FldPOWQ2BvDS2VIkZpiB63oFgjGEfoSCbdj9Wj2yomn
kBjQ9ZHL97jO2anSxuUM8jYvF0eH4NbPK1PXXuJAgAgvyVicbTE=
=6RYY
-----END PGP SIGNATURE-----

--b5sSX5qSQrSInIHt--
