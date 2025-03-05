Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C4A4F2D2
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 01:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6tvT5P15z3cjm
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 11:38:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741135106;
	cv=none; b=Io3q6AJb7NhQrhhSltpMndKgf1ZDConHvY9UqFGXnbVIOnvYc283GpO0acCO50hKpkbqX6WfqQ2x0rBrXu6JMaxOqD00G0h4dR9v4OXQEkXHz1l+nXBmz1JlKuTKgnewMXMUOWmIKQyiKZxlsyRt9neuwFCEloDD86HyT4Z3n5FFHXDGzFpEgevwL8CLDjttUUIqCj7+m9ufLIo6RbdRoPfVIIhanfy2xTn/LNdy7yi4cIjpnCP6telAHSfwmjegg6wn6NI/S2+jugRmMbvlQ6Vn2lzkfQcSnmbjTfC5ozXxTMZwLCd1AtROXhkFE4dFCi2W0TIdl2nMvc7LGgLb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741135106; c=relaxed/relaxed;
	bh=ut+Fyx8++D1m/dGHyVkYXbT3Q6MaINzOfQlUG7YuDE8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aI8Woq3rFMmFGtCvkLg37iE+dz9KJF3OaWmTtDpeAcsawQ2lLhsFCtDfuzP4239nO24D+43xvAJfLm4PBrPv8LELJMJaJ+Od2N+hJDuPWjrpvS05brJbqMHEjvuS4tw7BIp3WinoMPE41p6d1N4cGgTqlS31zrQlkqXt2gsIxH+ix5MGw8TM8Z//UBLUqgqeb4rNklZzpGIqCc+jdVXY6n5aFvz22eONOpOk9ZEqUALAiSqSugxPpBh8tmnaSDDqeQZKrVhNBLeyoL79Mln/wtDZqWYk9t9m7CvEUQ85ul7ScqOozLMLu17meRNQRi7guU2wV3FDqVn3LiuNptsgdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=SO0Dk87f; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wSQXjkLf; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=SO0Dk87f;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wSQXjkLf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6tvL6kj3z30CF
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 11:38:21 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E81E9138274F
	for <openbmc@lists.ozlabs.org>; Tue,  4 Mar 2025 19:38:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 04 Mar 2025 19:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1741135098; x=1741221498; bh=ut+Fyx8++D1m/dGHyVkYXbT3Q6MaINzO
	fQlUG7YuDE8=; b=SO0Dk87fjHTwnUPhCYCroUutMWzAsJRXLTRTnOCrmZ6Ls+Hk
	7+h/elXaGWi/FobH9cGKta1eslp7BYIR1jE1PDhj1a/N3GIthNcw3SvFDmI7z52T
	wjQdaU6cW1F+ulch1ZYyV88jIPGpqKEaR1Tv/pA73LYRj9EIC0N2PuYS64U83L0u
	MoHwbhJL8fp36631Y2lUff+PyCbBWLLEyJnWnGe1SdrUZ1/KIGWzMCUqeTV3i4a8
	PQ7AZMFvB1wTwZUVDqbOEhS8ED6tJQ5sj9MelCkHvd7caAkS8RknQhIWPwokLwXn
	ZOTYgNXdQQIsU4cO4pEeC/4+KfpansCL84AnlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741135098; x=
	1741221498; bh=ut+Fyx8++D1m/dGHyVkYXbT3Q6MaINzOfQlUG7YuDE8=; b=w
	SQXjkLfsphE15BoYuqpMv6ox+WBgvpkNbsxpqCp7xJlqVx+vxnXRhyU10hvKeF2J
	ajJ+FveWHHziZwnm+TaasJjFxONG1jXK2enegxzljV+C0cVRIahixS7ml4vSWNAH
	kRg47BM5vwFL1xpxQUTSjJOSH3RFOcipLxbts4rf6aas5iy4yELGz7bLQ+BE5ytp
	Xk8Y2m5z/q4k/IeAli9EdJX9DG0rnMBmUgFd5Oh5E/hZ4bkGHYcnFISO676Syh2N
	Gp6Nytwq88AhUa1Uvhw70Tie0lNv8Ujm905+XC+5SSwaSNVWdl9PEO6yHv537zCD
	tSi6A4OcbdDyNuh4PpgzA==
