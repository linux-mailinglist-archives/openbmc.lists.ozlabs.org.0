Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED994173E64
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:25:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TbyN1GvMzDrMW
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 04:25:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c42;
 helo=mail-yw1-xc42.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BiCNBCpD; dkim-atps=neutral
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TbxN3SbQzDrMK;
 Sat, 29 Feb 2020 04:24:06 +1100 (AEDT)
Received: by mail-yw1-xc42.google.com with SMTP id i190so4043225ywc.2;
 Fri, 28 Feb 2020 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=8DBagXdO92SGZD18edolNudaDY7BySfxVES4onPKc48=;
 b=BiCNBCpDhvom4uoBEgi6wWUf78Kj5hpmt5TQuapy9qcR64nz4OnJs4O7vU8LcLUu1Q
 Nfy/foDa3tGn4/w4Qq2UVG6M4CVuzCmn9cGtWCFzLZD/gC/cBKSKqjOgg1Y3L5Yy0mGv
 PDHzM2BiUkH/rSgYYhZ/pZYHhX40OjyNXBiHVxpBfnnDjWLEmX58heB6u2EeaeQzIDcy
 6/UrxwaLyrcFcHFVPAHwz4hCE5WmYIR+hl7l9Q9Zqhhks6gu/viQxHQ2VyXC/iKyyhnS
 TRQifnXdpH2I43DBTHtwz6C4YTGxMhpodWZtaFd/rok5ZYFKXb0osBRKqJwU0XgXJ6eg
 8KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8DBagXdO92SGZD18edolNudaDY7BySfxVES4onPKc48=;
 b=ed9vuv6rbeFnwuazuPs4YqJhKdEgP1r6qsvtFmgei5697iURFeHWEPmnZhHfW1/yaG
 3Wc+BsNCDSVZui/UkEfGp1FBP/Qaj74dydekTdqYT3DftyEKleyl+VAvtkV9pZdaGfu0
 LgC/ZRClv366ttSf+frwN/HmljjOGDVJjBnDIlOYe2wmE3y4N8mnJDqVEcee+Fr6FuS1
 wIxzZQK5I/rH3J5T2tPwXXT4d2dhDEI1YLpPlYpQxu3wo+IVY7G7MmC7Tae7wkzqRkhw
 t/xz4lz66f2psKGfxYu2mqAGoP0fFpC4uw1FwyRYBA6ACUU+66kpAv8YUh2PGuzaIeZ+
 sqXg==
X-Gm-Message-State: APjAAAUOS4bNlCKoNEc6RWrnOIOaQKpa/KQXYalN1kUW/ynWjVq2WLpB
 4716rtLkr8iZszkrfIZ5a8o=
X-Google-Smtp-Source: APXvYqzjFFyA3EgEXXPFZc4AK1Co1/BHuEDPNq3NoVt9mMTOgu4Ojh5FyaxarOeEjgtDprXLfIV49w==
X-Received: by 2002:a25:b16:: with SMTP id 22mr4521149ybl.380.1582910643178;
 Fri, 28 Feb 2020 09:24:03 -0800 (PST)
Received: from [192.168.1.111] (96-42-251-64.dhcp.roch.mn.charter.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id a202sm4221235ywe.8.2020.02.28.09.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 09:24:02 -0800 (PST)
Subject: Re: [PATCH v2] ARM: dts: rainier: Set PCA9552 pin types
To: Matthew Barth <msbarth@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
References: <20200225201415.431668-1-msbarth@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <ec4c675a-b1db-c2d5-97d0-dcff44123db0@gmail.com>
Date: Fri, 28 Feb 2020 11:24:01 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225201415.431668-1-msbarth@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 2020-02-25 14:14, Matthew Barth wrote:
> All 16 pins of the PCA9552 at 7-bit address 0x61 should be set as type
> GPIO.
>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
> v2: Added leds-pca955x.h include
>      Added upstream to patch
> ---
Reviewed-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index c63cefce636d..d9fa9fd48058 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -4,6 +4,7 @@
>   
>   #include "aspeed-g6.dtsi"
>   #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
>   
>   / {
>   	model = "Rainier";
> @@ -351,66 +352,82 @@
>   
>   		gpio@0 {
>   			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@1 {
>   			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@2 {
>   			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@3 {
>   			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@4 {
>   			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@5 {
>   			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@6 {
>   			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@7 {
>   			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@8 {
>   			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@9 {
>   			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@10 {
>   			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@11 {
>   			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@12 {
>   			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@13 {
>   			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@14 {
>   			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@15 {
>   			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   	};
>   
