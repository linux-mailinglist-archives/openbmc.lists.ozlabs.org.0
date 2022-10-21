Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90484607FCE
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 22:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvGS52qlLz3dsR
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 07:35:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Whk9W0LJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FUrYkskd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Whk9W0LJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FUrYkskd;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvGRX0K4Sz3cfB
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 07:34:47 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id F236E5C00B6;
	Fri, 21 Oct 2022 16:34:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 21 Oct 2022 16:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666384485; x=1666470885; bh=+W893TCHPR
	A7Wa6YP8HJ2yHLmwgGUYb31TbBY7JmKMI=; b=Whk9W0LJCWZEN/nyEBvBOnStAX
	Tgjgo833JRo9n6jfDs3LHM95Gd52BG2E/OrJbqPoVV3T96Pv49ymgF5pnxUxxVBO
	QJgTHs/r4hdhZA+nlpFMF94lTcEiWv1PM2qnk7szMGHoyKKbZRYODCvjPneLbs+I
	Gd9GXunUDYLpdptTXZEV7T29MJx2n2DgD6Towl1/JOxUYCOoOdIKxiweCyf+a2KN
	LfG/3d5oRY/5TjsoslrdGgN3Jjc1QVVNQFQg8mHxSiBDP3Vr6ggiGdOBXK1/dGWH
	BuBAMRxK2pAEmwgfg/p5jj5czGd28isx4mWfdC7dn4zBPOZ4mI2DYqnc3SoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666384485; x=1666470885; bh=+W893TCHPRA7Wa6YP8HJ2yHLmwgG
	UYb31TbBY7JmKMI=; b=FUrYkskdkEIPfd0P8fuvzsve55Xxm+rYtHjjuuZB11gg
	qv1cJ9Ofokg/MaWkDvPmfOUWnfc5AawM+oGh8neWmu6Zym3jf+x3Jc5pA1O2Yz/5
	P4+H0EfG/82x8e5cm908wVX5aW1Wt2NrThQYWnp3i2yAU2W01bT1g4vfV7k5wTWk
	JazoQHM0qxOKDfu0itxZcQHGyikD6v4wcvjcO3+FizcGuBmO5J4tSet+fJX7v3yR
	Uwk9QMymomVMfE+YvE752fjFlJaNb0fEG4MvGy5GjXu9vidHfUiyQH2jCB1M/cpe
	VLRd/Uk87K6Hr82caUpjTYKvaCBSsfDnKEoV8hBK8Q==
X-ME-Sender: <xms:ZQJTYwlONHOb3B-yLzGMc0C_jxiqwWbwxjG3y_dIKki8IPSmBbviQA>
    <xme:ZQJTY_1roxEsepbVtFvwQNy_YsjzmEp2zJv_BA6CNLKtul4FEh1HhSCWRM5Ps63RA
    DUmYDKJZNw72fz2Z8Y>
X-ME-Received: <xmr:ZQJTY-qgNkC2tmurD91RmiXfua5lwMpG2P2VilwT0wR-CGVm_vpVF2OV4DCxOzUSTZFJ-TRp4NatttTVT_Y50Gi3v4pS_Pwf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ZQJTY8krcPRhBvlBgBp7-X7AdzYXWZP4ivzNV4xAQFIbPX23ICpIjQ>
    <xmx:ZQJTY-3-qMJRNIEZB3jzMoB-syCoq0wfBmFplWtuzWR5nRh-sk86Bg>
    <xmx:ZQJTYzsVYMBEJ7bQ3jwOIixBQssD_WVEkJk3HovirmlsLKKV2e6pAg>
    <xmx:ZQJTYz8xG_UN5UbO9YWhr3RPoU3eBF0akKrnNbX-vOSlC1iOJhN7aA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 16:34:45 -0400 (EDT)
Date: Fri, 21 Oct 2022 15:34:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <Y1MCZNwdiZ9NC/tT@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hCLymuZ8gfevIUmC"
Content-Disposition: inline
In-Reply-To: <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
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


--hCLymuZ8gfevIUmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:

