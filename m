Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E44E97F9
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 15:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtdr6qJWz3c2N
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 00:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=dCRQEFgl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=dCRQEFgl; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtdR5TtXz2ynj
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 00:21:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648473670;
 bh=Nm/Ru4v6GD/9m6h8Ema9mdsaUHXiVXieqg+H9J3bSYw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=dCRQEFglsITzGpimBzcg+u4n6Kl0FzRG46PfUKNDL3Zc6F4MnJpb1xKHoaS2pPHf7
 Pje8OF4P7mEbD47lM71pF7jGJfY9ca178uwYfm18LEHprmOLdnwz49EnmIvOp5nfwD
 IXCKRSqyaVAzKIxi+6TF8gqSqeuG7cFz7zOx9I8k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1o9Wy01IDW-00b62U; Mon, 28
 Mar 2022 15:21:10 +0200
Date: Mon, 28 Mar 2022 15:21:08 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkG2RPrtPaBNXb7a@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x1hzLjR6QNWBL5ri"
Content-Disposition: inline
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
X-Provags-ID: V03:K1:Bioqa+FsRJNTbH3AmylnUOJ5uauHNDFVr5040I9oO0lC3hC8za8
 8toO+l0g55xievdKeTJ469gRnIKOkbsFSsOO+tgGq7irO2EOMhJkwHWcURdNp65efMi2oLY
 L5fGfWljKrJsoHoMaPXHH/ObRkqn8C/sxbzJkrFQPrLB6jphQpHadN6OgYOe3EsTr5qfgRR
 0QxmE3cnPXA2J3+3R2qHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qSCWiWhp0AA=:JPnFg4Ox1UVYYY/8fhKJVM
 l+WvPeePMt4LgNO1jOCklUiJsMJp2fVhkF6zvHWpwPAD9p3mgVERt6B29InFZ4jYgFdBA1cTm
 qSqT6SMcjXT0xhEAtfS8lEHCAbdD+JaGn0C9Vl8obNjSlkwx/RiBlQwb138BWaVTReKkIROJp
 NmbTpMS9m/HMPbF3tfbiDPS0I/f9zoLSS7lRHcDmG6NU4aEbhAtjG4N8fPjMYmN41KZP9j5Li
 0HqNylcSxz+EM6+yyI1O5ffSi+2g4Qeiedae73p8MkQGX0AkPpv20/NDmW8nPMRoCUgSLThAY
 TLdgd+0xyYxRjrrnEqh1rv8JAQ9VNn+jVKn4b8KoLIFFAHxWRR+1lI0NYVeb+3XeLxOfeBg14
 gAyZihbMNiS3tr6yDnFt9RsPUjd86HIxJXiBnn8ff/PMNRF4yRbIEmRqoLDMLj7ZQdDyig2TR
 D3faEKe4uBc/xXFoVzCqIxa/RYEGjM6cmx3QBW4SvS6R6OYs/pkBLkkboqv+dthGVLTpWGQm8
 t3hHhgBoZzDa/tDukFKzCnMCBX0fvBwPKnGwK3pn+w09ll4szL8l+1POb0DSdWP85MUvSXqIY
 CEbfamt1sbJpKJhT+xpLHVfcFXCnO/8M/zW+3B5KclMF/aUNQZPItw/KgeBEk22LsgMwBSohD
 7pg464l4jsM0XKrhGm0BltSjqvBNzDwBfrU/lM0dbnClpcDfyAZ7djoox39wGvonabWYMqx+I
 hwAruor/3uM4fCfq9TGuMjXxss+XipMSC9sQVHcKr1rbhp4CWR2WKgcjRuaERyOUV4HoWg3xd
 0PT7V6QsSDQzDft0mgayfapeqTiIoERDMphL2Pub/kxAqGkOXvDyIKmOcblFa4eMvZOA2t7pz
 /UcIVrhr4hcrN0H5A6QqC21PvordOTxUA1TsbJdoWbUXY1KBORh2xhnjzO/9Mur33ngpFnmmy
 OxPhT26iaoSQ9AfHKYJ8LEsqXBGgF4OewVdWCJWgvOJGhPYVHPQHbP+teS5P8ozVm6x0al4qs
 4PygQzjcdy6BF9MKsChug4Iv0jEJ+gKPzHip49KhW1vvSuTzRqJ/qoNcv/VD/9TonnJNkdSTa
 LKKxAFfWQ792s0=
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--x1hzLjR6QNWBL5ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.
[...]
> [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0

Nice idea, thank you!

A few notes on categorization below.


>  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
>  rename arch/arm/boot/dts/{ => broadcom}/bcm-cygnus-clock.dtsi (100%)

Or maybe bcm instead of broadcom. Not sure which is preferred by
Broadcom people.

>  create mode 100644 arch/arm/boot/dts/dove/Makefile
>  rename arch/arm/boot/dts/{ => dove}/dove-cm-a510.dtsi (100%)

Arguably part of Marvell.

>  create mode 100644 arch/arm/boot/dts/edac/Makefile
>  rename arch/arm/boot/dts/{ => edac}/ecx-2000.dts (100%)
>  rename arch/arm/boot/dts/{ => edac}/ecx-common.dtsi (100%)
>  rename arch/arm/boot/dts/{ => edac}/highbank.dts (100%)

Why edac?
The most obvious name I can see here is calxeda.

>  create mode 100644 arch/arm/boot/dts/freescale/Makefile

Freescale has been part of NXP for a while, so it might make sense to
merge the freescale and nxp directories. I can't speak for
NXP-the-company, so that's just my view as a bystander.

>  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile

The Kirkwood family should probably be sorted into Marvell.

>  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-moxa-uc-8410a.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-qds.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-tsn.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-twr.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a.dtsi (100%)

The Layerscape family is part of Freescale/NXP.

>  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi

armv7-m.dtsi is a bit confusing, because it contains a few devices at
fixed addresses, so it looks vendor-specific at a first glance into the
file. However, if it is actually as vendor-neutral as the name implies,
I think it should live dts/ directly, rather than in vendor
subdirectories.

>  rename arch/arm/boot/dts/{ => nxp}/lpc18xx.dtsi (100%)

Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
i.MX family (and thus the bulk of the Freescale legacy).

>  create mode 100644 arch/arm/boot/dts/vybrid/Makefile

Vybrid is another chip family of NXP, with a good deal of Freescale
legacy in it as evidenced by the "fsl," prefix in the devicetrees.



Thanks,
Jonathan

--x1hzLjR6QNWBL5ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJBthoACgkQCDBEmo7z
X9sFJw/8DJFQM9nd8arLY6Z//ocARyXbmt5SCXJ4Fe+N9mDLSgBhMW92vbZe9AJj
LXhypAAS4wZv1lpuor2GHufy5pFc0jL+UXBajKabI27cZX6x1KJR5tWglAAzfepf
zI8iaRfdQ1vm+70MGQDgXYMsUAyk+1RXuLYWZYXp3XX0E/0SsyXkc92jdqyurZmI
8PwvWo5cRY+2m35pvPUff8I4RNfrVvCcMUlzD34bnbi6Kt8Iedvn8QCzLglZyKgs
+0JL9pSrbyRvGqbYuaKqryL7bs/msL7CLAqUTzunTi1TFbGV8/dRzlxL9fFYmyFp
NJ9zszuKs8wfW03g+piIjWwN0ZItFXNQvvdBs0y6bfZZLwu6V9QF1MAN+7cnlCRK
94EH4UNH/FGOZkTnrW1IfNRG9hBMgddEWKQQmniGKmdZGefAIfvENQWq/ErV5vb5
vVUwMxG6HqbFZH0C5bFzeyUwd8UjjnCSGJ/Fe3Xdmgqpvk6pdgDESW+/7MEnXYks
9zs9a/M9a7iGH+Dagu5EkP8L2r2R1wTEBjSXrs0ZjfceZbVvYwygfoKPUzW59eRE
szecWAs/qLdxDrLfIVN1Kpr8KmLNSyyYT3kFDAkuupyHj4Qb9Am40KgzcTgYgv0g
ex5m9SbThoor9QWhVT1IDQHbzT0ZKHkaqf0dCJyIPVUekDYbFvA=
=A4ZY
-----END PGP SIGNATURE-----

--x1hzLjR6QNWBL5ri--
