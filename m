Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2A2F20FD
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 21:40:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF5F82RR8zDqc1
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 07:40:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF5CT443NzDqNw;
 Tue, 12 Jan 2021 07:38:58 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id x13so144658oto.8;
 Mon, 11 Jan 2021 12:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CuduTLZlbG35ugDeNBQcYjINyRmKUeAkNe31I9bczWo=;
 b=W6W7Naoy5zkInCmPE25n2p4eFpW0YF0A/IRqDwqgDwxEdkQixfJJbTQo6x7xkLCtCv
 WgyhM6605Uy5XzN86NCtmg/h1k96Dv+4XHeTk391B4RBsZd1xbPGbRJmdqlEV+TpPLji
 jr+0aeE3ToRbo2i1TIgM52Ly1rkmpUExt8vmqK8zghskiwf3gysyYwKUUMJ51gyQNs46
 Szr5nubPmfxkX3gPXY3WFrTgUnZ0ayr0BSMFmNcqSvyXa2/mLU9FSHYhQrvKz9pGvyqS
 E5NWtkGlUlqv9ZpQT87c2vgtyLrYlbHN/5p7nieTVUTG/lGbhcgs1wyJArpgOYn/IVvs
 yScQ==
X-Gm-Message-State: AOAM530fieROosZrxyOThVJM8SjUD91H4HMOHqMlRcz2nqJlDkLPUIuZ
 1kegWTiov2b67FqGBlptPQ==
X-Google-Smtp-Source: ABdhPJxTRSLja0Ho46/iFyMEhN0kc2ToJeDnvK9Ayi6Oy07tXCHtANqvw5CXVDBAtyMzqOaEojN1Mg==
X-Received: by 2002:a9d:2a86:: with SMTP id e6mr611496otb.313.1610397532905;
 Mon, 11 Jan 2021 12:38:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p132sm182478oia.41.2021.01.11.12.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 12:38:52 -0800 (PST)
Received: (nullmailer pid 3026340 invoked by uid 1000);
 Mon, 11 Jan 2021 20:38:50 -0000
Date: Mon, 11 Jan 2021 14:38:50 -0600
From: Rob Herring <robh@kernel.org>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Message-ID: <20210111203850.GA3022469@robh.at.kernel.org>
References: <20201229063157.3587-1-chiawei_wang@aspeedtech.com>
 <20201229063157.3587-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229063157.3587-2-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, haiyue.wang@linux.intel.com,
 linux-aspeed@lists.ozlabs.org, minyard@acm.org, BMC-SW@aspeedtech.com,
 andrew@aj.id.au, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 cyrilbur@gmail.com, lee.jones@linaro.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 29, 2020 at 02:31:53PM +0800, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 99 ++++---------------
>  1 file changed, 21 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index d0a38ba8b9ce..90eb0ecc95d1 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a slave on the bus
>  conditions it can also take the role of bus master.
>  
>  The LPC controller is represented as a multi-function device to account for the
> -mix of functionality it provides. The principle split is between the register
> -layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> -"basically compatible with the [LPC registers from the] popular BMC controller
> -H8S/2168[1]", and everything else, where everything else is an eclectic
> -collection of functions with a esoteric register layout. "Everything else",
> -here labeled the "host" portion of the controller, includes, but is not limited
> -to:
> +mix of functionality, which includes, but is not limited to:
>  
>  * An IPMI Block Transfer[2] Controller
>  
> @@ -44,80 +38,29 @@ Required properties
>  ===================
>  
>  - compatible:	One of:
> -		"aspeed,ast2400-lpc", "simple-mfd"
> -		"aspeed,ast2500-lpc", "simple-mfd"
> -		"aspeed,ast2600-lpc", "simple-mfd"
> +		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> +		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> +		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
>  
>  - #address-cells: <1>
>  - #size-cells:	<1>
> -- ranges: 	Maps 0 to the physical address and length of the LPC memory
> -                region
> -
> -Required LPC Child nodes
> -========================
> -
> -BMC Node
> ---------
> -
> -- compatible:	One of:
> -		"aspeed,ast2400-lpc-bmc"
> -		"aspeed,ast2500-lpc-bmc"
> -		"aspeed,ast2600-lpc-bmc"
> -
> -- reg:		contains the physical address and length values of the
> -                H8S/2168-compatible LPC controller memory region
> -
> -Host Node
> ----------
> -
> -- compatible:   One of:
> -		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> -		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> -		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
> -
> -- reg:		contains the address and length values of the host-related
> -                register space for the Aspeed LPC controller
> -
> -- #address-cells: <1>
> -- #size-cells:	<1>
> -- ranges: 	Maps 0 to the address and length of the host-related LPC memory
> +- ranges:	Maps 0 to the physical address and length of the LPC memory
>                  region
>  
>  Example:
>  
>  lpc: lpc@1e789000 {
> -	compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +	compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
>  	reg = <0x1e789000 0x1000>;
>  
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	ranges = <0x0 0x1e789000 0x1000>;

No child nodes? Then you don't need 'ranges', '#size-cells', nor 
'#address-cells'.

> -
> -	lpc_bmc: lpc-bmc@0 {
> -		compatible = "aspeed,ast2500-lpc-bmc";
> -		reg = <0x0 0x80>;
> -	};
> -
> -	lpc_host: lpc-host@80 {
> -		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> -		reg = <0x80 0x1e0>;
> -		reg-io-width = <4>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0x0 0x80 0x1e0>;
> -	};
>  };
>  
> -BMC Node Children
> -==================
> -
> -
> -Host Node Children
> -==================
>  
>  LPC Host Interface Controller
>  -------------------
> @@ -149,14 +92,12 @@ Optional properties:
>  
>  Example:
>  
> -lpc-host@80 {
> -	lpc_ctrl: lpc-ctrl@0 {
> -		compatible = "aspeed,ast2500-lpc-ctrl";
> -		reg = <0x0 0x80>;
> -		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -		memory-region = <&flash_memory>;
> -		flash = <&spi>;
> -	};
> +lpc_ctrl: lpc-ctrl@80 {
> +	compatible = "aspeed,ast2500-lpc-ctrl";
> +	reg = <0x80 0x80>;
> +	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +	memory-region = <&flash_memory>;
> +	flash = <&spi>;
>  };
>  
>  LPC Host Controller
> @@ -179,9 +120,9 @@ Required properties:
>  
>  Example:
>  
> -lhc: lhc@20 {
> +lhc: lhc@a0 {
>  	compatible = "aspeed,ast2500-lhc";
> -	reg = <0x20 0x24 0x48 0x8>;
> +	reg = <0xa0 0x24 0xc8 0x8>;
>  };
>  
>  LPC reset control
> @@ -192,16 +133,18 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>  
>  Required properties:
>  
> - - compatible:		"aspeed,ast2600-lpc-reset" or
> -			"aspeed,ast2500-lpc-reset"
> -			"aspeed,ast2400-lpc-reset"
> + - compatible:		One of:
> +			"aspeed,ast2600-lpc-reset";
> +			"aspeed,ast2500-lpc-reset";
> +			"aspeed,ast2400-lpc-reset";
> +
>   - reg:			offset and length of the IP in the LHC memory region
>   - #reset-controller	indicates the number of reset cells expected
>  
>  Example:
>  
> -lpc_reset: reset-controller@18 {
> +lpc_reset: reset-controller@98 {
>          compatible = "aspeed,ast2500-lpc-reset";
> -        reg = <0x18 0x4>;
> +        reg = <0x98 0x4>;
>          #reset-cells = <1>;
>  };
> -- 
> 2.17.1
> 
