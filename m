Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F204B4205
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 07:36:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxvcj5Srqz3bcc
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 17:36:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kFGI58gk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kFGI58gk; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxvbh3HbWz3bbG;
 Mon, 14 Feb 2022 17:35:11 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id s1so14618247qtw.9;
 Sun, 13 Feb 2022 22:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pyb5tWJcRHnLtMA4aomMpy/PR66GTMIsvJog689hRGc=;
 b=kFGI58gk9L2wKQUEXFTQIbvdGcIcQo5SWS5Le+2Bz/yzMVC5mL9Te3zCOzUeI/andg
 R0jO0pc9xYLWZ+lp0vuQyxunwlel8M6GupgUxW/zH0nsL/hjLvSsyDDsuWkSwUzoEw8g
 QnHGQ55wKBkp1SdkzYlni7GuAzsLnTJWGNrSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pyb5tWJcRHnLtMA4aomMpy/PR66GTMIsvJog689hRGc=;
 b=yujh4H8oxdZbeC0gbLj3ZV92CfFSiGzgJUPgjaqzVXVWFu/r7l153VCVcqYNGJDwoy
 s6oiWc0oVM0U+L/W8gsJurZ2d3mArSeVad68dR0dkrHtOuB7IUHNheTxRc4bIze5DwyA
 0nC9eiH52UbwuheCUgavG/XxaVNqg7MUvFbgldxQrSMCZKImNYKCV3vyvzxgeZuWBXLk
 fD6BJWIgJn8G+8D+nKrbcdXn0XEWa9FHRh+68Ua6WzrCPDcxyUMTkCLEoOnmbErYax2r
 LUh+o9mEfcsy3CbazgvckerdkZYSJq2XpGMjPRgLDfwrGgQ4kzRddcUnzC5NPca+3J2L
 IoLw==
X-Gm-Message-State: AOAM531y+z4eDayjfpm8j31DZV6ri6fGr/serFmocPAhe/LIqOH10tYN
 CxAL60aih6Ar6UzzUm+ThaGYPBLE9l83DSGox90=
X-Google-Smtp-Source: ABdhPJy9s/aFAuJqTSusNQt/lR4CkUZcKtx0CGfkmUOzhA2dqTW3wBKR7IQwfNsd1r9E1dqpyJV0U7n8PscONOlIaho=
X-Received: by 2002:ac8:7e91:: with SMTP id w17mr8357451qtj.678.1644820506485; 
 Sun, 13 Feb 2022 22:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20220214032708.854-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20220214032708.854-1-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Feb 2022 06:34:54 +0000
Message-ID: <CACPK8XcLJuWitefi8LTAxDrhzAVe3b88haQYAJRLX5M=ceDg5g@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: Use of_device_get_match_data() helper
To: Jammy Huang <jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 at 03:27, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> Use of_device_get_match_data() to simplify the code.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 3904ded2052a..d4acf84cda9b 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> @@ -2451,7 +2452,6 @@ MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
>  static int aspeed_video_probe(struct platform_device *pdev)
>  {
>         const struct aspeed_video_config *config;
> -       const struct of_device_id *match;
>         struct aspeed_video *video;
>         int rc;
>
> @@ -2463,11 +2463,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>         if (IS_ERR(video->base))
>                 return PTR_ERR(video->base);
>
> -       match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
> -       if (!match)
> -               return -EINVAL;
> -
> -       config = match->data;
> +       config = of_device_get_match_data(&pdev->dev);

While normally this driver won't have probed without matching on some
data, it would be sensible to add a check for a null pointer here.

>         video->version = config->version;
>         video->jpeg_mode = config->jpeg_mode;
>         video->comp_size_read = config->comp_size_read;
> --
> 2.25.1
>
