Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F99166B99
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 01:28:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nsk92JZgzDqc2
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 11:28:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mk0CLeyD; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NsjV5LzlzDqL9;
 Fri, 21 Feb 2020 11:27:24 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id j9so258810pfa.8;
 Thu, 20 Feb 2020 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vlf9e8PCxMy8eGHAA66JnCJwWWqoU2+bIGR18Xk5wUE=;
 b=Mk0CLeyDzct1sX63axT7hMDuzVKps8CcPRH1gOBCgnC7dn6oGylada1Aq+d2q80tY0
 IsrTO0zoWHUIkV7J+5At6YZmXgmlXtk7b3/Atb4YkT3gjxHVOJD4X11a9gW3J9xogMmC
 yZBgYo6tX7Y4rEeYV94pJ3gMaQvTCMue/PkSOzNkDi3wVYc0Imdo+gDWx9lys6yorXP2
 d6/f8BRHjs4lhqKHRWX2KYa9vABy7PeVZWqGP83q3chVv32+JaUjuUhP7LbrHgI0eWz2
 lb7i9Cbef+4fPYScbvO2rLsq4RJVaRPY/sle1TzfSAEKVlNCVpgcPl4xE/r0AtBWBNaB
 ZYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vlf9e8PCxMy8eGHAA66JnCJwWWqoU2+bIGR18Xk5wUE=;
 b=FqsvdTTXV1t7JF/9Rbruk4UiOM5SHAsS6HCqqDdLCC7Y+5n3C/v6Y8CTcEcNihq99m
 w/FYGL9zjXivVKaYb0X0GyTInnIdGYugRqH+TVqw5QUfE8c2V5n3z4f1x4kNziAVkPgy
 4/RpCGcsHLf9m4ikWmxZV12YKJr9v1IUTQ/uf+/00fcDzC7hC+ixwg6bPrbibYpLUq+z
 WzcLx2NViHMkh7FeEei9AQmjwP5Ods8oxk+315rY3B1IgSaW8wIMKbXRgogm2m1GFn+0
 or1hwUkalys9KnA7upL7iLk2ANLwGYwhl6VwfhRHF0x18LLKCavbvQ4sb3tlXqbTyGTG
 k7iA==
X-Gm-Message-State: APjAAAUJWcDAovwyir662FjG8G6ViC9tU+iF2M/iMMAYiMpbqF9ePgaq
 uDtxa1M3keMNCJujx9ioLh0=
X-Google-Smtp-Source: APXvYqyeVIYTi7VwppjFDqFRf+PGuo3qQ+FGi2uyU11/sFnMcwObMpN+4M+7gA1IAJ8rt9kz3zp3MA==
X-Received: by 2002:a62:1883:: with SMTP id 125mr33901467pfy.166.1582244839582; 
 Thu, 20 Feb 2020 16:27:19 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::6:8f30])
 by smtp.gmail.com with ESMTPSA id fh24sm535479pjb.24.2020.02.20.16.27.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Feb 2020 16:27:19 -0800 (PST)
Date: Thu, 20 Feb 2020 16:27:16 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: Re: [PATCH v3 0/5] aspeed-g6: enable usb support
Message-ID: <20200221002715.GC7815@taoren-ubuntu-R90MNF91>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

Could you provide some comments on this patch series while I'm working on
the other patch set (for vhub descriptors and DT binding document)?


Cheers,

Tao

On Mon, Feb 17, 2020 at 07:13:10PM -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series aims at enabling USB Host and Gadget support on AST2600
> platforms.
> 
> Patch #1 replaces hardcoded vhub port/endpoint number with device tree
> properties, so that it's more convenient to add support for ast2600-vhub
> which provides more downstream ports and endpoints.
> 
> Patch #2 enables ast2600 support in aspeed-vhub usb gadget driver.
> 
> Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.
> 
> Patch #4 and #5 add vhub port/endpoint properties into aspeed-g4 and
> aspeed-g5 dtsi.
> 
> Tao Ren (5):
>   usb: gadget: aspeed: read vhub properties from device tree
>   usb: gadget: aspeed: add ast2600 vhub support
>   ARM: dts: aspeed-g6: add usb functions
>   ARM: dts: aspeed-g5: add vhub port and endpoint properties
>   ARM: dts: aspeed-g4: add vhub port and endpoint properties
> 
>  arch/arm/boot/dts/aspeed-g4.dtsi           |  2 +
>  arch/arm/boot/dts/aspeed-g5.dtsi           |  2 +
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 25 +++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi           | 45 ++++++++++++
>  drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +-
>  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 79 +++++++++++++++-------
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c   | 30 +++++---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c   |  4 +-
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c   | 26 ++++---
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 23 +++----
>  10 files changed, 178 insertions(+), 62 deletions(-)
> 
> -- 
> 2.17.1
> 
