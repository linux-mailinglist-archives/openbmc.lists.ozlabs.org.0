Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44F59CD3A
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 02:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBVWy5R39z3c1c
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 10:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fPUcRTa3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fPUcRTa3;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBVWX42syz2yp5;
	Tue, 23 Aug 2022 10:30:46 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso8705205wmc.0;
        Mon, 22 Aug 2022 17:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=UUy7pFiuNHxxZ+gAKVDwyFup/IAsLQHlSSFpnTX7fgM=;
        b=fPUcRTa30JuAaTDPsCNaPlBbMh4qBfIqEwARHGAmw260OXHFvZm5IlNlItlySOO9BC
         zlh3BfXL+8F2Tq+l9UUvf3iX3+YLOXG1fRbz5FjhjUHxIQIXQsuonv/ijkCAgj+iCL2a
         Hwq00HLFPLhDIuxCVUN4lddoVrotvJTzUcarw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UUy7pFiuNHxxZ+gAKVDwyFup/IAsLQHlSSFpnTX7fgM=;
        b=FfnW6zH05PNGHDIkWCIpuwfychXsFoa36jusU0BFfIMg7YVvQnOuOg5y1qhnXSOs31
         nL7tzegsu68uCPDyAUoJWuNmEVR3m/e8c8OedYLDMJcDPNSLQnBdU3zgiKQwC6Wt+cpu
         WKTRsAT/WCSsNEAWeyfIl7vtdOOWzCtstwU6ZPysnnZcOeeETYgWsqUxtVe6J83TAJmP
         tkAqOvlu+FVNSID/J7EWV1Tnsmq+rSHn8TefiaDpy5x/gCSbEbM2J9cK4t1JP+oJjSV5
         XS0GA4sGPq6N+1FqBdF68R5oid2LXhEVbNOgqw2OE0J5ujP34eDJsItJ7oYS/0hfV8vy
         rcyw==
X-Gm-Message-State: ACgBeo3md7uAqvHL6aoaiuw+pZSqDi95c5ryDI6MYYn1DKyghqoqmkT7
	JKo30c2Fq6V1qOaJkPDxtOghxmYwgMwTbj7cf6Y=
X-Google-Smtp-Source: AA6agR7OTP6PMQ2t9lcuBSj1FFNbSPo+MEVjTKZAblWZjVImfq1Ms2uZmY4lKQoSF42B8mM8lUDv2SZQZd1zbz8SNoI=
X-Received: by 2002:a05:600c:1990:b0:3a6:2a00:3ddb with SMTP id
 t16-20020a05600c199000b003a62a003ddbmr458666wmq.72.1661214642422; Mon, 22 Aug
 2022 17:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661094034.git.i.kononenko@yadro.com> <f9814f62fe2d6b6c21400ee3c83e46e61e0c72d1.1661094034.git.i.kononenko@yadro.com>
In-Reply-To: <f9814f62fe2d6b6c21400ee3c83e46e61e0c72d1.1661094034.git.i.kononenko@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 00:30:30 +0000
Message-ID: <CACPK8XenuLrB-iOCo57FjeoOdEieHyxSM2ZM-X73AfP3fq3r+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] drivers/misc: (aspeed-lpc-snoop): Add regmap cleanup
 on a shutdown.
To: Igor Kononenko <i.kononenko@yadro.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 21 Aug 2022 at 15:54, Igor Kononenko <i.kononenko@yadro.com> wrote:
>
> The bmc might be rebooted while the host is still reachable and the host
> might send requests through configured lpc-kcs channels in same time.
> That leads to raise lpc-snoop interrupts that haven't adjusted IRQ
> handlers on next early kernel boot, because on the aspeed-chip reboot
> might keep registers on a unclean state that is configured on the last
> boot.
>
> The patch brings an way to masking lpc-snoop interrupts all through
> a bmc-rebooting time.
>
> Tested on a YADRO VEGMAN N110 stand.
>
> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index eceeaf8dfbeb..6ec47bf1dc6b 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -235,6 +235,41 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>         return rc;
>  }
>
> +static void aspeed_lpc_reset_regmap(struct aspeed_lpc_snoop *lpc_snoop)
> +{
> +       u8 index;
> +       struct lpc_regman_cleanup {
> +               u32 offset;
> +               u32 mask;
> +               u8 val;
> +       };
> +       static struct lpc_regman_cleanup cleanup_list[] = {
> +               // Prevent handling ENINIT_SNPxW
> +               { .offset = HICR5,
> +                 .mask = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> +                 .val = 0 },
> +               { .offset = HICR5,
> +                 .mask = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> +                 .val = 0 },
> +               { .offset = HICRB,
> +                 .mask = HICRB_ENSNP0D | HICRB_ENSNP1D,
> +                 .val = 0 },
> +               // Reset SNOOP channel IRQ status
> +               { .offset = HICR6,
> +                 .mask = HICR6_STR_SNP0W | HICR6_STR_SNP1W,
> +                 .val = 1 },
> +       };
> +       for (index = 0; index < ARRAY_SIZE(cleanup_list); index++) {

Did you consider open coding the various updates instead of using a
for loop? I don't think the for loop help us here.

You could instead make these three updates:

/* Prevent handling ENINIT_SNPxW */
regmap_clear_bits(lpc_snoop->regmap, HICR5,
                                  HICR5_EN_SNP0W | HICR5_ENINT_SNP0W |
HICR5_EN_SNP1W | HICR5_ENINT_SNP1W);

regmap_clear_bits(lpc_snoop->regmap, HICRB,
                               HICRB_ENSNP0D | HICRB_ENSNP1D);

/* Reset SNOOP channel IRQ status */
regmap_set_bits(lpc_snoop->regmap, HICR6,
                            HICR6_STR_SNP0W | HICR6_STR_SNP1W);



> +               u32 val = 0;
> +
> +               if (cleanup_list[index].val)
> +                       val = cleanup_list[index].mask;
> +               regmap_update_bits(lpc_snoop->regmap,
> +                                  cleanup_list[index].offset,
> +                                  cleanup_list[index].mask, val);
> +       }
> +}
> +
>  static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>                                      int channel)
>  {
> @@ -285,6 +320,7 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       aspeed_lpc_reset_regmap(lpc_snoop);
>         dev_set_drvdata(&pdev->dev, lpc_snoop);
>
>         rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
> @@ -345,6 +381,13 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static void aspeed_lpc_snoop_shutdown(struct platform_device *pdev)
> +{
> +       struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
> +
> +       aspeed_lpc_reset_regmap(lpc_snoop);
> +}
> +
>  static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {
>         .has_hicrb_ensnp = 0,
>  };
> @@ -370,6 +413,7 @@ static struct platform_driver aspeed_lpc_snoop_driver = {
>         },
>         .probe = aspeed_lpc_snoop_probe,
>         .remove = aspeed_lpc_snoop_remove,
> +       .shutdown = aspeed_lpc_snoop_shutdown,
>  };
>
>  module_platform_driver(aspeed_lpc_snoop_driver);
> --
> 2.25.1
>
