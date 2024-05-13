Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F48C4A46
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 01:53:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I7ZEPpfc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vdbsh6xShz3cB7
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 09:53:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I7ZEPpfc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vdbs50lJyz2ysd
	for <openbmc@lists.ozlabs.org>; Tue, 14 May 2024 09:52:56 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 569232012B;
	Tue, 14 May 2024 07:52:52 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715644374;
	bh=2F/1yMUoEQezu1s4YaExikKO7lt3XJBOzWNZVyDbNOk=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I7ZEPpfcEzB3U/L8w6/ZvgcN71CqWMHdlfsjJ5CydvDQb3/PPsULwJ9idlHEXLGOi
	 DVuUGF/0OmrhdW1rkNUaiufKF5sgaKI8Xv6mOT80E/su+W12oOR2GXCUXV5PxL32y3
	 6Pqy/3OHrmY7A9GEL0KcCr3KYekB1GeIqBxbxRKgo78793tS9DvXtmnmPHZDNAbR70
	 d4MOaSDydekR5pvcnnRzm3ElDpIQN+iwYE+xeRWuW376bcmeiP4RMDXPeD5YaH26aM
	 dJk3YO46V8d12ZdIHWCsc61zw/ztMHaEdlqHdcHk7e9DE/J9mUUs7LaQ4SiXchiD5e
	 JhkJdmMegak6w==
Message-ID: <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts:
 Aspeed: Add Facebook common dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	patrick@stwcx.xyz, Joel Stanley <joel@jms.id.au>
Date: Tue, 14 May 2024 09:22:51 +0930
In-Reply-To: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-05-13 at 22:49 +0800, Peter Yin wrote:
> Initial introduction of Facebook common
> equipped with Aspeed 2600 BMC SoC.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  arch/arm/dts/Makefile       |  1 +
>  arch/arm/dts/ast2600-fb.dts | 66 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-fb.dts
>=20
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6f4b4d8a17..3740a4452d 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	ast2600-dcscm.dtb \
>  	ast2600-evb-ecc.dtb \
>  	ast2600-evb.dtb \
> +	ast2600-fb.dtb \
>  	ast2600-fpga.dtb \
>  	ast2600-greatlakes.dtb \
>  	ast2600-intel.dtb \
> diff --git a/arch/arm/dts/ast2600-fb.dts b/arch/arm/dts/ast2600-fb.dts
> new file mode 100644
> index 0000000000..69ff575419
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-fb.dts
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Meta Platforms Inc.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model =3D "Facebook Common BMC";
> +	compatible =3D "facebook,common-bmc", "aspeed,ast2600";

I'm not convinced about "facebook,common-bmc" as a compatible. Is there
actually a reason to specify anything here other than "aspeed,ast2600"?

Alternatively, perhaps list all the relevant platforms, like the p10bmc
dts?

```
$ git grep aspeed,ast2600 arch/arm/dts/ast2600-p10bmc.dts
arch/arm/dts/ast2600-p10bmc.dts:        compatible =3D "ibm,everest-bmc", "=
ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
```

Andrew
