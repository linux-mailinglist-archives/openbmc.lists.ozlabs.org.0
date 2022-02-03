Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B24A7DB7
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 03:12:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq2Hb07nVz3bbg
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 13:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=NdbZMMhc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I1dTP/0A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=NdbZMMhc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=I1dTP/0A; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq2H95XYsz3bNs
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 13:12:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D6EA83202195;
 Wed,  2 Feb 2022 21:12:03 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 21:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=RUDE84Ab/nb0kk6cLkLf1R9R+crKZchJHz4/Od
 8hxMc=; b=NdbZMMhctLcEExKukmCttiANtJ1hg/VYzy6nhScWviakBXdCnXWQbc
 KCZfl3BvST4l4iCfz1u7PZT3Dn4XroE3MWHD0yjNs/mxMdlLC4igQpJhvuyIodqR
 /aLJuS9Jx0Dt6goNIDqg9QGtdRJ5QbwzC0RvaienUBz4GW+JEVmzpyEUvBrhdpmB
 pngLVuut/2QpAotADF9jos7KoWHzndpNPiU918USe0aWYCTpVC06Jux1eO+3LXSK
 DUH8fpR6X8u7V6m33TvGWRv2RcGmdHQG+1nGJbwIynv6JV9PejEMK7srwjMKE/YK
 YNgHHwARbDYjsexbmcYOlVmvhprRj8FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RUDE84Ab/nb0kk6cL
 kLf1R9R+crKZchJHz4/Od8hxMc=; b=I1dTP/0AJkVIV2IzSenYUDrIlLhl+jHia
 k6JA+NkgsezPolAXUE91hDVvG7JNbM3NMNn+f9oNsUaR6pvq9dBTPaPwi0LftEJU
 nnGW37nf04pP2ncnVTs2z5WeW3iEXDhc/3rv2r9r77IDr8/aPXa97s5FNgMEAvI3
 7GPWbiRtNl7A7vliuhGlzAxuhehqKbyaj7Mq4NuQuwSyAC/wjsxaibCHwNcDl0BI
 Au4HTdx6MspINwntf5y0zgTq0eIpznrWNAzg7qCtfkMloGDavRPNUOe8nFuyMt7H
 pCBZaRYMqu6CMyjRBICU5764+RraqjtxD6DyHO6hARk1n+N1S+sQw==
X-ME-Sender: <xms:8zn7YUCleTibsUkhl4RwV8IOq3f6bADEW6_gFo6pj8gXuznBluqxzA>
 <xme:8zn7YWj4OHVPCyKUUskOphgSCbB6XMy3nhxQ3m4NpnOOHChBlEIY4tDGU3MyjC1ET
 fk_wV2ikqah55msSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8zn7YXmMrz_nSaKyGCJG6Zz7xM54FJNvlA73M1GuuScyZqfwbmdU1g>
 <xmx:8zn7YazxYohW_mluwr_O76qVhFqFkjL5sehcUsbUHbfJRdZCG_2lZg>
 <xmx:8zn7YZQyFSal68uMd6r8T8FhpX79LexL_xp3sUuNXZVL5pFbHmgFYg>
 <xmx:8zn7YUPQbG2M9-kQhJqvKtIT_9xc-raXidb3MXDbALfpF1H_WPYyaA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1E2D4AC0E99; Wed,  2 Feb 2022 21:12:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <926eb042-991c-4794-9e72-84056b7f6473@www.fastmail.com>
In-Reply-To: <20220124191503.88452-5-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-5-eajames@linux.ibm.com>
Date: Thu, 03 Feb 2022 12:41:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 4/6] gpio: Enable hogging
 support in SPL
Content-Type: text/plain
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



On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
> Use the CONFIG macros to conditionally build the GPIO hogging support in
> either the SPL or U-Boot, or both, depending on the configuration. Also
> call the GPIO hog probe function in the common SPL board initialization
> as an equivalent to adding it to the U-Boot init sequence functions.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  common/spl/spl.c           |  7 +++++++
>  drivers/gpio/Kconfig       | 10 ++++++++++
>  drivers/gpio/gpio-uclass.c | 12 +++++++-----
>  3 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/common/spl/spl.c b/common/spl/spl.c
> index a1d4514fd3..bbb7578463 100644
> --- a/common/spl/spl.c
> +++ b/common/spl/spl.c
> @@ -12,6 +12,9 @@
>  #include <dm.h>
>  #include <handoff.h>
>  #include <spl.h>
> +#if defined(CONFIG_SPL_GPIO_HOG)
> +#include <asm/gpio.h>
> +#endif
>  #include <asm/sections.h>
>  #include <asm/u-boot.h>
>  #include <nand.h>
> @@ -652,6 +655,10 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
>  	timer_init();
>  #endif
> 
> +#if defined(CONFIG_SPL_GPIO_HOG)
> +	gpio_hog_probe_all();
> +#endif
> +
>  #if CONFIG_IS_ENABLED(BOARD_INIT)
>  	spl_board_init();
>  #endif
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a8dc16ca0e..8b8bf6822f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -24,6 +24,16 @@ config GPIO_HOG
>  	  is a mechanism providing automatic GPIO request and config-
>  	  uration as part of the gpio-controller's driver probe function.
> 
> +config SPL_GPIO_HOG
> +	bool "Enable GPIO hog support in SPL"
> +	depends on SPL_GPIO_SUPPORT
> +	default n
> +	help
> +	  Enable gpio hog support
> +	  The GPIO chip may contain GPIO hog definitions. GPIO hogging
> +	  is a mechanism providing automatic GPIO request and config-
> +	  uration as part of the gpio-controller's driver probe function.
> +
>  config ALTERA_PIO
>  	bool "Altera PIO driver"
>  	depends on DM_GPIO
> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
> index 01cfa2f788..219caa651b 100644
> --- a/drivers/gpio/gpio-uclass.c
> +++ b/drivers/gpio/gpio-uclass.c
> @@ -144,7 +144,7 @@ static int gpio_find_and_xlate(struct gpio_desc *desc,
>  		return gpio_xlate_offs_flags(desc->dev, desc, args);
>  }
> 
> -#if defined(CONFIG_GPIO_HOG)
> +#if CONFIG_IS_ENABLED(GPIO_HOG)
> 
>  struct gpio_hog_priv {
>  	struct gpio_desc gpiod;
> @@ -1033,9 +1033,6 @@ int gpio_dev_request_index(struct udevice *dev, 
> const char *nodename,
> 
>  static int gpio_post_bind(struct udevice *dev)
>  {
> -	struct udevice *child;
> -	ofnode node;
> -
>  #if defined(CONFIG_NEEDS_MANUAL_RELOC)
>  	struct dm_gpio_ops *ops = (struct dm_gpio_ops *)device_get_ops(dev);
>  	static int reloc_done;
> @@ -1066,7 +1063,11 @@ static int gpio_post_bind(struct udevice *dev)
>  	}
>  #endif
> 
> -	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
> +#if CONFIG_IS_ENABLED(GPIO_HOG)

Why switch to a CPP conditional here?

I mean, it's not clear why there was a choice for a C conditional 
originally, so I'm curious either way.

Otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
