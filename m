Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471886D818
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 01:02:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TDvZPeRh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm7Z708dMz3cH4
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 11:02:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TDvZPeRh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tm7YW6bX6z3bs0;
	Fri,  1 Mar 2024 11:01:51 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-70-176.adl-apt-pir-bras31.tpg.internode.on.net [14.2.70.176])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 21BD22012A;
	Fri,  1 Mar 2024 08:01:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709251311;
	bh=wLcneC51g0yvr2rzTMvDPFpjn3ptVrIuHETKFxaBzdQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TDvZPeRhAQ/ae5/L624GhlPAeR3buY0n8UuSKpHSUNxzU+Oc12emprmoIoHsRaIeu
	 MkFUPSISftOmnJv+B1ew/H3oAvCgSoxsCgcJue/SizLC6PMC2ElnRb9Fgj0dA9ZkhC
	 yX/NfH5gtdMsaYAm595hUfiJwfeHC1hhAvVe4tLejzqS9SomPFYy10/gf+87knqox/
	 f44qFlLO3i4WKXEBykHfikAVUP1Y47xSuKxn8PweCj16eENDn7HPq8PP1GaJ1RaCys
	 sFUMhiZzA4J5CRayMyuEEpSzBYR49shqXw8LpD2HA15kz59xs/Ru87jSSCi0bScftq
	 kCtM4H64KHGSw==
Message-ID: <cc13d3f4fc7f117d0f29cf18a085066fd4b560cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: x4tf: Add dts for asus x4tf
 project
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <ppighouse@gmail.com>, robh+dt@kernel.org
Date: Fri, 01 Mar 2024 10:31:47 +1030
In-Reply-To: <20240229111123.1932504-2-Kelly_Hung@asus.com>
References: <20240229111123.1932504-1-Kelly_Hung@asus.com>
	 <20240229111123.1932504-2-Kelly_Hung@asus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-29 at 19:11 +0800, Kelly Hung wrote:
> Base on aspeed-g6.dtsi and can boot into BMC console.
>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
>=20
> ---
> V4 -> V5: None
> V3 -> V4: None
> V2 -> V3:
> - fmc lable change to bmc.
> - use 64M partition layout.
> - rename spi1 label to bios.
> - remove bios partition section.
> V1 -> V2:
> - do schema check and remove all warings.
> - remove all unnecessary sections.
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 581 ++++++++++++++++++
>  2 files changed, 582 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index d3ac20e31..32c41f3d9 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-asrock-romed8hm3.dtb \
> +	aspeed-bmc-asus-x4tf.dtb \
>  	aspeed-bmc-bytedance-g220a.dtb \
>  	aspeed-bmc-delta-ahe50dc.dtb \
>  	aspeed-bmc-facebook-bletchley.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm=
/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> new file mode 100644
> index 000000000..64f4ed07c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> @@ -0,0 +1,581 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2024 ASUS Corp.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"

aspeed-g6.dtsi already includes aspeed-g6-pinctrl.dtsi, so the include
here is unnecessary.

Other than that the patch looks okay to me. There are bunch of issues
exposed by `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-asus-x4tf.dtb`, however
they're almost all generic issues with aspeed-g6.dtsi or deficient
binding definitions for the Aspeed controllers. I've put together a
patch stack to clean them up and am working to upstream them.

So for now:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I'll put v5 in a tree for Joel to pick up if he doesn't have any
concerns. I'll drop the redundant include when applying the patch
there.

Andrew
