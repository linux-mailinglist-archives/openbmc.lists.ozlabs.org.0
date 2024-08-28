Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FE962C1C
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 17:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv7Vb1PXFz30Th
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 01:24:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724858643;
	cv=none; b=L8jrVVHs/X6A2WAb1BnY0YnjeWz9O80pQaEAynkLyAE446InvlSvMDI1qAUG4/dgQq3v7uti9bpg+2eGUFdoHcBO954zIqbfNl0BhjS+oke43yWXiAYD4x2CPkP4vMrh9riS/i8MUEM2RZG1doXGuXYCBJeOBnNSS6wJq5D/ph11PDD4CPEpoRfukRtHlu0YyFW7eYU5dirbV0vRpH2P/IuvAVl1RGJSEhg5KzeHoIaX3k9cIFuFv6dBox+0/EfzNmmXJvurMSFDnM+W4NU1l9x3QY1oHYXdokAH2zB4rknKuCtY8lhc6zS2e8kIEJDXO1CSZgqSSxA0nA4R9hkZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724858643; c=relaxed/relaxed;
	bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=VigVrh55/dYXQe38XvdZiSI3Kxr+X1qThZhMyNt5EFSTUw5CVr/UKRrNKbrLdIqiMGbXIW7SyokmesQF3fl5ghVEHqgnPlUTqt2RA8wEkEmIhs9wy6N7vFEiiUUWVECUFQKeNwLFdtKXNV7jCuVjVOqyT8mO4UMeyixZkke7r4SBKMb6VAc/dVdtvYPF434DiLbZyVZwO0GQTJNOfV1/I06li+gBYR29j/8CyzhRoIgGLvJrYzJb4GOv5woUn4BcqYbUO828UWs7SvpysT5zhPLg+z/hmxrvyqSPfd3R7sKNTUtdeREJ7PoYUUvUbcuKkdDwLALOzzwLUXW0V5befw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nrUNkWaj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nrUNkWaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv7VW1xrdz2yDt
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 01:24:01 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e164caa76e4so6410025276.1
        for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724858637; x=1725463437; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
        b=nrUNkWajzw25cmZ3erw+oD1ow5MIG87DUXLbxgUjEw/Eset/dv9DMBK05gfCX+to9M
         vAPCEUH0pbVDgmLw0KbwL0XuUbbdo1nHXIbp8Q8Szv4UQGYCiwZ7/UAhreRTl/H7qote
         idXEqUagHlGIOVeE5bzCEBwhwLTn+mkvcKR1gvu9UMoP3Qs62KLym/TnSf8qio33hP6r
         oOn3ePtd7h1M26/IWEhgFFa50+4/omRDHTSnf+ZxcDUr6JHbxVb4jJryeTyogdedYX2U
         qkm1Jwb8+SCT5s5q/ca87lETV9WFwbA4FAY61AHXm8AaN5osmshcXJJm9JuhskkRo7Iu
         cwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858637; x=1725463437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
        b=RdxIfrj8jyB+3WY+zuvitYd8AXcKkls8R+rdF7ntzGuXxTsEjhvS1ydpt0wPrCDgjh
         cN8O8fivZ5SwkaE2FNeTP4xwGrcQLA3aVi3qIrOnQoXw7HOKysDJgeWlJKkci8RUaROa
         saLsiSrL81VxuWFETacBo/FGNqmWnCPeX4ox5xgDqOd1IpClbRVhtijwfHHK/KdCjyT+
         5CVu/FNu02Oj98dx2vR7tQHxQJqBckaWd0vNEbtAw+4shBO9r+/q9D4zh2GPID5Sc752
         ufU0mukwMQp0bK9akc3ru+AMpHcobCk7zBQXxEp48GhzpInlovxUGY2mAhyE9CkvHOBm
         SZfA==
X-Forwarded-Encrypted: i=1; AJvYcCXZKBcFbuGKTJIlhe8tgFELmIoxjfPnNGXCeI6OfsBRq7HoeXOPt8PjYUKFlR/nc/OsEjTtP7HU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxB11JcdiOmxJX2nv3JEh9d/BaAxlr3z0SysG8WauFMZtdNULn7
	D3WunS3UI0fCNfgjnc8/wemwNsWpsxesIQ5Fwh/Pl6CwNkkbi7huq51r5aKYy7xr7vHouSowQ6i
	ewig1vKUGWR+YyYJpM9aSrUlC/RnQBsN71gLI+w==
X-Google-Smtp-Source: AGHT+IGrQ8fIZASydEMTPgJtn6QAWdCuqrWbDh+r3EcwsMgb2mqXieOzplvqVupD9INUYmMzBF4NNL8ZwfYeKBgNa8Y=
X-Received: by 2002:a05:6902:2847:b0:e1a:43fb:12e6 with SMTP id
 3f1490d57ef6-e1a43fb14c7mr3278001276.35.1724858637220; Wed, 28 Aug 2024
 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240826124851.379759-1-liaochen4@huawei.com>
In-Reply-To: <20240826124851.379759-1-liaochen4@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Aug 2024 17:23:20 +0200
Message-ID: <CAPDyKFoFH+=Q+h8zuiuopi+f4p63QUoj_qEn83YVBinh8PnKBA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-of-aspeed: fix module autoloading
To: Liao Chen <liaochen4@huawei.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, adrian.hunter@intel.com, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 26 Aug 2024 at 14:57, Liao Chen <liaochen4@huawei.com> wrote:
>
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Applied for fixes, by adding fixes/stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 430c1f90037b..37240895ffaa 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -510,6 +510,7 @@ static const struct of_device_id aspeed_sdhci_of_match[] = {
>         { .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
>         { }
>  };
> +MODULE_DEVICE_TABLE(of, aspeed_sdhci_of_match);
>
>  static struct platform_driver aspeed_sdhci_driver = {
>         .driver         = {
> --
> 2.34.1
>
