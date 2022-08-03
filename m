Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23447588F8B
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 17:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LybdZ0G3hz306m
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 01:39:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=MvwhNV0Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=MvwhNV0Z;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lybd85W96z2xkh
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 01:39:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659541165; x=1691077165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lxoy1rbiFrupj1X3zBCjF4+0KHIB5JMqIsQ+6/7akSg=;
  b=MvwhNV0ZG8QcMVpXw9KXnZkk2VeDJr0p265lXQVInnqvfIHMCz3vuF68
   HCU7L5gm35rJZzCzzzm7UuhXZpb13FiNaPnqpzt+7ea3e9hIfLIEFeq/r
   P5a110znJkNH0pg+1DmryGZTjf+6YhGmPYavjxYgTUqKv0e4SCbZOa6VF
   4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 08:38:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 08:38:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 08:38:22 -0700
Received: from [10.110.49.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 08:38:20 -0700
Message-ID: <f78ee206-2011-685d-8256-e78020a95b7b@quicinc.com>
Date: Wed, 3 Aug 2022 08:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH dev-5.15] ARM: dts: aspeed: nuvia: rename vendor nuvia to
 qcom
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220708142529.2727969-1-quic_jaehyoo@quicinc.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220708142529.2727969-1-quic_jaehyoo@quicinc.com>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Gentle ping...

On 7/8/2022 7:25 AM, Jae Hyun Yoo wrote:
> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
> name in the file.
> 
> Fixes: 7b46aa7c008d ("ARM: dts: aspeed: Add Nuvia DC-SCM BMC")
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/20220523175640.60155-1-quic_jaehyoo@quicinc.com
> Link: https://lore.kernel.org/r/20220624070511.4070659-1-joel@jms.id.au'
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> It's a backporting patch from upstream. Please apply it as it's needed for
> making a bitbake machine target in OpenBMC yocto build.
> 
> Thanks,
> Jae
> 
>   arch/arm/boot/dts/Makefile                                    | 2 +-
>   ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index dc225e354791..134cdcdec271 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1487,7 +1487,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-lenovo-hr630.dtb \
>   	aspeed-bmc-lenovo-hr855xg2.dtb \
>   	aspeed-bmc-microsoft-olympus.dtb \
> -	aspeed-bmc-nuvia-dc-scm.dtb \
>   	aspeed-bmc-opp-lanyang.dtb \
>   	aspeed-bmc-opp-mihawk.dtb \
>   	aspeed-bmc-opp-mowgli.dtb \
> @@ -1500,6 +1499,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-opp-witherspoon.dtb \
>   	aspeed-bmc-opp-zaius.dtb \
>   	aspeed-bmc-portwell-neptune.dtb \
> +	aspeed-bmc-qcom-dc-scm-v1.dtb \
>   	aspeed-bmc-quanta-q71l.dtb \
>   	aspeed-bmc-quanta-s6q.dtb \
>   	aspeed-bmc-supermicro-x11spi.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> similarity index 97%
> rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> index f4a97cfb0f23..259ef3f54c5c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> @@ -6,8 +6,8 @@
>   #include "aspeed-g6.dtsi"
>   
>   / {
> -	model = "Nuvia DC-SCM BMC";
> -	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
> +	model = "Qualcomm DC-SCM V1 BMC";
> +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
>   
>   	aliases {
>   		serial4 = &uart5;
