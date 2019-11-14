Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79836FFD61
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 04:39:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GZT45M25zDqVj
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 14:39:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMML46qMzF4Vm;
 Fri, 15 Nov 2019 00:11:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 05:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="235662970"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.197])
 ([10.237.72.197])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2019 05:11:42 -0800
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-aspeed: add inversion signal presence
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
References: <20191114125435.27756-1-i.mikhaylov@yadro.com>
 <20191114125435.27756-3-i.mikhaylov@yadro.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
Date: Thu, 14 Nov 2019 15:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114125435.27756-3-i.mikhaylov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2019 14:39:07 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/11/19 2:54 PM, Ivan Mikhaylov wrote:
> Change the default .get_cd callback. Add inverted signal card detection
> check.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 8962f6664381..186559ee8fcc 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -143,6 +143,19 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
>  	return (delta / 0x100) - 1;
>  }
>  
> +static int aspeed_get_cd(struct mmc_host *mmc)
> +{
> +	struct sdhci_host *host = mmc_priv(mmc);
> +
> +	int present = !!(sdhci_readl(host, SDHCI_PRESENT_STATE)
> +			 & SDHCI_CARD_PRESENT);
> +
> +	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
> +		present = !present;

Perhaps safer to flip the bit using CONFIG_MMC_SDHCI_IO_ACCESSORS and
->readl() callback

> +
> +	return present;
> +}
> +
>  static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_pltfm_host *pltfm_host;
> @@ -183,6 +196,10 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  		goto err_pltfm_free;
>  	}
>  
> +	host->mmc_host_ops.get_cd = aspeed_get_cd;
> +	if (of_property_read_bool(pdev->dev.of_node, "cd-inverted"))
> +		dev_info(&pdev->dev, "aspeed: sdhci: presence signal inversion enabled\n");

Is this print really needed?

> +
>  	ret = mmc_of_parse(host->mmc);
>  	if (ret)
>  		goto err_sdhci_add;
> 

