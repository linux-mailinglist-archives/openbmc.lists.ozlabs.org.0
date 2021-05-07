Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF9375E43
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 03:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbssN5qX8z2yXF
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 11:13:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbss713Rvz2yR6;
 Fri,  7 May 2021 11:13:28 +1000 (AEST)
Received: by mail-ot1-f44.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so6619694oth.5; 
 Thu, 06 May 2021 18:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6+SbgXWxY1gSEdIUiXJS8BiZpv/UGkcHHXtFb/TCI+A=;
 b=sae5zdIf7X8p+8CbkvjlYQ3LkqFJIfqf3LRgJcSVtyYmqGA+S4VcOVsqXmT1HAid18
 3/nsMv76CgH7RP2XHbsTbxSlSAGxudq/PBU7b9W8CVMIhsQso20NL2/xgiSQh22lpE1m
 1P+xyVz70WHz2DfXHUfGRAQWOTfHRnJurBFFymitgC1rs5as4KWV0kNexEzOlXEWKr8M
 QIeznTnSgJj6mB8OdhQ2AQRrkkrHwxBuRu6WgNvKGbH0B4zLnBlTa7r1NWZzdTSTqFZJ
 gZrv3Gw4DM/JkHUFQ5jQyPx4GKNOZ/n1l1kS4WeffZbtPRdIMKObf6nwi3L+Qb7esvct
 ATVA==
X-Gm-Message-State: AOAM531+nrch08biZS7V10GYhCZwbUzZZlewW+bjfhol83scmk9aAwde
 +o+w3IgDND46UXMhdMkN6g==
X-Google-Smtp-Source: ABdhPJwprZcJkifPHv8l3JVb9xsBJ7fjNDgXUBwbZFhFrpcupUfUM5N35itbxcoRLv515J42Jwkdcg==
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr6055681oti.258.1620350006471; 
 Thu, 06 May 2021 18:13:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v19sm920949otq.35.2021.05.06.18.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 18:13:25 -0700 (PDT)
Received: (nullmailer pid 1125071 invoked by uid 1000);
 Fri, 07 May 2021 01:13:24 -0000
Date: Thu, 6 May 2021 20:13:24 -0500
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: mmc: sdhci-of-aspeed: Add an example
 for AST2600-A2 EVB
Message-ID: <20210507011324.GA1119409@robh.at.kernel.org>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506100312.1638-2-steven_lee@aspeedtech.com>
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
 chin-ting_kuo@aspeedtech.com, open list <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 06, 2021 at 06:03:08PM +0800, Steven Lee wrote:
> AST2600-A2 EVB has the reference design for enabling SD bus
> power and toggling SD bus signal voltage by GPIO pins.
> 
> In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> connected to a 1.8v and a 3.3v power load switch that providing
> signal voltage to
> SD1 bus.
> 
> If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> disabled.
> If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> enabled, SD1 signal voltage becomes 1.8v.
> 
> AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> GPIOV3 as power-switch-gpio.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 101 +++++++++++++++++-
>  1 file changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..de7e61b3d37a 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -45,10 +45,16 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        enum:
> -          - aspeed,ast2400-sdhci
> -          - aspeed,ast2500-sdhci
> -          - aspeed,ast2600-sdhci
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - aspeed,ast2400-sdhci
> +                  - aspeed,ast2500-sdhci
> +                  - aspeed,ast2600-sdhci
> +          - items:
> +              - enum:
> +                  - aspeed,ast2600-sdhci
> +              - const: sdhci

Why are you adding 'sdhci'. That's not useful as a compatible given how 
many quirks different implementations have.


>        reg:
>          maxItems: 1
>          description: The SDHCI registers
> @@ -104,3 +110,90 @@ examples:
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
>              };
>      };
> +
> +  - |

Why do we need another example?

> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    vcc_sdhci0: regulator-vcc-sdhci0 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "SDHCI0 Vcc";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 168
> +                            GPIO_ACTIVE_HIGH>;
> +            enable-active-high;
> +    };
> +
> +    vccq_sdhci0: regulator-vccq-sdhci0 {
> +            compatible = "regulator-gpio";
> +
> +            regulator-name = "SDHCI0 VccQ";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 169
> +                            GPIO_ACTIVE_HIGH>;
> +            gpios-states = <1>;
> +            states = <3300000 1>,
> +                     <1800000 0>;
> +    };
> +
> +    vcc_sdhci1: regulator-vcc-sdhci1 {
> +            compatible = "regulator-fixed";
> +
> +            regulator-name = "SDHCI1 Vcc";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 170
> +                            GPIO_ACTIVE_HIGH>;
> +            enable-active-high;
> +    };
> +
> +    vccq_sdhci1: regulator-vccq-sdhci1 {
> +            compatible = "regulator-gpio";
> +
> +            regulator-name = "SDHCI1 VccQ";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 171
> +                            GPIO_ACTIVE_HIGH>;
> +            gpios-states = <1>;
> +            states = <3300000 1>,
> +                     <1800000 0>;
> +    };
> +
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2600-sd-controller";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges = <0 0x1e740000 0x20000>;
> +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> +
> +            sdhci@1e740100 {
> +                    compatible = "aspeed,ast2600-sdhci","sdhci";
> +                    reg = <0x100 0x100>;
> +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    vmmc-supply = <&vcc_sdhci0>;
> +                    vqmmc-supply = <&vccq_sdhci0>;
> +                    sd-uhs-sdr104;
> +                    clk-phase-uhs-sdr104 = <180>, <180>;
> +            };
> +
> +            sdhci@1e740200 {
> +                    compatible = "aspeed,ast2600-sdhci","sdhci";
> +                    reg = <0x200 0x100>;
> +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    vmmc-supply = <&vcc_sdhci1>;
> +                    vqmmc-supply = <&vccq_sdhci1>;
> +                    sd-uhs-sdr104;
> +                    clk-phase-uhs-sdr104 = <0>, <0>;
> +            };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
