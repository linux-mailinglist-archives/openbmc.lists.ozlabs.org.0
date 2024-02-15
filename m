Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F98569EB
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 17:48:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zacnJTwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbLc20hbZz3fFT
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 03:48:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zacnJTwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbLbT1sBBz3cQr
	for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2024 03:48:03 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-607cd210962so8482307b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2024 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708015677; x=1708620477; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJXT4bkQbGQzTXV7k3G659qQ960IV+AKnK8ee7bJMnQ=;
        b=zacnJTwMb6RgQSazkV6OZ/ZJHcbSX/qXbuDtE/UFF+cjNBwE1pSUoMJfCRoxPBfr/e
         VUY6GG3K0HzyrPqRlrA/eja+2HLmZPeJc7krheYqAeRpyc57c5876d6RMNT2ulK/s9D+
         k91m9VyTlLwWUTd0f+sDXSkOB2YI9e2SS8EIgXb3a9VHSnz98r8PJOqZaMVOyN+DxvsT
         Au33sFgXAvFFraS8yqZDK4AmsPSeLKHi809i2KdwMyACIij17rXGyZWxrSQh1wP9DEjo
         fCTutbb9B7BMGLt6t/kMmzxw5PvPMV7pqCxf+Ihua15ViSyOwSCUjG8iJ3QCChJwWmSk
         Li1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015677; x=1708620477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJXT4bkQbGQzTXV7k3G659qQ960IV+AKnK8ee7bJMnQ=;
        b=luO3nJnWKEJ5js79lMIDwFRXE3Anu0Fpn0peGSY0Zj9+RzkUjduSng2RGMOyERJbZC
         s7X/+nEwlAV+6wCua4GrKjz/wh4M6op8VTlZqKvwDiM9Mt5QMC/dbBtSgFGP6T2MnwKD
         t43jXgKyTwvbpbnEW/sHgNBxxYR4pViYs6eijTd+QrrneiSmclMnjsorGX/bmK7ZYjYP
         HXbdPJFP8hR1EQpS28GU1fJs+ns8DQevmmR735G5+1d/x1/6ab7A1FRfozaSrQoKL7yb
         sDYrq+6wDZqm4dTZ2IxEzK/kjbfzKa4GXM6ToTM1nolBJXI1XmaDy3kCDAUYyItFvGdk
         mSGA==
X-Forwarded-Encrypted: i=1; AJvYcCWRrIIbGHnjvJa8AhRKh6B8RXAo3sG3HMmMGUJY46YRX3LZdEdnRzNL5gr61iB6ES2wfqG2QwLqAWCD+UDK71CQ/5Msp+NxBcM=
X-Gm-Message-State: AOJu0YyIv6dJ/gpyDXQJkeoFKHASIrDgjna2rvQlJVollr2KQtyHxN49
	s4KYdwC4e6KtdmQqkx/SrMz0bT/cLbWnAxNM8UFCOUKGMP27rWomPA6eKcPCjr1xZtwi57MHF+e
	mhPrgrTv8I5g+rcGoJKwRPPCotowIhkn5lgsIFQ==
X-Google-Smtp-Source: AGHT+IFcEdDxkaV5gl2B0D9rLVsJb+rIMq80f4RxVLr6/cWjMSKXRFW8Ted8UPodyM0dXz2HXXSU8/DgM010QxOPGuc=
X-Received: by 2002:a81:b3c4:0:b0:602:c1e2:c6ee with SMTP id
 r187-20020a81b3c4000000b00602c1e2c6eemr2101425ywh.44.1708015677601; Thu, 15
 Feb 2024 08:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
In-Reply-To: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:47:22 +0100
Message-ID: <CAPDyKFo9NpKSuBnrcOseuD-jDA64CMyRxpH-OUoozOQDYHj1mQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: replace 1st argument to struct device * for mmc_of_parse_clk_phase()
To: forbidden405@outlook.com
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 15 Feb 2024 at 12:03, Yang Xiwen via B4 Relay
<devnull+forbidden405.outlook.com@kernel.org> wrote:
>
> From: Yang Xiwen <forbidden405@outlook.com>
>
> Parsing dt usaully happens very early, sometimes even bofore struct
> mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
> dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
> actually not mandatory to have a initialized mmc_host first, instead we
> can pass struct device * to it directly.
>
> Also fix the only current user (sdhci-of-aspeed.c).

Is there a problem? I don't see it, can please elaborate.

Kind regards
Uffe

>
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  drivers/mmc/core/host.c            | 4 +---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>  include/linux/mmc/host.h           | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index cf396e8f34e9..8b2844ac5dc5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -234,10 +234,8 @@ static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
>  }
>
>  void
> -mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase_map *map)
> +mmc_of_parse_clk_phase(struct device *dev, struct mmc_clk_phase_map *map)
>  {
> -       struct device *dev = host->parent;
> -
>         mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
>                                   &map->phase[MMC_TIMING_LEGACY]);
>         mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 42d54532cabe..430c1f90037b 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -435,7 +435,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>                 goto err_sdhci_add;
>
>         if (dev->phase_desc)
> -               mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
> +               mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
>
>         ret = sdhci_add_host(host);
>         if (ret)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 2f445c651742..5894bf912f7b 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -539,7 +539,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
>  int mmc_add_host(struct mmc_host *);
>  void mmc_remove_host(struct mmc_host *);
>  void mmc_free_host(struct mmc_host *);
> -void mmc_of_parse_clk_phase(struct mmc_host *host,
> +void mmc_of_parse_clk_phase(struct device *dev,
>                             struct mmc_clk_phase_map *map);
>  int mmc_of_parse(struct mmc_host *host);
>  int mmc_of_parse_voltage(struct mmc_host *host, u32 *mask);
>
> ---
> base-commit: 9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
> change-id: 20240215-mmc_phase-26e85511285d
>
> Best regards,
> --
> Yang Xiwen <forbidden405@outlook.com>
>
