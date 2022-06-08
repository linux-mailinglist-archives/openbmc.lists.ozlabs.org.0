Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1891543D9F
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJrj3hf1z3brV
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sj/ESHCD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sj/ESHCD;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJrK5httz2yL6
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:35:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654720514; x=1686256514;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lS7NLP+OI7h8wB5VjxUrQ3Ia8yVZ5wCvZHOcmmr7wDg=;
  b=sj/ESHCDnKCvUa5iKBa5lICsc3a9CsjlB7R5xJC8pK2GTA+FcfETgwfs
   Of4fsNxndgQd8JU9Wor//RlGzetKV4i1PvLb1oTwifLuXOhXXX8zZf89t
   DW57ImSjlxEKwx1cVVWUsTxgkZM/TY+3UhkfNIfa7FuObWcf1zMWdJcI7
   Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2022 13:35:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 13:35:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 8 Jun 2022 13:35:09 -0700
Received: from [10.110.70.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 8 Jun 2022
 13:35:08 -0700
Message-ID: <4f8f72fa-6dfc-1617-4e43-5715926f9d96@quicinc.com>
Date: Wed, 8 Jun 2022 13:35:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>
References: <20220607142845.1123692-1-quic_jaehyoo@quicinc.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220607142845.1123692-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/7/2022 7:28 AM, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
> equipped with Aspeed AST2600 BMC SoC.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v3:
> * Dropped compatible string of flash memory - Joel / Cedric
> * Dropped I2C pinctrl settings - Joel
> 
> Changes in v2:
> * Changed vendor name from Nuvia to Qualcomm.
> 
>   arch/arm/dts/Makefile                   |   1 +
>   arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 172 ++++++++++++++++++++++++
>   2 files changed, 173 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 8f876a0aa0d7..952c3d776adc 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-ncsi.dtb \
>   	ast2600-p10bmc.dtb \
>   	ast2600-pfr.dtb \
> +	ast2600-qcom-dc-scm-v1.dts \

Please hold it off. It should have s/dts/dtb/
Will submit v4.

Thanks,
Jae

[...]
