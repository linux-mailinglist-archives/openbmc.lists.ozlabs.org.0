Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0697A19F7
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 11:08:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=TO+Z7EEz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GKvGckms;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn7fC3ZJXz3cML
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 19:08:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=TO+Z7EEz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GKvGckms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn7dd64flz3bTP
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 19:08:21 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C84673200645;
	Fri, 15 Sep 2023 05:08:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 15 Sep 2023 05:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694768898; x=1694855298; bh=j4
	lxXJzcpc3qVIDE2clx7BAf9Sw35NYIdKJIu6WAoUU=; b=TO+Z7EEzOySWA0R5CR
	9woKGe2U/Ljp9Q5ZyzIWwwCw8XiNmH/TTjXL9ing/bO53UeAg1sSZ59zlbVA4W0o
	6DIA1qi0zLkHmWgimCCJF914bRWO7SUaZ0o/uuf8Qy9qP5Ci9wASi67t1wPfvG1/
	e3pJ5PduLqNQCEyP2sUX5OMnft7HyOH4m9a+nc+iiwA86wHe7/34D/RrKCEC7mf1
	AQpG80K01i5Yg8/3YoewA1hsPk5L4t7EjtAb6ALudwTVqUDIhWZcYGaJuKd4bKIA
	X8SUpjviFB35g8mvbeApkAWTjTOdF0NRh8bgIfNga43x2KwefISKVzyOCPUQSzlZ
	qpJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694768898; x=1694855298; bh=j4lxXJzcpc3qV
	IDE2clx7BAf9Sw35NYIdKJIu6WAoUU=; b=GKvGckms9SBYFtczEb7IY1iNGzH6W
	Af4m29MWWOhsJy1egOI8KjrrPBIkqlMcSbNUNx0jtR+nbN873l3dZNEWs0E0l1lC
	ImmAxGcdIQbqrTWSWNjRfM3qnojydiMoqUwb4Tq1igBRiBXvUtixC7Q5WRpFb2By
	G2j5VoTpxE9owliOCZjaxxYcScMVYaMXKoiV/qA8NgPmf95pS4px3MyK7i+aNR/A
	Mz4UsHAvPJHmOWpRahENEL/vJzMX98LPFzFaMiq+nlXTF/jGYq5VrcFYmfzlH5bw
	IadKqhjXwOiKBgpVGy9q3iRJCttNLEaKqL24Q/mqK3fJLVtdDSwm1PVBg==
X-ME-Sender: <xms:Ah8EZf39zLv1BQYO4P5rFsVuJom-d6XdKsuh2X8FMpK6nRyuWahSxA>
    <xme:Ah8EZeGOq_UBaMMjemb5ABH1y6_ZiHhW3j3UHyWJtNkCSreJY6Lw-U0HSrJO4MxTE
    xNfnao1s-WJL2senw0>
X-ME-Received: <xmr:Ah8EZf5TNomSzHv5b8EgBTRq1OeZamSUn1CTFAP1_yEbcSGjS1uTJ6CIyfh4mi36xnSrpcigwZJePbxtCRpnadaAwXFvFUqCpRo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Ah8EZU1jozLxbK36XvkSNsFzPleNE8-PbHV0dR0y5QWjmBK4-UEyPA>
    <xmx:Ah8EZSE6COj72BptdRHznYgdWji6zohL4E5dRHk_e5WthyKaPiDNtQ>
    <xmx:Ah8EZV8CDeWDDDxhDbMJbk_M7iHcl31qLoUwRvMGhhNhmAW5UpNcGA>
    <xmx:Ah8EZdOyLnzcXGbieIkvFGY9ULo_PP3699y1Rlbjalp4E2XK6kFbPA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 05:08:17 -0400 (EDT)
Date: Fri, 15 Sep 2023 04:08:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Towards less magic strings.
Message-ID: <ZQQfAFjIg2_MH9vR@heinlein.vulture-banana.ts.net>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
 <263506b1-8182-fe92-4614-45f1d3b9c8ce@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OsiSnV3DjXYaX/KE"
Content-Disposition: inline
In-Reply-To: <263506b1-8182-fe92-4614-45f1d3b9c8ce@linux.intel.com>
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


--OsiSnV3DjXYaX/KE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 08:01:30AM -0600, Bills, Jason M wrote:

> I have seen a couple advantages to the magic strings that seem to make=20
> debugging easier between using something like busctl on a system and=20
> looking at the source code.
>=20
> One is going from busctl to source, it's easy to copy the string from=20
> busctl and search the source for that string.
>=20
> The other is going from source to busctl, it's easy to copy the strings=
=20
> from the source into busctl to see the results from D-Bus.
>=20
> Do you have any tips on how to do these kinds of busctl<->source=20
> conversions using dbus-YAML that will help as we start removing the=20
> magic strings?

Great question.

The conversion is straight-forward but there isn't currently a tool
to do it.  I could probably hack up something pretty quick that would
assist with the conversions.

I know we've generally refrained from adding debug tools into the image,
but it seems that `busctl` is pretty "hands-on" for many users.  I'm
thinking of working on a tool that will be provided by the
phosphor-dbus-interfaces package that will be smart-busctl.  If anyone
has opinions on that, I'm interested to hear them.

--=20
Patrick Williams

--OsiSnV3DjXYaX/KE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUEHwAACgkQqwNHzC0A
wRno0g/2I10n2ygsEdAObymkmX5zroT/NO9Rhpwhp9zKK/9U4npk5n82vGQhD0ru
gQ9J8C/uS2L2SfCUm17OlmPgeFY0JbIJDZDJRo1ogu3MDVEZh9SPn8jYxT+f2Kr6
q5g0O73ryQycB/Pej0QO2C8nzjVpZE9eI96ShtRuexQFjT7kw7PmX3OOR+OVQibs
wUHje+5Oa14+SAEddlG6ZtiRGHF0uiGtKpeShrqW0pnAZgfpwTUsO4pDDfoUmK0K
AVu+qhkYzGgPBqG7oZo1vz5xAB0kE04aVyAqtVJpNiBfCp6XqFnITyiNOrT2UOMi
mbwxs0K5gxuV1dOcudABpz+uZrboYeYLOVXO2wiRcGO4hvGOcAodKxG9WJ5tRUeJ
r0XbhZ1pEvU2tPoRgG8s4tyPWDwO+sgyJv/cNFs2b8yWW1bdT+p1hVG7IoxMcDTI
NobL9ogIqZR1gIYWP9NomHWU6ZGoSkYvY1X2INfDF0879tZGu/cheF2116GpXFB4
erXurY+1YyfCa9+weUMCmmlWjSXkLGchgD1LCyZpCciNxVv/hjbLMeaJHKKUi0Gl
N60XyT4+4UbMNtS6pg2g+ECrg0qfhIQUIsB4uWws+CAj4T+FY0FME0gs4WmEQMnR
AbURYdmT5EJXiD6W0FbaPZWPzzj3N+2HZZgLdJLqjEuCjRmPLA==
=qIBN
-----END PGP SIGNATURE-----

--OsiSnV3DjXYaX/KE--
