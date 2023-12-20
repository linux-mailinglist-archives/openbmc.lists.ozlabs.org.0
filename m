Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7ED81A5CB
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 17:59:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=kCL68Noi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HWdZ1gCI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwKXR2Dy6z3cVj
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 03:59:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=kCL68Noi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HWdZ1gCI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwKV35LCVz3bhr
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 03:56:58 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 852C73200A1F;
	Wed, 20 Dec 2023 11:56:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 20 Dec 2023 11:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703091414; x=1703177814; bh=mydwDB5dxX
	8btif0tSIARqVPrTI/W3G+Q9aMcIcylzc=; b=kCL68NoioIHLYGN3Eo4v83QMzi
	eYpsoSbVPzvf/bG4qSjO6IaJbz51Il5OLGjYk9uswiTU76fDQqoarsXkr297qada
	NgQH1oCmDWDHVUczmzE7k2Z1ilGDCdUTZSyW8SZu9gs8d2g/8rVL4sSi4OIwruWD
	zHRM6eSWgfpz2Tkpm9V96W9M2k5x02ArLo5dd5I1NvMrkAZiabJB/XlsjP+wACOn
	FXtQJOn9ZR8j2SxOC6MvQp8Q79OQF7hHDrzAp23bEIhwYOE3lr+e1uS6r7y18Eem
	KQSUTFzK6BCdKDW/9eIeGrJrDFexAbLw2npFAjSRpgcCqQo0QEDMpTRNTGFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703091414; x=1703177814; bh=mydwDB5dxX8btif0tSIARqVPrTI/
	W3G+Q9aMcIcylzc=; b=HWdZ1gCIQg9aXVYmxPAqpNc8mfC/mTFH+hHfSGoglvcU
	8QsqqplRl1Qs41gboiPtQERk1yZ2bj59390tPIxnvBYmnYpgWuCvGghxjYf4S61+
	IdTm0WZUFE7SnbWO1/yvQH+CavcQZn9yRb4LDBAWrWYMy5/4ovNwukmlbhhuDb9P
	+Hi7sADbGIiBm6GrYNolpufWK+IO6bDnwlEVQD5YE3ner/NeJq1Qn5Q4mpvSul4D
	R74WWoWyH4JXjF+EJKcNaXhd8ggfuPeRe88MhIi8Blg5TxgMoN9Rb/zeti8cbTfr
	9zouQZuJoWjyQZ5P05B3wAMJLBQETBMMOCK+KEDF6w==
X-ME-Sender: <xms:1ByDZRJwf3bQxjSNN1NWcrCBor5qi3GtJ0sNX7NvmnpvDPm4diQOgg>
    <xme:1ByDZdL_gCd_FrR5JJ2_pQM_CcTRapm_v4trDvWjOtXokB82nZgWtISny5_yhFCKO
    IqKHcMP0c4KKiycu0Y>
X-ME-Received: <xmr:1ByDZZvwu6CBuKr3LSHmv_4oOKybtuRcbDaZKpGz4teAY_z2mxiTd4CixULQJ5KCrypCqrQfv9VfdFbekksHWneG_YmGow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
    feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:1ByDZSYg-Mfx-ITq8xTCoVN3zvOe46oot7oJpZM02_N6nJJjTNpUAg>
    <xmx:1ByDZYaY0-SJFMQI3JHtTDlU9rDbWmyRn3KzUFQUi9c4Q8RdJzU7Lw>
    <xmx:1ByDZWDxjtl22kiSNMwDaGCXN5I1fAd3slIcsrQX7_XqA-Xb6LIFFg>
    <xmx:1hyDZQEj4Dszfswl_RXg5N8wbdWtJaPKHssffirWfSd3ijkOAdCbPg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 11:56:52 -0500 (EST)
Date: Wed, 20 Dec 2023 10:56:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Message-ID: <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7Ige98f3lDBxlaa"
Content-Disposition: inline
In-Reply-To: <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--C7Ige98f3lDBxlaa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 05:03:21PM +0100, Ambrozewicz, Adrian wrote:
> What I mean are functional tests on target, with real BMC, board, and=20
> sensors.

openbmc/telemetry doesn't interact with any of these things directly.
sensors are covered by dbus-sensors, etc.

What you are describing is an integration test that belongs in
openbmc-test-automation with all the other integration / functional
tests.