X-ME-Sender: <xms:-ZzHZ413eV0X6-Af9R0evJaKAeBWj0eCRSfizAIyZ_N_IYjBak3Fag>
    <xme:-ZzHZzGxErJ7nRipKu9bOtZM-Lwzm0LV6eOhWnpNvgmne3ZTag417bmnjJGNxic3-
    RPNvdpq3Qg5ROwF7AU>
X-ME-Received: <xmr:-ZzHZw7Qs2vMGjEWF0TBvBu9IHCAbJX13yMWRqM1UAivXhViGaWxMP9TZc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdefgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffk
    gggtugesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuc
    eophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepudeuvdef
    tddvveejudeuleelkeeiudevjeffffffvdffvdejkeeujeevteeifeefnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtth
    hopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlihhs
    thhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:-ZzHZx2WR57wPrNredmJguWUaFl49kDj0dKXuj5GwMZTRVl9P5bFpA>
    <xmx:-ZzHZ7G8WHpUKIp5UAOu1trjQQYyhsZCAe6QpLxG6Wtvom8ftMWjmQ>
    <xmx:-ZzHZ6_5YcOIartgMVCTKxX3glMqm4QgCKgPzvyhOcirEmygAjB88w>
    <xmx:-ZzHZwkb_Jj5BnGaVnVqmY56deK08kzVKgn681-JBDxrqw0epA0wtg>
    <xmx:-pzHZxNo_q0MqiPZnJZZc06T_95XJgV642yQyPfvc8ZkmrnlgLrmI7uT>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 4 Mar 2025 19:38:17 -0500 (EST)
Date: Tue, 4 Mar 2025 19:38:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2025H1
Message-ID: <Z8ec-DOTlSM8FMhC@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MfvuOkDevK6mm6o4"
Content-Disposition: inline
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--MfvuOkDevK6mm6o4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It is time again for TOF elections.  The current roll-call is available
at:
    https://github.com/openbmc/tof-election/tree/main/2025H1

For this half, we have 4 seats up for election.  Currently those are
held by Andrew J., Jason, Patrick, and William.  Due to slipping from
the developer membership, Jason is not eligible for re-election.

Nominations for those 4 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may be nominated.

Nominations are due by Sunday March 16th, 2024.  The election, if
required, will be held immediately after with more details to follow.

As usual, disagreements with the rollcall results can be raised to the
TOF.

--=20
Patrick Williams

--MfvuOkDevK6mm6o4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmfHnPYACgkQqwNHzC0A
wRn6YQ/9GdRYni+X7g/mDZpJu24qoMBwBHRi4+Xj/ROeiE4U6EbG/hE87tZd6U1O
LEXQs7KRDQtPCx4pFbQyNhGw3XT7D0fRbhWzmiMBbFAGANhtm/ocaHJWJ4TkK1Go
gtqgPFyrbIL73rErBL1+QhMBYk+K/5eXcXYlB3JC1+bzOce7O5JrVyFUZWdDjjbF
//3vf38rrIOuKomBMj8mn+2OQWxca1YOOFX819kVAhzR3hNq+91rwdZMUPgz+8JG
79j0UWER2hWcEKTPoQdWYEmPYcWyIGYrSAhFJfNHn78kFHOrETDEy8TzBdakWhn0
QkiREz7vEvL0OeHmdNlAdsXucDndVocOhU5YEFvy6Po2vGBnd6bezpY0hBgceTs9
U1Fn4a0mgSVk4d+6noMbq31rov4rRe0E00TOH4/81EF280EqWlvt9wlk7bL6PgWp
EyIpRgavabBI72YEXiJrTKMZPgp4U8K8nHezxWIkBb2gvbxr3vcObk82MbGSsj/P
XKD4ObnkQbo9z0SFzRREXFPX4M8FHhR5wUp0iHgH4M3eDg1V4EZHEghO2hmhkUmj
FvKYol9pEMEuvodU0nH9wOMGwdV+b0YRPKqLKf9k01j6FU9v4JSuyuQZ9rBNJSXw
jtFDr9+3++Dt5s/pVBcG+Di/RAZFdRtyoqWNTtnzjvdGiJFzsoA=
=909l
-----END PGP SIGNATURE-----

--MfvuOkDevK6mm6o4--
