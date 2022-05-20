Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DA52F4CC
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 23:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4fXv6hlwz3blt
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:11:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=N1AEnPAf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Fj7BlJTf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=N1AEnPAf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Fj7BlJTf; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4fXM6Zq8z3bkx
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 07:10:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 12D4D5C0061;
 Fri, 20 May 2022 17:10:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 20 May 2022 17:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653081054; x=1653167454; bh=wLA8dr1Duw
 5SjJux2p4w+ZPfUvRoDpc4D4r3F4IKkJo=; b=N1AEnPAfKCnkSk17pqgL5Z1mwB
 ZAoqiMr+VP84cMoJ7Cs0U6XzAuh232QpLcHq9f73aYv3dZU8A8oPjh25EzYl+QEP
 nj4jctc/eWEvsidkw53oPBEt/z+ZFqahCB8x7Gte5NVolMyGh3kFpzgmOc/cDJAW
 kBm5a8yM1HV4bt+WOT275lX+ILboydFQzTXxk1Tmtg4W27SbGCpcyHm3gbW7sv17
 3eXsyCl7WIijtSKW79EnOLI1BMNUCoQCzPrhSLm9gui6MME0QXQc66N/H920adU7
 bG5rWM/KY8v4vjILzb4+PpVkNf2gAydM+aHfaeitG9gl70Lo9hIRW2GowwEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653081054; x=1653167454; bh=wLA8dr1Duw5SjJux2p4w+ZPfUvRo
 Dpc4D4r3F4IKkJo=; b=Fj7BlJTf7eGVYJPsfB43ClO+4slvyEFT6mX+d8BDn/HU
 SADuy4aEGKgMQWFP/LZwboZ+gIAuxWM3W/0CEw/yEtpSAYaPHOCvI6qcjCsq3St5
 jeUjzMIf29ZOkZnwqwwjPZk5i+Fd7itQ9shusrUA4v7dXMxrY5RmTUDvrEyULZY7
 tkH1okjba/NM4G2NN+mBhrSbEIy2oNm34enWXxSmPhf5faa0Qho/ul7ITvz01cHE
 /Fb9hTLBbEWaNoenEJ5BGbVbgBXQ3gN23nhput78+bJFDzj553mWSrhnlC2DC7rV
 0ysoepWMoj5CJ7t6Q2hJJok0jx5ZDbFHDX8y5luBCA==
X-ME-Sender: <xms:3QOIYh1kOsB_pOvOP9UtGIz088K7Jq98Q7SJLQ3v6WuAX371mLqayA>
 <xme:3QOIYoHKgAckWaktkP8X9PN5PjoYBJN3PCGfNQsISkdPGRyNBERaEys5b6QTdxNR7
 OqEf_6JdZ3U_aIckMU>
X-ME-Received: <xmr:3QOIYh53EmyMooK40wwEoJlZR7PlyaKekWIiIkvgzlcNH58sLKGUGIFHdiW9-BwTyruZog1Ejo6vcs-zXu9Rt484H5MfyzE67z8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpeejgfdtleelvdeftdeggefffeeufeevgeejkeelgeeujeevveeufeeigfeivdejjeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:3QOIYu0XbbO6f34KTwKrXcLqmG-YGMF-HuBEB-1BnvIZf65gzz0Eiw>
 <xmx:3QOIYkHisTnumVZ0AdfCNsY-DRc27yfQeg8RUn87ayEKAwt7SyhMBA>
 <xmx:3QOIYv9X1tQUzzWinnHbTJQDyfFcRDTfIfILSOxpSxJnpW_qODZ2iw>
 <xmx:3gOIYpSWpLoL3VH_PJ6pClOswCVc18s3QJt3CaxV0vldSu17kgRoXg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 17:10:53 -0400 (EDT)
Date: Fri, 20 May 2022 16:10:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Aspeed SPI driver upstreaming
Message-ID: <YogD2/rKlWGUrBjH@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
 <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
 <20220516181824.ntp33kv75subztsa@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5j4NXv6SYd8RvaAv"
