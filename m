Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF226DFC6
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 17:37:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsh0n1R3qzDqf5
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 01:37:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=A7Dc44ae; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=HtLjfAl3; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsgzV1rwjzDqTJ
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 01:36:06 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 49A625C0063;
 Thu, 17 Sep 2020 11:36:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 17 Sep 2020 11:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=nvlUGjiqGs3wc50ElAMAq59J2P3
 BTLaA6c6J9dF2upM=; b=A7Dc44aeYUb3+SjzuDVezu5Tw2VvoBbiGHRG4uDYwYH
 Nwe98nsP+XwdqsYIfOOIMVvbVIgsw6kDJk1kCSA2oqHIPtknb1LjeiNd3DDrIlDd
 v/DNYB87X4iKDqRGJ+kQCj//OTQbCiwAA1LaXifHcTvnK2DQb9IWjKEOSfOGgyCj
 iOJMqH2hsU19PN8Mbbm9BWTIR7OMrrC2QShFwNh3dFaBANSOr4/aeKZ+rb99wV7a
 Kv1jbDgcw07o3EJjsYo5aqVYlc5BG7h9kl0L5V7h85yULDAUTwHJzjT5So9GCf3f
 4ehOh+ygwtaKANQB0FArlHCmTGM+/8QuqcfhJn1uF4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nvlUGj
 iqGs3wc50ElAMAq59J2P3BTLaA6c6J9dF2upM=; b=HtLjfAl3JWKkO/Vr5qBQ8U
 2hGNV7FKRtrXVgjebrDhHrifs+mR6I/J8yPlqm3ofVYrJAQqxPVgVepiET+hp3W3
 YU8uhmNBXSjWFdGwvjcj8AVht3P2LPNcB5e2q+UqqanOayvSE/hAwFM7VNkf7X4s
 +K1VdlP8h/trxBFc9CUFVNPhCVUYDlx6pxIQoIv976A5blnuknsGtjzMgbJokILA
 TTtZfs1ZvohdkfJwj5vibwrRyldCeba687JdWd17ztGsmGUVzhzL08R713fBhsEG
 Ksxn6Hsbq20ltQJT6dU+eGQsrN/U0x3+Wh2IRoTFT2GUhlez5SzBdbbvZFHrg4XQ
 ==
X-ME-Sender: <xms:YoJjX2BK7QvfgwjPxNtZm_-TosEGHt3htwUxqRHb3tP3Xezu4iPuWQ>
 <xme:YoJjXwgHUV196NCddbrAph4Iv3Uja1c4Lv0908-_1VdKYlNHVeUJfQA5TGOcFFCnf
 qWT-HSJq4BmJCpNu8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:YoJjX5mGkep9npMBSzfGUQ7MLR0zQUnM1JRtNm-peTjhbjuTCr5AuQ>
 <xmx:YoJjX0wx06bZVdWhbrSgxRd3EULjO1aHiKZlX-gP_NuoLOvWDh15HA>
 <xmx:YoJjX7QJilzAGf_2R5pRjiYj14hMM9sbWajTXBmWXLc7YbnFVhuHqw>
 <xmx:Y4JjX-MSvMbhRMvGEDqcqLNP7v3jUblrDNlYiCKK4BkVS8sjpfpswg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB077306468D;
 Thu, 17 Sep 2020 11:36:02 -0400 (EDT)
Date: Thu, 17 Sep 2020 10:36:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
Message-ID: <20200917153601.GH6152@heinlein>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline
In-Reply-To: <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
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


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 01:10:06PM +0530, Ratan Gupta wrote:
> We need to address the below two concerns with the existing settings infr=
a.

Both of these seem like missing features based on our now greater
understanding of the problem domain from where we were 3-4 years ago
when phosphor-settings-manager was originally written, right?  That
doesn't seem like a good reason to entirely throw out the approach.

>   * Pending v/s configured value: Currently settings have single Dbus
>     Object, Some properties which is for host firmware we need to have
>     two placeholders one for Pending values and one for Configured
>     values. Bios settings have this concept.
>       o Should we add two Dbus objects in settings infra?

This was going to be my suggestion, yes.  You could have two sets of the
objects: current and pending.  'current' objects may not be written by
dbus-clients.  These are the same terms used by the BIOSConfig proposal.

What I am not seeing in BIOSConfig and is equally applicable here is
_when_ pending is applied to current.  You will need some interface that
IPMI / PLDM can call to apply those settings?  Or, do you monitor host
state signals automatically?

>   * Dynamic Dbus objects: Currently settings infrastructure is only for
>     static objects, Objects which gets added on runtime, settings infra
>     doesn't support that.
>       o Eg: IP address on ethernet interface is dynamic in nature, An
>         ethernet interface can have multiple IP address on it.
>         considering if SLAAC is enabled(ipV6).
>       o Seems this problem is common for both(settings v/s bios-settings)

I assume these would be requested for creation by IPMI / PLDM?  We could
use a similar model to xyz.openbmc_project.Inventory.Manager where
objects are requested for creation dynamically through a method.

--=20
Patrick Williams

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9jgmEACgkQqwNHzC0A
wRl2MBAAkQWh3GHEjGy4zOXY2m9yX8qUd61ITxj2ZHZcoZR+Skmh067aU1DzVWQM
ceFyUay0xlynCIROGYulxKiAEAFHRikhEeBNCjvnUlG4ngpYECgKoZ9Lc6lU9FLI
qLwO1mCNoyLLLWXWzNCry6Icf692j5xIRAeljpS2zUx12cRY+znEN4gxJ9Y8haab
xjEhw45bt4AgJn8mZPSCiUAYVc/KC0FGqLB1cqxXnHiRkM3yvhkutomQAme4Lofl
dIMHZ5uyFlZHupIFVncXcWaVxmEF+gF2/7MvkPETW4voTzhYYQTXdYpYG1iauf3X
/crQrKMScdOfp9l5S1+BzRL7QQTeoHDte8kAHqvXzEGel3LTADbKDGd+1COSPSII
7WuQ/fgNnjVuC7d/Y5OKRl+oGFFiRL++jmPzXBkQpJOBU0HQgEK0jRvKz2HRPcaF
WfaDRwMyrFyP4/n1xGz7a3xD4U89DoFBpY6Ltd3oCnbDgdjH5RVx1T5v1D9JUANd
mqyw4QNmuoBXSnYQSjDlxyfSCpGE40K3z8HldkFj0pUQuY6kTsV7PD6XKDOsQ/t5
gMYZofm3ODQAfXLMW8z/POtIKUFCeUjoLAlZ27exp4lzXbsJbQfoqo7ygGhCdIQP
YF8MKv1E6FoMLUJ9UOMTXbKWoln6te8mwbNXtTUX0vcMZ4tCJnU=
=FkIZ
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
