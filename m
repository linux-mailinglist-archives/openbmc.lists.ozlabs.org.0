Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83D6D43C7
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 13:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqpz83871z3cMf
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 21:47:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=gtLLL4pb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z2r05Ij4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=gtLLL4pb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z2r05Ij4;
	dkim-atps=neutral
X-Greylist: delayed 97 seconds by postgrey-1.36 at boromir; Mon, 03 Apr 2023 21:46:40 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqpyS1MSMz3bj0
	for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2023 21:46:40 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 46D535C010E
	for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2023 07:46:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 03 Apr 2023 07:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680522398; x=1680608798; bh=rD
	jYGBA+hUylZRr1D7FtRfvfAxAg9jJR0V/UfMbrRm4=; b=gtLLL4pbcg6UyAvDrx
	eYV4C6xEEPDHuR9u3kEAfX16mX91xl7SDb+TOYlT9r/ZRbKMoOMLR5VPvNAiGinI
	LU7hOA/FEtLSaE4ZBMC8Duva0c25ml+hnmBWNU3lwD31vY68ObZvz8C33y3TwRO/
	n0LlKwtsp6ecXp/0wJopn8Ga3OeqG8ZQqOa4n7nemDMJnYdWPvKPtKd3YsHlrjSY
	iZJlLJNPw+00QdL2psefep4P12DXZclwHMqluUWkSqqmnQ8skVX24OvYhy0os6Q1
	EqajK/Wh94bq9mPx5p8q+okudCZYph7gqj3+EcI/METeltntrlZekKEKEX3HGfO9
	SPCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680522398; x=1680608798; bh=rDjYGBA+hUylZ
	Rr1D7FtRfvfAxAg9jJR0V/UfMbrRm4=; b=Z2r05Ij4d6HAiF4EFd51cmKE6+twE
	ixo322f+s5/PHEyahIL0eprlzSREffSUV9uE3YQKZCgzVR98/+GKMfziGbWM50ZS
	J6iu7Dg87NnWNoWxsiS8PU+MfR5FtTPwVd+H4c6DFXoJa2w0ExBCq8dplgQnhbUb
	4b5EDEKJaWG6+IiaiLBsrEfq0Np0suS5ysQRtWVLX/1uOxKsdk5CMKXdAHW+9bSG
	CTHixh5xbZFdp4nsU7tkQYmBZYVdzpA6p2OeyguNER6DxdCfmCBIWAGuINGIxj2l
	/1R3iI3zdAb+xvZ2juUx4IcFN+N4c7CWFahiJvlq8wjPS/su21OAo2g7g==
X-ME-Sender: <xms:nrwqZMo1PRl_lrWSC_-ac43OyFBqbmJC1BR0nrty7hi7gixF1XxM7g>
    <xme:nrwqZCp_kcfYLhXlX6CNgGbtrwz9HECQyLc5JukbeFLPnTX0ZNSWZqsX_7vhXjxgH
    KObTw56Vk90XsorkpY>
X-ME-Received: <xmr:nrwqZBM5S0939vmNLLE2MDe8fZ5-wRUIphoRQxxprB9tyKeJuHO3NA20KeUzmAzYYe_ZT8J6zRUGbDs4kIYXI_mXxanNjWtguvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeijedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepieduvdffhfeuieetteffhffgkeek
    heejhffffeevledtudeileffudfggfetffegnecuffhomhgrihhnpehophgvnhgsmhgtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:nrwqZD7LtbQnP918j-BVIDbfMkNH-S9OLsjHPqcDH8tbIE6kTy8BmA>
    <xmx:nrwqZL4BbaPq3e6-v02VJwiDjrrpitnFdxtINQhr_ja78P-q1Fbzaw>
    <xmx:nrwqZDgOCWUA3qdHlgIxn1ikH2yS9foAgnLBMLwT9wqbE4clXVBoRQ>
    <xmx:nrwqZEWtkv7JocWC6FtX_l5rSMmjB0odu-0KJoBUMGsDrSGRtlJngw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 3 Apr 2023 07:46:37 -0400 (EDT)
Date: Mon, 3 Apr 2023 06:46:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2023H1
Message-ID: <ZCq8ndHcOqSpklbU@heinlein.vulture-banana.ts.net>
References: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ujI6V5ZYMSQ0ermp"
Content-Disposition: inline
In-Reply-To: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
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


--ujI6V5ZYMSQ0ermp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 05:47:21PM -0600, Patrick Williams wrote:
> B. We have 4 members who's 1 year term has ended, which means there are 4
>    positions up for election.  These members have an ending term and may
>    be renominated:
>         * Andrew Jeffery
>         * Jason Bills
>         * Patrick Williams
>         * William Kennington
>=20
> C. Nominations for (B) may be sent to the mailing list by replying to
>    this email.  Only those eligible to vote may be nominated.

The only nominations received were for the 4 individuals already
serving, so their terms were automatically extended until 2024-04-01.

    https://gerrit.openbmc.org/c/openbmc/docs/+/62114

--=20
Patrick Williams

--ujI6V5ZYMSQ0ermp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQqvJ0ACgkQqwNHzC0A
wRmn2A//fdS1b+CyLWdCmSjC/Vs074p5BJBbaPxpbTBpOeS8rAWdRPs5qGEsJRpY
aWQmEZDc9AsbGhKg21eyTAOD4qt/bffNbr8R/49iqX73N6sDwNpkFhg4IJXsbTKY
iUQmta1JFjOF2vCvdytrocCODvnx2l9xKZ5DEpQkA3/P7eFACO0NjuATJ5LPgaQe
RI6SzK6XoPRNnEFxV9Fwr/vBuWNKcwxTlkuuqlDxXJGiGtJVTs9tQCx8OaEZTKk9
58sP5H/Cq0FG2cx67OOYh7i0qNwl/G6kjhYWmNdCivPv6xPpJ1TZf5nYoUGsoZWi
9BoPhCiQx6/amsxgYRRorBd77FoIqocit4ZDwidHmXgTrkirzBbPBGByQObgsLAF
nVvg4dyIeGpcPcG6+lIQKdnwEVi2pCOFrhcVJiAMjBKP0hN6GNa2F9heX8es0UPm
oo756eZKOU2bd/vyaWt9upQrY5StbHCHEGTOFxwjPlpojqcyx4frp0FfMczhHTgO
fqmBHOsIL7kBoBNCIB1zvno+hHMs1CucqYVyBimUeH+pa4Awpn7YjjMVO+SvlKqL
nxI/aSZb51J2CiHcNy4I/Q6jcwZzcnEntmtnZstQCbd2CzqAm8YDnk/Tety//bnP
O3kAHfPp7pHujWtA4K6+nzfsyRGysKzwslPAuEnSNLldcpRx0DI=
=eUti
-----END PGP SIGNATURE-----

--ujI6V5ZYMSQ0ermp--
