Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F28C7F7D
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 03:20:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=y6CLA+bH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UYzAvpsa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgTfk74BNz3ftN
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 11:20:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=y6CLA+bH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UYzAvpsa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.144; helo=wfout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgTf666b0z3fm6
	for <openbmc@lists.ozlabs.org>; Fri, 17 May 2024 11:19:57 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 5A8071C0016E;
	Thu, 16 May 2024 21:19:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 16 May 2024 21:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715908792; x=1715995192; bh=IUxkOFFx7u
	wM1gGc4j+EKte2//OcG4D0gUy6GYd1ofc=; b=y6CLA+bHjjq7ygwdGeeGu3gDpV
	ZtDzHgm95/SgYwukZCvrjlWO1xwraRtkqCs+zH784Ns13efN8DnXHF/sMDj6LMPR
	vi0Wj9yV1MMBZ6zYJXFIkdTuHnU2oQN6odAUXJWJb9ux7tE37DWZK2vNp/YQE4Cn
	zVeol8Glz++YE3uHcqFhu0TVLrS35vgXLTN/RqTmKBPgYB45/+CmnD01sbjEFnBZ
	bgBY2uHTxMRxST/Z1KxGAAgyrNqtzmw6wiHyCEP0LmZAEu/h9gQeBIdszoyhBlMD
	0nAwHhgIkALeqj3NxTz+ACqGsA5O5l7XfjbidyOwwAdbndqL0svUhuT+SDtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715908792; x=1715995192; bh=IUxkOFFx7uwM1gGc4j+EKte2//Oc
	G4D0gUy6GYd1ofc=; b=UYzAvpsaz1YW4V7ON7UEVaAs6JIRANoER9mQ512xDLoX
	D1Ti3MFXerXGcAZOevJxajpgYx7X+ucSisfQ5O6sbcL50SV6MAn94DTR4Q1wsh/g
	1NENQNHaznSYSuLk9r+y4kiTlkTxNJmj65MfEAaZjCanmVEopA9L6AOMo7O4YxPy
	FcCyjDf9oTXB+mURYkgyiDUSSl3JvbWVeXpWcN9tJ8Pz+cpMg2CPsvkUErluP3u9
	353xefU161uiDlBxf4oUO+PBYUUAKzWVzsCwO4eoruqzRl1Hs5Ef8gibQm9gq3yo
	v9sMRqtKyDLVPkM2Tf8+R/h4JMlIE29AGRq5Vo7kow==
X-ME-Sender: <xms:uLBGZmI3-WgiUDMCY47quz4vW6kA52LsC84cZZULWIyQwGiF-_pB8A>
    <xme:uLBGZuK8LOwYRN_il_fMKfl46EAfiGmhSnonc8mNo_4dBH2xV0IpdYwy7gauyujxb
    8fs4aw6j23hHFIcvqM>
X-ME-Received: <xmr:uLBGZmvQd9QtXt8-y0w83mLnlizJKMKMlxSD33zezpW48njp2_aRpsOPhqTi-GG34sDC1d4Pi44hcBtdE4MAm9ewPsE6GWnZHU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehvddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uLBGZrZLy00ZJyY5wMEEv7VhkowItGPseGlP9H64Sb-eSJVt4341Vg>
    <xmx:uLBGZtaEoKFg1naBkYw3PfvxzGuD7RU1UpRrrTTRZI0J2yl7Q1gnTw>
    <xmx:uLBGZnBv35Ly0Y9BUkSc0-EeVUKg5sd9v8zjcCDnhcbkOrPGCm6rag>
    <xmx:uLBGZjakHpUHcq3IpqBfNO97cwEDnpjGvw0J4Dvq3mpR2Ey6B0Lp4A>
    <xmx:uLBGZsVDsNvGF_eUq1YCjSedJL1Pqu2Cp0adgbGpr9Ez9v-vNqWzsasy>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 21:19:51 -0400 (EDT)
Date: Thu, 16 May 2024 20:19:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts: Aspeed:
 Add Facebook common dts
Message-ID: <ZkawtsDBMGT-rTJx@heinlein.vulture-banana.ts.net>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
 <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
 <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
 <242c8e796123208e3a3d133a292b8409a03c0e89.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rPnNJNRNtwNcMYB1"
Content-Disposition: inline
In-Reply-To: <242c8e796123208e3a3d133a292b8409a03c0e89.camel@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--rPnNJNRNtwNcMYB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 09:06:54AM +0930, Andrew Jeffery wrote:
> On Wed, 2024-05-15 at 21:37 -0500, Patrick Williams wrote:

