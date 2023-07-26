Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C7762C01
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 08:56:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOKUr3ff;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9l7N0wl1z3c1M
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 16:56:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOKUr3ff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 16:56:16 AEST
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9l6m1r2Dz2yVb;
	Wed, 26 Jul 2023 16:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690354577; x=1721890577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NGfMfU7QX/FvMvczs5lY6l7TlgmEQkvKreP+H495+9Q=;
  b=DOKUr3ffUFranAEWBIURtg9Bz2GySR7PNVUMdoudokU2NZfeU0mU529E
   PLUbMO8QORetAAdmP8+H641QlcnoueIy3C6/KRyKAZpn1xxCjBFSkdbUg
   m7CDRFumahQt3TwowIUhqgoNXo8MakqiP1tu5TN5QMtX4vxJbRun0I62T
   ii1686R64yIfSbed07ykN5ylvgElJtzOM5zlrnfsyGIQu9axUamcxrmBN
   d6RyHqHnclUC0BTYkqC3rNkZUVFuNhbrem+Aj4g+Ws0shAYJULWwj/HiV
   6myFJSr/waRcnSzgAaeDLHEeqgQjI2avy6rcAfc59UKGphOSi5dJnGC4C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357936996"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="357936996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676547119"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="676547119"
Received: from igosu-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.35.75])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:55:03 -0700
Message-ID: <6cd56798-dbdf-35d8-a381-a569cbbe00ee@intel.com>
Date: Wed, 26 Jul 2023 09:54:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 34/61] mmc: sdhci-of-aspeed: Convert to platform remove
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20230726040041.26267-1-frank.li@vivo.com>
 <20230726040041.26267-34-frank.li@vivo.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230726040041.26267-34-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/07/23 07:00, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index b4867bb4a564..42d54532cabe 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -450,7 +450,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int aspeed_sdhci_remove(struct platform_device *pdev)
> +static void aspeed_sdhci_remove(struct platform_device *pdev)
>  {
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_host *host;
> @@ -463,8 +463,6 @@ static int aspeed_sdhci_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(pltfm_host->clk);
>  
>  	sdhci_pltfm_free(pdev);
> -
> -	return 0;
>  }
>  
>  static const struct aspeed_sdhci_pdata ast2400_sdhci_pdata = {
> @@ -520,7 +518,7 @@ static struct platform_driver aspeed_sdhci_driver = {
>  		.of_match_table = aspeed_sdhci_of_match,
>  	},
>  	.probe		= aspeed_sdhci_probe,
> -	.remove		= aspeed_sdhci_remove,
> +	.remove_new	= aspeed_sdhci_remove,
>  };
>  
>  static int aspeed_sdc_probe(struct platform_device *pdev)
> @@ -573,13 +571,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int aspeed_sdc_remove(struct platform_device *pdev)
> +static void aspeed_sdc_remove(struct platform_device *pdev)
>  {
>  	struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
>  
>  	clk_disable_unprepare(sdc->clk);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id aspeed_sdc_of_match[] = {
> @@ -599,7 +595,7 @@ static struct platform_driver aspeed_sdc_driver = {
>  		.of_match_table = aspeed_sdc_of_match,
>  	},
>  	.probe		= aspeed_sdc_probe,
> -	.remove		= aspeed_sdc_remove,
> +	.remove_new	= aspeed_sdc_remove,
>  };
>  
>  #if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)

