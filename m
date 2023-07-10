Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5B74DCA9
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 19:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eL2E+07U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0BFC612Bz3byT
	for <lists+openbmc@lfdr.de>; Tue, 11 Jul 2023 03:43:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eL2E+07U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0BDY67w6z3bjK
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 03:43:08 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55bc22375b9so2358839a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2023 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689010984; x=1691602984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fDAy0vVA3a+9sJex/LHHOb6x4vi+5awTJxhRIpJhfgM=;
        b=eL2E+07U74IZq0xnbdVPQzdBSLu5MmteAAwMxGVinIep0YmICTUy7mBKdKJaZLyOXt
         TfebaFExZB2PrYzQ0V6Xj4ve9C+ISw1uBEIc4/+GHXL44T8KJkRS3ISzbrHRAnELokR9
         qUyrYV17+FMh83W7pYi0Sj9joDc00IWrr8mOdBb/EVECmFrDEA5CZjfwCdC1XSfWOc/h
         FcYyttwvfZtRJl2SWUiRUailD9qR1QTmEWBhjisD0NlmvtisMq4+AvD7UtabR4rKs4Zy
         UduUAqz0I6DNPSfJ/A9sznLx/vRrYxeU4SKjRfSlLJC+SX2t2uI+5uvfdi87tFEDv5XO
         oUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689010984; x=1691602984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDAy0vVA3a+9sJex/LHHOb6x4vi+5awTJxhRIpJhfgM=;
        b=aymyRXYnZYJzxQAX/U5KY/9NpupwoDFw5Qt6suYi3fyOKbgS64ZjZfNbasoao/EvPZ
         HvcFoaeNCgN41kVCw2N6Q1tmn+iY/HXKE1SMEBmyKc2Nu9Q+biHkbKfsFolfK7xUtiwV
         cG3iLqO9ITsaDlLTgkvfs533TNZFfMfonTw3dOd5gsi/tL9qFJwOr2yXMDP/fOaFbkkS
         Qw/RLQDOCBZxICldwfz3Xd6WyPh0kVwv+hb7VEFWC+be6h+wam9fddN6xvzMESLc7++v
         CJYoLVcZiKLsJCs2qzKqZbZMs/TE8sQWRllKjf4gni5ES9VUCxZl5EAAknYNSVDXLwtB
         HewA==
X-Gm-Message-State: ABy/qLZAnr7o1SAxkCEyV39QdyOEek71CEGHjGataqjgaZUPpbXOTGez
	9oUxU5bgvUre+NQjF9+UIrg=
X-Google-Smtp-Source: APBJJlF9Ambbltxhd1I/Ksl+P1TBG1QGVr5d3WoRX+eIRyqPl4cLyavb0mOyJJbQHNJfXVOaHmzF9g==
X-Received: by 2002:a17:903:428d:b0:1b2:46ab:a9e1 with SMTP id ju13-20020a170903428d00b001b246aba9e1mr9835540plb.28.1689010983634;
        Mon, 10 Jul 2023 10:43:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902e84400b001b80971609esm172820plg.152.2023.07.10.10.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 10:43:02 -0700 (PDT)
Message-ID: <1f4c500b-e706-a090-516d-992b68f44f0d@roeck-us.net>
Date: Mon, 10 Jul 2023 10:43:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Content-Language: en-US
To: Naresh Solanki <naresh.solanki@9elements.com>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>
References: <20230710162724.827833-1-Naresh.Solanki@9elements.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230710162724.827833-1-Naresh.Solanki@9elements.com>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/10/23 09:27, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Add support to read DTS for reading Intel Sapphire Rapids platform.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

This patch touches code outside the hwmon subsystem, so I won't be able
to apply it without Ack from a maintainer.

Guenter

> ---
>   drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
>   drivers/peci/cpu.c           |  5 +++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index e5b65a382772..a812c15948d9 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -363,6 +363,7 @@ static int init_core_mask(struct peci_cputemp *priv)
>   	switch (peci_dev->info.model) {
>   	case INTEL_FAM6_ICELAKE_X:
>   	case INTEL_FAM6_ICELAKE_D:
> +	case INTEL_FAM6_SAPPHIRERAPIDS_X:
>   		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
>   					     reg->func, reg->offset + 4, &data);
>   		if (ret)
> @@ -531,6 +532,13 @@ static struct resolved_cores_reg resolved_cores_reg_icx = {
>   	.offset = 0xd0,
>   };
>   
> +static struct resolved_cores_reg resolved_cores_reg_spr = {
> +	.bus = 31,
> +	.dev = 30,
> +	.func = 6,
> +	.offset = 0x80,
> +};
> +
>   static const struct cpu_info cpu_hsx = {
>   	.reg		= &resolved_cores_reg_hsx,
>   	.min_peci_revision = 0x33,
> @@ -549,6 +557,12 @@ static const struct cpu_info cpu_icx = {
>   	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>   };
>   
> +static const struct cpu_info cpu_spr = {
> +	.reg		= &resolved_cores_reg_spr,
> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>   static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   	{
>   		.name = "peci_cpu.cputemp.hsx",
> @@ -574,6 +588,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   		.name = "peci_cpu.cputemp.icxd",
>   		.driver_data = (kernel_ulong_t)&cpu_icx,
>   	},
> +	{
> +		.name = "peci_cpu.cputemp.spr",
> +		.driver_data = (kernel_ulong_t)&cpu_spr,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
> diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> index de4a7b3e5966..3668a908d259 100644
> --- a/drivers/peci/cpu.c
> +++ b/drivers/peci/cpu.c
> @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
>   		.model	= INTEL_FAM6_ICELAKE_X,
>   		.data	= "icx",
>   	},
> +	{ /* Sapphire Rapids Xeon */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
> +		.data	= "spr",
> +	},
>   	{ /* Icelake Xeon D */
>   		.family	= 6,
>   		.model	= INTEL_FAM6_ICELAKE_D,
> 
> base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b

