Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C343788AA5
	for <lists+openbmc@lfdr.de>; Fri, 25 Aug 2023 16:06:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ODTgydDm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LOcOpJNo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXMFX6R6Wz300f
	for <lists+openbmc@lfdr.de>; Sat, 26 Aug 2023 00:06:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ODTgydDm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LOcOpJNo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 566 seconds by postgrey-1.37 at boromir; Sat, 26 Aug 2023 00:06:00 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXMDm4zfmz2yW1
	for <openbmc@lists.ozlabs.org>; Sat, 26 Aug 2023 00:06:00 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 860103200A42;
	Fri, 25 Aug 2023 09:56:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 25 Aug 2023 09:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692971784; x=1693058184; bh=TQ
	RaBy0kk8m9TUSRkg6ao5K9LnZRcl/aD9JY/SxXVNY=; b=ODTgydDmIY/Y5aSAIZ
	upxLd79aWz1eyNHDaO1eRzmVYr5Rj89aR7D50/8qnD7gv1Cw0dWAZFg0XNx5pB+1
	asHmfVR64X8IpztZdXjQfeZVoMrCj+W1gF525C+s2YKBEV43Kpqqj+kYI2lri96N
	Hutx2NwUIK6wALZGpOEpCHWl9CxzVkrXwflwnmqOOXH9VkeiMbDvDGGc27YPFT9B
	C8t1mFMKmw/mwwwpFu0wIfsLrMbgbo+691tQUCfzY1ZZ3/Gd8dxSQzlb3FIZYNA6
	A0rrFi+4j0YwHHQiMIwDy0OKtin3PgOUmXOCMYHw6YWokNSe9e2qYIiuyU3ovSoh
	TXAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692971784; x=1693058184; bh=TQRaBy0kk8m9T
	USRkg6ao5K9LnZRcl/aD9JY/SxXVNY=; b=LOcOpJNox0UqA1U+1UL1KCn3Yj2eg
	S6dL031A5w/WL/spS61oAPxpCnDcQLR8lyoDkexoOK7qTGYKQmbXn4TUEpfkHeJ7
	hc9NWvWb+zSWhrRUmpmYXThwEQideaO+DwAn8JoGviTSC32KO04m7DjnL5GSR3+4
	lF5PETAPj3FMFOjqc9Wi5ElJ8Ko5CPgJ3m1OtmpvjPANgu8k5+xNqO8ZG2w/eBMb
	sr+Hz6jl7bSNZC88CXco/Vt9J1ZKKcu4wfMSqfXRLStTLLTijrsNVQ3IpAPbC72k
	3GgVXgrNFrTuFGIBrttoziCCl23xtelTBSwAkXpw5AePy0qGYxKtt0jlQ==
X-ME-Sender: <xms:B7PoZFs_neDxUk1hLxWmwq6i_KOQ8_c8yMJ4rCJOF7Qo_Fp7lALXmg>
    <xme:B7PoZOfXuYMuI0sYrwJD9NqMWQScu_v-7c0iGFw8XQoUKMkjg9yjV9eEwyUO5bUTq
    fw2CIr5UbEOML8rG9s>
X-ME-Received: <xmr:B7PoZIzPbmAphHvgf1qCeAHlSJgDiuyTl4Do3I1p5jhkDQXSY0RD5cBcNc57o9MNkAjk8LfUQVo1hJBe9GZZJbmGNbsrjTKWow8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvkedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvieekhfehveevieehieekfeeu
    ieffteeugedvtdduiedvffdvhfdtgfdthfefkeenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:B7PoZMOSmZ-IRBsd87GRx_5hVU6MP8udIo4HQ7Yl_QfEcLeN5nqkaw>
    <xmx:B7PoZF9zRpAFAyQlr5yYo9AL9sC88xarwGf8SGqDPdsl9eQO7I65xw>
    <xmx:B7PoZMUVIfjUC9wnWD8Q9k9nCoQi9RS6VTrNx4VKKphfAqmONq2U9A>
    <xmx:CLPoZCHSuVwIirL9tIid5FOH5BIV4dFCMxSjvePbr8GPtNffbH2kyw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Aug 2023 09:56:23 -0400 (EDT)
Date: Fri, 25 Aug 2023 08:56:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: sdbusplus updates (client-bindings and namespace)
Message-ID: <ZOizBevujmIBBEVC@heinlein.vulture-banana.ts.net>
References: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
 <CAGm54UF=8EWwzC0ZONoYFjHV2RagGyNocX3Ob-ftaYACpG9n9Q@mail.gmail.com>
 <ZFgMJz51IVKzo5IJ@heinlein.vulture-banana.ts.net>
 <CAGm54UHd5ukn_-n83Ud0RAZeLj_O+CxjXx74F8tKJyRj2j0s+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Cx37zV+LA6cM6e8"
Content-Disposition: inline
In-Reply-To: <CAGm54UHd5ukn_-n83Ud0RAZeLj_O+CxjXx74F8tKJyRj2j0s+Q@mail.gmail.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2Cx37zV+LA6cM6e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 04:05:12PM +0800, Lei Yu wrote:

> It's noticed that the `error.hpp` is kept and still uses the namespace li=
ke
> `sdbusplus::xyz::openbmc_project::State::Host::Error::BMCNotReady`, inste=
ad of
> `sdbusplus::error::xyz::openbmc_project::state::host::BMCNotReady`.
>=20
> Should we change the error namespace as well to keep consistency?

Good idea.  Done.
    https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66308

--=20
Patrick Williams

--2Cx37zV+LA6cM6e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmToswMACgkQqwNHzC0A
wRnvtQ//fhVYphOAYrwskcDJKYS4lz8wXmo2oqjCojNHFOScgHgKKZFZWbFSp8Ix
cNhUj3sml6yVf/DHwR7dJiMtb3mgE2aEQc0wnxBufdIhKuofMghavzFjx3pM1UKN
7SxY12C/ZnDckAYQ5UHWAuK8Hri+RuwRu0e+VOiA2a9a6i/uxfW5eT1YSMqOcnN6
q9aZifMbic3lTp3PAVDRiPPXFrOzK0PMiwyTe0fEO2rvLA3ya3TwDThwGdpQaDSe
jQb9+ZPtWtKBvqa1XfG0AtsMe420qg+6yfOX5yipq037Ma5Ea1cTZw7FSpT6ItPx
ignAbHJUWSsUnNWwvJsJL+DnAJRqM/Fm/TrlwCdG/b5dv8J9LhzV1QJALigaLHFo
vheMwKA2/bGk5HagBOEbw6zsTl70IUP2cChQbhyAuhoJRd551yuQITyaSIy9R/zP
KvhU5Pa8yY+bfnbbgwvtEq9602qgNoOaRUxbgmODa8cgxRgWw+Q/b2h/6Mni6Ulf
LGkasxYdEnmXzF3voI1BxFfCsu7ss7XsZGLzjv4gil9pQqFArbGpYcT14QCEaXgk
MT2kVbR1aobGWrlh7ZqbJ96G1kIJuowv1ysi7H5bTcgND1CaQ0wscmR7WWVQcGft
UjeCeQZNnye5ET7v/JyGY2piofm7NBPh/lDNuaOPlLP7UsgwrKI=
=rELy
-----END PGP SIGNATURE-----

--2Cx37zV+LA6cM6e8--
