Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A37853337
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 15:33:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SSTbh/QT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AJCIWaqL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ3hn29JYz3dVB
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 01:33:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SSTbh/QT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AJCIWaqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ3h645hsz3bcJ
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 01:32:37 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D6F063200A29;
	Tue, 13 Feb 2024 09:32:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 13 Feb 2024 09:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1707834752; x=1707921152; bh=wJhFzkBsB8
	dCG+ZrzdEiUg/WgMOm8cocflT72ZYqZUA=; b=SSTbh/QTE9FSNj14pa7HarBoeE
	EULk6pK93hpAulnxOrLQuWvWxoYpHiCO5Znizh5Ae70+wGBO2wH8Utn+pkMb3PNi
	3EnW5Fu4ppgVXn0od0rkQfKOxTgDPKEcCZeUM8h6r60Ha0Ax8EuhNcVGjNQ7vQdd
	i+AFMGAQaC0kGljpftFgcGn4jydnKfUkt/9kx2vNzFut5yi/nkRTDKAXfDw5HkQ0
	EA9tqbdZsRSGdd+FKnro2dnWG2VgVhqoOafMeHcX73I0Kg9MGLoEfcbv71QiAcN1
	SeVcjRwcC6PwtkgV6nj6LHVh5LaMhFxmme6Qkn07Pob0j3pYjg1eVcYGV08Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707834752; x=1707921152; bh=wJhFzkBsB8dCG+ZrzdEiUg/WgMOm
	8cocflT72ZYqZUA=; b=AJCIWaqLn9F7KHnLAftNA/y2Wb9eO1MzrYOQwFTbirTP
	/oNCJEf0v2nHfKUEDia0prqehoJYMehb4yc8Uo2YemuhtRAT6AHm3h1osOQU4M7l
	Bvh3spsnuj+BjGyRJVKi+bga+fw3SLQFpHe5GW8hGrs6MWLBrL2k2qNWqRM3dhcB
	0kVWpF1HVN/nlZxHVtjMj8zZRtgXSO4I1Y0YLRGGZaQZcOXy0JhunRm7Dlvq9N+S
	VskrT7uzPWXvRSQTwt4e4fiR8oaJqMbSEe3OdESY2nrFWat2yExDvOrbuaG3BdVr
	32SFJlwtgJRuYVkX5ATAK++54ED5AHV5TQaR+b2PAA==
X-ME-Sender: <xms:f33LZZ8-gBA-jWRRxaiezZMaWJkYXLoB9q1omFMmv9UXJltwXHd9zg>
    <xme:f33LZdufZyP7z6Tt0sxof_XaqaCJbog7DEbDUg4R5XpSMPIN_fu2FmzV2Q3w84LE0
    RThiKr3icoy3dMxZRg>
X-ME-Received: <xmr:f33LZXAqAmxzpseBeezjcHXeeSUWLU12ZkLRsHMDc9iyLycF4Lcgi0e6vTgqDb5P8vR2MjwAoMYN5ZywcbyTODnO3d5Dtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:f33LZdcdMHPdHS3TooiOOsXxZam2_03b02fmFscrqMXGcNJzL9t0-Q>
    <xmx:f33LZeOiw3ZbOj14elXzqQWBWYh2rcAmcVyvsd36ecW4mv0upERNGg>
    <xmx:f33LZfnoztm8Y3wQkvwU-u-_Vago75lU3lZPSRbh740D4h81iBu2-w>
    <xmx:gH3LZbqOZw9_8eZDcRiyrqKOQNwjKKUR0WXVklrSzqP4uthTFDt3dw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 09:32:30 -0500 (EST)
Date: Tue, 13 Feb 2024 08:32:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: File Manager Service in OpenBMC
Message-ID: <Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
 <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
 <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
 <874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au>
 <3862c106-d0c8-4168-bf22-ec9b8fba301a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zlPeGXL975Dsm0Rb"
Content-Disposition: inline
In-Reply-To: <3862c106-d0c8-4168-bf22-ec9b8fba301a@gmail.com>
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
Cc: gmills@us.ibm.com, geissonator@yahoo.com, openbmc@lists.ozlabs.org, ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zlPeGXL975Dsm0Rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:14:49PM +0530, Sunitha Harish wrote:

> I have mentioned the purpose of this usecase already. There is no more de=
tails that i can share.

I think we're missing the high-level premise of what you're
proposing.  Is this an arbitrary "expose the file system over dbus" or
does it have some very specific purpose?  You've said something along
the lines of "there are some files for the manage host", which is mostly
fine if you don't want to talk about the details of them (even though
they are supposedly already in bmcweb?) but I think there are still some
more specifics you can talk to.

> Its not about implementing the file system on the BMC. Its implementing a=
 systemd service, which will host the file descriptors as dbus
> interfaces/properties. This will give file handler APIs to the redfish cl=
ients who are willing to do file operations on the BMC.

My first read on this is that all it is doing is moving the problem from
one place to another.  Fundamentally, the reason to not have bmcweb do
file access is because of the potential security concerns.  Having a
generic dbus service that reads and modifies the file system has the
exact same security concerns, except now you've potentially lost all
information as to _who_ is doing the file operation (unless you add who
is doing the operation to the dbus interface).

If the proposal is "make a generic daemon that can expose the whole file
system as a dbus-service", the answer is likely "no" due to all the
security implications.  If there are specific files, folders, and/or
configurable sets (which by default is a locked down set of nearly
nothing) then "maybe"?  This is where it seems like people would need to
see more details of what you're accomplishing.

--=20
Patrick Williams

--zlPeGXL975Dsm0Rb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmXLfXsACgkQqwNHzC0A
wRl+4w//frlHDttj4G8glfWzWDNuM3vjsSp65PH0P5ZQr3SUZeiTE13f44pXNQNl
nlmNMihd0zeg03bfKAup3Yc17EU+pee8QUiToIcxGAYQwpG36LYcxeboPmdsKy3H
wRLwW/89tIkzG7UFrLO9dUxv1yjYaiHdvkqUK1xhu4K1zEOCJK1NNU5RIqzVKjen
n3aDwW7skyfEnZ3Uz3LjyqVYMI65RbW0a0SJrqV2IOFDrM13kPsVgMJkoevJFHlB
sFfh8PD0O4L983huZrxvsFHgGG5hky39mM8VNb0OQsN8ClKvAY2win6ctJfwGPXW
GHQtVolHuHuRX28BrQzVeo/aBLdYtycR3J/905BKOm8VoisPcXWL+LoUHqA7GPZ+
UpCyLB71dXHVEbNHZgHpLSAvVv3wLCJ19fm4kjKJq9/FT1/9H6yDhCRNZlvDGLOo
j6f9IZ6Lf6VjpKYAeM339miJBGCdbDjB8SRIHktCLk7Vdnp//cPb3Sv3XKa00SXo
3hhLpdPjCNjfXmfwSYZR/NA9Ek0gkQejlZ5fgSrXMPyKWBpD6rpalKBSeomgCDWT
NH5FokzQQio3WsUafjxSf1N+hxdkdc++GCBkYcNk8z7JLh3Nu4Fci9sFpUkek2h3
iZJjz48jLDmiMv8AzAYxSw9hq8Td9FM0RoIg7pfxZXPM3/+YJXY=
=MPnV
-----END PGP SIGNATURE-----

--zlPeGXL975Dsm0Rb--
