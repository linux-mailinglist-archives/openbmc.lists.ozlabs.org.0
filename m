Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E167C4E95
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 11:27:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IC60PAN/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S56qW6TN3z3c5L
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 20:27:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IC60PAN/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S56px0jyBz3bpd;
	Wed, 11 Oct 2023 20:26:47 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a6190af24aso1146599766b.0;
        Wed, 11 Oct 2023 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697016404; x=1697621204; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+gXxCxi6vp030i+agdceTeSycONQUjyDJd68wM+eSmw=;
        b=IC60PAN/WtfPm3Qtb1fuHX+9IdQhk9qm4fxOfN/g+8Y3Syrl+1zAjgCAyvY+mSJr3/
         FQnBnONHp1eTsZfIlk8AEHeqNnEe3qhBscEF/OIajescoQhhBv1EgFHNnKK49IL50Bt8
         mAzDEzPwUFyP5PDrJxd+UMOisodXU4glux0wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016404; x=1697621204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gXxCxi6vp030i+agdceTeSycONQUjyDJd68wM+eSmw=;
        b=D8ybBF5M9Vt5efUcOCE4GPexoVsRQurubC6KMFJglw0mRS+vZ7qJG15cAAfagSBDcd
         6cjuP5XHCRRhZQt+NMWhd/FpWLLsThMWXOEJGJLIKx5Tsbgc4kVpKa0Y2+r6vCqPBcsn
         bORYWBCB9E967jOFPQ/fFTPjQOJn3P1SaW9bl2PtXrp6wPgLjUBiXE3N1C2qw5cxsYKp
         UKniUQl5espubXKeUt3Pe0mgEVROH0qYrJ0tdNIYIR/3M8ynL7C/wsEH/t+E2uF6PHgX
         jHqQ87xPxnwBn4wZMG7igEPsOq8Ys6y135jbWXYkHiyQxYTAUXdLNTUVuZFWFVj4KwWp
         o7+Q==
X-Gm-Message-State: AOJu0Yz9VUI4cNVLw59Oso+hP4tYncx9fKgyrWqLU+kE689bEYH7EyTx
	kl7Beslic+z5Dm2lsOju6KZhS/SoiP7BcmvHS+c=
X-Google-Smtp-Source: AGHT+IHApwH+q9IPC29LKXoGHb2xdanm+kml7BeaRr/3PjuQ3NKQJoVq6Zhgzq28/yAtLmjZHjvfQbxoOnsjY+1Rl5M=
X-Received: by 2002:a17:907:7817:b0:9ad:e17c:464e with SMTP id
 la23-20020a170907781700b009ade17c464emr17132987ejc.68.1697016403957; Wed, 11
 Oct 2023 02:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230922104231.1434-4-zev@bewilderbeest.net> <20230922104231.1434-6-zev@bewilderbeest.net>
In-Reply-To: <20230922104231.1434-6-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 19:56:32 +1030
Message-ID: <CACPK8Xe5UEDt+ko_FtF-fi1TZDNZeZMtzaU_ZBxt6CO+UHJEpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: aspeed: Add support for aspeed,reset-mask
 DT property
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
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-arm-kernel@lists.infradead.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>, "Milton D. Miller II" <mdmii@outlook.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Sept 2023 at 20:12, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This property allows the device-tree to specify how the Aspeed
> watchdog timer's reset mask register(s) should be set, so that
> peripherals can be individually exempted from (or opted in to) being
> reset when the watchdog timer expires.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

A note below.

> ---
>  drivers/watchdog/aspeed_wdt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b72a858bbac7..b4773a6aaf8c 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -79,6 +79,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
>  #define WDT_CLEAR_TIMEOUT_STATUS       0x14
>  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)
> +#define WDT_RESET_MASK1                0x1c
> +#define WDT_RESET_MASK2                0x20
>
>  /*
>   * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -402,6 +404,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>
>         if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>                 (of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
> +               u32 reset_mask[2];
> +               size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
>                 u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>
>                 reg &= wdt->cfg->ext_pulse_width_mask;
> @@ -419,6 +423,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>                         reg |= WDT_OPEN_DRAIN_MAGIC;
>
>                 writel(reg, wdt->base + WDT_RESET_WIDTH);
> +
> +               ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
> +               if (!ret) {
> +                       writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
> +                       if (nrstmask > 1)
> +                               writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
> +               }

This will do funky things if someone is careless enough to put the
property in an ast2400 device tree.

The ast2700 has four reset mask registers. Not really your problem at
this point, but we might need to move to a per-soc callback in the
platform data or similar.

>         }
>
>         if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
> --
> 2.40.0.5.gf6e3b97ba6d2.dirty
>
