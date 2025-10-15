Return-Path: <openbmc+bounces-742-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22BBDF245
	for <lists+openbmc@lfdr.de>; Wed, 15 Oct 2025 16:44:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmv452sXNz3dHm;
	Thu, 16 Oct 2025 01:44:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760539461;
	cv=none; b=nNzVhVFFrf/m+s32Q4u20mx+Gv+Gp6J2f7pOprJq6MBUajy9YxTFvm/VXlmTRVBeal8uqVfkQnEBG339B+orvlWDiyHLC2XbGDP+4dVPGuY4yQczvlXrBI/hRqAr6QJpkQzs3k+w0Uxmc8lQnmrC38XirOc+L4rsm3/gKkf2FM12+aUXhFW/N4qXiASVFzyPPbJvpoAuPsfhB6p4H7y2o5zw+eKPtJZK6zNTfs57mtNumgnX6HAcr1NA+8Ma0Jkh2k4hYIzNbSg9eMJpMQpEr/SpT6s+PpJQSDkbgf/73t8ePWgAblpEOipqP3IQEJ0HTvV9in1hSgBYRtLCV9/1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760539461; c=relaxed/relaxed;
	bh=WAANnyHcNqT71fkunCGIz8y9ZAam3IRpwyX+yeR84HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJc5GlfQJDimRYiq7jKmPmPaZ5IAOPIKKwfGjNC2j8L13v18dUJmXcsu3wn7GOmxF8jWgpNG2n90OPbuJkM+tE185U1b634X9z7y605JooH+2e9haMB3QR7m6PpMrNJchGzjKG2e/UzfoUNtakm48P3l13S+7Le0iF2qJpfMay/MWtaeaJ+Y0g65xyrMWrF9vcUMyjA2kcynsBuV4PtusKPup8+3K2yG6p8A5j5RrZfok33jYDbspWcT2d+ralK51wIvr7nN9XWsX6gVID3M8uw+YAHnkN2/2b6tCOp246kexMCAfoyR8yPcQMJeJ+2aDXZ40EChhKiQnZlwspv3Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=HMs9BkLX; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AreLM+Ox; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=HMs9BkLX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AreLM+Ox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmv430hTqz3dHf
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 01:44:18 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 80CFAEC01DB;
	Wed, 15 Oct 2025 10:44:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 15 Oct 2025 10:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760539454; x=1760625854; bh=WAANnyHcNq
	T71fkunCGIz8y9ZAam3IRpwyX+yeR84HU=; b=HMs9BkLXCFAya+YvAocMjUizSD
	bzMjVc+1DBgMEkdgghaMxf5dgVacoTkn6csbpKSBiSiQLHeP/5hMY2+w6yPu4hyY
	vrGV+nogWULRGitDKcdgnuDxiPA+FYwGtFafkM5KK8Oyr+vMTEKtFoCdX9HSYoc0
	dQ9Zr6yYj4xG1Smj60mvat/4g/AjICOJyEqvWrb/++BvvwQ80vYwAa28t4RUfBBM
	bQ2B6Z8/EKOFRppKi/ag0zW1ZS8hQzn5omIWlV7BgWGnaejhwyzOR6iQtgIZyvnz
	1MR3o36mdp/OO8/QIFgVwcYpKB14s6TQtvUIcJKdjJX1AlbVYEi6pUFA6ktQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760539454; x=1760625854; bh=WAANnyHcNqT71fkunCGIz8y9ZAam3IRpwyX
	+yeR84HU=; b=AreLM+OxZ8ONsYwmNGSd0tCw/VEok3hh5mc2Yw/hFDxWq0oACS8
	5ltNGu40WsIPK33ycaFtv2D87ua0tqFabSSi4ktWBPBSbIZ9DkI95o9+0kwrkFwf
	4pPwcdOadBfOp2i5YcFOL9T/sMEMbaj7v8CYDhepvZoFtNBomIBBecrDsig/4yAD
	z0Tv5o+NJlkcN5DSh8xtmgmbAQmhWecUfV1p1Z44XC2Pw6h8hmF+Or5A6WDfSVAC
	0xmF1RlTxHs4sbU2KX2ZCa/q9L8scUfnCkaR1Z79R/mhUpLBNEoh7oG7XsNJ2rOM
	DeKmhF1giTZNwOL3y3hGb1O+UeAuk/HAU9g==
