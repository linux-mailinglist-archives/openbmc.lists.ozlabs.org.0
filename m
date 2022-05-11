Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E0522A21
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 04:56:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyfh251Zxz3brp
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 12:56:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aRu70p2p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aRu70p2p; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyfgd57bkz3bpY
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 12:56:28 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id x18so1091550wrc.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rw142SP1D0w4+i8KsSDdmYQy8Gf83CYOKV1vddk7rQ=;
 b=aRu70p2pfZcUWMHdIWqbytQqSGZfXNXX1bQeHHeKCkgC4hVbNA0gDtu2GGGJ13AmUp
 tjZ5R5pA4NEGLZwwgvww1pUK34y1CGmvHG+hCC5A6WNvlu8q3fZqnOep5KbjV7xzpFTO
 L7UKnyu69uJ616B9H+bcut5hOXmsnch5Z6fME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rw142SP1D0w4+i8KsSDdmYQy8Gf83CYOKV1vddk7rQ=;
 b=fU/hQKgdcZ3ocr6r8kIwliUc6D6xlIVpjlrtmD9lzm49HjPZiBsh0b5R3YBYMhFQFL
 S7eYGs9m31E43A13rf4iPRorH0fH0emFc8bb9O6RW6x0k1mk4zOQmsvgq/qXOsYGQQMV
 FK/wjGcDW7J+Yx0mx0RlIhINyNZb9q+WpDQFHX5X4YAo11d6F8iVnLHXeQHinSX0Ap9O
 kiwMDD4MrlyrPxqUNhyHSSt6jDyv9pIISRDJJ+3yHiYfpAhkI4gEdffYQXfxgfNzi7ix
 F+BEDIoteWtNyQTIG7vEhSMT+riJ76MK+evRG2PKoL+/ZTugrAkdMuTdt29D3sTbacI3
 SSbw==
X-Gm-Message-State: AOAM532TBDKG4A3S0KvslDvYB3DpCHOnupBUvF/GfngiruWxzvYhPM/S
 aZDso4gp9FKK8nPqT8fuFAb33057QpnECJT/GO3ZaUIm
X-Google-Smtp-Source: ABdhPJxLHZTnGH9yYEPqRe6CL3+4q5w4qvWyjwVjkf7PvcT2LU5HfK8fA7rTQHIIz7J8SOWLzz5bd9aONrs5cHiNZ7o=
X-Received: by 2002:a5d:6d04:0:b0:20c:52de:9ce4 with SMTP id
 e4-20020a5d6d04000000b0020c52de9ce4mr22178999wrq.572.1652237781573; Tue, 10
 May 2022 19:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220511025309.27224-1-zev@bewilderbeest.net>
In-Reply-To: <20220511025309.27224-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 02:56:09 +0000
Message-ID: <CACPK8XcCK0oq3dwqMH47B+Mmwj+MzhA8ogQT=80YFJfCdUP0uQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: Fix typos in
 platform.h comments
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 at 02:53, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> "function" had been missing an "n" in a few places.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> As pointed out by Joel during review of the recent backdoor-disabling
> patch.

Thanks, applied.

>
>  arch/arm/include/asm/arch-aspeed/platform.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
> index f05747642f38..ca270d4be118 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -19,7 +19,7 @@
>  #define ASPEED_HW_STRAP1       0x1e6e2070
>  #define ASPEED_REVISION_ID     0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL  0x1e6e203C
> -#define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA fuction handshake register */
> +#define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA function handshake register */
>  #define ASPEED_PCIE_CONFIG_SET 0x1e6e2180
>  #define ASPEED_DRAM_BASE       0x40000000
>  #define ASPEED_SRAM_BASE       0x1E720000
> @@ -34,7 +34,7 @@
>  #define ASPEED_HW_STRAP2       0x1e6e20D0
>  #define ASPEED_REVISION_ID     0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL  0x1e6e203C
> -#define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA fuction handshake register */
> +#define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA function handshake register */
>  #define ASPEED_PCIE_CONFIG_SET 0x1e6e2180
>  #define ASPEED_MAC_COUNT       2
>  #define ASPEED_DRAM_BASE       0x80000000
> @@ -54,7 +54,7 @@
>  #define ASPEED_SYS_RESET_CTRL  0x1e6e2064
>  #define ASPEED_SYS_RESET_CTRL3 0x1e6e206c
>  #define ASPEED_GPIO_YZ_DATA    0x1e7801e0
> -#define ASPEED_VGA_HANDSHAKE0  0x1e6e2100      /*      VGA fuction handshake register */
> +#define ASPEED_VGA_HANDSHAKE0  0x1e6e2100      /*      VGA function handshake register */
>  #define ASPEED_SB_STS          0x1e6f2014
>  #define ASPEED_OTP_QSR         0x1e6f2040
>  #define ASPEED_MAC_COUNT       4
> --
> 2.35.3
>
