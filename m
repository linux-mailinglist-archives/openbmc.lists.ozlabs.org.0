Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA2801294
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 19:25:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LLjmArzd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=in5dOEKF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShhLx4xd6z3ccS
	for <lists+openbmc@lfdr.de>; Sat,  2 Dec 2023 05:25:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LLjmArzd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=in5dOEKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShhLF5ymYz2yDM
	for <openbmc@lists.ozlabs.org>; Sat,  2 Dec 2023 05:24:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B81205C01C9;
	Fri,  1 Dec 2023 13:24:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 01 Dec 2023 13:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701455086; x=1701541486; bh=Ru
	2hRf/3+r8ju15FSYPR7cNoUqQIU/mBJdHr61lwwds=; b=LLjmArzdp/FHwA5C+V
	OVo3MjZrKh3PcWicud9pIfFbtHVx+OyOB0Tklry7365FQhALngtIM+CzIEHpj2bp
	psWSRepkB01p/6wlTOKLM8pxW+yRHJGGm9JLJzgKQb1JWID3/2+hGLSZPmKqwRzn
	KAopwz5Zm1p2215LYBkidjgJOoUDcWld3Z/chx2WKClENqhdjpVCMOtegic3HFfg
	Mtts9VtuTXx9PmcB4jo/OjFihC/qPyZJkDS5FfotE4CRfzFujvdU5z2NtjDY2+hI
	vy0u4QvrVF4Y4kLMTAp2vz/enxjvHeKw4Ykq/8AUOddpDJeAWVNStSksrwCzEBPv
	dmMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701455086; x=1701541486; bh=Ru2hRf/3+r8ju
	15FSYPR7cNoUqQIU/mBJdHr61lwwds=; b=in5dOEKFCmHbK1J+xYQSNorIY2UlO
	K9r6tn/I8+ZzBslEdeVEveOHcHKG1AE76ShJTyl0n1DJjoPdYzHoX7hX7g5kqkqQ
	b4iEQoMW62Yvdq/CQ5h7CEtkBTojEZMg5Lu6cofH1kpdgSOWmsF0x+A2zqlKxWJo
	si+DAj7eEZKKixfPkGLVC1JPY6MabCXiu3/UOpsLFVERlH5OA5ashQZkea2HcXzC
	5xwno5MCrT5bteoHwpQKSxj4n7msILb2Jb/2hHbr1EhyUSRSVneR6vDuGtmjdX++
	mpfWaFG7NAn1sdftaOlUEoUTzb+IrLVnGT/q6pOkOARIkPPHXbyhpwF4Q==
X-ME-Sender: <xms:7iRqZbqPDgXDo4hg3h5dXn8QH-VS8eyqforXY-IDiJE-sjN27bF-0Q>
    <xme:7iRqZVpqwk8UwbjJRF_nqpVpu41M536FPYfIwlfc1PE4uRk6NhdE_CbJYVKh5tToG
    QzecxvxWybVPq9cSVw>
X-ME-Received: <xmr:7iRqZYN8rK821Z7RpV-gmFS1zenm56vWkTxYurWcd4hfBJrilDuTOa2QXB83IKob3iB_tjzrCd56NyCcapdnjEwZBEI-ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepff
    fhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghi
    lhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvg
    hrnhepheefjeehfedtjeeivdefkeffheeludekudelleffkefgtdeludelvddtgedtheek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrth
    hrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:7iRqZe4h9muSgdlWZFVs8ZFQWv-arjOL46nMAfhHHngRNIoP0WYn6A>
    <xmx:7iRqZa4K9AFRduEZE-7aUvyYZaQjrrPpko9QHddmjtNuMABmKce4Hg>
    <xmx:7iRqZWh8z1M0WI_IzY0yEN0xWJcYfZEgSkNs-V-V8nRszLsBFBCuYA>
    <xmx:7iRqZfiGzUpszIdxSeKsK7hVL71QVCjsvB7t3cRLy_Him78ZZWZBnw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Dec 2023 13:24:46 -0500 (EST)
Date: Fri, 1 Dec 2023 12:24:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Chandramohan <chandramohan.harkude@gmail.com>
Subject: Re: Suggestions required for sending the RF events in case of change
 happens on the backend-repos
Message-ID: <ZWok7aT-agwWVRYW@heinlein.vulture-banana.ts.net>
References: <CAAtDDLbih38WXPBKk7aP+nuzKWdSU98g8PupeqW1wVJwSHpbKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OqiYnss6Ew3dAx7F"
Content-Disposition: inline
In-Reply-To: <CAAtDDLbih38WXPBKk7aP+nuzKWdSU98g8PupeqW1wVJwSHpbKw@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OqiYnss6Ew3dAx7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 11:33:30PM +0530, Chandramohan wrote:
> H All,
>=20
> I wanted to discuss various design approaches for, sending RF events from
> various OpenBMC services for resource create/delete/modify cases (but not
> limited to this),
> Please find the details below:

I'm not fully grasping what you're trying to solve.  Do you have more
details on what your use-case is?

Generally we _don't_ want all the repositories to know "Redfish".  If
what you're proposing is some special Redfish-oriented handling in every
repository, I don't think this will fly.

For Redfish Events, I suspect someone would need to start a dbus monitor
in BMC web to observe interesting changes and to turn them into Redfish
Events inside bmcweb itself.

--=20
Patrick Williams

--OqiYnss6Ew3dAx7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVqJO0ACgkQqwNHzC0A
wRmzEw//Xkwnt1ZVuWuRaWS1pUM66Eg9e4S0KNXI3qAaDHOhaVpatwSoMUnLw+pd
VlwDM9fg8wzGEq3E2BZxMG7y5y9Zg6wihytiumrv7UAdoF8bCWmQiFaBJjYtgVgf
pSZlRP3P/avN7ylkDIt5RPiccdlVMUf5mwj2RG2JfwC9lICHMf8TBauHaQE2g5HD
ddXWDDpYohPtnkPmg6OsaTL4q3rNa1TYwwnUM0W/bGPSJV9Jk2YgabgRZ2lDllbw
z2ESrZzpIkaL0BkYGWpJx8WGXh3DE9YkL202XqlNgtCVZjKlG8CyTabw4FHEXD98
ecFWE4xST14jiYlgaBpNSAuikCVaP6pmCE44/sT+lHM2L5ChJlHIiihno/H25S8v
yYLCwn8Tnnwd2/p+/IhQo8gOoYCfq5PRgAbSCwIod4Z/KFWkyx60vJys2bRJKy7C
vFaleHn+QuLMtCu1vvNAWyUTK8daf3F14YQYF/5KUvjAitdKeCkv2KZrzehIEZAz
GbtbHqv+pPyE64F6EhuA5ZXlEb5uz3hN1FZTCbrpKa5U12PIFzMU/cuqT8+J0E62
LPUCFHKXVZl3mFW1QfUtpF6zdR5modGuGYmhk8/dEaZEXVvQDD/1XmVPT55k5roI
RjXyUpN7BtbKEFnnQ2tkU1bkBrQf6y3jYsSNoBcw73xSdCgYB+0=
=RyS1
-----END PGP SIGNATURE-----

--OqiYnss6Ew3dAx7F--