X-ME-Sender: <xms:PrPvaIoxcrGEazP6ccMGaFUH6x-7lPFxwTKrzjG2AZ0H3Op1Yk1fKw>
    <xme:PrPvaEqz7FXMw7j0eb--_ZG0q_8652eEhvQmyoPFJx1JYSvj6nQz7PEZFNdYLu2-t
    oykGBPAGM2-gMeaHTgUm5E72C0P2EOhegh-o7rujJsuErPnjZsizds>
X-ME-Received: <xmr:PrPvaK3IXedOXo46BBEtavgSwdgGMHQRYI1kw9hw8vzPqDZ8mtjcTK5XCro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefteelkeffgffhgfeiffeifeekleeh
    jeekteekueetlefhhfelfeehtdfhkeehhfenucffohhmrghinhephihouhhtuhgsvgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegvnhhgrdifrghlihgushhhohhumhgrnhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdroh
    hrgh
X-ME-Proxy: <xmx:PrPvaLAokPKtxmEDKY5IE2aDTNv-KK6JE9diSQJA21KD-XBNfDIe3w>
    <xmx:PrPvaKfw9detdfxoCqX4_sOWqSox_ieEEffwNLzWl7XVrSXTGsXv2w>
    <xmx:PrPvaIhseTNhH94t8Hkg4-zVthmPKXdCIeKYpBMHYVcyJgX6Jz5iag>
    <xmx:PrPvaKoYKtudKEjimMvJGD2UdFkR90cObR8Xcjz6FntqT1JT_9_qpA>
    <xmx:PrPvaMl1ejVG9ImyVI1C0mc_X6G0nT3aJnwk9bM5A1FcQuN1PFwI94p5>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 10:44:13 -0400 (EDT)
Date: Wed, 15 Oct 2025 10:44:13 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: walid shouman <eng.walidshouman@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: IPMI Subsystem video transcript language
Message-ID: <aO-zPckgL6MOtglX@heinlein>
References: <CADaxruKBGgMe0rEKbid14n-xXbMWaRPq49f53LNDmJDg8O2JZQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="llA/15jf1R4fN9Wq"
Content-Disposition: inline
In-Reply-To: <CADaxruKBGgMe0rEKbid14n-xXbMWaRPq49f53LNDmJDg8O2JZQ@mail.gmail.com>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--llA/15jf1R4fN9Wq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2025 at 08:43:12PM +0200, walid shouman wrote:
> Hello,
> Could you change the transcript language to English for the IPMI Sybsystem
> video at https://www.youtube.com/watch?v=3DtAiua7CJ9es  as there are some
> parts where the sound is inaudible?
> Sincerely,
> Walid Shouman

I adjusted the language settings for the video in Youtube but it might
take them some time to regenerate the captioning.

--=20
Patrick Williams

--llA/15jf1R4fN9Wq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmjvszsACgkQqwNHzC0A
wRk6rRAAmkUMw8l/QoaBbAI89/1/FK3a9YXpXGzeI1hgKyQdH1eyf4DBag8FZnTX
0bA2WK50NsjrSkkybDpLcd1HW6zOF6uNRweT+MCkDnjs37ttJXmPNFKq6zfo9DGH
xjOVaaG4h+iRxr/VJ/sthn+1swxN0pFc9A20ytRwLVnErfnbuuTfnWcNneM0wiz2
c3KXIEWE4oVO8tn1eaGxQzrI5f1BDAwbY77b3Sf7CtdYC8BbMqOLFnKgrqC0gZB0
CCaL2v9PTIE2JIpGBCfOLuCpfvaTK5CUHTz9PvCAPQxZn4YeTsTgQxx86Vgr4PvO
rJsqDYxAabTCQiz9OhtNI77gN5VR+ATc/g9QTN5hd5BrwCA1BPEFMiwAxckWfNHO
UQQBL6mtWaQ2BFZorZWCZKiBvTZi+tcvTSGQWyfQj/LJ80Ovk4AZOweOPx3Yt5Um
25icGbZ4+tIqKu8d7DVe/xLDjlx4vONurFndxsJkCIpTSMJlTh9yyvqvAtSos+Ia
DajlvgjIzMzSmT2gqYhhiFkJ7jZjqtoVRe7SZ6VV2ztEKEfARJvQn5IOvmcmXC4O
JalEjVH/Vw8j831yHlrd+vi8MOFpBEBnpOkBWDxcNS5qHNScCiutzwZnJORxRKc/
PTRovE6Cx+EYtlyBCDRpZpIjgcJRMHXd8CYHgkK0dpyylUwsGTw=
=96Jz
-----END PGP SIGNATURE-----

--llA/15jf1R4fN9Wq--

