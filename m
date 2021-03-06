Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285932FD1E
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 21:30:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtGSs6HlYz3dDS
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 07:30:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.172;
 helo=mail-qk1-f172.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtGSg4L3Kz3cLv;
 Sun,  7 Mar 2021 07:30:26 +1100 (AEDT)
Received: by mail-qk1-f172.google.com with SMTP id d20so5656405qkc.2;
 Sat, 06 Mar 2021 12:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vpEE2LuMpf4oBZ8J8QruUIPmRVLcDf+SwJ7KDyqdFnU=;
 b=fooU0K0FwJ+SZ2AEn7IJmWlyHDA5ZeLzYatjdSGM/DBbvXW/+vDdgFQZALr/xXm5r6
 6RlkdzuR+J+iktGWFa7N5ji6buA53zqJZWgt7t+yDW8okUA0M4QZ5tYJPKqc5oI6OI3q
 URP/2S5HJveuvuTWAkdvnBuxwREq3lArO8sWGhApnl9iwHL1Tj0chMaxrigLoSM1aO63
 1593UmcOKIDFikjyTVTeRPqY/R6SjOkf2ly9vfijLFojAK6GKX54wvnmIsihFfEQIDPT
 Y7//Fj0vUX1qCMeH0FbWlKMV+NV0VjCnRNXadcqs/CzhTud1ENNQZsZvfPl9Oegh7/BU
 4byA==
X-Gm-Message-State: AOAM533CXJD9psUCP8KUpiZEbm2AZPY1QvkW/jpCBd67ezACphfN/bv7
 cmZdp041bFURo+V52e9dUg==
X-Google-Smtp-Source: ABdhPJy2fN2QBGV1lFAQNmt1/5joJHNHyoDWnAGMQoA/TNIDZatmXya4MAGjs7h+WUTWaxosvqM0QQ==
X-Received: by 2002:a37:7747:: with SMTP id s68mr15511713qkc.198.1615062621871; 
 Sat, 06 Mar 2021 12:30:21 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id 9sm4357749qtx.46.2021.03.06.12.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:30:20 -0800 (PST)
Received: (nullmailer pid 1164606 invoked by uid 1000);
 Sat, 06 Mar 2021 20:30:11 -0000
Date: Sat, 6 Mar 2021 13:30:11 -0700
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
Message-ID: <20210306203011.GA1152769@robh.at.kernel.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-i2c@vger.kernel.org,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> Append bindings to support transfer mode.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes since v3:
> - None
> 
> Changes since v2:
> - Moved SRAM resources back to default dtsi and added mode selection
>   property.
> 
> Changes since v1:
> - Removed buffer reg settings from default device tree and added the settings
>   into here to show the predefined buffer range per each bus.
> 
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index b47f6ccb196a..242343177324 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -17,6 +17,20 @@ Optional Properties:
>  - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
> +- aspeed,i2c-xfer-mode	: should be "byte", "buf" or "dma" to select transfer
> +			  mode defaults to "byte" mode when not specified.
> +
> +			  I2C DMA mode on AST2500 has these restrictions:
> +			    - If one of these controllers is enabled
> +				* UHCI host controller
> +				* MCTP controller
> +			      I2C has to use buffer mode or byte mode instead
> +			      since these controllers run only in DMA mode and
> +			      I2C is sharing the same DMA H/W with them.
> +			    - If one of these controllers uses DMA mode, I2C
> +			      can't use DMA mode
> +				* SD/eMMC
> +				* Port80 snoop

How does one decide between byte or buf mode? 

>  
>  Example:
>  
> @@ -26,20 +40,29 @@ i2c {
>  	#size-cells = <1>;
>  	ranges = <0 0x1e78a000 0x1000>;
>  
> -	i2c_ic: interrupt-controller@0 {
> -		#interrupt-cells = <1>;
> -		compatible = "aspeed,ast2400-i2c-ic";
> +	i2c_gr: i2c-global-regs@0 {
> +		compatible = "aspeed,ast2500-i2c-gr", "syscon";
>  		reg = <0x0 0x40>;
> -		interrupts = <12>;
> -		interrupt-controller;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x40>;
> +
> +		i2c_ic: interrupt-controller@0 {
> +			#interrupt-cells = <1>;
> +			compatible = "aspeed,ast2500-i2c-ic";
> +			reg = <0x0 0x4>;
> +			interrupts = <12>;
> +			interrupt-controller;
> +		};
>  	};
>  
>  	i2c0: i2c-bus@40 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
> -		reg = <0x40 0x40>;
> -		compatible = "aspeed,ast2400-i2c-bus";
> +		reg = <0x40 0x40>, <0x200 0x10>;
> +		compatible = "aspeed,ast2500-i2c-bus";


The example changes are all unrelated to adding the new property. Should 
be a separate patch or just dropped.

>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
>  		bus-frequency = <100000>;
> -- 
> 2.17.1
> 
