Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B3671B73
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxkxl48Wcz3cfP
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 23:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZJ0AbRgB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=buhiouXl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZJ0AbRgB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=buhiouXl;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxkx41Hcpz3bfK
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 23:05:43 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 6CFB65C00DD;
	Wed, 18 Jan 2023 07:05:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 18 Jan 2023 07:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674043538; x=1674129938; bh=J4ufYokEov
	X8bFkYPz6SVid2kBFhX9y7C5EMTrt9V5c=; b=ZJ0AbRgBiPs6PygYv6Uk2xd/Jz
	mppG4blkc1Rxz658pOItMarHG9aUkaKrlev1rZWwkP5FAGyFU1FdfhZAwj5uj+2K
	F0JTvPHCXf4MVhTJTvoZi+9eQJSvPp0Cpwts7djaLg2NUXAXiPSwbdOoVDyPLclr
	/8dZK/dQZE4bxAwqfSC/Z6Jmtmu+tgt4NhWcl5JuZO/z/9vrtvywATsXAybDj2IL
	gOUkrOOhuI3tgRlz2ANMmgpz9BVI+LkGZMT4RX6k1PYeetW30hgHFlVp25s/X2n+
	fJj1bVccv4z0zL2XzlI2ysP5v9SE2kURa094HwgZqWZHPaM7qx/ir+HTgJlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674043538; x=1674129938; bh=J4ufYokEovX8bFkYPz6SVid2kBFh
	X9y7C5EMTrt9V5c=; b=buhiouXl4pj0yi7Lb1pIEtBbidtASdX43Wy4AAq+yMS7
	b0K34L0FQzfOGzaYY4YPuCXWIZBY9yK0eRo8Bq61WPOnBgznfSHFtPWxMgOd7t1Z
	H2kTvMcHMFCgErte3J0bpvRuCI3QZSsYqpQ4tf50FCFIZelP/d4HNa2pKFKXeib7
	5tHZ37BJEmAdYaojKNIsb//YmVcXVaKDbT4VFSDc8acP1mCIp17hDFcJDIQPAQc0
	5R4X0wGUyxPhRvNgJnzTXCeibdupVMCB8t1d+qGDoxGGHAuYwAQEixfemPVQwiWK
	leP8CikslxTSFCJ7Jqymo3b1eXNnvR70iMpUMyOsXw==
X-ME-Sender: <xms:keDHY6KPWRc0bIIsD-I3DiIM1FOtljfxUS2Ek3WtQmaDGgLIa-fYtg>
    <xme:keDHYyLQe5XbjKVmA66YbxiiFBilsOAxMs-gu1rPCo3Tbg8hoaHFIimN7xo0W5Vym
    7iQ4ASzILXinXqV49I>
X-ME-Received: <xmr:keDHY6uCbjWMo9dEw2rRc_g6Ew2Lag7zdLYjrh7pnc63z9Edm1Du9bj4YHr59fEzp_CHVsSJ4QjcIAK7a4V0MZlstP1iwEu2kKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddvmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeeuffegtdevhfdvvdefueeukeefjefhjedvveefteeuudeuudegueeileefhfevteen
    ucffohhmrghinhepnhhishhtrdhgohhvpdhophgvnhgtohhmphhuthgvrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgt
    khesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:keDHY_aw-g1UhqYsWEnX8oawjA5wG45V2-ivAqCQmovSCia9wSLXrw>
    <xmx:keDHYxYhxuHZkewfK8otB3E0Iw7uMmwHByLadFnNe-ohFwoo1byKwQ>
    <xmx:keDHY7B2RDhPmnkpgas3NpeWVYUcQ8V6cXfBPWCTfzWdNw62U6noAA>
    <xmx:kuDHYwylHvoraUc8qMsbRar__oeHKMvm0lVpG5uphEpEhrDw5VOLxw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 07:05:37 -0500 (EST)
Date: Wed, 18 Jan 2023 06:05:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Richardson <mcr@sandelman.ca>
Subject: Re: BMC image generation without private key
Message-ID: <Y8fgj1VTa6G1Numj@heinlein.taila677.ts.net>
References: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
 <27195.1673986900@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xk2xoDjjxr/jkmex"
Content-Disposition: inline
In-Reply-To: <27195.1673986900@localhost>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xk2xoDjjxr/jkmex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 03:21:40PM -0500, Michael Richardson wrote:

> The build server requires authorization from the holder of the private ke=
y to
> create signatures.   One way is have direst access to the private key.
> I think that if the build server is so untrusted, then maybe there are ot=
her
> problems :-)

I don't have any security guidelines or NIST papers[1] to quote here, but
my impression is that this is a great over-simplification.  Every design=20
for signing firmware I've ever seen used in production separates the build
server from the signing server, so there must be good reason for it.

I suspect it stems from it being a lesser-evil if someone unauthorized signs
a one-off image than it is if the private key escapes.  Build servers run
a lot of code and thus have a lot of surface to attack.  A signing
server can have a single remote API ("here is an image and my identity
=2E.. give me a signature"), which keeps the signing key(s) safer.

Requiring the private key to be present on the build server likely also
precludes any use of HSMs[2].

1. https://csrc.nist.gov/CSRC/media/Publications/white-paper/2018/01/26/sec=
urity-considerations-for-code-signing/final/documents/security-consideratio=
ns-for-code-signing.pdf

2. https://www.opencompute.org/documents/ibm-white-paper-best-practices-for=
-firmware-code-signing
--=20
Patrick Williams

--xk2xoDjjxr/jkmex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPH4I0ACgkQqwNHzC0A
wRl80hAAmQrjLmnqeUnmVSfLmdILx+5LtyUDe922QoKmCNuxUwEt+rV8qKslMbWA
y6sKb5fstZd7rpVin4xJGr6BdrgaYf/SD4ccrBD+nsCDRZHjDICNQn+LWRHuEgw3
N9B3U8o8CtHsq+myCPBi5z7yba21BJMGDPxP6lOyP++l17s6+EHpgyMKm8Tu/iGk
QQ7yN5y6jEZ1wTmcrv8RHiEljw7/Pbnb1fC3+qR9li4DmVPuiU2I9CACKeY7Jcgc
tYWKrY/ubd/h/W55KRKpBJ/0tYsPbjgwPgKH355xaNGsKG0v3Eg4mhVn+CYMeWiE
v3Sa5ZfEo8icmakyA2+9GfGOxQ0ebIIwUzaae9bHfwNzSnl564mo8jq5Jlb1AN6T
xVOdyXDUnRJeXczvYBcXMO5uy5EOl4iGwHDLQ2n0DNvvOZmASg1HOZbOW+nUjGX7
Rt5tfl7V7fiQJY+PEPZCbYF/Ph30+mUejSwvENdDWaOrk1ScxQxevCdA5Mtt7YWm
XI6GW6lOx0zTDqgj+9iGD0v7x+EDcDyaZ2HRCQas/1kI0XzSpWWmmwvm1FKrPdvi
Z7GeZwTbIbPFYtqZD+HNLgslRDhwcTXtVJu4QTicNflxjX97WUzos5oE498tCYRz
Q5Qc2x7t/KYwhtRw6EwEbn/mMfFyNwBiE81g+gHXivYTWFu6tMk=
=1B0l
-----END PGP SIGNATURE-----

--xk2xoDjjxr/jkmex--
