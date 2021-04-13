Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53135E9B4
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 01:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKhjB0mTVz30DQ
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 09:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=b1+3yNCk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=b1+3yNCk; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKhhy57x5z2yhd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 09:32:17 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id i3so3500529qvj.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 16:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcgNcz5GqDRa8ghsgvDOnjhu2Fz/DaGDjWCp9aNEirg=;
 b=b1+3yNCkKganrBeXdPseplfQ0A9cBitL4Yk8I4toA4WrlGa/MLQUaUduuyRBaGUx/a
 1lWKAf7pkDHc/cTRM7W3U+aOyMoU9KZTW3GUQT3U2ox6GMrcwu2q+LPqAARrVPoRRedM
 Zx6vQkrX/lNTyc3pFlWiu4E6fHwGpnbRpzbj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcgNcz5GqDRa8ghsgvDOnjhu2Fz/DaGDjWCp9aNEirg=;
 b=TSmVLBs12qHpPEAbw8dYxxF5H/X1tjHGYou68tJhbFTFQf8kEVqzD4aG/zPvwyqFmx
 x5mHPLbOSIlpXKVxU30i0WsROql+GnZFGMbc1rGiP6YHJaZTUD8oO2zPp27pnTR8To+2
 arxuq1RTkt7dwhb61FNYGztko0GTyVE57R4Qi7Uln4sSrP1CzNA0qIOuDZsHmQPqaxfU
 3Uy9C+8Au7i9lNpAouDRLI1VA3uQhHYeTunVNwbMC71am1tAnVBIfqwrsjrZzr0FXeVr
 jui4Q7c9VLaUR0LnpiUtod4D7eXurUNx75VbvqS2OHmfpPK9BQ3JZE/UEXDuHLKmFIR2
 sRkA==
X-Gm-Message-State: AOAM530PgxMx3rDujsL44Mi8axvJ6dNnyidwef8iXUtSaoShi4URjuSH
 0Md3OpW9NJgsQ0MFVexo3MFTcmSG58UHckC7CZEnIRP0
X-Google-Smtp-Source: ABdhPJzyok2Zg2SGDSQo5qRTUJRgYpdw9UmSM0JPlFKCDm/Ari7Zth0AoNP6Z05fguIImqAIBMQaxdX2pD6+aVASZvI=
X-Received: by 2002:a05:6214:2607:: with SMTP id
 gu7mr35088135qvb.18.1618356733919; 
 Tue, 13 Apr 2021 16:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161150.2815450-1-wltu@google.com>
In-Reply-To: <20210413161150.2815450-1-wltu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Apr 2021 23:32:02 +0000
Message-ID: <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
Subject: Re: [PATCH] board: ast2400: Enable SGPIO in SCU
To: Willy Tu <wltu@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Willy,

On Tue, 13 Apr 2021 at 16:11, Willy Tu <wltu@google.com> wrote:
>
> Add option to enable register for SGPIO in SCU.
>
> Included new function register values for ast2400
> SCU and enable the SGPIO function in board init.

Which branch would you like this patch applied to?

>
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  arch/arm/include/asm/arch-aspeed/scu_ast2400.h |  4 ++++
>  arch/arm/mach-aspeed/ast2400/Kconfig           |  4 ++++
>  arch/arm/mach-aspeed/ast2400/board_common.c    | 15 +++++++++++++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> index 9c5d96ae84..17eaaf3e9d 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> @@ -75,6 +75,10 @@
>  #define SCU_PIN_FUN_SCL2               (1 << 14)
>  #define SCU_PIN_FUN_SDA1               (1 << 13)
>  #define SCU_PIN_FUN_SDA2               (1 << 15)
> +#define SCU_PIN_FUN_SGPMCK             (0x1 << 8)
> +#define SCU_PIN_FUN_SGPMLD             (0x1 << 9)
> +#define SCU_PIN_FUN_SGPMO              (0x1 << 10)
> +#define SCU_PIN_FUN_SGPMI              (0x1 << 11)
>
>  #define SCU_D2PLL_EXT1_OFF             (1 << 0)
>  #define SCU_D2PLL_EXT1_BYPASS          (1 << 1)
> diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig b/arch/arm/mach-aspeed/ast2400/Kconfig
> index f76276860c..c4e88b5140 100644
> --- a/arch/arm/mach-aspeed/ast2400/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2400/Kconfig
> @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400
>           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
>  endchoice
>
> +config ENABLE_SGPIO
> +    tristate "Enable SGPIO in SCU"
> +       default n
> +
>  source "board/aspeed/evb_ast2400/Kconfig"
>
>  endif
> diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c b/arch/arm/mach-aspeed/ast2400/board_common.c
> index 3829b06934..eca2ef03e5 100644
> --- a/arch/arm/mach-aspeed/ast2400/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
> @@ -14,6 +14,21 @@ __weak int board_init(void)
>  {
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>
> +#ifdef CONFIG_ENABLE_SGPIO
> +#define SCU_BASE 0x1e6e2000
> +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
> +       /* Unlock SCU */
> +       writel(SCU_UNLOCK_VALUE, SCU_BASE);
> +
> +       /* Enable SGPIO Master */
> +       u32 reg = readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
> +
> +       reg |= (SCU_PIN_FUN_SGPMI  |
> +                       SCU_PIN_FUN_SGPMO  |
> +                       SCU_PIN_FUN_SGPMLD |
> +                       SCU_PIN_FUN_SGPMCK);
> +       writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
> +#endif
>         return 0;
>  }
>
> --
> 2.31.1.295.g9ea45b61b8-goog
>
