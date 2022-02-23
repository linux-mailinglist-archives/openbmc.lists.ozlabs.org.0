Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D84C1B49
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 19:59:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3lgk0d7yz3bcY
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 05:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=q4nhCfPM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=B/GsHH6N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=q4nhCfPM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=B/GsHH6N; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3lgL2ZNvz3bSh
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 05:58:38 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 147BC3201FDD;
 Wed, 23 Feb 2022 13:58:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 23 Feb 2022 13:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=nwLSLc4eTLdfNRzV6oEtyum3Sf9vHfP6y7u+lu
 DJHnc=; b=q4nhCfPMdrd8GemOi7xbCWRCWbYtxSK4B6+qqW51aetoSGkxH0jxU7
 /9bdS8nGn5akchxdVsgU5g7SPHS0phakOCqWRVxxbTfELhI8AZtPXgf7Bjsl/8jL
 PJBlZai01AdlMM2SbgyAdpqRpmx1lSTUVvU3z97qcdo8aWw82XZZbbE0Qa8IutbX
 vPRGHuoarX71NNiXZlck2DkwP/88qtZSRk9N9U4gmuL1CDTkdTWHCjmOMBCagtLD
 gsmJ2d27PD46rB3o83fXy1BYE0ruHkGjfKsuBAXmRuo4iOG4mAl+Uufw5QyVYQd/
 acs3RfvRY6SyWd3fX7Ga8tTKzM7l0tOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nwLSLc4eTLdfNRzV6
 oEtyum3Sf9vHfP6y7u+luDJHnc=; b=B/GsHH6NwW+eLKbS6wdydRXQ/ydJ55x8S
 uldMkr6bV6gG0URACizpQpdoLl91Hfr+zJ2H67Jbte1aVrxgnKPoxkjUZbkusVb9
 5aDr//uj7GrrGSgU7t7AIUwM+NmP+BiLsehsnqTO1nh4yZ2dsqDDJDf5/w44m4V+
 7R4nTF8fps9iukRgBYDlBBxnyJORenbc+t0l60uPuxJTtsjyz83DS3Ai8aaHveXu
 Xm2w7y8QLnmI6Fp8tXjbmYAEndV+G8o0iUIq8n/I/psFC0oy19NXSGBNmVOlkDIX
 xDG9yvGvlMG3JJmHGaUPcnNd4NZHaHeQO6fOqta/quviE+cRmAToA==
X-ME-Sender: <xms:3IMWYr5bZv7rCcvu8eIlp0x7sB28ZTRP8zlZsz0Wnso96HY4zjEUnw>
 <xme:3IMWYg7gH-eSZO4U7jZzUmxmmmtJF0l_qbE39QIR8i4ONyl4CO710lFhJ7LMFx8xt
 ExsqEjJ_yCJgZOHj7c>
X-ME-Received: <xmr:3IMWYidSJ7QyJevtJAOr3LCfBDkTsK7tY2RCHDYaB2n6VX9FEh9wZs5aFWiK4FVkeL5JwGFdP3cCP8z8FGSvGkTBsGD1I_XTIcXh1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptedvieekvddtieelueelgfeiuedv
 uefhfeefvdejkeejieejueejfffhjeeludevnecuffhomhgrihhnpehrshihshhlohhgrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:3IMWYsJwZNueOBGJGNbZ6wwW6dInvLzTbzq5ICqlGb9jTVY3Q-9KvQ>
 <xmx:3IMWYvISLhLfKdjs0juYzO6iD3a2Qbiu1jXUEhTGzlCXg51t9C97PA>
 <xmx:3IMWYlwZovb9-tW1YFEsFA3tY2mw1eEHb5fj3CATpa7NGDL4jFjiHg>
 <xmx:3IMWYhztB-aoSlkOeOvfpQGJs6BhFSGyTXXl9YyO0ztDhF62QXh-0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 13:58:35 -0500 (EST)
Date: Wed, 23 Feb 2022 12:58:34 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Checking for network online
Message-ID: <YhaD2j7dD60TUltD@heinlein>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
 <3402647e-d195-4537-1279-bf4f7839161e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PIqdQTQ1ffNK/ogk"
Content-Disposition: inline
In-Reply-To: <3402647e-d195-4537-1279-bf4f7839161e@linux.intel.com>
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


--PIqdQTQ1ffNK/ogk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 11:36:50AM -0700, Bills, Jason M wrote:
> > My understanding is that in OpenBMC, the propose to use rsyslog is to f=
ormat the Redfish and IPMI SEL logs from system journal. The "r" of rsyslog=
d is not used in most cases.
> >=20
>=20
> Just a nit-picky side-note: The "r" in rsyslogd is for "rocket-fast".  I=
=20
> don't believe rsyslogd is inherently designed for remote logging.
> https://www.rsyslog.com/

#TIL

--=20
Patrick Williams

--PIqdQTQ1ffNK/ogk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIWg9oACgkQqwNHzC0A
wRnqZRAAg7EuMehL0NimgaPrUSdOugoP69u6cYycAQBOPyV6dUTWEv5c1MzgXCpw
Xii0611vy6MmLyRz4yPQUKyQDs8YUmUaHMXDWrTVcdTBaXb7F9J7XzNE14EEY+B+
S0WZ/z84Fz5CwoPnKwirxXSZbDGiE27GfZrXbN7bB3CD+4Ml89pbiQewtjjyu21P
ZASAOP1CdQTipSRSwowiD5euJQE765BFcsXM+5kkHbVPUcl6Qt5nTMG7UlOjIidV
U7kp7Lij3iwsq2Eva/t/IzVYKb4abJHzsMVHu+Qx66zqlQcUCGfviu/AmcfjrWPm
ku1EL8LMLYC0abQtr8J8mMmn9XtezlUR3t1pVeVXp5jYt6m/RuQHB5wVom8wfnVv
8rBSGj2b0DBxGTn/BKzjRXXhCc80UfSwNirHMH0m1Ug9SRIQ8C5qHB9F/1red5hk
Ld1Q0jZQs6J6trhmGO7tk2Yi1Am7Bx9Ale2lzWVTAQkPGkv4tuLJIa5Q2Z2Kxe4L
usAyTTqlvqvgKGi5zLRscMlMufVTbJ1j04gjHTI/OOs9OvJsMhg9LwmRULA0f3TC
SScjLgnTLJCZHwAJk1K5o4UUEi8yLIXdQQ7EBUoreEH+uKdJocdN5H//E+mU7PA8
rJifZwRqTsT7vreFYUxvBCF7bCSVN4ppjZZoIhU/jZRalUe1k+A=
=Sgdj
-----END PGP SIGNATURE-----

--PIqdQTQ1ffNK/ogk--