> I'd also be curious about the reverse question.  Is there any benefit to=
=20
> storing logs on D-Bus that makes it a better solution?
=2E..
> Is there a way we can now get together and define a new logging solution
> that is fully upstream and avoids the drawbacks of both existing solution=
s?

First and foremost I'd like to see consistency come out of this.  If
there is another proposal for how to do it that we can all consolidate
on (and people are willing to put in effort to get there) then I'm
on-board.  It seems to me like the lowest friction way to get there, with
the best maintainability, is to use the phosphor-logging APIs even if we
end up not putting them into d-bus entries.

It happens that phosphor-logging stores the instances on d-bus, but the
more important aspect to me is that we have a more consistent API for
defining and creating errors and events.  The "rsyslog-way" is that you
make very specific journal entries that the rsyslog magic knows about,
but there are a few issues with it:

    1. We don't have any consistency in what, when, and how events are
       logged.  We even have cases within the same repository (looking at
       dbus-sensors) where some of the implementations make the magic
       SEL records and others do not.  Additionally, they're not required
       to be the same format.  Some maintainers have even outright
       rejected patches with the "magic log statements".

    2. There is no way to generate something like a Redfish message
       registry for the events, because they're just arbitrary strings
       that are sprinkled around.  It isn't even easy to programatically
       search the code for them because there are 4 different approaches
       to that: cout/cerr, direct journald, phosphor-logging "v1", and
       phosphor-logging lg2.

    3. Any kind of automation around these is more at the whim of
       whatever the developers / maintainers decide to change.  It is,
       for example, really difficult for me to write data center tooling
       that reacts to events like "we just lost pgood to the host"
       because I have to read through the code to find the specific text
       and hope it never changes.

Conversely, the phosphor-logging APIs leverage YAML-based error specifiers,
which can be easily transposed into a Redfish message registry, and happen
to also be the same structure we use for inter-process errors on d-bus call=
s.
While I have to review the implementations to make sure they're
appropriately created, I have far less concern about them disappearing
or changing once they are in place (and I can review the changes to the YAML
specifiers to keep tabs on what changes their might be).

--=20
Patrick Williams

--hCLymuZ8gfevIUmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNTAmIACgkQqwNHzC0A
wRnHFA/8CKLE+du8Tz9KPlBBTeyHZESlyCmG6d/iK8OX515aqzGMKfRZgtr9SAZf
1CkXCHVr5wRRvRlKNX/k9UyDfYMGVp5PSTuvCdxDrNWQEF2qwPqsyEiCYDV/f1Ur
YHjwr22KMsOmqLJ6BsDcE6Kn1EIrDy01L1F+jQWkVpUoRH59cvs0jEgjUhGodeeU
rjtrhV6bJ7pHph8PfXVQwgXlTBwJVP2VaEpNDnr+uLWvPcIWLDkjZ09352NOHYWq
P2lowzSk5dLn6u37kvlWpI3EYdOrOLQpLwkZHTLmR1jId6FZmLQ25xY9rurpyKbJ
dwKbo65HB9qeO+gCG6h+42O3QfXk9SkJRkoDq58uVD2+5LgrUar1mdrA+IqTAfxR
Gy82TZ3NS4ebwWAOsZuTeAiT3+vvVtJYB2P3frERQd7M/bLbyIlfwmipfhc0mNmZ
i9n3b2DoDYgu5ujKKe8c7FXrPpPGdJHZM50pP3T9RBJhWrots2VuaTHh+me55fzF
lvu2h9A+biNfSbT/3lEukylJ1cw1GOjnd5r/at0y89YcX0Bs3toPlEj8V0kwjJIc
6x23OdSd9ZdKJqAndBREqiUcn3lpVH3hT+gls6rZIpSOnnoLMlF9K7rEUA/PaDl6
vKob/Ac1OHqcfwFsZcJ0cwbDN0Ydtxa4Xf2f2QcCKffDB/GoKF8=
=hsr3
-----END PGP SIGNATURE-----

--hCLymuZ8gfevIUmC--