> > > Right. It removes the nebulous "common" concept that might be upset by
> > > future changes.
> >=20
> > I agree that just "common" is probably not appropriate because this
> > device tree only covers ast2600-based platforms.
> >=20
> > We are trying to design our BMC hardware such that at a u-boot level,
> > the same device tree can be used for most of our platforms.
> >=20
>=20
> Seems sensible, but does this common design point have a name?
> Otherwise it feels like a "coincidently similar" relationship, which
> seems a bit ill-defined. Better to enumerate the specific platforms in
> that case.

I can make up a name if necessary I guess.

> >   This is
> > partially so we can avoid having to add new changes for u-boot for every
> > new platform.
>=20
> Not having to write new drivers or define drastically different
> devicetrees feels like a useful goal. I don't feel tacking on a new
> compatible here is particularly onerous (not that it even matters in
> practice if you select only this specific devicetree in the u-boot
> build).
>=20
> Just wondering if we can avoid nebulous concepts, and rather keep
> things concrete.

I realize the motivation was lost in what I wrote.

We are trying to balance a few constraints, mostly induced by the
project itself.

    1. The project has a refusal for any u-boot patches in
       openbmc/openbmc, but we want to have first class support for our
       machines.

    2. The project maintenance of u-boot is in poor shape and no where
       near the level of response or up-to-dateness of the kernel.

The motivation for not wanting to send a new device tree is mainly
workaround the poor pick-up rate for any u-boot patch request.

Prior to patches dated in March the last time any device tree change was
accepted into the openbmc u-boot tree was dated May 2023.  There was
even a devicetree sent to the mailing list by Joel himself that isn't in
the tree right now.  Our experience has been bad enough that we've taken to
just reusing the `ast2600-bletchley` or `ast2600-evb` on multiple platforms,
depending on what we can get working.  It seems to me [slightly] better to
reuse a tree with a generic / common name than to confusingly use
`bletchley` on multiple platforms, hence the proposal here.

In meta-facebook:

```
$ rg UBOOT_DEVICETREE | sed "s/.*://" | sort | uniq -c            =20
      2 UBOOT_DEVICETREE =3D "ast2500-evb"
      3 UBOOT_DEVICETREE =3D "ast2600-bletchley"
      2 UBOOT_DEVICETREE =3D "ast2600-evb"
```

I don't currently have a lot of faith that if we sent a trivial "add the
new compatible" that it would be accepted in a timely manner.

> >=20
> > Should we do something like "facebook,ast2600-standard"?
> >=20
>=20
> I guess I'm trying to guard-rail the discussion from the position of
> the compatible strings should be documented in the DT schemas. Is this
> something that would pass review upstream?

I don't know?  We're so far removed from upstream at this point that I
see that as aspirational.  (Everyone using AST2600 is using u-boot
2019.04, which was 5 years ago.)

Having said all this, I would love to do things as "right" as possible
while still being able to make progress.  What is the right step?

--=20
Patrick Williams

--rPnNJNRNtwNcMYB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZGsLQACgkQqwNHzC0A
wRnCsg/8Coj6+iOw3HJkWx5c8eIxYU4YrJpBP/NuIRAbUtXvbH+u07PyIMCNMiKV
njEadd1ZSA77YDLPO5THaUDV0/yTmLTccnQBGk3+GjzCn7uRMhRjBkMs0h6wrjIJ
21jS1lVKS7E3xuMUD4Cru7LhwGVBDNE1MQGh1noMXaIAfWVsSFTexwyrWoGikAUi
QKVtLFU9bNZxKgjk4gfyfdBMV/B6kDhs4tnAqHGmE/+84sObIbFmf2TEa66qzxed
zjkFcd8LLbdvyvbYaTElo3yThwYZfe6dx/YPDOv+MdB/5C8jearN99I9okZbx2j6
oknqhxINnFn/Gm0ssfuvrYTfI7MZW/H7JLmJwOoYRUnqykzD81dhCY7LY0ijDw4+
C0RT/vkGf+9+xwoVPjs+5JPED4AoNPkiU6zBrxKQJgkhvhqZCFiDTqW6O0WbI/V6
KHqZhFR6kZGnmu2FAXdlK43AktdLss0ElHkMwlKHLLtlN7t7vIJ54q8GS4uRn20a
5wh/cH9fWdA9GXU0fHwSnqvQ87FVUXrScJiPR9Rv6EZWRDW7FPInB7oO919swxJq
YjAONmsvQJiw0oAZuiEKBoFabupH4WnXkme47uIF3UryBq05T282lzfawNPT7i0q
mDnOtI2218NiMXecwhJtD7IiOZZfV32F7Fw3V0U/h0RMlqYBgw4=
=9y5F
-----END PGP SIGNATURE-----

--rPnNJNRNtwNcMYB1--
