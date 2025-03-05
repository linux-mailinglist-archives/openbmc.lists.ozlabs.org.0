Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CDA4F2D9
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 01:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6twR5SQWz3cj7
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 11:39:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741135156;
	cv=none; b=hQ/62LNJn4tcpc8AfMAnyaTHbV8ImTVs2retU2ybDIeIgWjgeeGRP2XOgMgM2vmzPgwZFOfswh5NKle0CwWaPA8okmwec4Bjjc+D3lAUgC/DmMe2jk2ofwLL4clBzm1OojQsbo4CbSd3ZOU5MXaukC0gW8RlWkKIlWB4bMmta6BlWPmJhp8OZQ2SCNL5VcZm0TStQ9zuVpyZewOijSSvUMzVbhb+iepeCRWxGiMjjjPanDyCOAqysbd0LA7T89Aj3iSGQdEqkV0vivgwB9MxRn2/0+lsGrHUofTeUYNxN6NqFpLf2IvstmswN6VyTzjGE1cGHwWh6XIQQ2G9Ay4MkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741135156; c=relaxed/relaxed;
	bh=KYV1qKc6uKeNxbkIdS/7d1/IuO3VcpNCdh7xCyRTSiI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcWBYZrppiJHAa67l35WCm59iuG/GajqAqIjrf531pk3kaHbDDioB8WPazqueb68rUDAoqQz9dRDRLsYZ+Niuk+30qttZrJiJGQOaJbaoa9e9u7spSeRexBESYycSqA5NJse8+4q00N134vAvrgIvD2HmVh0lPVi7yk5WZYljyT+/o07WLb7olKCGneaqqRpDVbhe9NJNzqpUXQP5qs7R7R6WiLg9A5xVdWRYjbGXtnN/ii4uiN14boFKYxJsI90SDQfX5CsHjKDUER3qgeVqS2hr9vv5DQCiQOMGrKK8XmSTnCwSFgEdtArr65k/O6o0q89qrXHXp6tOCDskxgwag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=C86tmh8d; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jJA1Ubut; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=C86tmh8d;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jJA1Ubut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6twM6Hdwz30CF
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 11:39:15 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC9531140255
	for <openbmc@lists.ozlabs.org>; Tue,  4 Mar 2025 19:39:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 04 Mar 2025 19:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1741135153; x=1741221553; bh=KYV1qKc6uK
	eNxbkIdS/7d1/IuO3VcpNCdh7xCyRTSiI=; b=C86tmh8d/DgPSJ/KRe2R4wFmL2
	4n/tnf+6qeZVqC9mMLMF3xp6scXE1I24FI1unS3Z1yitQXx0JibHXJl2FZCgVn+t
	u8/T8PLSA8Kj1KTT5NDLgP1V5ExSxUdElN0pDItNR7HOY7coP4LGis1AqU8xInUf
	xWL9xI1oovWa6DzBZpDHZyx/J32JzURRobBiHxnGiJb8bfTY4Gt4MdKpz/FHSRpJ
	TWsg6c/L6/8vsXcv5OHsFYpmjYc3oAF3aZ6RUoG+UROb59AIpMzQ3zTiW0fgX/kK
	jVBplnQoV8DDiASjCJhR51KSKseiAFrDVVMf+GdwoCk1Z7ZjqjMl+8lUaykg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741135153; x=1741221553; bh=KYV1qKc6uKeNxbkIdS/7d1/IuO3VcpNCdh7
	xCyRTSiI=; b=jJA1UbutKCQgsPDXbyU0sgsXT0UyjWautqovIA+Khhb5XQMV/qb
	2GOWT2k1LKVl8Vv3S9wzeIxiTTgoWVsFsNBbYtRitO06n51oLJdOCck8VryaxxBz
	fqFksMiPCg7+XbkJ0TQX/lrB0+F2f86hsdiS5FgMr2yO7U6RQ7jOPtVhXWF+SoCO
	8w0pgN5pQmjnEFizQDSIbRQBKlEHKjR7M+Gop3WQl3nZBXz1HWz0TSsQFG7LXgqX
	dH/Ds5tNo1oVPgg6RwJN0m86ylOxqWHcyluwENBme3yF3wpIbCuj5Fa6Mxkub2m3
	Yh3brSVotR/ePXbfzT25Lv/wFuBj/sCsfuQ==
