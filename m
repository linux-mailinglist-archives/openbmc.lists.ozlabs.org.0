Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584AE702FF4
	for <lists+openbmc@lfdr.de>; Mon, 15 May 2023 16:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKhhQ0Mfrz3f7C
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 00:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=IKGbUkUM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XF5FfkIU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=IKGbUkUM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XF5FfkIU;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKhgk6pB3z3cDk
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 00:33:37 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 24DC65C006E
	for <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 10:33:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 15 May 2023 10:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1684161213; x=1684247613; bh=6e
	OALhaEVRDCpySgUZ4vrPq91rwMALVtAfGdDY+GwXk=; b=IKGbUkUMX88FOktauW
	hPgeBlygwZ2dC+QaCbe+Vsoa98OOVeJvp328D1QHwyiWYAisc/dczr03rPZgPK6m
	ZqTXbXlYKUrCzVquAloCy05Q3l9U5pCWNudAH50KOD03avtqEl6LuWtbyVu51HdL
	ESSj7s+tj9Db9DyXh3GQKRuedkdQ2GPSRZ3PytwwbECuE+F7aM7ga9O8ThpT9ejr
	C3tyYyBbvZLKsRkz9fzssQYpXG6rfc2ET1J48/NIDjpvJLxm9O1Jy/zNJWhnVg0q
	KbLcPw4w1ZocQVHtMSh4ouPFXPBwwzOWFv0K2THlV/BgtGq7zGI+85jJYOXb+D5b
	1X0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684161213; x=1684247613; bh=6eOALhaEVRDCp
	ySgUZ4vrPq91rwMALVtAfGdDY+GwXk=; b=XF5FfkIUfrb5onLy4Y49wIR+AdyO8
	p6JLO46K3chv8aDn1NGMcjmbwNzUCkrGIKCfSP4NOk5OkJpjFCtplk8AalO0OMCT
	xONE5BvO7BHIYTq+egJIZZ+K8qN3T5M/3bs0FHoVtzDHpTwdLaBKOXDvLDzIoq3Q
	OTf3ZfeI5uTjEjBCia0D3+cS3pnFIYXcebnSlISQ8omJzOY8/uacURdF5dZWPg5S
	nySGwrJ1UXZng6TODb5CbSAPTwrUlpt0So0GY5Zu30RNwVlaJ5bs0Uo/FWjE+Qie
	APszCoYv3unGpfbGAVh+Bg90+m+fErXBiacLbpZJxMUIStpM3HuOa1kNw==
X-ME-Sender: <xms:vEJiZCqjEMbE2aqzW05FXpogAUXKJerK_OdAJBo7rg_e3MLl4yh0ZQ>
    <xme:vEJiZApRW2bzyFJZErGoPvjLyhbJzHKw2rICA6YpJOu01vPU2fSzlTPqik_nELJxf
    7BGFW9Gz0KWBBbTMf8>
X-ME-Received: <xmr:vEJiZHPVSPgWdo6BGth2r0HyWoHRoObyOxhLzpMFxASohzQ4ELQJgSYbQCsYUxWLfsJggTK0_A6zwZZVqzqIZB73Yw3dhYZ7a80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vEJiZB6gr-sDvM8-3dN1QGqNBSneVFct8JuWqiS1NIC--Qz6Yx0lUA>
    <xmx:vEJiZB7ljf8WOvOBSTQe6PFSx4dRLGVQ8RaWOWdkqY8p7IwSJMdF9g>
    <xmx:vEJiZBge0geoOFOW_1vhfVTs0eb6BrU0TZe1PPIgHKgAeHGOspgEoA>
    <xmx:vUJiZCXbUEWqP_h7cVl4gdvUG9TxTVhj4wD9XTeBh0JskWtyEiOPEA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 10:33:32 -0400 (EDT)
Date: Mon, 15 May 2023 09:33:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC releases
Message-ID: <ZGJCu6iz1T1Gt9Ne@heinlein.vulture-banana.ts.net>
References: <ZFLS4odjmhjBEoh_@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="erHbY6OLJfLlVZQG"
Content-Disposition: inline
In-Reply-To: <ZFLS4odjmhjBEoh_@heinlein.vulture-banana.ts.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--erHbY6OLJfLlVZQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 04:32:18PM -0500, Patrick Williams wrote:
> Hello,
>=20
> Upstream Yocto made the Mickledore release recently.  Correspondingly
> I've created a mickledore branch in our openbmc/openbmc repository and
> created the 2.15.0-dev tag on the commit in master immediately after
> this split.
>=20
> I split for the langdale release a while ago and did not get any
> feedback for a 2.13.0 release tag, so I simply made the tag today and
> pushed that as well.  Consider 2.13.0 released.
>=20
> I am manually testing the compile of the mickledore branch and then
> will be creating a tag for 2.14.0-rc1 shortly.  If you care about such
> things, please test the mickledore branch.  I've set myself a reminder
> to tag the 2.14.0 release on Friday May 12th if I do not hear any
> concerns.
>=20
> --=20
> Patrick Williams

2.14.0 has been released.

--=20
Patrick Williams

--erHbY6OLJfLlVZQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRiQroACgkQqwNHzC0A
wRm5SQ/+OoJMXxagvDxA1otKHk53wZ1Z6RlTtEkT5W0rE+c0Rt7Yp81fKEqlk+8z
GjHv6UiGupygcpwjrkP/vUPCJZ3L/0XF6cSA/VrXKY2xGXeDMZEelUAqBCNRBzgb
TRwIjD15xO7cf8XrCtW5kFB1t71APPeGGqc9AnUBcf/vM2Pae8bYHfAh8eKeV6HB
5NY75y0OVBhxQ050qH1wP2FPJmv44V/8fgvLYQv2V0NyHrHGLxfafYdnxOh5LbF8
b4HSxzZ8DmZdXKtq1UU4yUf+qmR6JCv9iTauefpjWRs/2ebLzt0paAoxuGsrNgjh
HmRN2S3+Eqi68yrxM+zdIDM/V8dRdBfAFdts1JiV7O+PPCNuhgBfxJQEWWbwEGCr
am4aGY1Wu3R/XhpY6LVEbBiN/s1yPScaSIQur56pUZnzwSFINkX0Sn0E4y+rDduF
GVeY8oGy4XjHdmfJbZV32E3Vj2oW99kR8F+sXE9kmxgrbQsxqVvogRWOVJtx/hT5
BKA7+eYkwdUYrF+29CsiNsswfV9b1DJpfocSP2nJm2/cV2yhScZYY5uugvyb92oB
BL8fK8EsLEjGT51wG3wmlblmVIE4RIIbfnG+6pxYq7y+Ahkl8bqK16FEX+q5ovBC
RRjaE0Fyh9y4gKwHmCqZqwPCagbYVIi6v0KTQg+DFrI2nchKU6g=
=07hm
-----END PGP SIGNATURE-----

--erHbY6OLJfLlVZQG--
