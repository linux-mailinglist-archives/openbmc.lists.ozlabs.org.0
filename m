Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D515F5365
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 13:33:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjCBX6mLgz3bry
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 22:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=NjSTMn5l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tsm/B9IF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=NjSTMn5l;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tsm/B9IF;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjC9t0jphz2xrr
	for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2022 22:33:04 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 5FFFB320005D;
	Wed,  5 Oct 2022 07:33:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 05 Oct 2022 07:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664969579; x=1665055979; bh=zQn9u74SgM
	lgLfLOn2i7c7KPlHr0Fkbnw1hE882JJ/g=; b=NjSTMn5lNuS7eleviSGnIx/0Pm
	HQJwglKspKTXKW3E20WsJLgaYwAPyjJq7/fmZUNTHTdvV0BYyyc8abcsdg+fUIaN
	wternwY6IztajiBsiqP6fi4bZGUCEwVRsPonrYtGxbFCAJNuHZLqNXX8tLsGsT0b
	PdBvrMmTfyydhXUOjBg4msTN9IGtueR9aNyXjAow1VZQfbApcrwK7uYnY/Fnl5Ky
	6TR5pIR/vTUGfpKY8qaRSWc9LEZzb840DO+I9M6axWhF4DO3RntOLc2EvqyQEjrl
	quYIrgyFogsrWdVOROeaYrlygwBwKGNRKrSXnIu+Zv1j5LRQhGmDqxlNWhRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664969579; x=1665055979; bh=zQn9u74SgMlgLfLOn2i7c7KPlHr0
	Fkbnw1hE882JJ/g=; b=tsm/B9IFRxKqSI4hgzv1pUAcm0Xym65gFSujpWU+t1tb
	si24OBJqKLCs2hTk8+6ZCz2P8elrV3tjUttKBkXj8Ssv9F5F5kkDTyiOMqm5Yos2
	gIxj8uFJtkl5/S8R0EaBe4HERveZFaRQQhtIM0SFwap4SJFA6cVFh7rY6UA0fr8J
	N/bd1iPc2qIrLlwJGSqASDcDZ8EkCZWq7wVwpBJI7pqhwNuq2QZUdM1eecmMh1e6
	ZuJsmHRnSSF3t5vIfktfxh+1i4RCIUIiyHKDggvNYKy784Mk8hsMyzfqQ6O/MK/+
	6kud0jE+QMsp33zcws1PWS+oDnbLwkk4ru5Dk5Clsg==
X-ME-Sender: <xms:a2s9Y9P1j-y6k6IRNxnANmllRmOPIOQXxJm65ratZsMknxCWFMyXbA>
    <xme:a2s9Y_9YofC7krzljtP91L6GOBsp_pSPUICK6rtfls95N4J8aLotDFAQ2ym_rknxv
    grKNQTztEAapVdDGzs>
X-ME-Received: <xmr:a2s9Y8RWHI-twtlA_WFr_fvMHIFr5_KDo5GdIbCK4Ndfre1Zgn5V8_UWpMivql0V4AlwZkC9xvlXnPorFq6I2_i6QPQXm8Wr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
    feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:a2s9Y5t1mJ6DCTRSXruJXFLHxZOX5msyzil87AdFlguKrEGR-7T0MQ>
    <xmx:a2s9Y1cZu5HvZxLCxxXS_3vIi37Q9TbPtvmLFttEYFpM9UXNYU8Fcg>
    <xmx:a2s9Y12QiHT03YQwagF6FplI4wxVD56hibD_Ksw29DrHUVhVsXQZQw>
    <xmx:a2s9Y1F5cIIFURUBSj9ot4dYANTgNn6RAatUrOGAOcylPs_9zgVkeQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 07:32:58 -0400 (EDT)
Date: Wed, 5 Oct 2022 06:32:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: William Kennington <wak@google.com>
Subject: Re: Linux kernel updates and v6.0
Message-ID: <Yz1raUAKT8CjTp7o@heinlein>
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CAPnigK=NZVWH+msS3Ajf-RBQqzK9hnoecizuFF=QbKh-mK=DNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HsdF0RaLPKdH1vxy"
Content-Disposition: inline
In-Reply-To: <CAPnigK=NZVWH+msS3Ajf-RBQqzK9hnoecizuFF=QbKh-mK=DNw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--HsdF0RaLPKdH1vxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Joel,

Any thoughts on this?

