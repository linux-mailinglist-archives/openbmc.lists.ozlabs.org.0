Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8BE35A5F6
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 20:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH6RM0GsPz3bwC
	for <lists+openbmc@lfdr.de>; Sat, 10 Apr 2021 04:41:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH6R75RSRz30CX;
 Sat, 10 Apr 2021 04:41:22 +1000 (AEST)
Received: by mail-ot1-f54.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso6675826otp.0; 
 Fri, 09 Apr 2021 11:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4MvFSu+iSn/dauM/cnTOpr/Gc9vHIrXjG/A41VJDYI4=;
 b=Adc8DX1Ww2Ru34mMfMrUoXquoVUpzdt94599tH+Vxe04eJsj2awqbx3OiuY5l0G2K5
 cpOuWxoloQVyvpM/6l0KbkyfoMKysJsvZUBBD4gSHXflTesGc8GB5ZO5yQBUO/Qbd8eR
 8gL6laJQmkZBl0U2qTAENHxIPU37SS/Ld5ojiI/2895lR2lCmpxOEUrQitOLG1aYt3M5
 Gq9MOOec+f9yS9hEp9bIBA/RMWJmcdaWpl/p1bASH0DPxgeN52lmMLKUGp5mvy6+fTPe
 J94jKIlo5Qm5INVqWwP+GQdlOsmSaoPVvWUAsUIgD2BDeEJw7OSAKjJSxvGK59FrlSGP
 GzIw==
X-Gm-Message-State: AOAM532i/RHKdiMRc6Ue6GPqjUGmGRPsNFh3EKQOcKsk56sWPqYuEADm
 dFeMjsSkvrE77OIyJbNK/A==
X-Google-Smtp-Source: ABdhPJzGKW/WQeP+HhyULbXe22Y/RLS1g/vF+rFi385EeuxrtQnl324VEHdsSv/nFS6zXrD211MquA==
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr12827904oto.151.1617993680723; 
 Fri, 09 Apr 2021 11:41:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j11sm667128ooo.45.2021.04.09.11.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:41:20 -0700 (PDT)
Received: (nullmailer pid 3937011 invoked by uid 1000);
 Fri, 09 Apr 2021 18:41:18 -0000
Date: Fri, 9 Apr 2021 13:41:18 -0500
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: sdhci-of-aspeed: Add power-gpio
 and power-switch-gpio
Message-ID: <20210409184118.GA3934798@robh.at.kernel.org>
References: <20210408015218.20560-1-steven_lee@aspeedtech.com>
 <20210408015218.20560-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408015218.20560-2-steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 ryan_chen@aspeedtech.com,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, chin-ting_kuo@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 09:52:17AM +0800, Steven Lee wrote:
> AST2600-A2 EVB provides the reference design for enabling SD bus power
> and toggling SD bus signal voltage by GPIO pins.
> Add the definition and example for power-gpio and power-switch-gpio
> properties.
> 
> In the reference design, GPIOV0 of AST2600-A2 EVB is connected to power
> load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is connected to
> a 1.8v and a 3.3v power load switch that providing signal voltage to
> SD1 bus.
> If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> disabled.
> If GPIOV1 is active high, 3.3v power load switch is enabled, SD1 signal
> voltage is 3.3v. Otherwise, 1.8v power load switch will be enabled, SD1
> signal voltage becomes 1.8v.
> 
> AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and GPIOV3
> as power-switch-gpio.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..515a74614f3c 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -37,6 +37,14 @@ properties:
>    clocks:
>      maxItems: 1
>      description: The SD/SDIO controller clock gate
> +  power-gpio:

'-gpios' is the preferred form even if just 1.

> +    description:
> +      The GPIO for enabling/disabling SD bus power.
> +    maxItems: 1

blank line

> +  power-switch-gpio:
> +    description:
> +      The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> +    maxItems: 1
>  
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
> @@ -61,6 +69,14 @@ patternProperties:
>        sdhci,auto-cmd12:
>          type: boolean
>          description: Specifies that controller should use auto CMD12
> +      power-gpio:
> +        description:
> +          The GPIO for enabling/disabling SD bus power.
> +        maxItems: 1
> +      power-switch-gpio:
> +        description:
> +          The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> +        maxItems: 1
>      required:
>        - compatible
>        - reg
> @@ -80,6 +96,7 @@ required:
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/gpio/aspeed-gpio.h>
>      sdc@1e740000 {
>              compatible = "aspeed,ast2500-sd-controller";
>              reg = <0x1e740000 0x100>;
> @@ -94,6 +111,10 @@ examples:
>                      interrupts = <26>;
>                      sdhci,auto-cmd12;
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 0)
> +                                     GPIO_ACTIVE_HIGH>;
> +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 1)
> +                                     GPIO_ACTIVE_HIGH>;
>              };
>  
>              sdhci1: sdhci@200 {
> @@ -102,5 +123,9 @@ examples:
>                      interrupts = <26>;
>                      sdhci,auto-cmd12;
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 2)
> +                                     GPIO_ACTIVE_HIGH>;
> +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 3)
> +                                     GPIO_ACTIVE_HIGH>;
>              };
>      };
> -- 
> 2.17.1
> 
