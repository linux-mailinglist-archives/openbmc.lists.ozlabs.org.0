Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6D3EA4CB
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 14:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlmXb5mpLz30Lv
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 22:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=h5vFht8c;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Epcrq1bI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=h5vFht8c; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Epcrq1bI; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlmX44YF8z2yYJ
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 22:41:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B6C8F320039A
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 08:41:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Aug 2021 08:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=u7l2ql/okoinsezi7zwX/25oArH
 80pFe8G38FSXFiCw=; b=h5vFht8cAbimrdrDRXmKGQOAxRdQidEP070ZLMUue+d
 YduoEj3u+8pdjntmbkf1k3ZWAAnXlJcLx9agBOeGc48HYFyRq93X/44lhG8bxfLP
 YhzOmKy3upd2agN7VX/8nR7CLHm1wRCAPVS5pHISjgCW//iZtdbvoH2GAqzkjJxU
 plYs0wGf3NfXtWLdfjfcIsxGXYppAZYBKrVRPzk05uTqVhxl5ZrkCEB8O90KFETS
 m5TiKVYpXeQIGZdIX887l82rAg2vCK/LXUdjCt1aX9FUR2GgX7P7SDBIVduQY8Y5
 O/hJAy6phit8KHWjoqNQyjXkTSYgyrxnH/HZYEGDlFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=u7l2ql
 /okoinsezi7zwX/25oArH80pFe8G38FSXFiCw=; b=Epcrq1bI4LeEKiq28x8M4F
 Qi2ibEAIbAuYY7cO1LiWYg9Y7TpNyy9wZDSDKjojwhS2e9fEzA2eMoTm3ZfWIMMG
 mYk7LTjwN1OpL7R2FnBY7gmqFQx/rqVuqlmRto51H9DUs8cFs3JXyk2s36j7dg8S
 DvfbttRG5hCeskpC6XB7Tc1GINLBiW8k5vhsv3KR3UM/+g8IJ3RkYEtN2mjAYxAl
 +B82IWm6CUv2l/nDUgSd0GVK3kex1uOsgqQqPoyoaqzCEYT0cstVud0N9X4+ZUAR
 /5GKEhy+GWeL6C3lQAFGw4K0hyTiQgg/uMVULi5eyLtnWfzfayPbQq8vcXMGb12w
 ==
X-ME-Sender: <xms:7hYVYeTM6OQCdks0_DwTOmfuE7-GC9Xi2fcuj_0QovGCfoY6MozG4g>
 <xme:7hYVYTwxWoH_eNR7O6ECAAbRr4Iyil-MsPdBz9TAeyZUVyU8UhEQY-tpb63fovlNQ
 b_2odgydLGfvNoZkss>
X-ME-Received: <xmr:7hYVYb02U37Cr8pNAthgCkkngEHUHINGEijvdS9DTJJgKAxlGb3zgJbXKjP9I4mLqR8i5FErSORZHntRnoRa31TRR8I5kQMTfs1jXcM63mZ7ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7hYVYaCIuy2NsxKFWiJTylTn3p6296oWq-NhDXDJ4y-MSyv23VMiIw>
 <xmx:7hYVYXiwXOWMdJKt5lFgyHMmkxnrL9WGpbsk6A5Ow4FHI8IerjdaHQ>
 <xmx:7hYVYWqPiS6A8ozqImqWZoMRoB8QnW9pYbGHYfVZUeYe0SlwjHZ43A>
 <xmx:7xYVYZfPpILOEEWhQkUm_7yh2fPE_gIFpEWL6dcGlJASsvjQ7IaT4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 08:41:18 -0400 (EDT)
Date: Thu, 12 Aug 2021 07:41:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Yocto override syntax change.
Message-ID: <YRUW7cazmCjW8VpP@heinlein>
References: <YQ1FD5q8KbhbXVBK@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ujcHM2YCZPYpC13G"
Content-Disposition: inline
In-Reply-To: <YQ1FD5q8KbhbXVBK@heinlein>
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


--ujcHM2YCZPYpC13G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 09:19:59AM -0500, Patrick Williams wrote:

> TL;DR: There is a required change to all meta-layers by Wednesday August =
11,
> 2021 at 1PM UTC.  Any meta-layer not changed by that time may no longer c=
ompile.

This change is now merged into our branch.  All of our machines listed in CI
are able to build successfully.  Many other machines have not yet been upda=
ted.

The following machines have had little to no effort since this email went o=
ut
and do not even launch bitbake correctly anymore:

    - centriq2400-rep
    - dl360poc
    - e3c246d4i
    - ethanolx
    - evb-zx3-pm3
    - f0b
    - fp5280g2
    - g220a
    - hr630
    - hr855xg2
    - kudo
    - lanyang
    - mtjade
    - neptune
    - nicole
    - olympus
    - olympus-nuvoton
    - on6263m5
    - quanta-q71l
    - s2600wf
    - stardragon4800-rep2
    - thor
    - x11spi

Any machine not updated by October 15, 2021, I will assume is unused and
unsupported and will create commits for removal.

--=20
Patrick Williams

--ujcHM2YCZPYpC13G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEVFusACgkQqwNHzC0A
wRlnlA/+IFiieNH48hE9AlcED+EJPbqWPJSbU6tpJymYzbiUVL/Dyd6n3Ox2YNd2
pRySVisx2B4Zv/R8FCj/Zi84R8en3lR+QZkTjU8sL6s80wzvYkrRbo5iPzBJo7cj
4Xysvyy13Sl/WUt5pXqCRMVGcIHfR9f1xReX0oERhDQ2Kg2qmIYOpcfkRKINDtHn
zZQ5P8bUCrHaI2hxRgJrcfZNEE92bJ0v3nNso0yIpzY2qFhLSkI9byl7fAYO+Nz8
Xpxz1H2tEoDVyTEVU3wUk9Vlyl5lBNJEHS3vBrYrFDqgGZezblv+sc5Eov5jQBPn
5Lq7ZV0JGYrM9T9tKoe+ehsTzELmc3XxaXZdfubUQSWezkSbQpRmus4jlaIK71o7
pXGNh+YU2qqBOvEDMjOmS4wF687Y31EXlsF/jb4nLg9lyQKWQb0ekXU/0giTTycj
y7XZeyqYUYZXYbGVFwMuYu9w7JZwIE5CFSXenksjclFYrzeQZpLebrnVkWNjRmhK
kVMIugFqB+a12K6h5xCkw9RDS83kUSe03Rry0b8dv5i4OzE2/GpO3RD7HtNBWQqz
IcrSun/SEopqMIUyPaqe8CxvsjxBzhI50APFXPqV23IesXyEw7wl42xjzmzOaWK4
YpnSztndJ+aHh2bFN+6ivF0LBjYJVEgn3z5OpOTlhvSPBhmydbg=
=Tyic
-----END PGP SIGNATURE-----

--ujcHM2YCZPYpC13G--
