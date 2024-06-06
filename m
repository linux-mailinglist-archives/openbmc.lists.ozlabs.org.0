Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA778FDCE7
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 04:42:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ErBhgSD2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvpWr4GTGz3cVv
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 12:42:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ErBhgSD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvpWL25Pjz30Vr
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 12:41:50 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C63520154;
	Thu,  6 Jun 2024 10:41:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717641710;
	bh=dtP+0rgiWU3wI7thDBVAgr9CHcjfZGvQu1poqkaUZhA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ErBhgSD2AVpe0nIz8FkTHKG5bYFeXxzZCWsYL5rdrbOQlpH+8uGWKq7cy0kpvaN4g
	 zBAlspdUIPGiwVXIbdFURfeMnFq/i2DUre3tJUc3FJQKmt5mZJP5u2GO0UOXf3Rd1a
	 8QqRCiUjAOasCkdc3kfyYrRpaSCxBW8NqNzfgcoCmDO0GAoXGDCwgAN1KJWMQm1ScN
	 kzeONr+oGfWoMMw2/I2QvbAPf1J3GmjJnbNqcpX6WvdyI1zzoo1lLRqJ6BRxnofeyu
	 2ozxxpn9RiLN6Gb3DU7lOrou5QObR5YuxiBVqae/mWiB/06NHpBVJ3YwMbTlLXB+ro
	 JmW6Pnb1Qlx4A==
Message-ID: <898fad5266555a9c98fb43e0dcc3e7e9906d128d.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v2] ARM: dts: Aspeed:
 Add Facebook Harma DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, patrick@stwcx.xyz
Date: Thu, 06 Jun 2024 12:11:48 +0930
In-Reply-To: <20240605135401.3119532-1-peteryin.openbmc@gmail.com>
References: <20240605135401.3119532-1-peteryin.openbmc@gmail.com>
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

On Wed, 2024-06-05 at 21:54 +0800, Peter Yin wrote:
> Initial introduction of Facebook Harma
> equipped with Aspeed 2600 BMC SoC.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
> Change log:
> v1 -> v2
>  - Revise common to harma
>=20
> v1
>  - Create facebook common dts
> ---
>  arch/arm/dts/Makefile          |  1 +
>  arch/arm/dts/ast2600-harma.dts | 66 ++++++++++++++++++++++++++++++++++

The discussion I was having with Patrick was we could make this e.g.
ast2600-facebook.dts ...

>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-harma.dts
>=20
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6f4b4d8a17..cb96c0a673 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -688,6 +688,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	ast2600-evb.dtb \
>  	ast2600-fpga.dtb \
>  	ast2600-greatlakes.dtb \
> +	ast2600-harma.dtb \
>  	ast2600-intel.dtb \
>  	ast2600-intel.dtb \
>  	ast2600-ncsi.dtb \
> diff --git a/arch/arm/dts/ast2600-harma.dts b/arch/arm/dts/ast2600-harma.=
dts
> new file mode 100644
> index 0000000000..11d6d5d60c
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-harma.dts
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2024 Meta Platforms Inc.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model =3D "Facebook Harma BMC";
> +	compatible =3D "facebook,harma-bmc", "aspeed,ast2600";

... and then just list the compatibles for the concrete platforms here,
like IBM does for P10.

That way your patch for Minerva becomes a 1-line change here.

Can you please send a series doing as much?

Cheers,

Andrew
