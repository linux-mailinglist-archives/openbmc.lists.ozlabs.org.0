Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D382E1F6
	for <lists+openbmc@lfdr.de>; Mon, 15 Jan 2024 21:48:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=oINyFPUN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=daW6SD2p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDPNv1xNPz3bpK
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 07:48:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=oINyFPUN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=daW6SD2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDPNL1Xcfz2xQ7
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 07:47:46 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6236C3200A43
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2024 15:47:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 15 Jan 2024 15:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1705351663; x=1705438063; bh=uW1jjp7i+V
	hsGgyLmoBr0KfS6s9N+gUTCDrkdvYFr8k=; b=oINyFPUNN6swm+K++HKLuiT+a9
	tAqKiUeW7NIEot3TiEyiUIqc3YHVmqFtWkjgUaceVPBa8bqX+Ybe+qXVpwQqZHxs
	rg40uFiyDSoBl7HM3xSR02ENmoLoLohufQvGJ50LN3wgiC7zjpV36BaEG5wLaYcX
	P+VaYnqouvcd+TnCeG+1A3noXLMoPIp9tgrV3tHWdjhbUpdrZtWkgJjlkhPIJ9We
	xfaQOwkdtZFF5TnQZ7WzQkVrSw03kAfEbtDa9lYisP59YSkPe/9mgZ11GOoKvdRV
	cQJ90l3ZYzZe8oJmusqEPesB8/b3BElt58F5aiboVQHfij5kQwKMrzrjhAQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705351663; x=1705438063; bh=uW1jjp7i+VhsGgyLmoBr0KfS6s9N
	+gUTCDrkdvYFr8k=; b=daW6SD2phUFg36n7aIfbssdq20WFLabDn/yaYKYWohv4
	xtlURdauF+vDzS4KAUHlB8mQDQp4meo/5Pfm/RnpwnJNpnLgrA6DG7iGf3wwx8Tv
	n38+WR2qn+hMbYzk6biJDydvWnX3pn0hcfRV65IOIGVORy5FtWMxnw/S3xn+Y/Wr
	P2hoca7IZFm82I9L4Bq74duMM2pnushlnPE277mYSm7JRCR2RxgTqQxZlbdwJ+o2
	fUl+2E/6dHTJcMNpOFcOiSr4d47YdiaOVEutO8u91R5seqH864Ph8xkegNMs05Dy
	WFc0GiCLJ0Kr3jtDDu9wDpJA/8LIZnfs9bf8tw8+Pw==
X-ME-Sender: <xms:75mlZQt2eQZ93kJ-att2yQRGDwN2WQmo79OHE_040KLPghKdmHrSlQ>
    <xme:75mlZddA34Vyr65wKiqnIMcoIEZrpSoHcPbBr-Vo1h02tr3M_AjFzAU-5WMk-yEJY
    IQlnsAx9rHLeRS81kA>
X-ME-Received: <xmr:75mlZbwd5MOvQjLJOKIqBLQi-bzgOLhn6XFxReBIeSwhqQg7MChpxtN3fpoKPhNWWDWA2yn29bWumFiUuYhWwxFFPYCGCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejuddgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
    hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:75mlZTP9ChHBshnpPeU4M9Ybim8v2vRszs4f53jUtgswyRErxG8hTA>
    <xmx:75mlZQ9lcQLfFkQx8GENC5VuY5tagsw4c7gCGWOY0OrrmZeoOqdd4g>
    <xmx:75mlZbUdzpf1TZzNusAQpJIEr36WrXaD4HYrLsQ_E2x9zV92N49bJA>
    <xmx:75mlZZIX5EJgvngPuLWVHLHhaWnok2x1QGYguHxPOOFzB2BICdFHiw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2024 15:47:43 -0500 (EST)
Date: Mon, 15 Jan 2024 14:47:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2024H1
Message-ID: <ZaWZ7iAlV3N0scrc@heinlein.vulture-banana.ts.net>
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XxfTfM6CYhN3unRH"
Content-Disposition: inline
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
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


--XxfTfM6CYhN3unRH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 02:45:23PM -0600, Patrick Williams wrote:

> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew J., Jason, Patrick, and William.
>=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.

I will self-nominate to continue serving on the TOF.

--=20
Patrick Williams

--XxfTfM6CYhN3unRH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWlme4ACgkQqwNHzC0A
wRnOVQ/+MIWyXA2frimcg9V4s6iNmoIOWc/7lPpUYQ2FNIh0YgicAlfH49RFFkDx
mOeDCfGXnJWWTuzuZsCiSDJSXEAV4WNKxL8EPKwr3XF006FuxHfEpUykoP//IHB/
J8yq0Nr4vXD/kW2cB1czZRqmJ6844g5277D1/rxspPZJfqVCoYh2dMGB7Zo1t1PN
j4NqDbFsyR1EL0TrRy6Nd4YY+DJtnprmhVHTDeRvwGtF5K2tcVa/MTp74brZ1z++
GQqN8z2C0UpBf5Ccg+HG3FksO4RdG8mFoHlQU38jes5wwlKtaEjqtJUeAtmSuyyI
spbaxVe5kDZVmtGbxyPiCw0VgU7feyz13s9/MXAGJHuGACoGgQUHHhrkyPcShxbp
4qoB5bhwPIfkKM85gb8hDvqO8iXoDRpT2YgzwTfYUQAx8cRJ5VhGTRBasdOCXbSq
MSYbe9Vgs5chNPNYBvy9xLRX85m/cBrEuAAeRhIcVVEItTm2nYn2TUG5D4Vz8DAN
pu5nDGWOJuoCKv+BiDrg8nNQ7DPVULuf0cqZH/GhCrfCG7FPHnzFwEB7G+r1pPJr
3H6jeMg03xuoqCZKiaMPU7VYfi/hfRefXimc6riiuxejHW4aFdea6DAgzTPWOb/Z
6t3Xt3eH+cMxHIsRfwoT//AYC7tYd3xXMsOo6Hh/Ep25ytldR18=
=OCyn
-----END PGP SIGNATURE-----

--XxfTfM6CYhN3unRH--
