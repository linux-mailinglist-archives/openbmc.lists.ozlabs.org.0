Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1527D9C9C
	for <lists+openbmc@lfdr.de>; Fri, 27 Oct 2023 17:08:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ULt9pbVS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH5f41fLGz3cR9
	for <lists+openbmc@lfdr.de>; Sat, 28 Oct 2023 02:08:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ULt9pbVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH5cw22Tkz3cTD;
	Sat, 28 Oct 2023 02:07:44 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so1535067276.0;
        Fri, 27 Oct 2023 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698419260; x=1699024060; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qloAnNyX4uVkIPIKZTip1fVvsVzeHLGFV3eqAOjO77U=;
        b=ULt9pbVSClMTGigbQTFwq0/N2pLui9qfRAhVm3JVebVIsRPs2LfAn3sblt8xdN/uDe
         JY+kdbI134Aj0jmHi6683/0ajaPNcIAgRwnxWCUhMAU0dkHRnW7N3E8tDrTMg83BeBpq
         B3n6Ag33CGOq/ruXagwormp9/pgspI3MLDQdUDocPCoIBtQIh3A9tJE2kH/OSLF6WNMA
         uV2/luvrhpwqxTpSBXQEHZPK86m6z9kF23MZJJ+ZdyLzHX3qyr2FdHTu506pCwEHrChu
         UmTVl0/cfqcS+DD9F0O8AO/ycmbz83E2RDovwuVlpu8cLmZlyC+Ln+TSPbRoEMXigKzy
         69Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698419260; x=1699024060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qloAnNyX4uVkIPIKZTip1fVvsVzeHLGFV3eqAOjO77U=;
        b=if69u3gmj09jwsEfSAdekaghXSdh8AXw5ju8jYosbII8S74w6lH36k2Vzf2G1tlGOr
         zVmSvTJdxU8LYG1pYYAwTb2R8mSQPTNwQHqVj8cGM6HQgzCHYLgg+LPiT4ObywVgcqy5
         WRNntOleciDwTWsofBT6pJ42RkuPyZiwUpA1xK4DC6Qen7nzv8iREFkxBAU2J1M450gx
         ZSQnzzJ0YAe5xCRhNzxBkINUPOqBgO7ND3FfgPRy/mLO/jHbIGAWWymhnmB7U2LieTs9
         f2B1VtHXs8JXEHurhfjQtSbgiJooNxbDOkQTMC0rzy+/0e9jM0684mNcCqnGEnCh0WWn
         ne7A==
X-Gm-Message-State: AOJu0YyhK7SXzBocTQT5yOvqKBrgm8l0Duq9I3hIrgX/yGhQ3C57JK7n
	mNbikdG9xRYLdJW8YIcOuSY=
X-Google-Smtp-Source: AGHT+IEKEXt5/iKxiKcWIl/Ao3PxFYpGuQy/xFOERmbn41PzQs02RXFUo2GS+lXEsahSLBidbEQKAg==
X-Received: by 2002:a25:7694:0:b0:da0:cea9:2b43 with SMTP id r142-20020a257694000000b00da0cea92b43mr2963493ybc.41.1698419260315;
        Fri, 27 Oct 2023 08:07:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d7-20020a258247000000b00d89b8bf0147sm711124ybn.15.2023.10.27.08.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 08:07:39 -0700 (PDT)
Message-ID: <2fb7109f-b26b-bbd2-6c4d-d900fd4917d4@roeck-us.net>
Date: Fri, 27 Oct 2023 08:07:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: aspeed-wdt: Add
 aspeed,reset-mask property
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Milton D. Miller II" <mdmii@outlook.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20230922104231.1434-4-zev@bewilderbeest.net>
 <20230922104231.1434-5-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230922104231.1434-5-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Eddie James <eajames@linux.ibm.com>, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/22/23 03:42, Zev Weiss wrote:
