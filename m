Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5863692BB
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZPR2B8cz2yRW
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:09:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=nhPvpIYb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J+cYuQNa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=nhPvpIYb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=J+cYuQNa; 
 dkim-atps=neutral
X-Greylist: delayed 268 seconds by postgrey-1.36 at boromir;
 Fri, 23 Apr 2021 23:08:59 AEST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZP75Bsyz2yRW
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:08:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3123E1303;
 Fri, 23 Apr 2021 09:08:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 23 Apr 2021 09:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KtML+RTgYUuXsYPNw1mmVn9kOTi
 NG6lYAHng1IvUD7U=; b=nhPvpIYbTxCoz7evgZK9TTLRtukZCmfWdkFjTBM6hLQ
 kFOQMMicPIFRBxemwNPHDjaxLHGmJXYtvyr8TM8bIB9YnhDpp4NWbymebhNfWx9j
 GgMoKnHx/ewgCMwPDbvpa91JG1mcGMd6JPKtLGSMXCKKCc7ddLpc09APYxgKyml7
 kYdQGnLHCxX6VCR08b+jUuJAuoelPYPaPbliLW7/CwnBx6pVMdMXTCQODN68Vps3
 1e/nDkVvYQh+Q697eeD+u5bOMIJ7ScAxJMt+Rvveuz4j/jPWKDT92CN1wcy0SAAS
 Z5d+VfRPYwmFLYS2lQaRWxv0Cyq+5b1NMI/nu5PjtWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KtML+R
 TgYUuXsYPNw1mmVn9kOTiNG6lYAHng1IvUD7U=; b=J+cYuQNazJ8XoT3k8+EvyC
 AU+7vWR5GqL2KSlfcoM2//B1UFbiykjJiKWZWhjfX+kwHuC4f9WqM1nDk+4HyQ/n
 jDsA1gQ6I7JmFpMQzvIQkDr2++VgJyrG/O2J/QCbUIFXLu6VpneEitd+7VvFYdcz
 51oVmNPyW9rwj1hXyynmonyA7kwubALNgruSXpZNbpAF3YqjdXY8Q+sVxZY0bTf3
 BMqlSnE3Hk70AvBIjGvoOuYzAeKFpJxdAulXsExxoynjR1nWVguxmx9kCKuoGVj4
 fYEQ6AU+/3gKZxH5H3vZOyb7ggatiMRdA7y1keynMKweoYIfd5LHgehqUGq3jCfw
 ==
X-ME-Sender: <xms:6MaCYAbDijw5GMmiT-zjalLQw8fzlaq2r5ffZ3xduXwcRiVkMXqbqw>
 <xme:6MaCYC1lpiEZnmp5h1umroLqhrwM2CClV0m5zheBlBEt4k5u_uhZkD_C8ttHAINXT
 2iYxoDABgwkYnwbgr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:6MaCYIWKuVJ9nZjfYcPpVrO5wxwpCOlJOV70WilBsnBLgZQoqiurUw>
 <xmx:6MaCYEX82dwy-0cY2IuPqB8vJV2G86t4-ttRCyq9z0WXVj73rxDA5w>
 <xmx:6MaCYPfic7GbI1YE9zh_SYbwcRwtDivFF2fG4yoVNnDG27-FxqL6fA>
 <xmx:6MaCYE3vj6JjRK4bvZRg3qhfzURG1AZ_IagMXAMCYemFDg-8cyv1uw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0CD3240054;
 Fri, 23 Apr 2021 09:08:55 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:08:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike <proclivis@gmail.com>
Subject: Re: libtirpc link error
Message-ID: <YILG5jY2q/lHc1hy@heinlein>
References: <61F426A9-21C7-4D09-BB20-AC4046F436DD@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mDSjYGjNbuba4hCX"
Content-Disposition: inline
In-Reply-To: <61F426A9-21C7-4D09-BB20-AC4046F436DD@gmail.com>
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


--mDSjYGjNbuba4hCX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 04:30:29PM -0600, Mike wrote:
> Hi,
>=20
> Has anyone seen link errors for libtirpc-1.2.5-r0 from openbmc tag 2.9?
>=20
> I tried building with tag 2.9 using my added layers and conf from a succe=
ssful tag 2.8, but get errors in libtirpc_la-binddynport.o for multiple def=
initions of __svc_xports.
>=20
> Mike
>=20
> Sent from my iPhone

I don't know of anyone reporting build issues with a recent tag.  I had
updated it not too long ago to pull in security fixes from Yocto and it
builds successfully then.

Is this a `bitbake` failure you're seeing?  Which package is it for?  I
assume it is a base Yocto package because we don't have anything that
should be directly linking against libtirpc.

The "multiple definitions" sounds like something that newer versions of
GCC have become stricter about.  In that case, I'd only expect you to
have different results if this were a native package (that for some
reason, incorrectly, your host GCC is being invoked for).  I think many
of us use a Docker container to build in, especially older releases, so
you may want to make sure you've got a common environment to what we use
in CI for testing.  I personally use the crops/poky docker image for
building any older Yocto releases.

--=20
Patrick Williams

--mDSjYGjNbuba4hCX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCxuYACgkQqwNHzC0A
wRkHOw/+ISa8XACuV7fu769q6kYHNwPyfLAw6+YNkv7uZNiV5bXxLq4g1FrGbVrG
X2YO5w+fTf8R17+cb8dnw+sGRa7A3v839LuIdHjS5/NLRE1nDZfwm4pnBuYFlU7Y
+XkExhJxlR5MSxoH4KKLybBID8wu8ZXBu6D26qTQ7GeeyqZcDkluX/0jwFmmaivO
Eo8tEwxlGk98vdjofOnNkdGSkKsogi3vP3/BLTu6Udb3aHxN2RSQe+7NcsBfc7xz
o0lCKvEj/Kcny8Q5LRytUf6I9J9SO3yRyx0A28rDtyM+X/3ZBZjk+3iJcl28qp/r
w8YqfDUVvaDaCMUCbhGqETNKNMtoAJJFmhKPsEmPJMM3+6y9JmwXxX9HzmR68lxR
0kYL/2xhYqv1z4OGwr/oLOLEduxkKksAr8XgMCJsu+JidGDX8GkfSW1240OqvDSJ
nrQj5N4Pwn4fDv2JBx63lP9SRPI/aNTMnHx+Z3Wbf331yjwdaYlEULmL8MbF64ao
L1br8BmP7lEBpEq1rNNyPnnWyjVeVdw8Unz238+zqy5Rt2ZSIZLGs21drZr9zhQ4
0OXoE36TOw6ZIN7PGqfeGe1nrmpRCjJybN2EejPeLSfxsFC64+s3YMQv/ZmtpHtP
c80kEdy4QDR7OdF3ZE3RWm6yb8xesU02PmX7/z0A9vYn0l9P4nQ=
=9KaJ
-----END PGP SIGNATURE-----

--mDSjYGjNbuba4hCX--
