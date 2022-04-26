Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7364510BAB
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:04:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knwsb56jQz2yHp
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 08:04:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eoZJK5ty;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KfiWZA7A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=eoZJK5ty; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KfiWZA7A; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knws60Zhwz2x9M
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 08:04:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A23A95C00F8;
 Tue, 26 Apr 2022 18:04:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 26 Apr 2022 18:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651010660; x=1651097060; bh=nKhjOx8+gT
 SgS8f9zOHnVn2B5hoIh9KS9pRq/bi+igk=; b=eoZJK5ty5xJGm8ekPMl6PjYq2W
 4V2rtyJCZzcI2cbxQdQ16+DzqZqCTiHyNi7KJIeH1pP6xfL/DgeTrGYkQCpipFMp
 hFXRFaI7KrUcOD/H0hDxR65vPY3rzFaSWKADEJctynaOJaBiEVYcUDu1jhkZYMDl
 iuLVJ6jf83nXGa+FHmprpjou+hqWc8GtNEs8s4e5CW7AzhZhti7n085DGF9+T8wQ
 zTvMo834XDK/cVwuxK0ZOELWiwRoTjExBMSQ/QR4kTjGgnwNFdQzrWtQTIld7Q7S
 qR8ug3W/XbflLsi4gtsb5PyIvo2CwCjTc7ReSa0ZiPr1gVsFreEZgdgtVPog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651010660; x=
 1651097060; bh=nKhjOx8+gTSgS8f9zOHnVn2B5hoIh9KS9pRq/bi+igk=; b=K
 fiWZA7Aqsi2lWNL2p5FTK1cUr6npupjmdL/Q2s7WP9UtoI+mMXiw6VMKQOK/DSI+
 D8pLDZ5vnvoAMcMo8FRIrYa76dyAX4UVX8G2EPoHo7t4GwYTUupyBYiOu+WnZ+he
 0gBdKkXU9dUqkaa/rYXKzTzneXrHCE6EbxD8ruzQEXupg+ITCmP3d9r4gxTfSXcF
 VVfhj6s/3jgxrjtlXVJb0QSWAOYT8caYyhxvX2ujSWncZJP5xFYKovBcmN8CW9kj
 UqqzcgpEipOYZYI1yNDppAtuqSi4G9TQ2Q/zFbEmPaI+VVLugle5+ukcamERlEYV
 mqYfIawbGx5TMaG/QIEvg==
X-ME-Sender: <xms:Y2xoYraoKYa-407dIZuwYeKfN87PQ82BJEN_Na5mb071i7joEfubMA>
 <xme:Y2xoYqZ1DjH7y5XGKn5F93BnCYcoAK-LKSavg6u4Ed8sbppFYA_rsbJLpva_oBwSi
 guW2AJzmmHSc4JbVHA>
X-ME-Received: <xmr:Y2xoYt-TQ0Ftukzt8toMc_dZCPfnqMuJvWA42b9Mwt3M0QnEPhuUT8XMWs-ufOm8dVRNVl8yvr0Du-oG4zbxCdeduBmbfyiFMeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
 evuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epudejvdeujeehgeeigeelleegvddvgefhfeeiffekkeelhfehfefftefhtdfgudevnecu
 ffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigt
 gidrgiihii
X-ME-Proxy: <xmx:Y2xoYhq8F3mDxwxWkPEn4FS2YphbViI5MQ1m5dlF-bI11ueKw6TlPg>
 <xmx:Y2xoYmo3VhIg2Eydho68rxGNwJb4VHZ9VRniWQq9o_GEFhlEo9HVSQ>
 <xmx:Y2xoYnRwHcc4PJgS8UZB6lLLn6EArA75xKDNjH7eX-i0WZMgyAUcKQ>
 <xmx:ZGxoYnenysGEZcQF3uoPW4J2JuH0-0tdV8DXKu2YV0H8XYpC0ivaYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 18:04:18 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:04:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashree D <srid.11486@gmail.com>
Subject: Re: FRU information in inventory manager
Message-ID: <YmhsYVC9CzSUYcT9@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CALXuKJc9=hCWjU_QWi5LrP-3SeC1EwE7vvScD4qJgSfZoN_hTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gOJV/wCka2Q2WxXF"
Content-Disposition: inline
In-Reply-To: <CALXuKJc9=hCWjU_QWi5LrP-3SeC1EwE7vvScD4qJgSfZoN_hTA@mail.gmail.com>
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
Cc: spinler@us.ibm.com, vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org,
 devenrao@in.ibm.com, santosh.puranik@in.ibm.com, velumanit@hcl.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gOJV/wCka2Q2WxXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 09:27:30PM +0530, Jayashree D wrote:
> Hi Team,
>=20
>=20
> I am working on displaying FRU details in inventory manager. Based on the
> eeprom in sysfs path (/sys/bus/i2c/devices/8-0051/eeprom), FRU details are
> fetched and updated in the inventory dbus path in phosphor-ipmi-fru repo.
> This is fine for the case where the FRU information is present in EEPROM
>=20
> In OCP multi-host platform, we have IPMB based FRU, this is handled in
> ipmb-fru and the patches are in review.
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/51555
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/39593
>=20
> Could you please provide some suggestion on displaying these FRU details =
in
> inventory manager?

Is there a reason you're using PIM and not EM/fru-device for this?  It
seems like if you were planning on using EM for pieces of it, we should
continue for the rest of it and not try to blend PIM and EM.

--=20
Patrick Williams

--gOJV/wCka2Q2WxXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJobF8ACgkQqwNHzC0A
wRl2xA/+JQ+zCnSi7xp/0BX7sQJsPxsj1Qa+BkRCkjZj88hWjkOlbtWB3ROk3nBw
NSPvv27nWGMtrRq2IOTj1aXM0K5fSaqZbvtujFgcMm3zWdgy9B4fIZXl7dBjYZUz
A9PfHKIWrsRjOMjIz7CvVGwCjElcyaiB4jUu5pSGeG5C7LI+FpMuIGKiEttQtMqp
UVXxuXPH8bYYjc31tqhqcys70M20ot8j4AnIvvCmoqt5oU4WQE3IDO4XYcBFkcLG
g9fg/ym6SGormO02kIeGjfN8Qlsh1bSH2UJ/qri2r+S6I6A8L5VYIJYApDQ0qaV6
6ZEIhp9g8k+mDPYgupCKFhvtgyPVOoWxs2q0XD3nrNCiWgTosZyjdcQ2ZK95pRQp
2FidSZhsgulPsaf4fB+85nIMjI1p41GwiO3V9G5wE9jI7zke055PMdRs8GLZFsSp
6HDDePfwj/toar74VCJwr/9cnd91cO3Ygm2vW49nHNi8zKQ1J4C2oEs+3SvvKcOz
n3ZjR8pUezDsf60gjK2EZSpu46GwpqqNQ8HLtINaWSXyeGrcquIrwU/HJCs6TIRi
mKgS7RKHFcs6PJCuR/p1nrIxfXHDk901FBlrvG2mGAdPOCiLOSOS9wdXFRE47enu
m6JneVMgTRZoSLTVvXqwOHKc06Ai5PQI00nYsJcBWQ8tobIr41E=
=7fQC
-----END PGP SIGNATURE-----

--gOJV/wCka2Q2WxXF--
