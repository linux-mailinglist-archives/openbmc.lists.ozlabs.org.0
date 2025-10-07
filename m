Return-Path: <openbmc+bounces-723-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF48BC0A21
	for <lists+openbmc@lfdr.de>; Tue, 07 Oct 2025 10:32:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgqBP2W9jz30Qk;
	Tue,  7 Oct 2025 19:32:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759825933;
	cv=none; b=TEQZuAWw65lR+5JZW4otzrNmedETdhwBYMKycXlJYeDL6R3HnjOXYhUdCA2NsBGXoyUqLg5gcwNvCnz/2CLo0VVtvkIzJfaD7Bo1ioj6vwRfqSylOcIzQBu3/0Y4ifkYNrPSWyi8ih/633Stxt2JpgfQu9wzAWgqrZMqFJuHb5VWpC2dtxcmQ5/k9zqejHJLJBvN+MLIDYsYs745azlC1aSqXM7cEOhRbHMMJYAsJwA6bYgBaYYcQV0u7BqThKbaO2RHr9f749oizWgY7Wcxis+2iO4joSz8vFj6q5QnM/y68pLRXJY77xfiosIqie2fxXdMR02hQBlCvJFAalYuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759825933; c=relaxed/relaxed;
	bh=KRkVknuePC1H2FAEOrYArnzEj1iIGT1jYYonHEFaS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCl3gAaE6LsJevi9AbCtAI4zaaPj+RaIljquoCtFMPkpHYra/2EllW/xeETB4LtwlUDnO9mOw2kU1qUxTEDakA42lHt1idRVh3VaGFLfOfVVVJc6UARibndBZEfbnhPVntNktAk8OdZDXadAr1WWbu29FN28hVeJZ6qaDtJhbStX5j87rpBoHh6QeQnjB77SnPgQe7AsrhfwrcFJoDp0iwsDO+Pv2+yvEbBAd2btap+CKq3MHMiwLjnFLCuDW0YwaaB9PbdI5gHqHwpQ/36CvwkNnrXjpKAP9MXWR1TRECVKm43pi5iG0l4J5L10MKC84Dm94xQpECvHSmsWa7XB9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgqBN1wgFz2ywC
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 19:32:12 +1100 (AEDT)
Received: from [141.14.14.72] (v072.vpnx.molgen.mpg.de [141.14.14.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3ACBF6028F374;
	Tue, 07 Oct 2025 10:32:00 +0200 (CEST)
Message-ID: <277a2c83-de30-41a2-bfe4-d48efeceb6a1@molgen.mpg.de>
Date: Tue, 7 Oct 2025 10:31:59 +0200
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
Subject: Re: [PATCH 3/3] hwmon: (peci/cputemp) add Intel Emerald Rapids
 support
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-4-fr0st61te@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251006215321.5036-4-fr0st61te@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Ivan,


Thank you for your patch.

Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
> Add support to read DTS for reading Intel Emerald Rapids platform.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> ---
>   drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index c7112dbf008b..b350c9a76894 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -364,6 +364,7 @@ static int init_core_mask(struct peci_cputemp *priv)
>   	case INTEL_ICELAKE_X:
>   	case INTEL_ICELAKE_D:
>   	case INTEL_SAPPHIRERAPIDS_X:
> +	case INTEL_EMERALDRAPIDS_X:
>   		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
>   					     reg->func, reg->offset + 4, &data);
>   		if (ret)
> @@ -539,6 +540,13 @@ static struct resolved_cores_reg resolved_cores_reg_spr = {
>   	.offset = 0x80,
>   };
>   
> +static struct resolved_cores_reg resolved_cores_reg_emr = {
> +	.bus = 31,
> +	.dev = 30,
> +	.func = 6,
> +	.offset = 0x80,
> +};
> +
>   static const struct cpu_info cpu_hsx = {
>   	.reg		= &resolved_cores_reg_hsx,
>   	.min_peci_revision = 0x33,
> @@ -563,6 +571,12 @@ static const struct cpu_info cpu_spr = {
>   	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>   };
>   
> +static const struct cpu_info cpu_emr = {
> +	.reg    = &resolved_cores_reg_emr,

Only use one space before the =.

> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>   static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   	{
>   		.name = "peci_cpu.cputemp.hsx",
> @@ -592,6 +606,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   		.name = "peci_cpu.cputemp.spr",
>   		.driver_data = (kernel_ulong_t)&cpu_spr,
>   	},
> +	{
> +		.name = "peci_cpu.cputemp.emr",
> +		.driver_data = (kernel_ulong_t)&cpu_emr,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

