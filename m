Return-Path: <openbmc+bounces-1080-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63ABCEA146
	for <lists+openbmc@lfdr.de>; Tue, 30 Dec 2025 16:35:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgcbv6Cs2z2xs1;
	Wed, 31 Dec 2025 02:35:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767108923;
	cv=none; b=PqSdixDxgOoypibCMA/8iB70HDzcG7CMldv7hb+aKsCjVRrIlEnI/FzWQi8kaplwHpP2K9+zaa9EV7lGS2sa4R4s0kQZkkn/EFodNu+p0y9gZ+RWn7lWGaVzoC7uDs/rKavrMoYbCPnfistmHZXwEFEVV34FsJxFT1Yfyjoq9x0nL2LFp1Oebi4P3UfOcznQV6c94pzFqXi2rBHHYmq+ak5PvP94NQ2Vtcc0SWzQOv17GHQVZ6kcPoZsUDP/ZRfWAbnK1xivtxHZcSvLhN6kKO+vLRgf/RB2fa2KQMx+hG6FbAsUnk7m4XGg/MnaICrSJpB2NSj3zDRvEdCFoQI7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767108923; c=relaxed/relaxed;
	bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3ycEMWUWW+n6kvrTM4iaZFpttDDswdx4Q07Byop81uAoHMHCtcijiY56lc1D+7WABCcpkn4uhqHxaQq+lR56U5J5Dm/RNjMpLwz5lfce0axGn7PAbeZFLDpH1om1dCEd5UtIHpEZ8l1yQ2+CxLRPvSS2vjNnMRfUhvarQpudM7ympgT3CvdqTcP9vkhhotXV4RH3qEDV/3UazoFt3Lb04PZGi8+tkggsOcahFk7oQMSO8Kt+1KIbi5nFh76483ojVr8JRWBAd6cr4M+/vkJ7EHCHQCNi8F5y2IenJrYtWBT85GN5ZW/z42AyS+xasa/tJ69eQRsgaYZ6s+h2o7Vnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OYNAHmds; dkim-atps=neutral; spf=pass (client-ip=209.85.208.177; helo=mail-lj1-f177.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OYNAHmds;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.208.177; helo=mail-lj1-f177.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgcbs5T79z2yD4
	for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 02:35:20 +1100 (AEDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3825ae23d95so29429861fa.0
        for <openbmc@lists.ozlabs.org>; Tue, 30 Dec 2025 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108857; x=1767713657; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=OYNAHmdsB/xLSJqtrHEZv7go4EeEX1+Q61CqjahFveJDsxQDl/xqfHmj1h5cbMowum
         2wIbAZsdhdZvGcBqcR85gvqHBmZUxN81B0IpaThzWvVOXub7Isyqq94GOsRb4EfN5QdI
         8Pyq+6SBifS/5zH2z9oMPliK1BBgEvnRri+tFA/zq2WEJssbNTX0okU1HluhbU7SLyLs
         bJdPjC5ebMx8hxIbigeuwgdCLC0m6/S5sqRA5YNLFoYx9vIgsIWRAS0lzf1RhYhVgnth
         i9xuDBpvCweubBABZMlppijbiDotP++Fx5ARVfXRv26Yx8LA+aAQfpXUiQD2s9XWpriC
         Sd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108857; x=1767713657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=LlOc4ONCpRc7/568PXxEhj6m6doKvFrDWDjSthoRHYo1NS9ddKFkRbKJ4QkRKuqPL7
         ojIoeSbtUj15fz7rHCOUQDF4Xmv68KbveF/c8hE/zNL7TO3boODLrwuV+C0fjMyLNfCC
         C0eXOFeWV4bPlhszpOQ2pttVl6H3oKAybElP42gWVB9M7tG+mCW3uIBVZaR/9yb1lDCl
         ECoSCM7JF3iv3IXkpudHBZOZ21P588tQtFK3nKlg5zvKwEbsdluBrMpy2NQj9OWpEmo4
         c7doi3RhzakyacxaJWwbzZZ2yp8kJpV69sZp9bHN8qummUOq5z6gy0krsvCTnziWEhE9
         0kIg==
X-Forwarded-Encrypted: i=1; AJvYcCVc+q6AOfLYajnYkNyVeLF8MyLYbBDbbSRpIlowKOKR1tV+3sNHf469+49hUHXugk+7pcj4+/6n@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVudl6QOGzWzXJgG/97GzUE/u+6LvY8CUL13MVRi08HIOoICOy
	vpXlnkbKvgk16KInSKPzb5WpLn6zhDRzdn3neDsTwiqWX3RL69hcKos3b/7JDW2yMPjX6Cb7pzc
	9z7sRsRAAP0Xj6vRiLMCnQmJjsl+rDBEoDII9wn+zHQ==
X-Gm-Gg: AY/fxX7feOlrXMUZtO0l5FyWW1yFxZfjQVBcWXA0x136MW3mpye7taDlVBhw2/BQo9N
	0esAgjdnF6LB3ZcWlnav+o7EG2zl0MZxKHO7W/tUZkbPTPGYmy+oTgZuR4teDrAjgayWNJfObFN
	7xtusaKqBTwo968X9ymIDsGs8cjKlDP9BEZr/ZpnKgb7mffmr0IJslpBj3bgcfpVTjVv/e16E2Y
	pVS+43TiDNfGx1PZ6tVm/9X5HhqRukoUsSRYOjMhZt7R6D7fnWAbkqwQcRsitYTZCxCSI/dIq8e
	tyLknFI=
X-Google-Smtp-Source: AGHT+IF8m67UtLFJYo+1Sd/5xP1asTd78BRhH0xaCX+pqytxUScESGkOS8OTTGNkp77INxT4etPPBh36TlR00OdBV7U=
X-Received: by 2002:a2e:a801:0:b0:37b:b952:5e2 with SMTP id
 38308e7fff4ca-3812158e6d1mr92229501fa.16.1767108856717; Tue, 30 Dec 2025
 07:34:16 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com> <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:39 +0100
X-Gm-Features: AQt7F2oKPch5XI3ozINSBYMELnoLnRJYzcAZlrhoJTH7OcGc0z1qpY0CIewnVRk
Message-ID: <CAPDyKFp3X0EeiGRHLQqzE3vkVoLmOwi=1813S32sLTqXab43gQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Adrian Hunter <adrian.hunter@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 24 Dec 2025 at 13:44, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

All patches in the series applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ca97b01996b1..4296def69436 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
>  static int aspeed_sdc_probe(struct platform_device *pdev)
>
>  {
> -       struct device_node *parent, *child;
> +       struct device_node *parent;
>         struct aspeed_sdc *sdc;
>         int ret;
>
> @@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, sdc);
>
>         parent = pdev->dev.of_node;
> -       for_each_available_child_of_node(parent, child) {
> +       for_each_available_child_of_node_scoped(parent, child) {
>                 struct platform_device *cpdev;
>
>                 cpdev = of_platform_device_create(child, NULL, &pdev->dev);
>                 if (!cpdev) {
> -                       of_node_put(child);
>                         ret = -ENODEV;
>                         goto err_clk;
>                 }
> --
> 2.51.0
>

