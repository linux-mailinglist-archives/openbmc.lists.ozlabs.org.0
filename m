Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D39481B4373
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:44:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496drn2gtczDqck
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 21:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=s/cAhtdr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Etq0xmgL; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496dqs2s1tzDqW9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 21:43:53 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E8555C01BD;
 Wed, 22 Apr 2020 07:43:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 22 Apr 2020 07:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JLvzJUtfS21KUmH89Y9tQFepedJ
 Z1WEsybLcHTTdZXs=; b=s/cAhtdr49WF4Yr1wwaUMTD8D75193ekSWi8Q+Ey5BF
 w58KuVSG6qy120xA6Yp54Xv7n80eB7JnJJovopWdnw1W91MR5XsQT2C3eGf3SeJU
 qgBvH5PS065rwK5K2nbcaRfIudeaCrqjslmnepl3FqLesaN5SQfoDqWtt5UQer+0
 eShrhoHDjEbdb4CPubRfaigoy4dNDVk9VyFJcAe25S4/FizPWqEDkGVu+d29ILhy
 fciAeQeMvGnw+r4bcRBJ9feCGeIEgMnfsRNpgwSV+tZHEaAYWTBwc0JuC9J0RRQ6
 LZukPX4J0tFM3ZEWE3Wo4Zy45V/Wr+zGKJqgj4bVR/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JLvzJU
 tfS21KUmH89Y9tQFepedJZ1WEsybLcHTTdZXs=; b=Etq0xmgLcvdAIxLjp6mWJd
 wV2Ub8357I8oudt4+d1AkEDHFN9zZqmqq8aeclxGeQ5I8v6V6i2CMiFHC0Gsz+zq
 KmVNiUrPQlDeJN/d1PvboBR6wSl0FvjWufLhwsT9PEjXBVyA7qcgb62KDwGMQPul
 BXTdgdJYZ4txXHleM+DTla63R/t+fyBUlJq+VlU6DQzZbP3TcVQh0A0duccNdKUq
 +wcLgQaQTq4yDKfv4v0MWVZYG8t5QkLUzZI0fEdswE3wdlV++esk7oCZ4y9VYv3Y
 HpNkfylcpTcyEAdTeCaeAlsnAqO7KcYwOYZtrb1lPZ0NiCdq9lwf2GEVRZbMH/Ig
 ==
X-ME-Sender: <xms:9i2gXoXWzv4H00stxMWiY_4vJ8Qkifr_j6rCQ8Ctnt9ZGEEYsH9uIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeejgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejiedr
 vdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:9i2gXs-IdzUSIR9faHmqjtZgPWaGIEf3BxlfmjgqRygPNJoLlNQR5A>
 <xmx:9i2gXthHXUhA27y78SpLuMUBVNlcQC5coL2DZfZeODp_t0-FuWa6Uw>
 <xmx:9i2gXjVYNccUdMSWUFdA-gc6c5sTntjitedcdrEL9JzMkC_vuqTcCA>
 <xmx:9i2gXqPAJepNpCUS6eDiD2lfc_v8WmL2PUgjPAmNxbPrwIdD0Yn30A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21B4F3280066;
 Wed, 22 Apr 2020 07:43:50 -0400 (EDT)
Date: Wed, 22 Apr 2020 06:43:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: Re: phosphor-dbus-interfaces modification process for existing YAML
Message-ID: <20200422114349.GD196148@heinlein.lan.stwcx.xyz>
References: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 01:00:40PM +0200, Adrian Ambro=C5=BCewicz wrote:
> We would need to extend it with new hierarchy/namespace : utilization,=20
> and corresponding Unit: Percent.

Seems reasonable to me.

> Should I push change directly to review or do I need to discuss it=20
> earlier with someone? My first thought was to address=20
> https://github.com/openbmc/docs/blob/master/architecture/sensor-architect=
ure.md=20
> , however this document doesn't seem to address these details.

It sounds like a straight-forward enough change to just put up a commit
that changes the phosphor-dbus-interfaces.  Since you're also proposing
a new hierarchy for these sensors to fit under, there isn't likely to be
any backwards compatibility issues are there?  If there are, that's
probably when we'd want to expand the scope to a design document.

--=20
Patrick Williams

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6gLfUACgkQqwNHzC0A
wRlzkA//eKC/YzSyO23cIKn1Vt5PF8dDfSTg23vBDikNdLQ3HNpUMZ7NuEm1ht90
kf9vfkTIHW8UmZKHHWSmdjvH5KyNDM6ZslFtb9HEXE2Gf6C3kFeo9YqjHGq4gEXt
0D4whdoKmU9SefDely3ZI1Bu3SaAPdaTtwGL2VuhEW6Hk1qTg3M/HhZBxB16GuGV
A1UG3vIAZCw0cKgtfAjtHDcJ8H8HZ9nhKXiP88SKBKahdmNfVIW1ReEY8ougj0Ve
f7S4vJgcO19tOx+f1njK3AQBaPv5j/U0411729gwXjvVmq8jhtAmxHNeTzjdLqaH
tgKXMCXP3R3M7f8FdndFNZtqyV4mCXcR+c40pg8G2zJKIvTONOGi5EdfzP+Lfoc3
DCbjza7H8iZ3VemC6eRSK+F6SLIMxtXZMescxzMPh/fOhDZI0jvzPA98wmHcZqqT
znoW6daWHgRZLAcAYsD29d3RXwwcCaH1kPBbtdrwTaGLUkp7mZKeysgJ2ZRvHDAv
vtP1kkJWPTTiIFQvU5ACdvpV+UxFXFpV6XfD+lRG14ntxG4ad5pFJFiskSGD9DxD
QbqPNzla5hQDB+ZtGEPLfKFIoeYHAd1uZ86d7uhnjcvu+rd0UDwQ37SAj/ZtuK/d
HmClPUiTHA2eYYYjpu6WSwCjBizjt9nfDs/J2B4wDlYQRt/iAMo=
=yxG7
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
