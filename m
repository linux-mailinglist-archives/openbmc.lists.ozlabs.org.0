Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 474BD5E8520
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 23:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ5QF6xR1z3cfS
	for <lists+openbmc@lfdr.de>; Sat, 24 Sep 2022 07:49:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=KsGZodvN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cHQgblMq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=KsGZodvN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cHQgblMq;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZ5Pl4Sdvz3cBq
	for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2022 07:48:42 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C9F505C00DC;
	Fri, 23 Sep 2022 17:48:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 23 Sep 2022 17:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663969717; x=1664056117; bh=ktDaIjnbpJ
	nUMl3c87NLSf5og+YorVyhMEhw9NyusFA=; b=KsGZodvNUi9ZcDhdhuqYsI9zNu
	xxjVTUPvgTt17BcyXZbn6vvMjbsEAaNLd4sxy55dSlJXVcpfvFXmHvyIPa7n5lBD
	xjWMz0Hy99u+RNJSY1eKgLfx4ElV3i16SaUKhdB8F/yr6229XWZmc/UuSoywjpas
	8+bao4W4EXLqr03Efzu+7sHlvfrLgk9/GldDaSCtme20/80MP3LCkwAC4Qe4L5Dr
	z3m5i1e/BQiS/hhBS8eyvkgc+r+JNBf8drpZNYxLRD5Ysu3kwynHy+77WQ8isJD2
	m4LaRekaYRry/c+Qd+rQZ/lN8oHloLuhnUdFXT8U0AXrI8JAOq76yhafk+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663969717; x=1664056117; bh=ktDaIjnbpJnUMl3c87NLSf5og+Yo
	rVyhMEhw9NyusFA=; b=cHQgblMqMnHHWV91YbPJzpV//VBTRFVSnS60W24YUG6R
	8tVGMWpO1tjC3r+G07NSRr1K4cdhMN/ugBHOaXm7kx+mkjToVdVfmofp+/Py7UbH
	yuPj/dRaYrZKA+mOo7LY6hZ3w6yxSubsqVhCYUR8R7VAvznPDGrW2bRZiLi+mv6I
	/FZnDQScXEZbBgZt8pWtfEmg635bhwNW7HFhUyhZXTZ3YSlpV1TuqP5/1GasUGVg
	VUXXx6wp00Iapq15nsQnvBaZ+q4WJZn5GvBGJXfVSWyYXeYeAOus8cw36vEp8h9t
	GyWuGeFpdxgH4YLIWe+1nyX4tZZvamTS5PuEP+Gbzg==
X-ME-Sender: <xms:tSkuY6hi8Bq72xAO0_pzzUxXu4kiEnOqrxoFwVPH7wMAjGhaqhKr9Q>
    <xme:tSkuY7AN01vMBUtaGqgv60EOQDQx_OdPX1lz3aR2hgmRURlNAQC6aKQm7ajz4tENq
    gNopo0H7B-m_8KZ15s>
X-ME-Received: <xmr:tSkuYyFMyewVemM9jsQFrSJ37wPe9eV6cQz3faA9jg_j8woQCYixdhOJSg0f44oJJF-Zay-ugkyHtr0MFKtizsyj86RAuJlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefjedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:tSkuYzR8ar35bgZ_jlD5e_mf2XgQSGBJZkGwbWlR1-SoBF_N153Yuw>
    <xmx:tSkuY3xeISaYzMVnvDt983StYiyZE7u0cFkRJU62E0zpWiZSqxuhrg>
    <xmx:tSkuYx4_T1qcsM_Dx5Vs9TOS7DGsV3oC7kN34WJytSIq2KS3aFzSMA>
    <xmx:tSkuYwpauei8KRZIAgh311tBUHu470c3E9Ea_X7TCJzo48XHwgsm0Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Sep 2022 17:48:36 -0400 (EDT)
Date: Fri, 23 Sep 2022 16:48:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [EXTERNAL] Re: new port seeing ipmid exiting with seg fault
Message-ID: <Yy4ps2Zhvaj8km2w@heinlein>
References: <66a2cce533124f56b60f68f9f0b807af@ti.com>
 <317d91c1-870a-4370-8ce4-12fc1a531486@www.fastmail.com>
 <8ce9679e73c147f1a220083c6ac7c9cf@ti.com>
 <675085d8-46d0-4eac-b6e5-40c9ad868dc4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F/iDbywegl+syzf8"
Content-Disposition: inline
In-Reply-To: <675085d8-46d0-4eac-b6e5-40c9ad868dc4@app.fastmail.com>
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
Cc: "Patton, Schuyler" <spatton@ti.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--F/iDbywegl+syzf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Schuyler,

On Fri, Sep 23, 2022 at 09:36:30AM +0930, Andrew Jeffery wrote:
> On Thu, 22 Sep 2022, at 15:14, Patton, Schuyler wrote:
> > Apologies as I am new to OpenBMC but I was looking for guidance on=20
> > which ipmid commit I should use beyond the bfd3a17 commit that seg=20
> > faults.
> >
>=20
> You'll need to reproduce the issue against the upstream code before we=20
> can help much further here.=20

To reiterate, this is really the answer for all repositories.  We don't
have people that support release branches of code.  Most people work off
HEAD in this project.

If you find a bug either the latest commit of a repository or the version
pointed to by the recipe in the latest commit of openbmc/openbmc, someone
is much more likely to look into it.  If you are trying to report bugs on
something older it is quite likely going to get very little response.

--=20
Patrick Williams

--F/iDbywegl+syzf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMuKbEACgkQqwNHzC0A
wRm6Zw/9EFPERuBb/5yBGqFuy0nh6iYL1SSO+nbDd4Z6NKGYJaGpGTuugzJLrdT8
IKcctAlimM9D5KVECboUiBtbhrwEHn0NnNXhWot7J/fuBFFhmJkQ8sYmiNTforBr
EMEBhhM9hQJeCVQAtrE5H8LntZXgxpjzViXLkrk6y8T9/Z1Y5+Ru4UpUbLDpULk1
HJC/uWB5vDPZ7lpj3Vm4NlaWIjAWQB01GCb38p81+wsTwC0A/8ikrvUlP0opsmpV
SI9Gr4g9ES/DZK64xMVJsgMgXui4xoiW/6vmVhCPajiG9lbQtiNcrccwdYq/D9AN
V+RO3J8tQqL2eiml4vyUion2v3X5lZzT3GVbctdgj4gVwm08zE+cXnKPcMkRAQGV
UDGVFubOk/oaJev8q8ibFlkRaGtJp0/sT2FG4fpIuq1+80rRAxp0pB/k5ZPCL5vZ
G6RG33+ZKsLk3yRVgbdYwVJzQrZD5aVok3yHbzpLB9KKzRrIhTE/wxyJ+XIEPzET
us/uS16wyH9royFXMFY9PRJVueCLxTN0SfTCGddJXr8OGi8medp11OKv6rHN58fm
wry43WPcptb4rpoaQc0ahCtsq6ZezY+9cJ64YY+DAQI80uTMO22qeb/vc3q4fiWP
NfM5eGqE7VSqzROgZZZdn/2UrjBTWnDaPDoimSDNGjbMdNY20Rw=
=+0go
-----END PGP SIGNATURE-----

--F/iDbywegl+syzf8--
