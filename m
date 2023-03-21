Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773536C2E1F
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 10:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgmq51jpWz3cf6
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 20:42:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgmpg1ymYz3bh5
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 20:42:02 +1100 (AEDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2AC7D61CC40F9;
	Tue, 21 Mar 2023 10:41:57 +0100 (CET)
Message-ID: <f2fe16cf-3838-df89-958f-c39d1bae81a1@molgen.mpg.de>
Date: Tue, 21 Mar 2023 10:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Content-Language: en-US
To: Iwona Winiarska <iwona.winiarska@intel.com>
References: <20230321090410.866766-1-iwona.winiarska@intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230321090410.866766-1-iwona.winiarska@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Iwona,


Am 21.03.23 um 10:04 schrieb Iwona Winiarska:
> For Skylake, DTS temperature of the CPU is reported in S10.6 format
> instead of S8.8.
> 
> Reported-by: Paul Fertser <fercerpav@gmail.com>
> Link: https://lore.kernel.org/lkml/ZBhHS7v+98NK56is@home.paul.comp/
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>   drivers/hwmon/peci/cputemp.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 30850a479f61..87d56f0fc888 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -537,6 +537,12 @@ static const struct cpu_info cpu_hsx = {
>   	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
>   };
>   
> +static const struct cpu_info cpu_skx = {
> +	.reg		= &resolved_cores_reg_hsx,

This is not aligned. Why not only use one space before the equal sign?

> +	.min_peci_revision = 0x33,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>   static const struct cpu_info cpu_icx = {
>   	.reg		= &resolved_cores_reg_icx,
>   	.min_peci_revision = 0x40,
> @@ -558,7 +564,7 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   	},
>   	{
>   		.name = "peci_cpu.cputemp.skx",
> -		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +		.driver_data = (kernel_ulong_t)&cpu_skx,
>   	},
>   	{
>   		.name = "peci_cpu.cputemp.icx",


Kind regards,

Paul