Content-Disposition: inline
In-Reply-To: <20220516181824.ntp33kv75subztsa@cheese>
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5j4NXv6SYd8RvaAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 02:18:24PM -0400, Brad Bishop wrote:
> Hi Patrick
>=20
> On Thu, Jan 09, 2020 at 10:43:17AM -0600, Patrick Williams wrote:
> >It looks like this patch set is still the MTD-only implementation, which
> >is useful for SPI-NOR chips but not useful for non-flash devices such as
> >TPMs.  Is there any work or thought into how we could do a generic SPI
> >controller and then layer the MTD above it?
>=20
> I wonder if it is "just" a matter of implementing one of the low level=20
> controller methods described here:
> https://www.kernel.org/doc/html/latest/spi/spi-summary.html?highlight=3Ds=
pi#spi-master-methods
> along side the spi-mem callbacks...

I don't know the details here.  There was some dispute between the MTD
maintainers and work that others were doing in this area that has made
it difficult for us to get additional patches in until someone refactors
the Aspeed driver how upstream wants.  (last I was aware)

> >We have some system designs where we have both a NOR device and a TPM on
> >the same SPI bus.  What we're currently doing is using the
> >(non-upstream) aspeed-spi driver which lets us use both the TPM and
> >MTD/SPI-NOR driver, but since it doesn't have the calibration routines
> >the SPI-NOR runs at a slower speed than optimal.
>=20
> Are you still using the aspeed-spi driver?  Have you had any issues with=
=20
> using it?

I am not using the aspeed-spi driver in these conditions.  After
initially setting this up we did some testing with the TPM driver and
realized that it wasn't working.  It turns out that the Aspeed hardware
is incapable of bi-directional transactions (bytes going out MOSI and in
MISO at the same time), which is required by the TCG TPM protocol.
We've ended up having to use the GPIO-SPI bitbang driver for talking
with SPI-based TPMs.

--=20
Patrick Williams

--5j4NXv6SYd8RvaAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKIA9kACgkQqwNHzC0A
wRmLERAAhne/7A909L1QwSbbj4BgnusTOdvJuUCo8lKI6IhkyWjNmDO3NoaeiNKl
ZZZZR9Yn8oNuFZGJdC7E4WgXwReauTwSKITT1rV/c2wlvr2kW8fyx8U+xL9Bgy7G
GZZFH10x7UL5tqWIIsfsktD1AOy4o5JvmE9lxs6CDTHdT78H5Tr7KpbCIrUwllq4
JRpHIi1i7Tj5jq4/qQYrCaLzk5pZAVMxPnrA5XHA4q5mTwI8hSdbEcRcmY0zNMci
T1RIwwGnURvqnUc0D5qXR312F1f+P9JtLNonShLh0zaD2+M45ANA6doLFgiygiji
W2hK2/kVeP134thJPI9dLzY4zJbxaCZBrOnaDKKnAIVPugAZwQgaFSBYknPR5Whb
VwrK6r0kWG6av6b83UVv3FOKq7Cxo1FWZQlJGngDIZ630KOyhFZC5gqbiA+Nze8a
k70MoKPLYS3CXG8oRCWkGW67Zc7bJJsW+p45I0pQ8TttBvJPwVqPIzXyjblqgikl
ScjVEsimEuhj+pxPUl9eXoDIMc05wfdwKyzYcLYDGZ8PoTJrTSvMyDRaeX1MlvbT
htXfxzef0NLCcFrAuA5J7ioeCZJNPbTYKI1UWKdlrldMwllc89qfPreRnHFibb8n
WMxm/4d45u3YshwxifI0wklz119OLeQ2IfcDg0xxGEutXqRWi4o=
=rHx8
-----END PGP SIGNATURE-----

--5j4NXv6SYd8RvaAv--