If you want to make sure that openbmc/telemetry reacts to the dbus model
correctly (which is the only thing that belongs in a repository-level
test) you should mock that out as a unit test.

> Could you point me to examples where it's documented or done in=20
> automated CI for other subprojects?

See openbmc-test-automation test cases that currently run on QEMU as part of
Romulus and you can talk to Andrew about the hardware tests that run on
Witherspoon (which are non-blocking but he keeps on top of the
failure reports).

> Or perhaps do you meen that maintainer stalling the change until he=20
> makes sure it doesn't break various configurations is unacceptable? Then=
=20
> IMHO I won't aggree, as code compiled within unit tests is just one=20
> arch, yet alone separated from rest of the system.

There are many problems with your position from an open source
perspective.  These are the ones that are top of mind to me:

1. You have no idea if the breakage is due to the submitters proposed
   change or because of a change in another repository.

2. You've made up your own test framework that nobody else has
   visibility to.  That means you're effectively treating
   openbmc/telemetry as your own sandbox and are not collaborating with
   the rest of the project.

3. Your delay in integrating changes can have velocity impacts to the
   rest of the project when we _require_ repository-level changes in
   order to integrate a Yocto update, etc.

4. Your position is that you will reject someone's commit because it
   breaks your internal test.  They have no visibility to this test,
   they have no way to know that they are "breaking you", and they have
   no possible course of action to recover from any issue you report.

If you want to have your own tests to test integration of
openbmc/telemetry (along with other open source components) with your own
project you are more than welcome to do that (even though I think it would =
be
far more beneficial to enhance openbmc-test-automation).  That should
probably be happening when you import openbmc/openbmc into your own
internal tree, but if you want to give yourself early signal to these
failures, that is okay.

My gripe is that you should not be holding up the open-source project for
your own unpublished, undocumented, non-aligned tests.

> W dniu 20.12.2023 o=A016:22, Patrick Williams pisze:
> > On Wed, Dec 20, 2023 at 03:18:38PM +0100, Ambrozewicz, Adrian wrote:
> >>
> >> Currently we've integrated proposed changes and wait for feedback from
> >> automated regression test suite.
> >=20
> > Hi Adrian,
> >=20
> > What did you mean by this?  Commits go through CI when they are
> > submitted.  I don't see any change in Gerrit for any of the 3 commits.
> >=20
> > If you have an internal test suite you haven't contributed upstream and=
 you
> > are holding off merging commits until you run them through a private te=
st suite,
> > this is unacceptable for the open source project.
> >=20

--=20
Patrick Williams

--C7Ige98f3lDBxlaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWDHNAACgkQqwNHzC0A
wRkWWg//fH6J4M+/EwWkSl9mJUB/qowGC0riszo2JruGpNYB2kyT2Ag4o9eZYyQY
GWRN1KG7IOPyatvogvGGcNkSmGrvqFBIqfp4SbAagKGhAQNmCBCtKnwbeEuFcmmM
Dcq/0od6zu3ZWukLRiG0GLIu1tgVcgDm6coGmFL8M3rqKMsfcaFmrAdXZMs7LlrL
LqK8TQKat2Nuzr2+PeCcrX/gkKohQJAvn3YUgEzUSA/VjoxEg5VWvb+uRzxXaixb
duOq4npB5godBU3hQqOrJF3VwSiO4dNT29R7kbVyAycPzw3HbfOD+eXevb6zOJeP
a6sRFtPNFth97a10OIajKB95YW3mI8VMipwlAG9eS2X5kgY0rIfPpBI3lFogeX0p
j7RZVSNqUCLNJP3k+/ttIaz0NaZbv6YiRvtDqksDj12b195Q0lkzgGM4Gagxsin/
Ymp5nBu7AtetTLVhXFhR8kSkZwxlMFMPkEbJRxbttJQskrQQXxirgH7GKicVUAN0
ylUsyKc8ngxk5rAyqjFceIs61C/FgWXRaZiHXdSamkLmNGc1YeH1d/kbV1/gpsRA
sGjmRctfQ7hPKQWIpSS4Rvapho9Rrb216BhS5pdKsQVyiAYiK4tS2Q8fVuBD3IPa
8cDQublaFqDa4A9Oas3tS1zHqELf67TTUaIVTYfaUD/eEdh1NO4=
=Os1U
-----END PGP SIGNATURE-----

--C7Ige98f3lDBxlaa--
