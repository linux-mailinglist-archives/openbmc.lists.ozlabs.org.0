Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E005AE91B
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 15:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMQhm34MCz2yQl
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 23:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=XmCeBGHo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xCOKpRwc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=XmCeBGHo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xCOKpRwc;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMQhM4cCnz2xG8
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 23:09:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9D6B75C00FD;
	Tue,  6 Sep 2022 09:09:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Sep 2022 09:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662469761; x=1662556161; bh=sVOujPRAth
	uEYKlxf6oJ/Fdu4k3GMSqVmeURG3lTVtY=; b=XmCeBGHoys6boSdKw/R/7JvD4a
	HN/Z7p7gt3DJjMYFwZaJytNhV98Xdh3rWBHDjt/QM+ghEMWN0l5JMhNSfG/9hDbx
	OxTDd5ZxmL88eH1Ad38zlbLgshWdk5njj1uOZx7u2pr/Bts28+U9tXHxGhCltjDg
	n8MJmUjeQMnaiWxgIc6Y1VlFPM4HshmNHrVbbhXz8q6/ZiR4QFo2XK4uuO+2/H2z
	Ls7x2gChieAJZQ5kjhG0rEOXDRmFI1px89sPPAEUtulnXut1LcM/Ai2Jbi3tZGDA
	Djrb5UfrXWpRZL4EVxvDzGn4xV3+JOjiKj81WSsLBE1sy2tBqQhxx89PUCWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662469761; x=1662556161; bh=sVOujPRAthuEYKlxf6oJ/Fdu4k3G
	MSqVmeURG3lTVtY=; b=xCOKpRwchBIX4QznZxOsTweFOunp/v3SQ0FMtw4rsaRB
	+OHN+mcKGe9qiAzul+kcbF8VJuxeEuDrsy1IgGukubEWjNfxqX4dc8QRVQNC72rd
	zb2mh+saZrDHv4qdBr28SP4D6ftxHyO4wVU8ifkI1o4fw5/jCep0Q1mPymHbDWIC
	fHb5AKm8RJMLkf81AS6mY4mD1bM9QxJN8DppQ7Uc6m/4u0g7jA42XE1GY/THkiLu
	X0tOerBza19Z1XjHGAm4TOpFt2LRIeZ+Q3fXu1+//brj2FrMLs+YcJNITW7vZDWQ
	MYNJIJKUMPDWijpBve6jMvxLQMuhJTfSzW2m0cPRNw==
X-ME-Sender: <xms:gUYXYwiOis_M4NekC407dD8eYTNg2dl2tXY09v4gpN8bW1Rh6zhwSg>
    <xme:gUYXY5DF7wCtD07qgswt2bX2rbKE9rp0t0NFbvSukGC8mi7CpeYD8BurN2_Jd3RPT
    CA22K9lfwH6ybkUBw4>
X-ME-Received: <xmr:gUYXY4HWtsnjkezJqcFh4Jh0U4hxV6x5JUlCJn_mW5x2uzEVYBxUwroOdTgceh4-8gdfKdW0YaBZyIW3AdK4LvTmava2y--D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:gUYXYxSnYAn2ttv9gxAI7BzJjYxsCRPVj8ZGMEGRFlTEdzpHURcAyw>
    <xmx:gUYXY9zf9m5GslJYrFdgEOBuCVLRZ0pMmwwNXDOrWui0VzkHt2b24Q>
    <xmx:gUYXY_6U87MU8DbOPeuZGUBT-bSRUunn-xHWS9fsitiixG1TKXWSlw>
    <xmx:gUYXY-oAduqJVAgq_htQCp3ag7a4cUU4a3kLL4MnkbT-vKdyZ8ajkg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 09:09:21 -0400 (EDT)
Date: Tue, 6 Sep 2022 08:09:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Richardson <mcr+ietf@sandelman.ca>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxdGgDLWXs9Li5dA@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
 <32094.1662451519@dooku>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kmODjvhdEl88C++I"
Content-Disposition: inline
In-Reply-To: <32094.1662451519@dooku>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kmODjvhdEl88C++I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 04:05:19AM -0400, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>     > We did not discuss any
>     > difficulties in image size increase due to Python or in getting the=
 Rust
>     > language environment ported to bitbake.
>=20
> I imagine that the bitbake recipe is probably the critical path, but I al=
so
> suspect that Rust is being used somewhere with bitbake.

Yes, there is already Rust support in bitbake/Yocto.  It has been
available since probably Dunfell.

--=20
Patrick Williams

--kmODjvhdEl88C++I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMXRoAACgkQqwNHzC0A
wRl1uQ/+O3CB9i9yeuHihC7psDxYjotZ2HZUnXN1ZqjCr9aUaMXcnD7jnltSzJQc
luOXNvmxAuqVs32Nf1WtXv/z7tfF+F4RwkpKnVhb8yJjJUOLCkHzDzrmcAaixrR0
sYLEq9FRh7Oy6oX6O5sfqVlrgkpIDc7+gW4OfoBcetqqz9cxIMqAXQ/OzRKqS3Cc
vxPS3h5RmNz3oWPltrnRDEtoqorCCDiF8ZTOnzHit1wxCONmOqauQt1tW1e2e6uB
0fuZT276TH3Zeu5cygleVnR/rvxjrmPlX0FaPWm8i6/9VoDuhqS3U9Oe44tz3JkH
ltJhOxaJ1ltr6ll1MKoAt4Oorny499MVWNSL8X0651lSSWbCHVwh69Gmg6OnYUMF
2AprPe22DauFz3cPCmQwqlQqYDB+VBYpHEEWOGh+1cQLQJg6I5ElES9V9HuD3isB
XDVO6nP/2q/l40kFMzFFw4CsW8XTK/Cjo//yM/VvmenqerFSD9pBKXSyTo/AT1zu
ksH4EdP3W7r9QticEq3OC/IhepF6p5r31mjBC2fSbVQGdM1Rn6IpmSZjfWWcBNE9
EbF7u3ICjZD9/QqutrLA2PgxfMX5uxhSESnOZvFfjYL8qI3BLc9vdBmr6+Seb8AX
Xc150RUP03OOKF/eUFptXRRhsdIkbrdD6aZ1rVuW0Wb6tAoDF18=
=h5/b
-----END PGP SIGNATURE-----

--kmODjvhdEl88C++I--
