Return-Path: <openbmc+bounces-722-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65ABC09E8
	for <lists+openbmc@lfdr.de>; Tue, 07 Oct 2025 10:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgq3h5bV8z3000;
	Tue,  7 Oct 2025 19:26:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759825584;
	cv=none; b=j2TzfG3e89s7VbIacaaT+b10l9xc8R5BJLMun/8O/n+0o5DDny4iUm4zc0k9N/NGi5AI1NjOER2yP2lZlewlieGzrL3Wolxt8tXO3TUvI1HJg/WQHmklX/ZOmKlDfg3nbPXMM41+4ZpQhI0vK7pLCaG09+98HSp+ImMmO8vX7qa1uGb1jrxQtzm10cIcPDOJxzKRQSFF0UgJz8i/wHMqkn3SCD72XhMF019GmMx4D+oxebNn0LotlrUQ8d3jgmL+HvtYyA6MMmlGZwsywHKKg+z78ud85JlC/5eDd3YCW1o9DoVtJzxjbU4K0y6vBnwC345qnM7iNdN8C543IXNp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759825584; c=relaxed/relaxed;
	bh=oXncpE77WU0hF9XbQyojnipiRXw6V/hJeBTIUagkE10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3DmiqUmJJ9slJm02qGXOWWj4b3vclsMH09mXJws9vrSPU5tWY+D/wNLvOqZAHU8oHUGMWE5JgZNYBSGyQAkWtp8B17wTtnu9ePClWqizPIRpvvBbKvB+xTFl2M2G8qE2wPJiY7mtVvt080M1Y8ZCc4Zms86kNB8lStza8hXgbf9wE1hSE15ShmL8sh9Ojuzmq2c8FKzeFHolhg23PofcTbjUloi7YCF0ctpugOrpgh6tYm+NOamZ6yhOCO9zNhKh65yJK8uUgpuRrlmov6/o2TbyYl+vmuG127Oaqg6dQpGorofg6bJofaZB6Bc/8Ivv4NkGydOuyFsIjq3MbE6RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgq3g0tG1z2ywC
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 19:26:23 +1100 (AEDT)
Received: from [141.14.14.72] (v072.vpnx.molgen.mpg.de [141.14.14.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 17BB76028F374;
	Tue, 07 Oct 2025 10:26:10 +0200 (CEST)
Message-ID: <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
Date: Tue, 7 Oct 2025 10:26:10 +0200
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
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-3-fr0st61te@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251006215321.5036-3-fr0st61te@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Ivan,


Thank you for your patch.

Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
> Extend the functionality of hwmon (peci/dimmtemp) for Emerald Rapids
> platform.
> 
> The patch has been tested on a 5S system with 16 DIMMs installed.

What is 5S? 5 sockets? (Probably not.)

> Verified read of DIMM temperature thresholds & temperature.

Also paste the output?

> Using Sapphire's callbacks about getting thresholds because it's same
> platform/socket.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> ---
>   drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index fbe82d9852e0..a281476c7a31 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -32,6 +32,8 @@
>   #define DIMM_IDX_MAX_ON_ICXD	2
>   #define CHAN_RANK_MAX_ON_SPR	8
>   #define DIMM_IDX_MAX_ON_SPR	2
> +#define CHAN_RANK_MAX_ON_EMR	8
> +#define DIMM_IDX_MAX_ON_EMR	2
>   
>   #define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
>   #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
> @@ -571,6 +573,12 @@ read_thresholds_spr(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
>   	return 0;
>   }
>   
> +static int read_thresholds_emr(struct peci_dimmtemp *priv, int dimm_order,
> +			       int chan_rank, u32 *data)
> +{
> +	return read_thresholds_spr(priv, dimm_order, chan_rank, data);
> +}
> +
>   static const struct dimm_info dimm_hsx = {
>   	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
>   	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
> @@ -620,6 +628,13 @@ static const struct dimm_info dimm_spr = {
>   	.read_thresholds = &read_thresholds_spr,
>   };
>   
> +static const struct dimm_info dimm_emr = {
> +	.chan_rank_max  = CHAN_RANK_MAX_ON_EMR,
> +	.dimm_idx_max  = DIMM_IDX_MAX_ON_EMR,
> +	.min_peci_revision = 0x40,
> +	.read_thresholds = &read_thresholds_emr,
> +};
> +
>   static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>   	{
>   		.name = "peci_cpu.dimmtemp.hsx",
> @@ -649,6 +664,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>   		.name = "peci_cpu.dimmtemp.spr",
>   		.driver_data = (kernel_ulong_t)&dimm_spr,
>   	},
> +	{
> +		.name = "peci_cpu.dimmtemp.emr",
> +		.driver_data = (kernel_ulong_t)&dimm_emr,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

