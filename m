Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FFA00C4B
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2025 17:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPq7D0zMLz3cB7
	for <lists+openbmc@lfdr.de>; Sat,  4 Jan 2025 03:40:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.24
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735922404;
	cv=none; b=GrzuWRdC4w91ilhFr0npkVXgLVABSv1nnM+QJk5GZFKNwJDFQW5RNw6zRbl+It+7HZGwv1cVcDfUsSLdRLuwBSCw1QPh0PURvemB+h0gorWmHdTY3mBUO9unZqbxXBRTVs+pENoEurVd0AUbHULYgM1Ayo9tOfmCBuimFjalCgQfE5/3qRJIYuFT84dfrsBrF7pXS3j4pChyksiR2/aSl9LJw4PlYATfMxsFFcVHjPgxf4wxf7sUsgBpYEHJkR5mkqHeRVbKHLTu85ePrB9f6NwZ1AboOTavjsTmCYPE7a+9jytcufJK9uHOQamvBWs+72MGO1PVDAohlIDGzI753g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735922404; c=relaxed/relaxed;
	bh=GImteROnqULHiFchXLQTzhpJttZLzgZN6ofwaQa8E98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1waVyvs9gVu2jYvx+uJ3TXEMYZut0cod/nw+gZ6ejcM+muQcLwfwrJqg/TeX/3OAyc9+Z08k9BCGh0V4GnAaYzFQLksthF3wj0Zz7wITzJvj6kGC2/bbbpsStRB6iLvpBsFAmp7IEqshdffYAZq+MvXwc1tbPh7N/D+2Yl+Fz3C9LBR8j+qXE6IJgCdGTGWye34rnAC2hKCzPlNrXE/SNQQORx5+EK3fUOspUajVICX8IoHiJ4fXJSMQzQBRjEIZFlU3Cta0Kqi9Qrll6perfWHHHD5jSaudul3t5RBrelZapR3y3vAdN07br+G4Vl1aY6y6DGrFwfab7AENJSDFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=SIjH7vjb; dkim-atps=neutral; spf=pass (client-ip=80.12.242.24; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=SIjH7vjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.24; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPq750rJJz30VP
	for <openbmc@lists.ozlabs.org>; Sat,  4 Jan 2025 03:39:58 +1100 (AEDT)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Tkh7thvQlgiluTkhAtJugY; Fri, 03 Jan 2025 17:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735922332;
	bh=GImteROnqULHiFchXLQTzhpJttZLzgZN6ofwaQa8E98=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SIjH7vjbbSJIaxUKmhBM3ov4wfqI0MWG9M5HncSgPDIZwGkA8cuMe9jaoJ9kCQJcN
	 l6X1mLcu0p0afX4EQLWzCU1tk6JHQWsSoYCNxxRvqKDryVgbJoAa+NZ3FUVY5VDmBk
	 fGsQSUs6nLeRW8VFjrtGtXikEuPUUg/+vmABh2SAFy4UdH+Bv7FAcUYRM5vo3gDaeT
	 xnd4f8akpir9p8Gv1eJx7n0gUxch0qZdDB7LqeBcWT/+Sg8X4rvQIQa3/SxeBMjoDt
	 KMaLhw3/Ym00PLFzdpfP8SK6jcCqcSXHwkHqVlBcg1raOiko71QEvISzZZgboc2Kek
	 bmSEmk7QzeXQQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 03 Jan 2025 17:38:52 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Date: Fri, 3 Jan 2025 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250103063241.2306312-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 03/01/2025 à 07:32, Joey Lu a écrit :
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

...

> +	/* Nuvoton DWMAC configs */
> +	plat_dat->has_gmac = 1;
> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;
> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;
> +	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
> +
> +	priv_data = nvt_gmac_setup(pdev, plat_dat);
> +	if (IS_ERR(priv_data))
> +		return PTR_ERR(priv_data);
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

stmmac_pltfr_remove() is called by the .remove function.
Is it correct to call stmmac_dvr_probe() here, and not stmmac_pltfr_probe()?

> +	if (ret)
> +		return ret;
> +
> +	/* The PMT flag is determined by the RWK property.
> +	 * However, our hardware is configured to support only MGK.
> +	 * This is an override on PMT to enable WoL capability.
> +	 */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);
> +
> +	return 0;
> +}

...

> +static struct platform_driver nvt_dwmac_driver = {
> +	.probe  = nvt_gmac_probe,
> +	.remove = stmmac_pltfr_remove,
> +	.driver = {
> +		.name           = "nuvoton-dwmac",
> +		.pm		= &stmmac_pltfr_pm_ops,
> +		.of_match_table = nvt_dwmac_match,
> +	},
> +};

...

CJ
