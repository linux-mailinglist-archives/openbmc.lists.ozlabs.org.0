Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EAB179654
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 18:09:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XgMq0MZQzDqdX
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 04:09:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nPtvWklQ; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XgMD3VK1zDqX7
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 04:08:37 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id b1so1272429pgm.8
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WcXiDjy33PYge8hUsXuS+/8NVEyCDj8/Q41XwHVNKcw=;
 b=nPtvWklQt9QghWJiSdW0QkhlOrTOjZ3+Pds6ZlGJMH65EhPXyR/CLtQPDyWFP6vkVk
 WBs9KyqFwr2826o1eb60HIE/D7eB88nLn5qItsO4QRJum9NW2rUgoDgdu2C/+OBnAOSm
 7VGNMVXMqTvDsGKcEVAvHD4xY3TNY3Ecoz0Qo3LB+REQP+1vkTxrkDtf35T1c8a3WTAq
 sLvRu06xnTEnC5SFMLwJEPp9umUI7fdjZNSUghVcNxaa2fnjI1marOElFj9M6v17L6Tc
 cDQfQ0dSZIo4z57MzT4QliTFyIk634DnwZVwEEfcMAlNnN7o5KsNQ0HOvPjIMqpmRcrW
 VDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=WcXiDjy33PYge8hUsXuS+/8NVEyCDj8/Q41XwHVNKcw=;
 b=lcsbNakiFbM1GtNJrlgs8GMk9bdQjkRY50Hs89crDFlO68iuESVbXdKtJ/pCtdzQSK
 AtZmgWN4ODsKZLrY/HsvP4ueeEEKYERSVifu/Y3Na2t6OxW43p4n/KtziR86GoMj938U
 RskrvuMrzriiEoEbpqlxjRCc1pctNfMkaK8zgp6cWlQp0vXRrV8np0YNhhK7e0vipfpy
 zQJAjAK3CiDojbruUNzn5kIocQOjuwODVLZyY50WKEXdBLgFNLXQvo4o1Iip2MDx3b4F
 kvsMk0ZfKRK5IEk5ieg64VgmIi5A7iYRpFX06aQnmbenpciXTW35fyUfgDtwzfQlNKfb
 AaTg==
X-Gm-Message-State: ANhLgQ0qdJumnW0O1fKzM6cvQw2KW554Uw/904QVaXPjl88Boqz+m3Xi
 bTvWfv42jcKBoGsRj+ZBs4s=
X-Google-Smtp-Source: ADFU+vv+Df31P92V8d+K3fXU/m2exn8CF+UTDgAxezww+iG60GrEAezFnJETx5JbDF0id9d06IG8bw==
X-Received: by 2002:aa7:91d7:: with SMTP id z23mr1179323pfa.160.1583341714250; 
 Wed, 04 Mar 2020 09:08:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h8sm1192994pfn.59.2020.03.04.09.08.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Mar 2020 09:08:33 -0800 (PST)
Date: Wed, 4 Mar 2020 09:08:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-binding: watchdog: add bootstatus reset type
 documentation
Message-ID: <20200304170832.GA22914@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303100114.87786-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 03, 2020 at 12:01:12PM +0200, Tomer Maimon wrote:
> Add device tree three bootstatus reset types documentation.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> index 6d593003c933..65e24a80ee70 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> @@ -17,6 +17,33 @@ Required clocking property, have to be one of:
>  
>  Optional properties:
>  - timeout-sec : Contains the watchdog timeout in seconds
> +- nuvoton,card-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the card reset type for checking and indicating
> +  the last card reset status (WDIOF_CARDRESET)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is porst
> +
> +  Reset types:
> +       - porst: Power reset
> +       - corst: Core reset
> +	   - wdX : Watchdog reset X (X represante 0-2)
> +	   - swX : Software reset X (X represante 1-4)
> +
> +- nuvoton,ext1-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating
> +  the last external 2 reset status (WDIOF_EXTERN1)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is wd0.
> +
> +  Reset types are the same as in nuvoton,card-reset-type property.
> +
> +- nuvoton,ext2-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating
> +  the last external 2 reset status (WDIOF_EXTERN2)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is sw1.
> +
> +  Reset types are the same as in nuvoton,card-reset-type property.
>  
>  Example:
>  
> @@ -25,4 +52,7 @@ timer@f000801c {
>      interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>      reg = <0xf000801c 0x4>;
>      clocks = <&clk NPCM7XX_CLK_TIMER>;
> +	nuvoton,card-reset-type = "porst";
> +	nuvoton,ext1-reset-type = "wd1";
> +	nuvoton,ext2-reset-type = "sw2";

This set of properties maps chip reset types to reset types defined
by the Linux watchdog subsystem (ie WDIOF_CARDRESET, WDIOF_EXTERN1,
and WDIOF_EXTERN2). It is neither a hardware description nor a system
configuration.

It is up to Rob to decide, but I personally don't think it is appropriate.

Guenter
