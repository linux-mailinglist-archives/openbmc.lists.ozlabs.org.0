Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D95A95A7
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 13:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJJdN3jmbz2yfq
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 21:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Xc1Eit/A;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nTyXTr4I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Xc1Eit/A;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nTyXTr4I;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJJcs1Lj9z2xHq
	for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2022 21:25:32 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7BD085C0121;
	Thu,  1 Sep 2022 07:25:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 01 Sep 2022 07:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1662031526; x=1662117926; bh=FF7G2EMAF2
	nnaFCRCKLzK7HTCbwoYwRZoqhN/nbLZXo=; b=Xc1Eit/A7Jauk3ekweFMs/CjE/
	FwrBLY50pNiNUGUcRvOqhPIiV+ejISo5Nhc+ZvIX2wFfQ2GvZyMXNYbWj9+8UXX8
	swrpOu7USORdy+GJASg6T5ApkXJmY4KwzjSlzu9HYFBcmIbZlM+UlT0LiDDKspOU
	6mnOe5QIgfQJ2BcNkUD5VslRyfgzKbLRKNnhO5qa695UIkXxzmLR49sUcPH0ILoz
	JfKseYZ8eYDdkXHdSNPlyATOhDLayevjQvVkDWWeEA/eqYGhQ3LUbfD+paTrb2hq
	AnfzFEPeS7KhRTdtygSAsiBuyy44hWtxWQW+crsDRVR7DGaihUOgtIn4Qhag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662031526; x=1662117926; bh=FF7G2EMAF2nnaFCRCKLzK7HTCbwo
	YwRZoqhN/nbLZXo=; b=nTyXTr4Iogn0T0qT2oo+uRB54EP11GHH3nFIkKfUWSew
	tbJ76goiXvhtaYpthaP5Ch9U+C53G5v/sctFQVEWm1fJd4SPukmG2fcmHnRThh7M
	QAwmjZl7TDfPPEJrK+o4pXFFMwKHat9bLXbMmYXn+9+E4p60346iBz59436qPmw7
	LB/1ZhF85CNxFjgb+BDhbH/FHCea5wCRwOdvidkYOcj22qP5NuDayKLU8cjeK5pk
	q5+uezDIEiT4bM3JWtRe4c54qeRhmOCH7TMfDGlmXsvrhTaI7KS62A0pDG11bjkr
	vsZl1OeII2JypW8qKZpBctriUt6EknR/a7WATYsg8w==
X-ME-Sender: <xms:ppYQY1cHohyPxLerR-KhHbIve3J7FWWIq8Qe9Eqg5GMaV1DlekDQcA>
    <xme:ppYQYzNmv0Gu1bksv0IPflRVsPQBxfN4t1C6Sb34o8HFuA0yeN5lpKUHuXm5799xE
    yONaHwbXLHUW4gYbkQ>
X-ME-Received: <xmr:ppYQY-ittFztCyeubrRhPDrD3G_JkZhWfgzL_JEs1S_eFX1_-2nVgSwDi4YFoTxFjHNYbjcQI3r_peA0wp0vlQEcVbPFJqnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
    feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ppYQY-_n75M1zryOO4jsGBJXD8XQEYrPTCbsODS5jfSA8hr7XUnk8A>
    <xmx:ppYQYxs_HtaOhgm1KWzk6gr4gQRFoI5iI7mngPg3f1ml6t0ytb_TfQ>
    <xmx:ppYQY9G8XW8gqFrfUa2JVAk9ybLAENbxzbO5STlyQYnNy_JWM5rWoA>
    <xmx:ppYQY_2fIo4ozKtRQDygj1ICQQmcc_HQziB7KuFFIt_EBRyUgMeIaQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 07:25:25 -0400 (EDT)
Date: Thu, 1 Sep 2022 06:25:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N66FCkR9bLMLnLMW"
Content-Disposition: inline
In-Reply-To: <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--N66FCkR9bLMLnLMW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:

> DISCUSSION: Create two separate designs for:
>     Enable Keylime Agent.=A0 Direction is for the keylime agent to open
>     the BMC network port (using systemd, sort of like how SSH works).=A0
>     The intention is to engage with Redfish for how to configure the
>     Keylime Agent: certificates, start/stop the application, etc.

I guess you said someone is working on a design for this.  The Keylime
website seems light on details to me, but I'm having trouble
conceptualizing how it is applicable to the BMC.  It seems more like it
is geared towards a self-selecting cluster of services (which reject
peers they don't trust).  Keylime does have the unfortunate aspect of being
written entirely in Python, which makes it very difficult for us to support
on any of the NOR-based systems (all of them except IBM's latest).

Are we also planning on providing attestation information over Redfish?

--=20
Patrick Williams

--N66FCkR9bLMLnLMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMQlqIACgkQqwNHzC0A
wRlf+A/9HYohaKkB0WXLuyYVwgcaFQpTqwEC0WcRvsVYjH+umsch883gBjv0+q+W
I3OWanpPej733ZlbmWc2Ol30cvkFkeV7Cbr46x5yI6Rq6GO9ZnH+sQftQb8am6Uk
fosr7PQ3SlEyLEbaY9IkQZf78Iq4jjMY3CfPszVnC/z3G08KFRBQjFdhXnr0Inee
bftpSQ8gB4RDkWhOkgajQtxeffeJ6a/gGOuYQ83pCJXvQYm9W9tsYRorQDRIMuJy
8F3OBtADWpwiaBlWUhmEle6NetgNzq2/CP7CkPaqEYc7huooS90bgQA0YNsfQMoS
U1EgBFEOiO9zVRW3p6eKxdO7vK43VOj3TiBq9wbCKNDKEmeidcuNaSoFSDcoBeSp
6uMFeecnNZn/unDmiu2o+S9z2Qmi0xz8CjZn8LO6gITisd9Gx2CJDnBCw0oRR/Mv
1rVUcKaLdSO7EZjpJhrQaNJmDapdRMRoRBq2g4+AgfRFmYEWfoPihDL9CAuJCHcl
Vyokc9zZowiCgCcmpyxO8Xf4wxREZnTulYJDNPq2JhET5dZsfQBL7B6sYGmtP7rR
CQ12p3QgGaYOxJprA8tUXg8gR6xam08F6+RSLw+iFOBXSOkCjXgwo+unZkET+cPs
rlt7yEVRLVgsZNhfB7/Cc8+T0Bq5QXnu1dNjGPf0X7BV0poLyBA=
=DuMI
-----END PGP SIGNATURE-----

--N66FCkR9bLMLnLMW--
