Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3736A88D
	for <lists+openbmc@lfdr.de>; Sun, 25 Apr 2021 19:33:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSw990fngz302f
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 03:33:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LtSlhuaZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=LtSlhuaZ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSw8r56FQz2y8Q;
 Mon, 26 Apr 2021 03:32:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=voFwKrTTjjoyFJE6evMIYyhewsdMjPxL3p2swH7Uqb0=; b=LtSlhuaZiX7L9FFvjwUKDmATvG
 ghN3hT8T+DxHu3JGJ40h6ULLb4Sx+VQIFytp9Ezy5D3U734hIvaOhCauDnrYMrPW0xPXEevle1jeg
 U/OWE74IFVUB9+/7PWNPC01Dqzq45C/J03y96I7SGSiXEgVqHowYZixvbAANBSwGDvQ5WfOT+lJ7+
 Uec8Mh41l525KKr3msY9vfYMLVdsiQNj49jzq96B/uQJU69WfE+WDRnfZ7C784/jT4+2JIlVJttj1
 5sX6RxtDIrZtcXAs/16rlexZry10dzu1yQpIP+FRX864CUtBjAwwsZveGvxNm02EPfmNO/uEkhSum
 59USWy3g==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1laibz-004Wfq-GF; Sun, 25 Apr 2021 17:32:07 +0000
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
To: Souptick Joarder <jrdr.linux@gmail.com>, andrew@aj.id.au,
 linus.walleij@linaro.org, joel@jms.id.au
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6db04e41-3ee6-c569-34b2-83693b620362@infradead.org>
Date: Sun, 25 Apr 2021 10:32:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/25/21 5:26 AM, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> 
> drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c:2705: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2614: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:111: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinmux-aspeed.c:24: warning: This comment starts
> with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Fix minor documentation error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 4 ++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 3 ++-
>  drivers/pinctrl/aspeed/pinmux-aspeed.c     | 3 ++-
>  4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 996ebcb..4c0d266 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -2702,8 +2702,8 @@ static int aspeed_g5_sig_expr_eval(struct aspeed_pinmux_data *ctx,
>  }
>  
>  /**
> - * Configure a pin's signal by applying an expression's descriptor state for
> - * all descriptors in the expression.
> + * aspeed_g5_sig_expr_set() - Configure a pin's signal by applying an
> + * expression's descriptor state for all descriptors in the expression.
>   *
>   * @ctx: The pinmux context
>   * @expr: The expression associated with the function whose signal is to be
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 5c1a109..eeab093 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -2611,8 +2611,8 @@
>  };
>  
>  /**
> - * Configure a pin's signal by applying an expression's descriptor state for
> - * all descriptors in the expression.
> + * aspeed_g6_sig_expr_set() - Configure a pin's signal by applying an
> + * expression's descriptor state for all descriptors in the expression.
>   *
>   * @ctx: The pinmux context
>   * @expr: The expression associated with the function whose signal is to be
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 9c65d56..9bbfe5c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -108,7 +108,8 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
>  }
>  
>  /**
> - * Disable a signal on a pin by disabling all provided signal expressions.
> + * aspeed_disable_sig() - Disable a signal on a pin by disabling all provided
> + * signal expressions.
>   *
>   * @ctx: The pinmux context
>   * @exprs: The list of signal expressions (from a priority level on a pin)
> diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
> index 57305ca..894e2ef 100644
> --- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
> @@ -21,7 +21,8 @@ static inline void aspeed_sig_desc_print_val(
>  }
>  
>  /**
> - * Query the enabled or disabled state of a signal descriptor
> + * aspeed_sig_desc_eval() - Query the enabled or disabled state of a signal
> + * descriptor.
>   *
>   * @desc: The signal descriptor of interest
>   * @enabled: True to query the enabled state, false to query disabled state
> 


-- 
~Randy

