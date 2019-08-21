Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51298615
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 22:57:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DKjj65FdzDqsw
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 06:57:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DKj20cNBzDqkL
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 06:56:53 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id e12so3379534otp.10
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 13:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cw5zVFDgnti+9h09SHubCz/1zUqdZG2/3ACA1Sozj6M=;
 b=nSn1jIFI27tRPhocdh23oQ3VEVDbe3E3aVEAwRgjJOizMtFmgibsEG5o721P5+R/DV
 9DSjImMf9hFLFTuGQgUKPSFlIS1GaOINkbguRVG/hfzhgt2uRAo3dcHsy64HcdmJlubh
 F/HsJ1rWstm4DEoR/H9nGyNRry9daS1KMDb3gmWvQQUKU6P7AfZKFFnByg0iv5G915AF
 gfeyeThG6ROKzJP4XlgRm0/M0uPQ4g4bDmyISqHsjlXr16TlEJnwtZ6IPyZ/oDfbY5ZK
 bWaUtLrkYVWxjIhBtsA8uMxEZmvEyXVXS89JqUZ2D8Fuhpi022mWiJK0+qUGey3bblQz
 3QQw==
X-Gm-Message-State: APjAAAUCQjgY3Kr3MpbAJ1TbXZZHDujgydNnBtcXG0jvnUK0slQ+hVi5
 Wwzf7P/5ONP4vDihJFulrQ==
X-Google-Smtp-Source: APXvYqwkzyR5k2lVn9jQ7SWqN03g1X/p1BcvTAz47w4p4sCmgewK0YLxZltsj/wiQTiBJlsmcwM1OA==
X-Received: by 2002:a05:6830:1657:: with SMTP id
 h23mr6886407otr.222.1566421011342; 
 Wed, 21 Aug 2019 13:56:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m7sm8447750otm.5.2019.08.21.13.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 13:56:50 -0700 (PDT)
Date: Wed, 21 Aug 2019 15:56:50 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: spi: add NPCM FIU controller
Message-ID: <20190821205650.GA14884@bogus>
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808131448.349161-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 broonie@kernel.org, linux-spi@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2019 at 04:14:47PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Flash Interface Unit(FIU) SPI master controller
> using SPI-MEM interface.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/spi/nuvoton,npcm-fiu.txt         | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
> new file mode 100644
> index 000000000000..ab37aae91d19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
> @@ -0,0 +1,47 @@
> +* Nuvoton FLASH Interface Unit (FIU) SPI Controller
> +
> +NPCM FIU supports single, dual and quad communication interface.
> +
> +The NPCM7XX supports three FIU modules,
> +FIU0 and FIUx supports two chip selects,
> +FIU3 support four chip select.
> +
> +Required properties:
> +  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
> +  - #address-cells : should be 1.
> +  - #size-cells : should be 0.
> +  - reg : the first contains the register location and length,
> +          the second contains the memory mapping address and length
> +  - reg-names: Should contain the reg names "control" and "memory"
> +  - clocks : phandle of FIU reference clock.
> +
> +Required properties in case the pins can be muxed:
> +  - pinctrl-names : a pinctrl state named "default" must be defined.
> +  - pinctrl-0 : phandle referencing pin configuration of the device.
> +
> +Optional property:
> +  - spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.

Is this something standard? If not, add a vendor prefix.

> +
> +Aliases:
> +- All the FIU controller nodes should be represented in the aliases node using
> +  the following format 'fiu{n}' where n is a unique number for the alias.
> +  In the NPCM7XX BMC:
> +  		fiu0 represent fiu 0 controller
> +  		fiu1 represent fiu 3 controller
> +  		fiu2 represent fiu x controller
> +
> +Example:
> +fiu3: fiu@c00000000 {

spi@...

> +	compatible = "nuvoton,npcm750-fiu";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clk NPCM7XX_CLK_AHB>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi3_pins>;
> +	spi-nor@0 {
> +			...
> +	};
> +};
> +
> -- 
> 2.18.0
> 
