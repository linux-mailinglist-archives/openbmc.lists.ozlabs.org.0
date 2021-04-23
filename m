Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E2369367
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:32:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZvx5nkpz30NR
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:32:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=MyBSjp3j;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oAVb9s4N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=MyBSjp3j; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oAVb9s4N; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZvP204zz30BD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:31:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D879F13FC;
 Fri, 23 Apr 2021 09:31:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 09:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=oeojxlveMVL/+MDt6Yu+j+Pf9py
 OyhbELnfJ2mKkJSI=; b=MyBSjp3jFBAlVp3wmPS9pWhzoIhH61gSNgoV81cuZi+
 76bmCuMV/PnUjZvwO2QHFYhBt8e6UFrJE+Y1vjZBDFoQnyR9h62It4fp3uVPL0Lq
 K49I836R5V1ypK3pbtda/1U9w9Fbiw9apFiULB5r0OPaRKNj1hX/s4nhkkK7TZcK
 0zD8A8C4Upbryn/kpJ5rrG+dSwXI4VFfzZtqYOOyWlQxP/iwwycWohvbI8EypMg4
 4MFwwu8Xyt8q+iL4ZkzNYxWwG+FMBrHtjC1yYV4Vu81LGX/r2OCXWRw95vMvBBzt
 8zxaK6/Kop0H76H3KYl9AHk6owLXVFZ+7k4fkqxwTjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oeojxl
 veMVL/+MDt6Yu+j+Pf9pyOyhbELnfJ2mKkJSI=; b=oAVb9s4NmeHUNgBx7AtwGE
 g9YsjYvrmZgESRW7W76VG2iBtev0jcLTYzR3odOOiwwsQdGqfAsmuachPnvTZ0Ya
 WP4+Scbaw9vMTf5cs8fBhXtlQwrvc8diwtPbjprBXYhkAqQ+gVFCaw6/DVzrF+pR
 uLzcsgudbS+f3jwON9oSe9ufLoCDYPfm1aQzM7L3aJEn5Bmdrhn+dRPC/Okj4UmF
 QYqyeAy1K3WC4ipeYM4xayz/azik2Q8+1PKQmsXZKvzI1YpiS0yKXyMuNOK1NOKn
 eiNomKcnYVANnXBgdLjU6eZBxkc0lJWxHXHVfE0D3M9MGSs3/1hteIrklIn5ah9g
 ==
X-ME-Sender: <xms:PcyCYIyzrAXvnfK93B1FOSIDxEtW7aypctlI7eqgxKYn2cVrI_L40A>
 <xme:PcyCYMRW3sj0KYaz-WI8uWYJxYImFYbURRG8PXXxHEf4DPSkMMXijmYJlgT_fZw5o
 jIl2NM1yFEC34gy7Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeeikedvjeejheetgeeggeefgeff
 teeugfegtddvudeggfeugfefjedvuedvveevnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:PcyCYKVhrzS367oYSoBtf01beTlmW-dmgK-N3yHAIQwiu8u0REurPA>
 <xmx:PcyCYGg9Zl_kOwv3PjeWTU8ElBDWXL2yGAS_zbXj8wYWiQaJlgs6WQ>
 <xmx:PcyCYKBZ14FTE3mcj6jNXGxVGH0A0a4DpdqY6AyJWpfGyuUGqTeHjA>
 <xmx:PsyCYFouZ3jeSnZE2KBh7_BeP2rDm00wmMeKDOE7LUz3Cvn2Nucu9A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69B27240066;
 Fri, 23 Apr 2021 09:31:41 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:31:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
Message-ID: <YILMPOZwlODKqxtb@heinlein>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KOWKdDGWbDBpW/N4"
Content-Disposition: inline
In-Reply-To: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KOWKdDGWbDBpW/N4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:

Hello Thang,

> Can you help create 2 new repositories for Ampere specific codes:
>=20
> - ampere-platform-mgmt: contains codes for Ampere specific applications=
=20
> to monitor and control Ampere's Host like RAS error handling, Temp=20
> event, ...

This sounds fairly vague and potentially overlapping with some existing
repositories.  Can we get designs on this to understand the scope and
applicability to other systems?  It is quite possible that pieces of
this already exist elsewhere in the codebase or could be extended with
minimal effort to fit your needs.

> - ampere-ipmi-oem: contains codes for Ampere specific IPMI command suppor=
t.

We certainly have precidence for <company>-ipmi-oem repositories, but I
think there is a desire to reduce them and try to make the IPMI handlers
more common.  I don't know if anyone is actively leading that effort
though, so in keeping with the existing precidence it seems like we
should create this repository for you.

--=20
Patrick Williams

--KOWKdDGWbDBpW/N4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCzDsACgkQqwNHzC0A
wRmDww/+Pq5B04moBpcGOdhf57mCUYpw0vGoouWOLr0UsUjXFOhwBzQCWzHn10yp
h8cXXE+kbtY3bA7ZAHnXlWm/PVxx+6JMsQicV0/O7ZtyrBjcJV+8Ir5Q20Y6Mq3S
T+rBxORm9UqD+20thw7ajpVXJ2zHFKcWJ1SvZcPhfMK8ogyYEGCqyNd8TZfJ0Umd
wBt5HmEI9TKgsQEKzFEOUBugTjI9aYqNargYLZEWqqG5M36GwvjfNfQXuqrYGAkd
rgUXyg4IOWFXvScs4ytACGAkBELbU353ROupQIeCEk16cGLe4Iqhy9aFB3ljfz80
QHWhVTUffpIVjFiGgEsagzRwKOKf+OsLpFzhzZobT0Ysz8U7aRr6aVCEC4JQHtYq
pk59x107R5x3X6c0TtiM03IJC6XZQ46dI9MwHgd9EyE+GJvLHrmO2dxBLT5WBFDr
lpmPMYx+1fkcSe26oS6j+I6dR62QP5Pa1QvkBYwdyOdjCU2lh1RaX35r+Fxn5N1I
5ImN1PjIjEqFRnk/OXR7VeYexIhBzZmJze/bv+wRA3hxd5RZ6VnoXZKlUwpfQUKb
c95ts/zCJmviWmX5GtC5m3JDpRERskhCVEbf9BQ78MQfd/AdxUC9Ruejo1LTcvlx
W4AH68AUydIKi15+aWhoJ7C00dskA6PpDs+SvwOWNVgP49ajUOQ=
=IFd0
-----END PGP SIGNATURE-----

--KOWKdDGWbDBpW/N4--
