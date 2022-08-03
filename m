Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C02588F80
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 17:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LybZk0my4z30BP
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 01:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=PK3meVYV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=PK3meVYV;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LybZJ6M1qz2xrj
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 01:36:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659541017; x=1691077017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=heiP5n1LPaqrxH5/hHPi/vlKLuxPnUuu8Niy2caYly8=;
  b=PK3meVYVv86qWzbU6VZe6BHB4X98HNE2ZWPgYsDdvmnyQw9xHwQ9YNAW
   XaQwu+EgBTuaT5zUCdb7mXwUmFsygNzxQfJIOD2DYk6nWJvG0X1zJJ8Nf
   e4IzmfF3PIliKxj342aiowXOy1dvB6ZoMQOD/tRUUzm3Rxt67yVxvCsP0
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 08:35:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 08:35:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 08:35:48 -0700
Received: from [10.110.49.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 08:35:47 -0700
Message-ID: <a931446a-42ce-3af7-9244-a9fa6abfbe9a@quicinc.com>
Date: Wed, 3 Aug 2022 08:35:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] mtd: spi-nor-ids: add
 winbond w25q512nw family support
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220719205856.2232070-1-quic_jaehyoo@quicinc.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220719205856.2232070-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Gentle ping...

On 7/19/2022 1:58 PM, Jae Hyun Yoo wrote:
> Add Winbond w25q512nwq/n and w25q512nwm support.
> 
> datasheet:
> https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf
> 
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> This is backport of 47ed8b22fd561b65e8541919becc76ab3d86f7a3 from the u-boot
> upstream.
> 
>   drivers/mtd/spi/spi-nor-ids.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi/spi-nor-ids.c b/drivers/mtd/spi/spi-nor-ids.c
> index 5882eab2e3fc..53e352d8656e 100644
> --- a/drivers/mtd/spi/spi-nor-ids.c
> +++ b/drivers/mtd/spi/spi-nor-ids.c
> @@ -334,6 +334,16 @@ const struct flash_info spi_nor_ids[] = {
>   			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>   			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>   	},
> +	{
> +		INFO("w25q512nwq", 0xef6020, 0, 64 * 1024, 1024,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
> +	{
> +		INFO("w25q512nwm", 0xef8020, 0, 64 * 1024, 1024,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
>   	{
>   		INFO("w25q01jv", 0xef4021, 0, 64 * 1024, 2048,
>   			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
