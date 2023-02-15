Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DC697768
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 08:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGqZV3BGNz3chl
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 18:33:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGqZ42fT1z3c6y
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 18:33:29 +1100 (AEDT)
Received: from [192.168.0.2] (unknown [95.90.237.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3CFF461CC457B;
	Wed, 15 Feb 2023 08:33:24 +0100 (CET)
Message-ID: <866fe1b3-8044-6581-9711-452550f91198@molgen.mpg.de>
Date: Wed, 15 Feb 2023 08:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
To: Quan Nguyen <quan@os.amperecomputing.com>
References: <20230214064509.3622044-1-quan@os.amperecomputing.com>
 <20230214064509.3622044-3-quan@os.amperecomputing.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230214064509.3622044-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Quan,


Thank you for your patch.

Am 14.02.23 um 07:45 schrieb Quan Nguyen:
> Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
> to BMC when DIMM training failed.

Where you able to verify that it works? Out of curiosity, how?

> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
>   drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> index d4e3f308c451..c35f1d45e656 100644
> --- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> @@ -265,6 +265,16 @@ Description:
>   		For more details, see section `5.7 GPI Status Registers and 5.9 Memory Error Register Definitions,
>   		Altra Family Soc BMC Interface Specification`.
>   
> +What:		/sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
> +KernelVersion:	6.1

Should it be 6.2, as it probably won’t make it into 6.1?

> +Contact:	Quan Nguyen <quan@os.amperecomputing.com>
> +Description:
> +		(RO) The sysfs returns the 2-byte DIMM failure syndrome data for slot
> +		0-15 if it failed to initialized.

to initialize

> +
> +		For more details, see section `5.11 Boot Stage Register Definitions,
> +		Altra Family Soc BMC Interface Specification`.
> +
>   What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
>   KernelVersion:	6.1
>   Contact:	Quan Nguyen <quan@os.amperecomputing.com>
> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
> index 1635e881aefb..3e8570cbb740 100644
> --- a/drivers/misc/smpro-errmon.c
> +++ b/drivers/misc/smpro-errmon.c
> @@ -47,6 +47,12 @@
>   #define WARN_PMPRO_INFO_LO	0xAC
>   #define WARN_PMPRO_INFO_HI	0xAD
>   
> +/* Boot Stage Register */
> +#define BOOTSTAGE		0xB0
> +#define DIMM_SYNDROME_SEL	0xB4
> +#define DIMM_SYNDROME_ERR	0xB5
> +#define DIMM_SYNDROME_STAGE	4
> +
>   /* PCIE Error Registers */
>   #define PCIE_CE_ERR_CNT		0xC0
>   #define PCIE_CE_ERR_LEN		0xC1
> @@ -468,6 +474,61 @@ EVENT_RO(vrd_hot, VRD_HOT_EVENT);
>   EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
>   EVENT_RO(dimm_2x_refresh, DIMM_2X_REFRESH_EVENT);
>   
> +static ssize_t smpro_dimm_syndrome_read(struct device *dev, struct device_attribute *da,
> +					char *buf, int slot)

Could `slot` be passed as `unsigned int`?

> +{
> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
> +	s32 data;
> +	int ret;
> +
> +	ret = regmap_read(errmon->regmap, BOOTSTAGE, &data);

The function signature is:

     int regmap_read(struct regmap *map, unsigned int reg, unsigned int 
*val)

So why not use unsigned int as data type for `data`?

> +	if (ret)
> +		return ret;
> +
> +	/* check for valid stage */
> +	data = (data >> 8) & 0xff;
> +	if (data != DIMM_SYNDROME_STAGE)
> +		return ret;

Isn’t now success returned? Should a debug message be printed?

> +
> +	/* Write the slot ID to retrieve Error Syndrome */
> +	ret = regmap_write(errmon->regmap, DIMM_SYNDROME_SEL, slot);
> +	if (ret)
> +		return ret;
> +
> +	/* Read the Syndrome error */
> +	ret = regmap_read(errmon->regmap, DIMM_SYNDROME_ERR, &data);
> +	if (ret || !data)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%04x\n", data);
> +}
> +
> +#define EVENT_DIMM_SYNDROME(_slot) \
> +	static ssize_t event_dimm##_slot##_syndrome_show(struct device *dev,          \
> +							 struct device_attribute *da, \
> +							 char *buf)                   \
> +	{                                                                             \
> +		return smpro_dimm_syndrome_read(dev, da, buf, _slot);                 \
> +	}                                                                             \
> +	static DEVICE_ATTR_RO(event_dimm##_slot##_syndrome)
> +
> +EVENT_DIMM_SYNDROME(0);
> +EVENT_DIMM_SYNDROME(1);
> +EVENT_DIMM_SYNDROME(2);
> +EVENT_DIMM_SYNDROME(3);
> +EVENT_DIMM_SYNDROME(4);
> +EVENT_DIMM_SYNDROME(5);
> +EVENT_DIMM_SYNDROME(6);
> +EVENT_DIMM_SYNDROME(7);
> +EVENT_DIMM_SYNDROME(8);
> +EVENT_DIMM_SYNDROME(9);
> +EVENT_DIMM_SYNDROME(10);
> +EVENT_DIMM_SYNDROME(11);
> +EVENT_DIMM_SYNDROME(12);
> +EVENT_DIMM_SYNDROME(13);
> +EVENT_DIMM_SYNDROME(14);
> +EVENT_DIMM_SYNDROME(15);
> +
>   static struct attribute *smpro_errmon_attrs[] = {
>   	&dev_attr_overflow_core_ce.attr,
>   	&dev_attr_overflow_core_ue.attr,
> @@ -493,6 +554,22 @@ static struct attribute *smpro_errmon_attrs[] = {
>   	&dev_attr_event_vrd_hot.attr,
>   	&dev_attr_event_dimm_hot.attr,
>   	&dev_attr_event_dimm_2x_refresh.attr,
> +	&dev_attr_event_dimm0_syndrome.attr,
> +	&dev_attr_event_dimm1_syndrome.attr,
> +	&dev_attr_event_dimm2_syndrome.attr,
> +	&dev_attr_event_dimm3_syndrome.attr,
> +	&dev_attr_event_dimm4_syndrome.attr,
> +	&dev_attr_event_dimm5_syndrome.attr,
> +	&dev_attr_event_dimm6_syndrome.attr,
> +	&dev_attr_event_dimm7_syndrome.attr,
> +	&dev_attr_event_dimm8_syndrome.attr,
> +	&dev_attr_event_dimm9_syndrome.attr,
> +	&dev_attr_event_dimm10_syndrome.attr,
> +	&dev_attr_event_dimm11_syndrome.attr,
> +	&dev_attr_event_dimm12_syndrome.attr,
> +	&dev_attr_event_dimm13_syndrome.attr,
> +	&dev_attr_event_dimm14_syndrome.attr,
> +	&dev_attr_event_dimm15_syndrome.attr,
>   	NULL
>   };


Kind regards,

Paul
