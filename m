Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199298B903
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 12:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHtyF1BjDz30T6
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 20:11:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727777487;
	cv=none; b=A7AVtZLdHaze/udbWLu2EMizHEQapeQuC3CxN1ah0HSGxXX4iGT3nQ5P8DxrarFooXQMEe9faV6vPGHWy8KdEd8xQBE7wALmBqsFBFvQtNMIDizS4r7mnas3f4thvdrbCAYRJ58yIlRqFjEp6Vcwcf/a9mGIaRuwa6fm+ITcYpnJgijh4+MhQzEQJn3F8mHx1IX23CEwzyvsMlaZEaZGokHePmhOB9tl+trNrXn7ETny2dJTtzvcOYrFbu/EDAkmFZSDxzN5nQ6A/gT5L1kUJ3gjFmIE8mhxBf320SLuuB8D5qysnC7+OZp1LILWxsklqd1LXfvYektmZ9O4l99aOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727777487; c=relaxed/relaxed;
	bh=t7kvX5e+VnjTDgjLqfyiRBEwfl0KxygOVpHSVmIE7a4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV9nfCdkfOSdJUXAOi+VLMt1R0IETcp8xs2w30Dpd8PDN1RAQxQ2uyDqmJCWJKXEYCudGM2cdkR8xqdIe2UR7hh/YflR3ZcfZOdmK4D4El0+PBFBKlWZEmFCG2m7JWFAf3opdTSOQhKOf1Yz3kxB6phqcc4GiawenCkzfa/7AjBnfYN+l0/fu6RezW8rzI9iRKDtzezIynUTYBvJlzyG3xA8JVC/LF6lY+tIevHyTPQBFd3XfGdw0DTcAueVpU3nMRmosnOKQg1UdWZex7QuLtHth//f766GhjaAXd9HuXwq1+zNXm13RvKHqfuRYQank1fETA7gMlKxJwSFS+kCCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=GdA1bdsG; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IRnKZNN5; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=GdA1bdsG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IRnKZNN5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHty43gLFz2xpf
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 20:11:23 +1000 (AEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1611A114120E
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 06:11:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 01 Oct 2024 06:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1727777480; x=1727863880; bh=t7kvX5e+Vn
	jTDgjLqfyiRBEwfl0KxygOVpHSVmIE7a4=; b=GdA1bdsG5GgihXqtsmwyKvHrwF
	hYJfYd94Tm69K6wdGEeZGs5+NKosIImlVNRfQctPfwRFLq3jmGQu4pzVhQuWQ/eq
	lw1KdnIwiBFtR5clOC2cQCQ7Jm43GZ7fhaHnhiiUXEurAiyjDzW4JkewUYJ6hbj+
	1DRSTd1eeFDglGn5MB+SJMlCk+Dkq16QhPGeOVL2eI5vZ49sGK+SmgA25YFDO42v
	TaEBpPmHRuiZWd2XMOxuSyDfbcHuu2syM6iz4wpFzYZkQwxOVJrgdv4OX4rqt35c
	enQb/sIXL6XAMDvBsrhThIo5SUFoYlVIWDBQvIXV78wTCe+wsuDntmYLy7qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727777480; x=1727863880; bh=t7kvX5e+VnjTDgjLqfyiRBEwfl0K
	xygOVpHSVmIE7a4=; b=IRnKZNN5NKfBe07wyJLh3un+BlXV08G6uFtxYQv7kEJ+
	5lhThSzOwKdAnKhl+BEKFqPup0k1Fvd1FmIt/FBMrPQkCjgV6fLpK/eutQf20J/6
	Jrwfzlm92w6DvB5bNhZsqnIauqsfvbo6B+mRuh7QD19DzXvFrJ8laO4GWn4tFV8W
	hNNGs47TSlTu7EVY43DWrAheTbNY7hNpyx+oy5rIDr6UXVYUrlC9S0agxzs8Wm5p
	9brFSAsHlN/NaqeStB9ymhUWDCLdwwnab3V4tGEi+Upc4ltrUIrnt570/9Hfikab
	KM6P3xQvpNORHKa6KAYtfVh/p2oBE3iiIGQHafdpCA==
X-ME-Sender: <xms:x8r7ZsQsOKva6NJfE3gcFYkwtekj6ypwWacfI6flRaotCWWBgK8AxQ>
    <xme:x8r7ZpxDyeMSzlmfxiAO_fLjqEuVy43DkyzkUCzhL5BkZuh9S61huwA0jg4-jzcd3
    _d5W6Y9u6iQgfv8Q5A>
X-ME-Received: <xmr:x8r7Zp1JoGIEbPxsjuReMRZDRGSC3J_x5Coiil75ubw48eUQfG4KolPAmtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddujedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhgg
    tggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuc
    eophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeef
    keetveffgeetffdufeehleefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtth
    hopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlihhs
    thhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:x8r7ZgDSAUi24Ad4SMlP3csNxfaQfajNth_QKRvC5305PV0AuZTnSA>
    <xmx:x8r7Zlguth8PYA2OGHG3c01ilrEczl3w6UIGLTuEFoDV1gFC8rtEmg>
    <xmx:x8r7ZspnO7gew5djbl4yPOTt4x1rDxqyIoDGwJ_mgSI2_kZ8zS00xA>
    <xmx:x8r7Zog-YB0VaiGGRSjdKdlsKsLYNmyEde8h1OhiSPGBIRmzPSDEmw>
    <xmx:yMr7ZlYdAd8L07KmX_g1ydboB90YIfh_8xvP9uFPZnTY2kTmPDympNHO>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 1 Oct 2024 06:11:19 -0400 (EDT)
Date: Tue, 1 Oct 2024 06:11:18 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2024H2
Message-ID: <ZvvKxr6Fb54In-4E@heinlein.vulture-banana.ts.net>
References: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="degjDfMT8IABNNi1"
Content-Disposition: inline
In-Reply-To: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
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


--degjDfMT8IABNNi1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2024 at 03:38:12PM -0400, Patrick Williams wrote:
> Hello everyone,
>=20
> It is that time again for TOF elections.  The current roll-call is
> available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.json
>=20
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
> on rejoining.
>=20
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
>=20
> Nominations are due by Friday September 20th, 2024.  The election, if
> required, will be held immediately after with more details to follow.
>=20
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
>=20
> --=20
> Patrick Williams

There were 3 open seats and 3 nominations: Andrew G., Ed, and Manoj.  As
such, no election is necessary this half.

--=20
Patrick Williams

--degjDfMT8IABNNi1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmb7ysUACgkQqwNHzC0A
wRkMXQ//YcQwZ9dzuJ12EaUEHb3q3hAS2XFe4tFujKv365bIx7jlldlbTT0zuchn
iQDX9m5iCYUOcg2kOiK7nJDYtm57Y6eSHfDp6aUkBY2lYwBsPV8hNQ0fr+PYQrYO
BPw1qU0I/h3TIKgL6fyLoJSPJEr3rNnFdO4iNOtqQW0PjLI56w0cMejaCcut2ogn
oLihijlM1sE352HdsKFWYQGoOCI13xOFZ3tq9jYlaT5L6KGmBy4+bLpQBxUkelY0
P4fBSj0Hb4Oo0MbFPmIK+xqUDnSucvAlS5y+gziCcmii7lPei9kUo1N98+HfaYUU
jmthqxPyD4x6tYN29/L1UfmBoOZiCRnGgQHzzx9sbvJhqkm8X0Zg6Qgbkyl05HOF
fzTEDIj0eN66EjhJlflzhdQ5Y5FHUEYySR7XJg5VFI7m9z13dNqfn0E6PP1Hr1UT
+kImbCdlsK/mwRZV71VBNtaDmJx3J71N6xSJGXENKnx22r9FBJUo7acIbswzj+gb
oEcfkJm3cvmf2dpA/4i9c+8XTMtRwpLFkiMLSJQPTZNYJmEZ5VYdXNyVn+qt7f7Y
Gk7lYKGbBbIYErW2aQyWl8kO4bHuHb8TT2ri5lzTdwjpnIgF/OcHpEDabJ6E4WL7
mCKXG2QzTZFSWAMSdb/CER189Ot9JYhNJmMIbqbep5s2m255Z2w=
=T+uS
-----END PGP SIGNATURE-----

--degjDfMT8IABNNi1--
