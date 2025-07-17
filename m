Return-Path: <openbmc+bounces-381-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077BB09886
	for <lists+openbmc@lfdr.de>; Fri, 18 Jul 2025 01:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjqLx3xR7z3bkb;
	Fri, 18 Jul 2025 09:46:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752761111;
	cv=none; b=V2z+f6Nu3a/9FBDG5y9nDYQYDeNslIbkQSrYuGhFxoQzxyUD6jn6OaePP6B9+oKMmMgeGX/pzDKLGmXEEQyx2B31XNq0IwL0MELG3TZMtB7iy31cZSt2a8gfMUn+zh+r0bhl6cG/W260FdChM4VCswmrxzBIRmy2qP30OLPU4pxGWkqhblQWmEdqiyVe7WOUXmUoMbCxq1LNhONKuYnrKilUqeecCxrhA49ysOlbGQJ6zh5E6UVLUF7bINInHMXL5MqipLJXLNbgsQigdIa9mNmEEIMkGT8KdSI9pQq0J0KCnYIC9NQsN6r41KUN4oV9pe4fcqGSweJGAFCTpQJo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752761111; c=relaxed/relaxed;
	bh=hziN1ibaswAS/psjN8sr3ljdhSytt8bIgX4uJ7Uc8ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4K+nEkLAo3/V+LiOHyHv+21EHzAtB3quUzqCIEf4vFaUDIpPiWB+Rna9nJQe6uxeQ4dmgeZ7acgSLL7BeY7S44877H6j5vVPfxl+OzKpGAsIqvFLCVXK84svjYj1xUsgs1JBCVo6Z1Hcu/YXbq7/dcGHCvYmNWmoGOTLK96laV4SBkjnS10NMw+MPNKsAKSWoBnHcTt/tPE/fdYwkpKgdBhXI7SImtsoOtownuAvl9g5EaP0XBbuwpQ7b72g9yKLRehBfyNXVtfw5LmULuky1WyPXIQGKN2DIB+cMuluUWuXjVQndGaz7InspvuBWmwxX53nFtYhHFa72GPG1mjkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hai1OrrI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hai1OrrI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZSP0r8tz2yPd
	for <openbmc@lists.ozlabs.org>; Fri, 18 Jul 2025 00:05:07 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4e62619afso105378f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 07:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752761105; x=1753365905; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hziN1ibaswAS/psjN8sr3ljdhSytt8bIgX4uJ7Uc8ag=;
        b=hai1OrrIwpgV12oGgYJ+zlY1bvJJoAX423N+LTog4ucZXfrcCSyWVO9QLFwN7pwYJ9
         Bf7yFJDaL1g5qwAaF9qk14hldTf/ySWofbBG3vAd3pYNy8pa+Wk9W11TQDM5DWW/V5N0
         DGWb7VXmYtqiFmne6gUDBT6gpR6CtO2PUaj1naiLHyPT83R7olWdzN8tadkuTaWQRgXs
         pPDIRTyjhMQvO68Pe7SKRyAEdzQ/hNEXYWVStl8DIfHl59rhah+r94KWQMszYhK+FzBZ
         T0Jopr39I1ueAKwJbv9GtIhxudztJ4oCiI+HUHPvpzwlk+pjsYTuVvWO8By2p0KGWfH8
         A8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752761105; x=1753365905;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hziN1ibaswAS/psjN8sr3ljdhSytt8bIgX4uJ7Uc8ag=;
        b=A/X1EDgwZjTy1CVa3YuFbLVTlfQTCDXfGKDtFKzjYTgDKe5fgbV1h7/8lW8k8XaQHN
         H7Pq4sNxhlApVoGJ2PhP46VdlbEwkF4FFq3lVQZq/qvA+7uK99n3sHCu4982AkpDGioa
         J+giQrKYeMxGcCOqDmoh4vzGuhSqy85BqEb/HYZmHnpkVF0C4s5CSXx8g/eAQ+B17CrP
         3XmzTquQBIF17muYDbIP4SPnG1zWTNf9n/3+5gcqnPR/lRvtmOCpnIkCysItvSnCg0PF
         LmykmMY+WeovCGLlskKznLkqfgOptw5V//eC2j4fPxKM5wxT2X3pkq2yD/e2rGb+2Fjl
         nWNw==
X-Gm-Message-State: AOJu0YzQuYiDfaW2pB4kvUw2bJzLvmK5zqBXFnFjlRubpNqUebNRX+zw
	SuetTKVV5pJoyn3bEolUX8T4r1utx1cw1J7EwZSYQ/1eFffNs3S9y2XGsNfB90Q78Lw=
