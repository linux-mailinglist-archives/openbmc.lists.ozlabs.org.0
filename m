Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914498309
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 20:34:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DGXX2vkKzDqnl
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 04:34:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DGWV6sN8zDqmh
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 04:33:24 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id g17so3019437otl.2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 11:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=egHhqVwtSMDmp9YF4xs0dobfljwNvPw3rwWXCHsf7oo=;
 b=gU2I8DOLir5eO6Ono2exwYFOg7YlIpYsIQ4O1x+7NJcBDwiwETEEMQnjiEgw2vW8gQ
 PYzZNur/UfRCubkxaGEICAOoENv+UjskoqCF8S1KlurHEKxVjRuQzqhYNlItmL7RMzz4
 EiEv2DyVTaYbObkEXA2Qvz6WnKrTy7sLh4xynwoFzRtH5aNSASCbQGNBK8e+Ubc20yrA
 gHQSYu7HD2cgQbRzOcIfq/HZpKkZO9LGmZQbhIMDP7/zjZ9ATCSx5OBWom/F1+wp85SO
 AyHC2527Rw4PLjqwiY8bfOESJvKi+sYesxuqdgmCCGuxgiHvmUwlVa/BeXQpr6llX2u/
 JyQA==
X-Gm-Message-State: APjAAAUVdwtow6MsisUbqo2M5syZy5z/tcpHMgIykRHC5IwUGQkzuXT0
 Co08bnv7ckdWaFdoqOIFNw==
X-Google-Smtp-Source: APXvYqwQIo2Vuh1ftveWru24y3+5VDk13vltqfb28SAYQ4YZfiK4rqCZKAcqCdEvqJ17ZGIKIpXeTA==
X-Received: by 2002:a9d:331:: with SMTP id 46mr23079892otv.8.1566412400760;
 Wed, 21 Aug 2019 11:33:20 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v24sm7972302otj.78.2019.08.21.11.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 11:33:20 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:33:19 -0500
From: Rob Herring <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: net: document NPCM7xx EMC 10/100 DT
 bindings
Message-ID: <20190821183319.GA19310@bogus>
References: <20190801072611.27935-1-avifishman70@gmail.com>
 <20190801072611.27935-2-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801072611.27935-2-avifishman70@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, netdev@vger.kernel.org, gregkh@linuxfoundation.org,
 tglx@linutronix.de, davem@davemloft.net, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2019 at 10:26:10AM +0300, Avi Fishman wrote:
> Added device tree binding documentation for
> Nuvoton NPCM7xx Ethernet MAC Controller (EMC) 10/100 RMII
> 
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  .../bindings/net/nuvoton,npcm7xx-emc.txt      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt

Consider converting this to DT schema (YAML).

> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
> new file mode 100644
> index 000000000000..a7ac3ca66de9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
> @@ -0,0 +1,38 @@
> +Nuvoton NPCM7XX 10/100 Ethernet MAC Controller (EMC)
> +
> +The NPCM7XX provides one or two Ethernet MAC RMII Controllers
> +for WAN/LAN applications
> +
> +Required properties:
> +- device_type     : Should be "network"

Drop this. device_type is deprecated for FDT except for a few cases.

> +- compatible      : "nuvoton,npcm750-emc" for Poleg NPCM7XX.
> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the emc interrupts with flags for falling edge.
> +                    first interrupt dedicated to Txirq
> +                    second interrupt dedicated to Rxirq
> +- phy-mode        : Should be "rmii" (see ethernet.txt in the same directory)
> +- clocks          : phandle of emc reference clock.
> +- resets          : phandle to the reset control for this device.
> +- use-ncsi        : Use the NC-SI stack instead of an MDIO PHY

Vendor prefix needed.

> +
> +Example:
> +
> +emc0: eth@f0825000 {

ethernet@...

> +	device_type = "network";
> +	compatible = "nuvoton,npcm750-emc";
> +	reg = <0xf0825000 0x1000>;
> +	interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +	             <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +	phy-mode = "rmii";
> +	clocks = <&clk NPCM7XX_CLK_AHB>;
> +
> +	#use-ncsi; /* add this to support ncsi */

Doesn't match the binding.

> +
> +	clock-names = "clk_emc";
> +	resets = <&rstc 6>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r1_pins
> +	             &r1err_pins
> +	             &r1md_pins>;
> +	status = "okay";

Drop status in examples.

> +};
> -- 
> 2.18.0
> 
