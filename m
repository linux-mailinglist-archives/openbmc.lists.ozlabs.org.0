Return-Path: <openbmc+bounces-755-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16335BE6A9B
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 08:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnvyG21qnz2yqh;
	Fri, 17 Oct 2025 17:27:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760682470;
	cv=none; b=bQAvuqfS5JndoPEjqZST6H8h3x6G+OPn0KBIjidhC3IReTPjbeG5eZOdfB1e1Vt1U/7asbN27xK+PuWMqtjY0VgdrCEZy45qnIROKedx0Wm1zGXyLwxSDlCV2e8pt4YzQhBaOp+MuC/W50Ir1DaXG5BsJrjlo/3KGf5mG9636lJfWv8Dp8S1yqUN3okD6G7N97ZjOy0N6ClPp2S3SVidcef9dm1MXPTOuouwueIyRWn0ARzLPOkp830dpqMfo8MG5/ua2D+mZ96OVMZNiUkJF0KTX6eMQ7bV31S+plK069OzKWA+Ooh65ZiYizySIt9GkGrhPdHomYobHruAFVZQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760682470; c=relaxed/relaxed;
	bh=ikNtldnSiUcpDgaP+TWXKLJJ0mTUmGGvhRvHoOOj/RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8zxoSz8MSHLVfCF/jJTxOsN7mrkrfa6JPEIooyfWQc+XpCO+XMtb1d7nNLV1cmtSlQ7L54vSlzUrEAQ2U/32MAXzSh03tZT6w+BlpEThCRT60+rKyim3+eVS63oMPnCMgIwrxPJrWj6tEbFm7H7fmHMsPSu2dDA5r1QUSEpUlB+KARBm3NGRAzB82/gfx49/cNbS4DS33KsiV8HGXmDWG6Ax/won/6GJYtwFih/dE6DjUYLq5hwAi+/XzqGoFgRWjaPqgRtV0Y7J82XhX4qcOOLgw1aFXoUco2T6vMLBIvSnpBIv3TzPY2YoxcUjifFQJrs02Gi2kI34isg++BOfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnvyF0BMfz2xBV;
	Fri, 17 Oct 2025 17:27:48 +1100 (AEDT)
Received: from [192.168.0.5] (ip5f5af782.dynamic.kabel-deutschland.de [95.90.247.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id EA4F16028F341;
	Fri, 17 Oct 2025 08:26:57 +0200 (CEST)
Message-ID: <8fa346e3-308f-4ecb-af57-0fd643351765@molgen.mpg.de>
Date: Fri, 17 Oct 2025 08:26:56 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
To: Colin Ian King <coking@nvidia.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251016153000.9142-1-coking@nvidia.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251016153000.9142-1-coking@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Colin,


Thank you for the patch.

Am 16.10.25 um 17:30 schrieb Colin Ian King:
> There is a spelling mistake in a dev_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <coking@nvidia.com>
> ---
>   drivers/spi/spi-aspeed-smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 0c3de371fd39..f3a7189afd51 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -539,7 +539,7 @@ static int aspeed_spi_trim_window_size(struct aspeed_spi *aspi)
>   	} while (total_sz > aspi->ahb_window_size);
>   
>   	if (trimmed) {
> -		dev_warn(aspi->dev, "Window size after triming:\n");
> +		dev_warn(aspi->dev, "Window size after trimming:\n");
>   		for (cs = 0; cs < aspi->data->max_cs; cs++) {
>   			dev_warn(aspi->dev, "CE%d: 0x%08x\n",
>   				 cs, chips[cs].ahb_window_size);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

