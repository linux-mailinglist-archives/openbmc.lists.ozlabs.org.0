Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84475251ACE
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:30:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWcH3m6CzDqX0
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 00:30:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=hwSgtRhS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kMdevwlx; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbWVs5Pc5zDqWb
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 00:25:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C9486B4B;
 Tue, 25 Aug 2020 10:25:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 10:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8MibFf5l6N4W0GHXxTG112gu7kZ
 KOOCmWh+URCmr9uI=; b=hwSgtRhSAg5NiaZIL2cKceRsQV67/+6h2d7oFt+wPcR
 b1kRFJDlwmpi9P/tQ2m3+Jhh9gBuCXvb7dwR9tp8rvZRwOyI5m2+6aHSgWriBuFc
 lrHkopKaMhlm+zU/C4sUltvE/wsn5iD3KkWHL0Z/9klsTOoI2l8BEHCDoPZdljPg
 7gzBkU0xqCXvOInMHK/miuFpWlixXdQYxZK1I5V5uUATvHKi7mlVT3fEVKug3DS2
 QJEjWQIIt8CPaQYBCpdIzkfNphs+IA3lWfw/l4jlNiYgkPd8HgIGna7HwflJYRxt
 28KxfZZOqK5R5xn4EaqrvCj9lP0MqcgyAA9z3WwEmMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8MibFf
 5l6N4W0GHXxTG112gu7kZKOOCmWh+URCmr9uI=; b=kMdevwlxENf88tv9luVQOb
 n1k6MFxkJ4wtVqxVxVb0dxtCz50Kgmnayds3GJlbZ+eD3Bd9XduR/3EO9uFzo5gj
 QZxWRo0fwP/GhYoC/HiMq6qkYCQYaKnxd+qW6lpNSNJsh8xRAv74sl0/EYexb1GZ
 DaAjdbmmiMhGXZaZtTgedTrTzcdKULj+DoZo/aVWpvJj7V112/1EyFEwNKZab2RL
 MHMZEoAv+ukwBYAc+etLfKIgTfMOyRAIjY2rnORytfZw6EsOW2rHNCzPTUh2AMEb
 iyR0z9uoNu3Ln/5bx2RVf9yfnmpUUtWtvmZW3mI/ctSeCXDGDU5jC29w3BesNZ0Q
 ==
X-ME-Sender: <xms:Yh9FX9fOPUmePve2gANzJgcES4qcsJ4A8BFpJX9rx_-lnai1SXxWxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeeuleekhfehueejteehffefhfdu
 tdehvddvhfejudeikeeviefhffefveeiieefnecuffhomhgrihhnpehophgvnhgtohhmph
 huthgvrdhorhhgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:Yh9FX7NXUB_gyF-rfkouLPetpTt9KWsE8T6i0fwOCDI4bKplnO1tLQ>
 <xmx:Yh9FX2iBZI5bgMbDfcSiRTSP6Kmf010b4IJyXnwZPdRdYsDX1MvSAw>
 <xmx:Yh9FX2_10a3ZBIAqlCvRm43IZ_0PiRVDg3s8rjw3ovMaFOjsPW-BwA>
 <xmx:Yh9FX6Wf4lRKh0mwWUvzrAUqebOftaK-_PnrEdP0JqxNaes9zthKJQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D2C030600A6;
 Tue, 25 Aug 2020 10:25:37 -0400 (EDT)
Date: Tue, 25 Aug 2020 09:25:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Neil Bradley <Neil_Bradley@phoenix.com>
Subject: Re: Tioga Pass OpenBMC 2.8
Message-ID: <20200825142533.GI3532@heinlein>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <f11b61fdc4c240aea245f01b2318c616@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline
In-Reply-To: <f11b61fdc4c240aea245f01b2318c616@SCL-EXCHMB-13.phoenix.com>
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
Cc: Amithash Prasad <amithash@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Neil,

On Tue, Aug 25, 2020 at 01:35:12AM +0000, Neil Bradley wrote:
> Thanks Vijay! Take a look at the attached picture. It occurs to me that t=
he RJ-45 jack on the left side with the purple cable plugged in may not act=
ually be a network connector (we got these machines last Thursday and are j=
ust getting acquainted with them), so please forgive my ignorance in case t=
his isn=E2=80=99t what it=E2=80=99s supposed to be. =F0=9F=98=89 The workin=
g ethernet port is the leftmost SFP+ connector on the mezzanine card (below=
 the sticker), and the rightmost SFP+ connector doesn=E2=80=99t provide a l=
each. My assumption, which may be incorrect, is the leftmost ethernet jack =
is RGMII2 and the NICs on the mezzanine is RGMII1 (at least according to th=
e schematic which shows it as an OCP connection).

=46rom
https://www.opencompute.org/documents/facebook-server-intel-motherboard-v40=
-spec:

10.4.2 Management Network
The motherboard has three options of management network interfaces for the =
BMC
connection. The management network shares the data network=E2=80=99s physic=
al interface. The
management connection should be independent from data traffic and OS/driver
condition.
=EF=82=B7 SFP+ shared-NIC from Mezzanine 10G NIC or PCIe NIC, driven by BMC=
 through
RMII/NC-SI or I2C. I2C being default
=EF=82=B7 SGMII/KX shared-NIC connected to midplane interface from Intel=C2=
=AE I210-AS, driven by
BMC through RMII/NCSI
=EF=82=B7 10/100/1000 MDI shared-NIC connected to RJ45 from Intel=C2=AE I21=
0-AT(co-layout with
Intel=C2=AE I210-AS), driven by BMC through RMII/NCSI=20


---

So it seems like that is another RMII/NCSI attached network interface.
We always use the "SPF+ shared-NIC (10G)" though in our lab.  I don't
know that we've ever attempted to get the Intel chip working.  There is
probably some device tree content, at least, missing for enabling that.

--=20
Patrick Williams

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FH10ACgkQqwNHzC0A
wRlXCBAAhn0hb8txap8RV4Y0L+qZmEn0K6OzYXzYcRk+r+5f8JblzBEhxuDY+lbf
5ogr+/7EIwVjOznYZE/m6c3KWiyUgP1mRasLwA5rgDsuZ4c9JmIVguWqMJpIPAhC
fuxESQLK6X0F3uXZB8VBB+rVn5AkpUM8PktOIuROlVNiVkOWy+WoS7KJPLAC+hSg
yX/pfkz5XQBYCsgCa+RL2GB1PHFdH5TJuDkDlKdaWHmvbX86mc00XPrbOuRCXlh/
4KIVLvicTvoT4Q8gm7Gx/wNvOAyGBNpXd170/Gj0AHA9lQx3HSmbaeraUheepNkO
IzwvVjODricUjLFI+gAwQBE4hdQQ7YBa82dQu4CCjUoO9otlfewtHYNnE3GNFLZl
EdNAJBFf/fsBsZgC0ql7NwvcCun2robXSDKvscTObxdpEheXBqlFtZJMEfuNapvp
DZ7hrz7CcQvypLc+vCuxB1uNN47amQjWsVWj1Ir7/ZATA/1FKhyPrgY4kTPg9KD/
r1EohPsFx5zb6jj8RKFuZOdkx8PJ4ScLznFz3hJGzmNNMilTuHw6LcBu6ZDDqjsz
/csh/F+74pwRo4FkIclp25Gy7E/DQi9l5yQh4dkRzukvQ/NAa4E3Jrx4mbgc0EaO
BXy7amt5Ga8XdoPcQmi7JvL2FTlLFTYgMlZD0G5dIlqn9Va5/qE=
=K4Zp
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
