Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBE96FC3B
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 21:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0mjt4hYvz3cMQ
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2024 05:38:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725651501;
	cv=none; b=JOSW63hjmnsrE+fwB4fcoUVjBxSbPFgt/1B47sMRfv0Gzum56TG3y/hEgHD15O7wX96Z7cMTyX365Sybk9gIqf/8dZ2JJnU2hJvhIpYg1zOgJQr9GVuOA2W6af4dkQ2Nonq07KDTYjljXMvGXfw/W1+9r27YZKRF3Zja97TJQ/QKcvER2+p0Yu5Gebv75yyyjxiSpnw43DKwCfFu0cfThoK+KhiwHaIvIAH5p/ROOTisRxIRcM4OUEbSSQr+oWzq9bCxprMIAOB5TIcanCZrk18uKoAEPAZiEoc1D/dFkANFd0Dtz0caU7VQ7FzSb3Iywbzf8KrSHwSUQN0w2dpLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725651501; c=relaxed/relaxed;
	bh=mriNj2jPT+t/PGKTrJKPm9ogCmPzUuwpjaa2rO6RaEo=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=IWwI/ZdyQ1Ntwt5KLBVOAarYmqFE1WBkzHjTaoDcjAEVXgIekjbOr67zQdnb4QTmqTSGWGsEDlSFPVm+iPfP0blyKMQqp2u9LXEqyiBHhJIJ1Svwy41XcUhU0HbmZ15qAs88thyCv/2oWv92k2XC8RgjiRLHzmFhyBWWSuzJNODnHU0BbPBy/JINU7pimyyT3WpAnsppx2korW32iMEXCVpHtjXFJ4gBlUI0naq+EhXrBGrNOk5o45qKbH5CpaCU1/cPGAAa6ZwHavvPv4Wk+KS1NdJubqsAs+Ahz3ppLgYeHKi4gP/AoEbe+aGVm2T77HafUbgsBY64fDvBUqL9hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GUpADve/; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F/DSaFc9; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GUpADve/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F/DSaFc9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0mjk124pz2yGf
	for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2024 05:38:16 +1000 (AEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 98DA31380205
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 15:38:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 06 Sep 2024 15:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1725651493; x=1725737893; bh=mriNj2jPT+t/PGKTrJKPm9ogCmPzUuwp
	jaa2rO6RaEo=; b=GUpADve/d5LLSkOc1OlNSxeCQU8F4g/iG73NUgYzREfeUIed
	E1fTX4btUX708Pwx8vfV+rhv4SEGACAPBQphNhkgbl6bx5WNiz2KKT44wrOGzPKk
	U0lz0pb8YPl5jYbgBcFocUWzYpBO7HS+zs1ccmekrxA5RnkJyvn69ttHbhVlXpKG
	xmsg9lHEsUqR+3R2Yoxf9H7whj1H1Ymomuma8BneLvA6xN+ifnt6CAOFXxJ9v8rj
	iTfPzFtrRpCy1aUwyFIO+7m1OvP1DnKHi1cyRNc8/IgszUfMqiKfwNB4aJVaCS1W
	CSoEnAIqQCzCv9oaJ6urvzMf/3VETwunbdvqkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1725651493; x=1725737893; bh=mriNj2jPT+t/PGKTrJKPm9ogCmPzUuwpjaa
	2rO6RaEo=; b=F/DSaFc94yq/3qihtYBYeKqDWzVjbOOibKImpB8E8IB7VqNXvdI
	k7fYLTpOHysL1/g72y4NP33eDcRGijswdxBhf0gkWA+PVrkPDX7Osfsc7cWHdt91
	hbA870FaxozYi8cbbfQimB6uuoKYOD45ANqjUHqeBxrdudSNi8HA5zuwxwBvO82O
	Ym5W8smdRnuBBMN7sFvAl2v1k7ZfKJdKLdk/I026O3zl1hnl2tr6OOAZ+p3Mzmtr
	98Fi9qOdDVTLhR++rVjUhum2rSDurOpiJ6JYXF//BGX83R+FFnqEmcOf3CBdQ0jy
	BrBBJozgbtVemQY0S1XZMCV/YsxiLUQPlgA==
X-ME-Sender: <xms:JVrbZrea5clgv94kPmf6wBsdihX7jIM5ZTPbhZjkUwt5pvmch5ZBwQ>
    <xme:JVrbZhNmbdr8Kf7z_XofZzH6-HLo6Dr0gEYb0oKjOMZuo54oSpL9AQ6wlQ9-zMyW3
    GwfVNoxQSA8Eo1YPhI>
X-ME-Received: <xmr:JVrbZkjgLdVSs8O6yx8XlZqKJjYnjforqOoTJTbdHcO7pekQH980VOMEzDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfgg
    tggusehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoe
    hprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduuedvfedt
    vdevjeduueelleekieduveejffffffdvffdvjeekueejveetieeffeenucffohhmrghinh
    epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtoh
    epuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishht
    shdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:JVrbZs-aTHOUyak4db_d69i6sTw5tTpaLq0jcw7XvPb6kTchIc_7Cg>
    <xmx:JVrbZnuoy1_dQzwRpgPyFzHNlkx799SEjQzu54XbK4OZ1wA52nZlLQ>
    <xmx:JVrbZrHaXz9RUWt50W4prZvgPRT5Dc6EFueC-wXulexK52VWG0f67w>
    <xmx:JVrbZuO0FKaqygDVpV4aBoanCGrSO_X4n9gMo4nP81UBekOsNjPNYQ>
    <xmx:JVrbZg4qd1Ic7mfoWWhZHKJLpIz7Zg7PswzPm0pjefzlC3DVlzAWarAJ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 6 Sep 2024 15:38:12 -0400 (EDT)
Date: Fri, 6 Sep 2024 15:38:12 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2024H2
Message-ID: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vgv2pyULkh+TW8uj"
Content-Disposition: inline
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


--Vgv2pyULkh+TW8uj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

It is that time again for TOF elections.  The current roll-call is
available at:
    https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.json

For this half, we have 3 seats up for election.  Currently those are
held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
on rejoining.

Nominations for those 3 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may be nominated.

Nominations are due by Friday September 20th, 2024.  The election, if
required, will be held immediately after with more details to follow.

As usual, disagreements with the rollcall results can be raised to the
TOF.

--=20
Patrick Williams

--Vgv2pyULkh+TW8uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmbbWiEACgkQqwNHzC0A
wRk6bg//T1MsHIoP0dXQe9v2bCIt2q6RxlCb1fX3C3E0BBk74s8TQYeHtl4HXVHv
qrR5LbBCWwM5YOH3GcOX7SzPWHkXG5Nn3yHsyfnQ5yPuOF+HoDWZBrjnYCsBq5oA
77oUqusaJfMPofl+WTaxubaT66QPhCNje4siBGR4xVzqbH6uAvMF5QzcYdS1+FNu
lSe2KVfWfDS755yONqMYIE2MzTO6jNXmcTu1ONXqnq8DprGQrquWzucpI2XZ89wS
qMGqMS+W1kR0MbzMeuSK737EBiaN4Go8F3ige7gL1sR6Gvn3P7eBCp2pW5tGCALX
xKDqOct6qauvwPD1lWgDvR0zCHOZuDQYoV4AQK9okOkZAxRYWEy26P1AefnJnVcq
Wx7Z8tHGbivO0ZrpRIFIoV27Uq1AV0R7dtHrn/zZNVRTSKjMt7WlCWZrzAC4M8/6
niU9auggFpOdzKNi2IUD5DcXHPFPx/2xJaSoggU4ViKbDJL3Gy5noRB09Kalodd4
v+O3v6+S796qgamrVR0vG4q5MIqZlTpKJPM1IKNvXv2vs0uNVH9dBsXFOZHhdMBR
WQ264x5P9sawVLHc7SdPv2CX2rLTZ+TAF50LwmL4QsF85T9xFiK2Qijnla3I//j3
spkMtj4n8aT8v5CNTL6hZAj7/YQG3ldZSYmkdOQqq6aWmjFBTdE=
=g4lO
-----END PGP SIGNATURE-----

--Vgv2pyULkh+TW8uj--
