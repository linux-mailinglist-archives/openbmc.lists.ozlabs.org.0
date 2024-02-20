Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F885C24F
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 18:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfR1R5TDqz3cy8
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 04:17:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfR0y09z1z3byl;
	Wed, 21 Feb 2024 04:17:19 +1100 (AEDT)
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2098E61E5FE01;
	Tue, 20 Feb 2024 18:16:40 +0100 (CET)
Message-ID: <26acdacd-e63b-494f-bf7d-215b8643a0c5@molgen.mpg.de>
Date: Tue, 20 Feb 2024 18:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: host: replace 1st argument to struct device * for
 mmc_of_parse_clk_phase()
Content-Language: en-US
To: Yang Xiwen <forbidden405@outlook.com>
References: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Yang,


Thank you very much for your patch. Some nits from my side.

For the summary, I suggest:

 > mmc: host: mmc_of_parse_clk_phase(): Pass struct device * instead of 
mmc_host *

Am 15.02.24 um 12:03 schrieb Yang Xiwen via B4 Relay:
> From: Yang Xiwen <forbidden405@outlook.com>
> 
> Parsing dt usaully happens very early, sometimes even bofore struct

1.  us*ua*lly
2.  b*e*fore

> mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
> dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
> actually not mandatory to have a initialized mmc_host first, instead we

a*n*

> can pass struct device * to it directly.
> 
> Also fix the only current user (sdhci-of-aspeed.c).
> 
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>   drivers/mmc/core/host.c            | 4 +---
>   drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>   include/linux/mmc/host.h           | 2 +-
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index cf396e8f34e9..8b2844ac5dc5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -234,10 +234,8 @@ static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
>   }
>   
>   void
> -mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase_map *map)
> +mmc_of_parse_clk_phase(struct device *dev, struct mmc_clk_phase_map *map)
>   {
> -	struct device *dev = host->parent;
> -
>   	mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
>   				  &map->phase[MMC_TIMING_LEGACY]);
>   	mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 42d54532cabe..430c1f90037b 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -435,7 +435,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>   		goto err_sdhci_add;
>   
>   	if (dev->phase_desc)
> -		mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
> +		mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
>   
>   	ret = sdhci_add_host(host);
>   	if (ret)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 2f445c651742..5894bf912f7b 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -539,7 +539,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
>   int mmc_add_host(struct mmc_host *);
>   void mmc_remove_host(struct mmc_host *);
>   void mmc_free_host(struct mmc_host *);
> -void mmc_of_parse_clk_phase(struct mmc_host *host,
> +void mmc_of_parse_clk_phase(struct device *dev,
>   			    struct mmc_clk_phase_map *map);
>   int mmc_of_parse(struct mmc_host *host);
>   int mmc_of_parse_voltage(struct mmc_host *host, u32 *mask);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