> This property configures the Aspeed watchdog timer's reset mask, which
> controls which peripherals are reset when the watchdog timer expires.
> Some platforms require that certain devices be left untouched across a
> reboot; aspeed,reset-mask can now be used to express such constraints.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
>   include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
>   2 files changed, 109 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index a8197632d6d2..3208adb3e52e 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -47,7 +47,15 @@ Optional properties for AST2500-compatible watchdogs:
>   			   is configured as push-pull, then set the pulse
>   			   polarity to active-high. The default is active-low.
>   
> -Example:
> +Optional properties for AST2500- and AST2600-compatible watchdogs:
> + - aspeed,reset-mask: A bitmask indicating which peripherals will be reset if
> +		      the watchdog timer expires.  On AST2500 this should be a
> +		      single word defined using the AST2500_WDT_RESET_* macros;
> +		      on AST2600 this should be a two-word array with the first
> +		      word defined using the AST2600_WDT_RESET1_* macros and the
> +		      second word defined using the AST2600_WDT_RESET2_* macros.
> +
> +Examples:
>   
>   	wdt1: watchdog@1e785000 {
>   		compatible = "aspeed,ast2400-wdt";
> @@ -55,3 +63,11 @@ Example:
>   		aspeed,reset-type = "system";
>   		aspeed,external-signal;
>   	};
> +
> +	#include <dt-bindings/watchdog/aspeed-wdt.h>
> +	wdt2: watchdog@1e785040 {
> +		compatible = "aspeed,ast2600-wdt";
> +		reg = <0x1e785040 0x40>;
> +		aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
> +				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
> +	};
> diff --git a/include/dt-bindings/watchdog/aspeed-wdt.h b/include/dt-bindings/watchdog/aspeed-wdt.h
> new file mode 100644
> index 000000000000..7ae6d84b2bd9
> --- /dev/null
> +++ b/include/dt-bindings/watchdog/aspeed-wdt.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef DT_BINDINGS_ASPEED_WDT_H
> +#define DT_BINDINGS_ASPEED_WDT_H
> +
> +#define AST2500_WDT_RESET_CPU		(1 << 0)
> +#define AST2500_WDT_RESET_COPROC	(1 << 1)
> +#define AST2500_WDT_RESET_SDRAM		(1 << 2)
> +#define AST2500_WDT_RESET_AHB		(1 << 3)
> +#define AST2500_WDT_RESET_I2C		(1 << 4)
> +#define AST2500_WDT_RESET_MAC0		(1 << 5)
> +#define AST2500_WDT_RESET_MAC1		(1 << 6)
> +#define AST2500_WDT_RESET_GRAPHICS	(1 << 7)
> +#define AST2500_WDT_RESET_USB2_HOST_HUB	(1 << 8)
> +#define AST2500_WDT_RESET_USB_HOST	(1 << 9)
> +#define AST2500_WDT_RESET_HID_EHCI	(1 << 10)
> +#define AST2500_WDT_RESET_VIDEO		(1 << 11)
> +#define AST2500_WDT_RESET_HAC		(1 << 12)
> +#define AST2500_WDT_RESET_LPC		(1 << 13)
> +#define AST2500_WDT_RESET_SDIO		(1 << 14)
> +#define AST2500_WDT_RESET_MIC		(1 << 15)
> +#define AST2500_WDT_RESET_CRT		(1 << 16)
> +#define AST2500_WDT_RESET_PWM		(1 << 17)
> +#define AST2500_WDT_RESET_PECI		(1 << 18)
> +#define AST2500_WDT_RESET_JTAG		(1 << 19)
> +#define AST2500_WDT_RESET_ADC		(1 << 20)
> +#define AST2500_WDT_RESET_GPIO		(1 << 21)
> +#define AST2500_WDT_RESET_MCTP		(1 << 22)
> +#define AST2500_WDT_RESET_XDMA		(1 << 23)
> +#define AST2500_WDT_RESET_SPI		(1 << 24)
> +#define AST2500_WDT_RESET_SOC_MISC	(1 << 25)
> +
> +#define AST2500_WDT_RESET_DEFAULT 0x023ffff3
> +
> +#define AST2600_WDT_RESET1_CPU		(1 << 0)
> +#define AST2600_WDT_RESET1_SDRAM	(1 << 1)
> +#define AST2600_WDT_RESET1_AHB		(1 << 2)
> +#define AST2600_WDT_RESET1_SLI		(1 << 3)
> +#define AST2600_WDT_RESET1_SOC_MISC0	(1 << 4)
> +#define AST2600_WDT_RESET1_COPROC	(1 << 5)
> +#define AST2600_WDT_RESET1_USB_A	(1 << 6)
> +#define AST2600_WDT_RESET1_USB_B	(1 << 7)
> +#define AST2600_WDT_RESET1_UHCI		(1 << 8)
> +#define AST2600_WDT_RESET1_GRAPHICS	(1 << 9)
> +#define AST2600_WDT_RESET1_CRT		(1 << 10)
> +#define AST2600_WDT_RESET1_VIDEO	(1 << 11)
> +#define AST2600_WDT_RESET1_HAC		(1 << 12)
> +#define AST2600_WDT_RESET1_DP		(1 << 13)
> +#define AST2600_WDT_RESET1_DP_MCU	(1 << 14)
> +#define AST2600_WDT_RESET1_GP_MCU	(1 << 15)
> +#define AST2600_WDT_RESET1_MAC0		(1 << 16)
> +#define AST2600_WDT_RESET1_MAC1		(1 << 17)
> +#define AST2600_WDT_RESET1_SDIO0	(1 << 18)
> +#define AST2600_WDT_RESET1_JTAG0	(1 << 19)
> +#define AST2600_WDT_RESET1_MCTP0	(1 << 20)
> +#define AST2600_WDT_RESET1_MCTP1	(1 << 21)
> +#define AST2600_WDT_RESET1_XDMA0	(1 << 22)
> +#define AST2600_WDT_RESET1_XDMA1	(1 << 23)
> +#define AST2600_WDT_RESET1_GPIO0	(1 << 24)
> +#define AST2600_WDT_RESET1_RVAS		(1 << 25)
> +
> +#define AST2600_WDT_RESET1_DEFAULT 0x030f1ff1
> +
> +#define AST2600_WDT_RESET2_CPU		(1 << 0)
> +#define AST2600_WDT_RESET2_SPI		(1 << 1)
> +#define AST2600_WDT_RESET2_AHB2		(1 << 2)
> +#define AST2600_WDT_RESET2_SLI2		(1 << 3)
> +#define AST2600_WDT_RESET2_SOC_MISC1	(1 << 4)
> +#define AST2600_WDT_RESET2_MAC2		(1 << 5)
> +#define AST2600_WDT_RESET2_MAC3		(1 << 6)
> +#define AST2600_WDT_RESET2_SDIO1	(1 << 7)
> +#define AST2600_WDT_RESET2_JTAG1	(1 << 8)
> +#define AST2600_WDT_RESET2_GPIO1	(1 << 9)
> +#define AST2600_WDT_RESET2_MDIO		(1 << 10)
> +#define AST2600_WDT_RESET2_LPC		(1 << 11)
> +#define AST2600_WDT_RESET2_PECI		(1 << 12)
> +#define AST2600_WDT_RESET2_PWM		(1 << 13)
> +#define AST2600_WDT_RESET2_ADC		(1 << 14)
> +#define AST2600_WDT_RESET2_FSI		(1 << 15)
> +#define AST2600_WDT_RESET2_I2C		(1 << 16)
> +#define AST2600_WDT_RESET2_I3C_GLOBAL	(1 << 17)
> +#define AST2600_WDT_RESET2_I3C0		(1 << 18)
> +#define AST2600_WDT_RESET2_I3C1		(1 << 19)
> +#define AST2600_WDT_RESET2_I3C2		(1 << 20)
> +#define AST2600_WDT_RESET2_I3C3		(1 << 21)
> +#define AST2600_WDT_RESET2_I3C4		(1 << 22)
> +#define AST2600_WDT_RESET2_I3C5		(1 << 23)
> +#define AST2600_WDT_RESET2_ESPI		(1 << 26)
> +
> +#define AST2600_WDT_RESET2_DEFAULT 0x03fffff1
> +
> +#endif

