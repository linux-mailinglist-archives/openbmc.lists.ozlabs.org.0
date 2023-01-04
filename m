Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16D65E605
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 08:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NndJj4d4Bz2ynf
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 18:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLNZO5QC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=dz4list@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLNZO5QC;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnKyy4l8zz30R1
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2023 06:53:13 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id e21so14054349pfl.1
        for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2023 11:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6e/5Cu+B9TE0Cpngv2/HB2QVOfrVt3C21w8th7LRob8=;
        b=LLNZO5QC8ES7UJNrvSY2UdSyTX3SsbRsfqVoru6x5esJtwHhQdVGTnENURmQq8rXPI
         Mwb+0+cZX1gEnR83qXVIzkVIgBM3UT8DInwUzfEB724AtfrpcowV6a31Hj+ohI1C6EHH
         ToXx/hUJLCE9VZXiXALtIzFtbjmwZt/8wNnjSQDMAqPd9ZKZ1v2K4UMoP1HB68XH90KZ
         gR6N64ZuPAEorpIu38v21n/qEC7KedZpW+MSUsxqiLI3fG71MYOfF0MZOMZTA+LciJDt
         f9odnz65KI51fbPc0/QXi73HEQB2S8TVg71lbqw8KiGHgpeb+zfB5M7h6GZvvKCiRvHn
         qWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e/5Cu+B9TE0Cpngv2/HB2QVOfrVt3C21w8th7LRob8=;
        b=pTyrryKshJpZp7N+oMY+7lC7+XhBDvZ/iqWU2MHZbAwyhSUtt4V8TdQ+AHrfLpnDCZ
         0enW/IqbFQN90IrmSJQjT4O/e1fYn5hZdU30TcmVzaFUM9W10XTg2rbVvkf+JM0s7yg4
         S+afzBcFF6suOmJssCLs4qdHwC3OPiCZf5shZ4tWN9t9IzJ3jK56m9ghBTEjJIGkhR2M
         tOkaTzgAE2JdfuRihohI8rmHe95IFUQR7Hxk4l/oDqO76FYYViRJ1N97O/fERwObrFy/
         XFrMjSG9krIIkohSTaQJX4jDY0tLM51aEkwMWk0DEwJVO612fz1TENFVxSQ+U4eKbVKv
         W1kw==
X-Gm-Message-State: AFqh2kofEG68LuGvsQ31u8JdFUQ4ewVX+TUMGzfhAm6SHkYd0G/C6Yqq
	cBm7jN9FCGMCI/ZP4n+MR40=
X-Google-Smtp-Source: AMrXdXvc6ZCynM82FRDifP1zkF1udsSA69A9In4oXFnay7SjIAU+XFg6yixR8pYiw77FNRFwfMfJjQ==
X-Received: by 2002:a62:e911:0:b0:581:579d:5c44 with SMTP id j17-20020a62e911000000b00581579d5c44mr30417469pfh.5.1672861991274;
        Wed, 04 Jan 2023 11:53:11 -0800 (PST)
Received: from zhdaniel-fedora-MJ0FVN0B ([2620:10d:c090:500::6:c6f4])
        by smtp.gmail.com with ESMTPSA id s5-20020aa78bc5000000b00581e0b5ad8dsm11476024pfd.107.2023.01.04.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 11:53:10 -0800 (PST)
Date: Wed, 4 Jan 2023 11:53:08 -0800
From: Dan Zhang <dz4list@gmail.com>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH u-boot,v2019.04-aspeed-openbmc 1/1] ARM: Aspeed: add a
 config for FMC_WDT2 timer reload value
Message-ID: <Y7XZJDlwunz5MWJW@zhdaniel-fedora-MJ0FVN0B>
References: <20221216163023.551569-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216163023.551569-1-potin.lai.pt@gmail.com>
X-Mailman-Approved-At: Thu, 05 Jan 2023 18:19:27 +1100
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
Cc: Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Dan Zhang <zhdaniel@meta.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Dec 17, 2022 at 12:30:23AM +0800, Potin Lai wrote:
> Add a config for FMC_WDT2 timer reload, and set timer reload value if
> FMC_WDT2 is enabled.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  arch/arm/include/asm/arch-aspeed/platform.h |  2 ++
>  arch/arm/mach-aspeed/ast2600/Kconfig        | 10 ++++++++++
>  arch/arm/mach-aspeed/ast2600/scu_info.c     | 13 +++++++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
> index ca270d4be1..4c2b0866fb 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -44,6 +44,8 @@
>  #define ASPEED_FMC_CS0_BASE	0x20000000
>  #elif defined(CONFIG_ASPEED_AST2600)
>  #define ASPEED_FMC_WDT2		0x1e620064
> +#define ASPEED_FMC_WDT2_RELOAD	0x1e620068
> +#define ASPEED_FMC_WDT2_RESTART	0x1e62006C
>  #define ASPEED_SPI1_BOOT_CTRL	0x1e630064
>  #define ASPEED_MULTI_CTRL10	0x1e6e2438
>  #define ASPEED_HW_STRAP1	0x1e6e2500
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> index f5852afa77..4c141672a1 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -53,6 +53,16 @@ config TARGET_QUALCOMM_DC_SCM_V1
>  
>  endchoice
>  
> +config ASPEED_FMC_WDT2_TIMER_RELOAD
> +	int "Aspeed FMC_WDT2 timer reload value"
> +	depends on ASPEED_AST2600
> +	range 0 8191
> +	default 0
> +	help
> +	  Aspeed FMC_WDT2 timer reload value, the time unit is 0.1 second.
> +	  if this value is 0, left original FMC_WDT2 timer reload register without
> +	  change (Default 22 seconds), if it is > 0 then set timer with the value.
> +
>  source "board/aspeed/evb_ast2600/Kconfig"
>  source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
> diff --git a/arch/arm/mach-aspeed/ast2600/scu_info.c b/arch/arm/mach-aspeed/ast2600/scu_info.c
> index a2277eec58..c18bc3923a 100644
> --- a/arch/arm/mach-aspeed/ast2600/scu_info.c
> +++ b/arch/arm/mach-aspeed/ast2600/scu_info.c
> @@ -30,6 +30,9 @@ static struct soc_id soc_map_table[] = {
>  	SOC_ID("AST2625-A3", 0x0503040305030403),
>  };
>  
> +static u32 aspeed_fmc_wdt2_reload =
> +	CONFIG_ASPEED_FMC_WDT2_TIMER_RELOAD & 0x1FFF;
> +
>  void aspeed_print_soc_id(void)
>  {
>  	int i;
> @@ -302,6 +305,16 @@ void aspeed_print_2nd_wdt_mode(void)
>  
>  			printf("\n");
>  		}
> +
> +		if (aspeed_fmc_wdt2_reload &&
> +		    (readl(ASPEED_FMC_WDT2) & BIT(0))) {
> +			writel(aspeed_fmc_wdt2_reload, ASPEED_FMC_WDT2_RELOAD);
> +			writel(0x4755, ASPEED_FMC_WDT2_RESTART);
> +			printf("Set FMC_WDT2 timer reload value to 0x%04X\n",
> +			       aspeed_fmc_wdt2_reload);
> +		} else {
> +			printf("Keep FMC_WDT2 timer reload value as init\n");
> +		}
>  	}
>  }
>  
> -- 
> 2.31.1
> 
Thanks for add this configuration.
Looks good.

Dan Zhang