X-Gm-Gg: ASbGncvZAzyX7aDFSbyMn4K8spRCUHmfiwZ5gHzK2CF+jwqtEKumKKXHib2PKT1dDJD
	enSJbX37lZvlH1zi8gkGVZABYsWB949dv7KUZmoCY2gr440r28CkuziRBBcOZ/vYYXLG7iX5GrE
	1j/bzdWv6GSdbCd+IXGCdxm7/qsn9wTMUQXBEt6J6h7YupPGVn9EjwmMpq7vud4adKsp8UVDorw
	SND8Bq3po5F/mK27/fEf8o/gI+g724qPYI/x0zKJhKiZ+wtQ2ghy1z8NJzrKkjLj9QaKGIBLxDH
	VjPE26+3iSzGMw0dv04o7vhiCxF/0GEJ21WWfn0YUMsFMiuko1V/nL9F6MyZTcdGXeXZxOJCq64
	zdINEIDBFs76HM1+LXIHEf8msaFdUf+5uuuNGu75LWw==
X-Google-Smtp-Source: AGHT+IFIkZphDhTA9B+44Q5/IKe43A9aFgi9cyKEASIvFShkWzB+ZlJHgdIZmVNpNfSEhLsgS6PcJQ==
X-Received: by 2002:a05:6000:2301:b0:3a8:2f65:3751 with SMTP id ffacd0b85a97d-3b60dd4d73fmr2588922f8f.2.1752761103089;
        Thu, 17 Jul 2025 07:05:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1792sm21038309f8f.13.2025.07.17.07.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:05:01 -0700 (PDT)
Message-ID: <db07c25c-4064-4330-8bdb-8a619b0b2915@linaro.org>
Date: Thu, 17 Jul 2025 16:04:59 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250717135336.3974758-1-tmaimon77@gmail.com>
 <20250717135336.3974758-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250717135336.3974758-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/07/2025 15:53, Tomer Maimon wrote:
> Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
> nodes for Ethernet controllers, MMC controller, SPI controllers, USB
> device controllers, random number generator, ADC, PWM-FAN controller,
> and I2C controllers. Include pinmux configurations for relevant
> peripherals to support hardware operation. Add an OP-TEE firmware node
> for secure services.
> This patch enhances functionality for NPCM845-based platforms.

Drop this sentence, redundant and not in style (see submitting patches).
> 
> Depends-on: ARM: dts: nuvoton: npcm845: Add pinctrl groups

There is no such tag.

Use changelog for this purpose or b4 dependencies.


> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 695 ++++++++++++++++++
>  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
>  2 files changed, 702 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 5cd877e6c20a..3564e0e30791 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -40,6 +41,11 @@ ppi_cluster0: interrupt-partition-0 {
>  		};
>  	};
>  
> +	udc0_phy: usb-phy {
> +		#phy-cells = <0>;
> +		compatible = "usb-nop-xceiv";

Please follow DTS coding style.

> +	};
> +
>  	ahb {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -56,6 +62,259 @@ clk: rstc: reset-controller@f0801000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gmac1: eth@f0804000 {

Please follow established naming for node names. I'll fix whatever old
stuff you took it from.


> +			device_type = "network";
> +			compatible = "snps,dwmac";

I don't think we want the generic one, even if it is allowed by bindings.

Also... You CC-ed an address, which suggests you do not work on mainline
kernel or you do not use get_maintainers.pl/b4/patman. Please rebase and
always work on mainline or start using mentioned tools, so correct
addresses will be used.


> +			reg = <0x0 0xf0804000 0x0 0x2000>;


> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks	= <&clk NPCM8XX_CLK_AHB>;
> +			clock-names = "stmmaceth";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&rg2_pins
> +					&rg2mdio_pins>;
> +			status = "disabled";
> +		};


...

> +
> +		mc: memory-controller@f0824000 {
> +			compatible = "nuvoton,npcm845-memory-controller";
> +			reg = <0x0 0xf0824000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		udc0:usb@f0830000 {

DTS coding style...

> +			compatible = "nuvoton,npcm845-udc";
> +			reg = <0x0 0xf0830000 0x0 0x1000
> +			       0x0 0xfffeb000 0x0 0x800>;
> +			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk NPCM8XX_CLK_SU>;
> +			clock-names = "clk_usb_bridge";
> +
> +			phys = <&udc0_phy>;
> +			phy_type = "utmi_wide";
> +			dr_mode = "peripheral";
> +			status = "disabled";
> +		};
> +

...


Best regards,
Krzysztof

