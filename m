Return-Path: <openbmc+bounces-317-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D81AFEB1D
	for <lists+openbmc@lfdr.de>; Wed,  9 Jul 2025 16:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bcflc204Pz2yhX;
	Thu, 10 Jul 2025 00:01:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752069675;
	cv=none; b=CGRfMBqc/Hz3ayAmphvNRxX+2jHcU0UWgJH+5wC2/8a2HU6u5/9jUPgIkCY1gY5sswnmrrGcmrwNpjz+ctrWFjouF4zj1KWfZN20Uv5TImKlOOVEv+4beOgVn1UZGf2pfUbuIZ5VYt/pHt4yTn7ryNoodHg+bUm83WFBqL1Wh9RTcBi4j5tz3Bj6lo3cgxX8/pTghcJ/jWxXJyl195Jsg3KB1nOT1+Fkv8/tA++f+AMNrGBE2b+WOezY6c0CZvZkgqqRCiZcFWtuIwbs7k4YiEcDlYPchjyGhqwOZvbRJ+9XnOra179SzofIr9uekGoIcsLP2s6n/EXKjnS+v/IjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752069675; c=relaxed/relaxed;
	bh=e5S6+aENUZaxCH2TX/EGu1uSuXjmZRLlCMqJv2u8VdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oT7ZjAFi7fmPClOfWXZ+6SWljlHUUGfRei0FJZNPj252VP7j2dqLNcLJcknJBT1TPQ31fNl4mucRx1BvhoOA0W2PnyOO3g0aS2i/px3b3sRiydR1PT0XMzZuZ/g6yLTPIGQ9/Mf0OqW6ebPgNsM/b4RkG5Iusxaw+fwRsXZ+lWAJKg4AP4/93j7dYhjZhJZVlrvBbPxtfIyDUWhanSjUq386ElDfyKguA0i/gpM3Gb+7+aq7jURjhx9RAFTLAkJCSU68LJq5MDlgTpdkdKKKUDdtoAAXrgRIUztnmxgQecpdeKKW8RMXPe8qYwt/yBSaSthUV0sE9wuHfDYqL6eSaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iESOwTUD; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QH7w8sgP; dkim-atps=neutral; spf=pass (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iESOwTUD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QH7w8sgP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 452 seconds by postgrey-1.37 at boromir; Thu, 10 Jul 2025 00:01:12 AEST
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bcflX21HFz2yKq
	for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 00:01:12 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9FF131D0005F
	for <openbmc@lists.ozlabs.org>; Wed,  9 Jul 2025 09:53:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 09 Jul 2025 09:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1752069216; x=1752155616; bh=e5S6+aENUZaxCH2TX/EGu1uSuXjmZRLl
	CMqJv2u8VdE=; b=iESOwTUD41bIW8KAMKruhpBMGCzaPKl7uEu4nLKxXXYICXw0
	JDJhcpUO5I+BbqL9gn+2uzBA7h2Y8OI+CSwe1d1c1Evf2v3sOpAdnqipfV1DAFP2
	8Vn4fr6/Y2IbUXMuRxtQtBE/So1VplNsKwYloZaqZnb61z2dhBuiSmprRF9nHYR2
	0X4mcE5lBIb7CeMC3QR2SBWPKZx45gQaUkta/tFHr8/AV1jf9cLJ23JD5Ii/KXMf
	eE+gZpWkU2JOrG1pA+fte//hLiq1AstHI7074HNRdThymitx6Q7aT7hNwfvHnIml
	j+31z4SV1h78724KdLJGSKKfqs5U2izsCp4yJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752069216; x=
	1752155616; bh=e5S6+aENUZaxCH2TX/EGu1uSuXjmZRLlCMqJv2u8VdE=; b=Q
	H7w8sgPNITdyJu+l2Xt37TORAlqwlVHRxzbwhkYRhYQSfgRRSte5HZZsKkHvnSJK
	WSAJsTVdAWLDmivIPhSismvCp9NtPoWJ+VVoqNHE4gE2HVuVTjGTdKKjfeM6gsxU
	j0anGrUYjCbxA11vJkCGEO/yF7j3KdQay792c5jeLEAyLui4aBCM0OAg04n0Nnjs
	DOGjEgNdvWA6b81/ZHo3PzYdvaBI8oHFNYngcOSeeBvICk6IMfEzyEP8SascFg8M
	PQxoMkBmRcVsHruKZJ5KK1Ut8nRrEEkPvMNQh2UKwyW8ihgX7hdOEZLQjdKeVg+d
	KHefsyclLXV0sz+vEwn7w==
X-ME-Sender: <xms:X3RuaGYCnh5gMWNMQ6pIuvuyCrD4NpL80AUHzFKip0KsK813JQ9GUw>
    <xme:X3RuaLYUmSUAB12EB97bzvBbLNTXwPKbEe6tUAxfpgRtYUwNDlAI3DKBH2fzVPfGS
    qaFgcD0lua1D-r5M_w>
X-ME-Received: <xmr:X3RuaKXWBt_38LyoiKoSJ61AJmozQa23CCjck5_wPGEi3ipqcMUDft5BZws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculdejtddmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhr
    ohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrd
    ighiiiqeenucggtffrrghtthgvrhhnpeejffeuleehledvfeevjeeuffejjeevueevhedt
    udfftdegleekvddtveevtefgteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphht
    thhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlih
    hsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:YHRuaK2XArKlq-vRSg_hqPgEuFiv33MdgfZz8WMUP4KE2svtmMYT_g>
    <xmx:YHRuaJbvhrrtk2CYJ1q1uiUmdoaaTRfOJr6YLsOUjX6279cuWxeKeg>
    <xmx:YHRuaFrQ-6eOvVTHY1YJSp9L_Zxp5dFVSfnGCaUOfUTsi-VnQSt_uA>
    <xmx:YHRuaNox9LpqVbmVw-xNYgasnTLvFo7kDGs8EW0g4OcshwJmn9m_MA>
    <xmx:YHRuaO2X3Eiv0AhAG3-vBV6PvFRKyRiXfSxO80NQv_rBYQc28RE-gsKa>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 9 Jul 2025 09:53:35 -0400 (EDT)
Date: Wed, 9 Jul 2025 09:53:35 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Deprecate phosphor-hostlogger?
Message-ID: <aG50XyECFuxmDkXB@heinlein>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J208+F3Vh8VzMhfY"
Content-Disposition: inline
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--J208+F3Vh8VzMhfY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Does anyone have opinions on if we deprecate phosphor-hostlogger?

I ended up becoming the "maintainer" of it due to the original maintainers
no longer being able to contribute to OpenBMC.  I've read through the
README and it is very much not clear to me what advantages it has over
using the similar functionality contained in obmc-console directly.
There is some mention of rsyslog and logrotate integration, but
obmc-console already supports a logrotate-like functionality, and I
think rsyslog could be easily configured to pick up the log files
created by obmc-console, if someone were so inclined.

It appears to only be used by the following meta layers:

    * meta-amd
    * meta-ampere
    * meta-bytedance
    * meta-quanta / s6q
    * meta-tyan
    * meta-yadro

It seems that this repository also incurred some bmcweb support that is
enabled for most systems (by default), even though they do not have the
corresponding daemon.

Can any of the system owners above comment as to what functionality they
are gaining by using phosphor-hostlogger over using obmc-console
directly?  Is this some functionality missing from obmc-console or is it
just a relationship between host logging, bmcweb and rsyslog that we
need to add?

--=20
Patrick Williams

--J208+F3Vh8VzMhfY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmhudF0ACgkQqwNHzC0A
wRmxAA/+Jpw09WcltsL7dbCRev0mlb+bXD6vgeZuek00mqM3V3HLjZS59vn3336w
KN7B8qBZyQEi4xrOEq696J38feaxAT8Kh+AK7czh1GYLYuTJ/YSRoKwSEgnW2l2m
1KvcaxYtDazIKrENv1Pdbh9/aLseKi1i+SR5xQnIT99nB3U2TmqMxNDbAGVFf8/u
aN5fQfAVIrh65KFl/hn6r0C16LemYXItm+yctIgRFqNq5zbiMaNb/HVJlZ6UAYgZ
7RciGFdt/pMTtASviukFQaF3z8ODciXz/ZTEBU3kqp4n8ugCt6eIVVkxn8RhGlOk
9lEHmYKoQYDQ6l7d9UfcMQph1c3JqDBtnhpL2zoetrSAB8+rTMJhhtPWxlmf3oem
uIxEp7/PCV4BdhFCVHmMyzRsylqbZsShdM6ThFODfJbZXAxni0kNyZxUwcFO2Ceu
qtL8RIz/ZbIu19pOP2kXOZqgXQqlVpS43vrMmYyLx3MUVvmEo5KqKPvlqmqwXYX/
UG0q9gFcXrQgjLRk/YgycqAtF2KD204zuVnY9vQUh/BKKpKiQi1LTciM0IWH7e+8
jjoHEAN9hzQwznbMOFVakwx/oX2JCraJJrC2+TCwSHWySlKBlOA5Q3nq1/GWz4j0
SyDx2agLfdKMOS4VaObnFhk8fSw9WGb8Fzs4EjfJ+eQaiH7iZ8o=
=UP8p
-----END PGP SIGNATURE-----

--J208+F3Vh8VzMhfY--

