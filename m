Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C35A456D
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 10:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGPHv6fRcz3btQ
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 18:49:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YSKJY0it;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YSKJY0it;
	dkim-atps=neutral
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir; Mon, 29 Aug 2022 18:48:51 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGPHR71K8z2xjh
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 18:48:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1661762928;
	bh=x79yWCbuNLXEU/1zCdsg1A5pjnyEe/t3/mrJeXUW4SY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YSKJY0it/W+HnzGvYhZKzzKqrJQYbU8dBK1rHHPAc8Q1emSHZdNr5J96l934XTxOI
	 7RtBxTznPe3vnqK/nf0CdBrqOsfl30jCzId5fHA7u9RwHupZoPRMZMED2y4TgneSNn
	 XDS9Zh1fXsjFQ3xtruSn5V40/eDlD4UlDmeN567g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([95.223.44.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp5a-1otx0Q2QLE-00YC5h; Mon, 29
 Aug 2022 10:43:30 +0200
Date: Mon, 29 Aug 2022 10:43:29 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: AKASH G J <akashgj91@gmail.com>
Subject: Re: Read CPU memory from BMC.
Message-ID: <Ywx8MZ/vih+W+ujY@probook>
References: <CAE33tLF5KTW8-gCq9bn_AsKmfaMUrV9faERzWQzL6s38F2O-DA@mail.gmail.com>
 <328645f5-9bd7-99d0-8b1c-511175d3d94f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ByIadL/5AI18gBnY"
Content-Disposition: inline
In-Reply-To: <328645f5-9bd7-99d0-8b1c-511175d3d94f@linux.ibm.com>
X-Provags-ID: V03:K1:RepSYPrNWkfiW3FWbcYQ+4dWZeUsEMvOwDPFuFIgUHFlOos7pil
 bqQpO1mFL00wM/laNfT5J5Kc2ns2efUU8Off3QA7Yi2kdg22WsqZN9dNWIL21u3VY42ThxY
 iKZOyhZCR4oC/ixmzkyaKA+OEYhHjFneFxpYNjhmC6qvNs3GbJFNf7qFhe0RDIXx4jBa7Ir
 emLC+C/ja58/bNytn2geA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:95a2AMA7jOc=:LRQKUD21NhnYNzM9h0yscl
 5vORAKIGgXiCiMo/V9ToqSm/uBfxX5ZsXdUQvfnGwz+4K8DSAxcSinqZEzNN7ZDpx3hfhgYPc
 zV2JS3OYoRvlnFAs1bQ3wRSSCnTY7xM8k219m4gFFwJ4oWIO34NlW5QOGX2RYBvOmYj2I27OM
 aaJ59m07Zux91LDkO1RPb6t4EbFLVIbGHsR12GbLQihKT0qy8ckHwOA0g29HhmfTFoHRVnFWE
 1oS23ThKrlxbSX28k1Jpkp5ip8CgLpLn0pJYchertgkxIpeYERGe7eWE6fti2gbV5TPJmZcvx
 uxE7uasDhAniKqA2al30QVDwzEqvVOSf8CWH7YFbS7fu7a/WfnHWlhF6Wsy64dOLVKnS2QWkZ
 jj6iPPOp9HR4r+Cv+Dc7Kwzju/IA520lxfVksQ+8rb5hmENiF8AqCzMghc8Tnl4hs+jTJYwak
 lpnyXhFIQ0s+j14ZR5XcWz+TlxwegI7uFUdnu6cipLKwdEoS8s4Oon6/OqRWNBGjsSDbkcmfq
 iL1HDGO1infs46N5E2OuWUMUHQ6C3DT/Aylbykl3hX7UW9JBXtlF+5Qlnwl29N6OOtr9mDY6u
 ZV/kyaKUVFcOj7d+eQdsZDvgzM3dE96ax3N2pJWZjSYxJ+ZKgEx79vcD5qPh3QzXf6fFCk7zB
 EyL31hMzXiXgpDDCaNcD9AQD7CEchyE69ar5bMkkicJcaSUVunvrPVturOtO779NqFi0f7qIX
 dakaQb9XeuUeqieaLVB0yRKxgfwe07g1gPKOFnVSJZXR2wGiDVHMd/WiLpxxjKnNZXSD+4CJB
 cP4QI1gpcWo6J/AbztRa7AEG2ZKxfBQOEASLBLS1tE4UflYZll/LB1oA1VOFcFYttea3RlRl/
 cfVkAgCVSYOlnmS0x0RvAtWAQ4ZkJ1+wuzEN3K54/OxblUHBg5m94b0Xfi+MoNcsxzk8GTwDw
 Ze7PPfZ3/nTNfHhJoGE5OE+fA8OAJNOCDT/tw9Sv3OCYTBNh14/0RL4h8c+e4UsQmy49MKXLg
 Wn1rMyIvxY9j274EVOaaYVBiH0dwCBlsm6tml5r0BPThC9nO3iNsMD8rp7uQ7MYtlF/r1an6A
 6515endSwI4jmiJOuQ9ejujp+nJMg56chgebRlZXFY926N4Y+D7mC6FpA==
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
Cc: openbmc@lists.ozlabs.org, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ByIadL/5AI18gBnY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2022 at 08:30:54PM -0500, Joseph Reynolds wrote:
> On 8/26/22 11:42 AM, AKASH G J wrote:
> > Hello Team,
> >=20
> > Is it possible to read CPU memory space from the BMC?
> > If PCIe connection is available from BMC to the chipset, can we do DMA
> > from BMC ?
>=20
> Akash,
>=20
> I hope not.=C2=A0 I assume you are asking about how to read the host's me=
mory
> from the BMC.

Hello Akash and Joseph,

At least HP iLO BMC hardware has this feature (as documented by Airbus
security lab[1]).

In other case, the reverse is possible: Reading/writing BMC memory from
the host[2].


In any case, before OpenBMC can support reading/writing host memory, the
hardware has to support it. Which BMC hardware platform are you working wit=
h?


Greetings,
Jonathan


[1]: https://airbus-seclab.github.io/ilo/RECONBRX2018-Slides-Subverting_you=
r_server_through_its_BMC_the_HPE_iLO4_case-perigaud-gazet-czarny.pdf
[2]: https://www.flamingspork.com/blog/2019/01/23/cve-2019-6260:-gaining-co=
ntrol-of-bmc-from-the-host-processor/

--ByIadL/5AI18gBnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEhh3Clxs0Y2wkh8R0lF/c9L3bh38FAmMMfDEACgkQlF/c9L3b
h3+rowgAhsXFEhK74WLvj3PYsSRuudrFEauEPSVTKHkC0te58UpbnWuX9ai/nJYS
PwksOhpVKJNBsNl2WMoJsx2321a+I0gWH8m3a80+CNeppLvlcYfnDj1kUXqsYrv7
a88H6a6HV15aP5WlBsYDq2WK5GC2jAU8gzLR352kYmtVvtbScyvltoRHHjT5610q
vjzjbErLjxxPOvmxmRi41q1EplbrtjYuHJB0yo0P9jQ7DaJZ2kDJIfR38VwNEnfh
m4kQxuVexZ5dZ82lcs4+2t/Lce/puHdd7OoMvl6Gbwh3v9sBw3iTfGkC9pj3Fi58
AheSQURVONV+/p2OcskO4PZG6s8LMQ==
=djTm
-----END PGP SIGNATURE-----

--ByIadL/5AI18gBnY--