On Wed, Sep 28, 2022 at 03:30:23PM -0700, William Kennington wrote:
> The ToF was talking about linux versions being used for OpenBMC users and
> we were wondering if we could codify a policy around which versions we wi=
ll
> be developing against regularly. In the past it seems like you usually pi=
ck
> LTS releases to base on (and Facebook / Google are interested in sticking
> with LTS releases in order to reduce toil / number of potentially
> incompatible kernel upgrades for each of our machines). It would seem like
> kernel 6.0 should be an LTS release, although gregkh hasn't said anything
> specifically about it yet. Can we get something written about the expected
> alignment with upstream kernel release cadence?

For minor clairification, I believe it was Intel / Google that preferred
LTS.  Meta does not have a preference as long as the OpenBMC tree is
well-supported and we can backport changes that have been sent
upstream.

> On Tue, Sep 27, 2022 at 11:35 PM Joel Stanley <joel@jms.id.au> wrote:
>=20
> > Hello OpenBMC,
> >
> > We've been using the v5.15 kernel as a base for almost 11 months. In
> > that time there's been 16 bumps to pull in stable fixes. We have
> > merged about 300 patches in that time to support new machines, and new
> > hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed's
> > spi-nor devices.
> >
> > It's time to move to a new base to ensure progress is made on our
> > mission to upstream all of the support. By rebasing on a new kernel
> > release we can see what work has been done, and what remains. Since
> > v5.15 we have upstream support for:
> >
> >  - PECI, thanks to Jae and Iwona
> >  - MCTP, thanks to Jermey and Matt
> >  - spi-nor, thanks to C=E9dric
> >  - nct6775 i2c and lm25066, thanks to Zev
> >  - ast2600 adc, thanks to Billy
> >  - ast2600 gfx, thanks to Tommy
> >
> > and others I have missed.
> >
> > In addition to the ASPEED changes the Nuvton hackers have been hard at
> > work. We now have support for their latest generation  Cortex-A35 BMC,
> > the npcm845 "Arbel" and it's eval board. Likewise the HPE "GXP"
> > Cortex-A9 ASIC now has upstream support. Congratulations to both teams
> > for this work.
> >
> > I have prepared a v6.0 tree that contains backports of the FSI and
> > Aspeed v6.1 patches, and a small set of existing patches. I will
> > publish this on Monday, or once v6.0 final has been tagged.
> >
> > As promised the last time we rebased, the Nuvoton patches that have
> > not seen any updates since they were merged in 2019 have been dropped.
> > They are welcome to be resubmitted as long as they are also being
> > worked on upstream.
> >
> > Please address any future patches to the dev-6.0 tree.
> >
> > Cheers,
> >
> > Joel
> >

--=20
Patrick Williams

--HsdF0RaLPKdH1vxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM9a2cACgkQqwNHzC0A
wRm7LQ//cHyCAFhQtWL4Q4IuY6q6e+cSCqHRdFwMiwAizyrsFlpaBa/hEGk8aqIy
poTVRRRqKMcetiAkIXVQnfb9bRQ3/O4YEbpOQhEhfey+6QF9av4NXD+uDVAuCyUc
nV7B9hJHHozKDnwG/uxaFXdxfIy6boN6GM0mO14m9SzUNVuC3Ez/oO5SggYbqFFw
eL3GNVu8kZGX/2oQhfAr3F4KCn0Tgab0q3YZ8n0PjCwzpiefhUxBu1K5464IZRtW
2YegDtesV33EWUlAfl4+bftMmcOzZuS+lcFoUeO78VtWzppeSjQ9nD2euLF7hmkA
lNiR8lzfMPMV9DvF/T/bziu4dIhrNcfk/sySXzadikhvfIJBmPVaAVs9kcIQB2Tr
QI0w4+8OmD3QIcC3hFNfp3dAW/UDIIv87+hweyx1CsEGV17/cRLr6mpbubJz8feu
FMZQ7YuVnDfqFfPj8WjjT13z9pqBx+ugdYO/SsgHmUm6EHskqKDewMQqAF/Aj+Lu
XGX82DqFS224Jhe9Z1S8bGAyTMzs2QXCeXrZcf7jIONGjbP+QaCt71wHZeY9IKcA
HUfsYXcj/EFWd0epbAS/4ZTJZegCS3nqBGRZK3xn9N43QDeq7N2wgM5R1mzIivjC
B6PNwgfVZnxQZlRn9wGh+A6fEHn/zdYK2a7z9DIgnTAiNtoOFz8=
=h6AO
-----END PGP SIGNATURE-----

--HsdF0RaLPKdH1vxy--