X-ME-Sender: <xms:MZ3HZ9loM8rqbLbqM64PC8vacq8D-SQit1zC7dYGOUEx09jsAQzarA>
    <xme:MZ3HZ422GGZPS5rHdUasFKAdXp9PYOPfLa6JTIrlSgTlpaOP2O5DFiwZ2AfKsdF_r
    9lLyVCdSj6wag5zr3o>
X-ME-Received: <xmr:MZ3HZzrA5DMAPa_NXcllsYgQOMrSxBiVgfKUF_Xp-aERpgfuzeRbihPfLQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdefgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffk
    fhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmh
    hsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeeh
    heefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhes
    shhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:MZ3HZ9lgdWO6kRX3TPkGIFF5aKUr8pqtxrxl3dvhcg-SiRM4qc5n_Q>
    <xmx:MZ3HZ732TIDo2XM4s4a5mFgzGTFwucVDmEBHPu59yxL_uotmSGoChg>
    <xmx:MZ3HZ8t4laNqOR3t0NtpeCkpWTPOfr-znnpnEM3_QqQ3d9k4k7n1bg>
    <xmx:MZ3HZ_Vh7Mj7wEywayliFU81QWxrMEiTjHKDOEASNMHRMjh2M9YAyg>
    <xmx:MZ3HZ09O_JqlNCLY7yae6MK5A3-3eVptcGp_FboQYivhM74QJRg8uRIR>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 4 Mar 2025 19:39:13 -0500 (EST)
Date: Tue, 4 Mar 2025 19:39:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H1
Message-ID: <Z8edMK1Pik3F8WEt@heinlein>
References: <Z8ec-DOTlSM8FMhC@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="37syhG4jmcQj/v0m"
Content-Disposition: inline
In-Reply-To: <Z8ec-DOTlSM8FMhC@heinlein>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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


--37syhG4jmcQj/v0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 07:38:16PM -0500, Patrick Williams wrote:
=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.

I will nominate myself for re-election.

--=20
Patrick Williams

--37syhG4jmcQj/v0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmfHnTAACgkQqwNHzC0A
wRnrlg//ZAqv1IC5KVBQXCGgi5K/a/UCjbT8u/OEjKEZyZdVzGZk4eV1B476hJmS
oxdtZIHJcNRdOQ0bBw9SydPGcyozlbt0HXiavqzIC7+XwlTYK3VhCRVE+EN6af+D
vLiRtKxXTc77QkVAgHhHaP5hiurT1MZNKtNC9L2A4aOWi2HIdOMNAD317tcjCyHu
2u+6o69Nm4d87juotPeeIlkzgIhKl9cOv8gCnh3V5azcdayjY4129pPbR20FCoPA
ADy9vet+hkIrVoAasQO1soYa6EeLpda5S6JDhsO5T3ag4pkZoDfUnThFN2eep1gD
0dbeonki0nj64OPs9bMz3anpKZAo6HnepviBpkOtOwl77Gd3Y9Kz4r2/wT/kzixb
h9Nos1t26oaZwR1XW96Xez425fxX0vg+WZGn75eCIW9reuYlR7mWJw5D2KrcBC2L
VWGA6uUWOe4hZAHzodU0Vq+yK/9wSid6yuVjN6Fh6ZqDT55+KNwWzrRhZqZd4qye
l/qLI4ry8CFKmO8M41vJc8ITyhyKuWLq2lIVLFcVnU+HplzUPj9KFwaIV+eGatil
C3MP/roWFZrVzFxec/XYAYblUFcv1ddfQz9SMUdUm1eG5DBeZmDqNDSOC/DCZDbi
bTtdms41ccGW3WRvPq1QDQAlSj39rUsxAQ0SPgK0YhLPNT1btdA=
=YzOr
-----END PGP SIGNATURE-----

--37syhG4jmcQj/v0m--
