Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F75A77CA
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 02:16:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NPW56yhWzDqpv
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 10:16:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cOn1sGb2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QDntCloe"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NPT23TmJzDqml
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 10:14:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A3A42518;
 Tue,  3 Sep 2019 20:14:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 03 Sep 2019 20:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=W0iML2fIAlXSbOkfnY+zlAvfKjW42Nj
 hKZjTbe/fpq4=; b=cOn1sGb2LBRodVF9fvdVR9S+MK+VXXMK7UsQzkpKkxaUVOh
 C7Cemr7NfBcL8AO1q4d6Ibr1TxXXHlYkbXePHLld3WorYCcW5OIIt48uHwabc2rm
 HY2/prva7wAHTkJ57qvYEdvvfcRNmnKtoAMRs7k14ARr87QG9Bc+fs5z5t9dPGi6
 Ct3ICKzJIh9pnKXSlj1l3eojTs5wkT2f6igiXfHB9u+utpaoRFskz0VYOsUsJarF
 s++ImGigTbWeeRJzZycR6jkRM5H2Ihnq29IIAVwE+ijtsJ2GQF9P0IxHBKUA5Urn
 gcAYiOvF8d8nDtSmfHCKiiyo7CtOBi7R5zIfhsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W0iML2
 fIAlXSbOkfnY+zlAvfKjW42NjhKZjTbe/fpq4=; b=QDntCloe/OtG/jedmABH/+
 sXr4hMYBqU3ddSKlZ3RmBEQ5HjDAeJar76JpegiHt0a0gFOH8RjUfOVWpFLMbrok
 iJEnPrnRJ2ypwTnKZMXWCIZVuPufHzcFA81Ya1u8WU3vP/JLYvVyIE03E3FSPUg9
 XI748+MLGD4CBO22EQul/hlpeyZ8gwZsVLP8E5PfPWND/XxP55nXdCpkTaIcuWYW
 YdSo6S4K7bk5ZoOHw3TGJxBiyoVVrgn2BkEu89ebTFYjBOV0V2kwoIYdUYd7Z4qD
 3KX+e4UeSpSF3FRoInU/JmCSzooRVxuvJ8tjyN1vOmPKQrGXHvxHW1E5MaSVWd3g
 ==
X-ME-Sender: <xms:4gFvXRc9hy_QBRfOoOfQ_dkFGQ4VwTt15WgvF89BABYUCaNIKk1pSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:4gFvXTL01c6HD5XlJ1MirjvbEVbPdr2EhlvcDqEoHMgxMIWBmgUbnA>
 <xmx:4gFvXTAlUw2dzlRLNmc2z7-aGrPZVQdSZ2_miCOeTIo-g_zTFNlmGw>
 <xmx:4gFvXUgG7LmSXZApc5H_VUoSEqNe-MSxwQ0iCz-2XziL9LiH5v8OPQ>
 <xmx:4wFvXT3mZZuylvsHM70ghH8mgUQGHV2LkY9RBlmvtVDdCSESgqtqCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8A4B6E00A3; Tue,  3 Sep 2019 20:14:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <07d807eb-2eed-4007-b769-07137d87bfba@www.fastmail.com>
In-Reply-To: <20190902002911.18717-1-joel@jms.id.au>
References: <20190902002911.18717-1-joel@jms.id.au>
Date: Wed, 04 Sep 2019 09:44:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Add Tacoma machine
Content-Type: text/plain
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



On Mon, 2 Sep 2019, at 09:59, Joel Stanley wrote:
> This is an AST2600 based BMC card for a Power9 system.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/Makefile                  |  1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 39 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1b45e790e1e3..180405378b86 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1280,6 +1280,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
>  	aspeed-bmc-opp-swift.dtb \
> +	aspeed-bmc-opp-tacoma.dtb \
>  	aspeed-bmc-opp-vesnin.dtb \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> new file mode 100644
> index 000000000000..9ccd4c3db81a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2019 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "Tacoma";
> +	compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;

There's only 512M of RAM, so: reg = <0x80000000 0x20000000>;

Looks fine otherwise.

Andrew
