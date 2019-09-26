Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96414BEC1B
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:42:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f52V3p5tzDqnl
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:42:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.61.149; helo=7.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 64727 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Sep 2019 16:41:54 AEST
Received: from 7.mo177.mail-out.ovh.net (7.mo177.mail-out.ovh.net
 [46.105.61.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f51t3c09zDqdV
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:41:51 +1000 (AEST)
Received: from player168.ha.ovh.net (unknown [10.109.143.146])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 7FBAE10BFAE
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 08:41:46 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 1E548A2451CC;
 Thu, 26 Sep 2019 06:41:44 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 2/2] ARM: dts: aspeed: ast2600evb: Use
 custom flash layout
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20190926063157.22743-1-joel@jms.id.au>
 <20190926063157.22743-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <84817147-0252-b104-7d99-1d592655e01e@kaod.org>
Date: Thu, 26 Sep 2019 08:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190926063157.22743-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6749206995319098118
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/09/2019 08:31, Joel Stanley wrote:
> The AST2600 u-boot and kernel images have outgrown the OpenBMC layout.
> While BMC machines use 128MB SPI NOR chips, we only have 64MB on the EVB
> so use a layout that has a smaller region for the ro and rw filesystems.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Perfect. We can move the layout in its own .dtsi file if some other board
needs it one day. 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 32 +++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 7bcafb027afa..0b3d3978c4d3 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -96,7 +96,37 @@
>  		m25p,fast-read;
>  		label = "bmc";
>  		spi-max-frequency = <50000000>;
> -#include "openbmc-flash-layout.dtsi"
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			u-boot@0 {
> +				reg = <0x0 0xe0000>; // 896KB
> +				label = "u-boot";
> +			};
> +
> +			u-boot-env@e0000 {
> +				reg = <0xe0000 0x20000>; // 128KB
> +				label = "u-boot-env";
> +			};
> +
> +			kernel@100000 {
> +				reg = <0x100000 0x900000>; // 9MB
> +				label = "kernel";
> +			};
> +
> +			rofs@a00000 {
> +				reg = <0xa00000 0x2000000>; // 32MB
> +				label = "rofs";
> +			};
> +
> +			rwfs@6000000 {
> +				reg = <0x2a00000 0x1600000>; // 22MB
> +				label = "rwfs";
> +			};
> +		};
>  	};
>  };
>  
> 

