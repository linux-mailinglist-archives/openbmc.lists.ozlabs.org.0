Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F8B50B064
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 08:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl4684SmYz2yb6
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 16:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hgRc1qbp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=hgRc1qbp; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl45l3svjz2yHp
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 16:20:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18744B82A89;
 Fri, 22 Apr 2022 06:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309E7C385A0;
 Fri, 22 Apr 2022 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650608420;
 bh=UkX75BGCyuOB6rEboSSssW8QbDcr3wh9/Lr/10Fgdj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hgRc1qbpYlD6lLac6bl1xs3QS7ZdBNsn9wO9AngxbMJubajdBi2Igs5GbfMFXBVDm
 ExDkQBqLSG+X0NshsF16c8VSej2IXEpXrF7ULoc1PsifRaIgAjygHtba8izEkuVP+Z
 h8Ne8319Jq+aphaQn0gX4DnwjMjF+E5kakc+nhLM=
Date: Fri, 22 Apr 2022 08:20:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YmJJIb1DAIq5arCw@kroah.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422024653.2199489-4-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 09:46:47AM +0700, Quan Nguyen wrote:
> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v8:
>   + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
>   + Avoid uninitialized variable use               [kernel test robot]
>   + Switch to use sysfs_emit()                                  [Greg]
>   + Make sysfs to return single value                           [Greg]
>   + Change errors_* sysfs to error_*                            [Quan]
>   + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>   overflow status of each type of HW errors                     [Quan]
>   + Add some minor refactor                                     [Quan]
> 
> Changes in v7:
>   + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
>   + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
>   + Validate number of errors before read                       [Quan]
>   + Fix wrong return type of *_show() function     [kernel test robot]
>   + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
>   + Use pointer instead of stack memory                         [Quan]
> 
> Changes in v6:
>   + First introduced in v6 [Quan]
> 
>  drivers/misc/Kconfig        |  12 +
>  drivers/misc/Makefile       |   1 +
>  drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/misc/smpro-errmon.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 41d2bb0ae23a..9fbe6797c440 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -176,6 +176,18 @@ config SGI_XP
>  	  this feature will allow for direct communication between SSIs
>  	  based on a network adapter and DMA messaging.
>  
> +config SMPRO_ERRMON
> +	tristate "Ampere Computing SMPro error monitor driver"
> +	depends on MFD_SMPRO || COMPILE_TEST
> +	help
> +	  Say Y here to get support for the SMpro error monitor function
> +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
> +	  loading, the driver creates sysfs files which can be use to gather
> +	  multiple HW error data reported via read and write system calls.
> +
> +	  To compile this driver as a module, say M here. The driver will be
> +	  called smpro-errmon.
> +
>  config CS5535_MFGPT
>  	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>  	depends on MFD_CS5535
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 70e800e9127f..483308a6e113 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
>  obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
>  obj-$(CONFIG_SGI_XP)		+= sgi-xp/
>  obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
> +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
>  obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
>  obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
>  obj-$(CONFIG_HP_ILO)		+= hpilo.o
> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
> new file mode 100644
> index 000000000000..df7d8fc4ff3f
> --- /dev/null
> +++ b/drivers/misc/smpro-errmon.c
> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0+

Are you sure you mean "or any later version"?  I have to ask.

> +static struct smpro_int_error_hdr list_smpro_int_error_hdr[2] = {
> +	{
> +	 ERR_SMPRO_TYPE,
> +	 ERR_SMPRO_INFO_LO, ERR_SMPRO_INFO_HI,
> +	 ERR_SMPRO_DATA_LO, ERR_SMPRO_DATA_HI,
> +	 WARN_SMPRO_INFO_LO, WARN_SMPRO_INFO_HI
> +	},
> +	{
> +	 ERR_PMPRO_TYPE,
> +	 ERR_PMPRO_INFO_LO, ERR_PMPRO_INFO_HI,
> +	 ERR_PMPRO_DATA_LO, ERR_PMPRO_DATA_HI,
> +	 WARN_PMPRO_INFO_LO, WARN_PMPRO_INFO_HI
> +	},

Odd indentation, checkpatch did not complain?

> +static ssize_t smpro_event_data_read(struct device *dev,
> +				     struct device_attribute *da, char *buf,
> +				     int channel)
> +{
> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
> +	s32 event_data;
> +	int ret;
> +
> +	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
> +	if (ret)
> +		goto done;

Just return the error here.

> +
> +	ret = sysfs_emit(buf, "%02x%04x\n", channel, event_data);

sysfs rules are one value per file.  You know this.

> +	/* Clear event after read */
> +	if (event_data != 0)

Why would it be 0?  Isn't 0 a valid value?


> +		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
> +done:
> +	return ret;
> +}
> +
> +static ssize_t smpro_overflow_data_read(struct device *dev, struct device_attribute *da,
> +					char *buf, int channel)
> +{
> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
> +	struct smpro_error_hdr *err_info;
> +	s32 err_count;
> +	int ret;
> +
> +	err_info = &smpro_error_table[channel];
> +
> +	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
> +	if (ret)
> +		return ret;
> +
> +	/* Bit 8 indicates the overflow status */
> +	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
> +}
> +
> +static ssize_t smpro_error_data_read(struct device *dev, struct device_attribute *da,
> +				     char *buf, int channel)
> +{
> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
> +	unsigned char err_data[MAX_READ_BLOCK_LENGTH];
> +	struct smpro_error_hdr *err_info;
> +	s32 err_count, err_length;
> +	int count = 0;
> +	int ret;
> +
> +	err_info = &smpro_error_table[channel];
> +
> +	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
> +	/* Error count is the low byte */
> +	err_count &= 0xff;
> +	if (ret || !err_count || err_count > err_info->max_err_cnt)
> +		goto done;

Just return the error.

> +
> +	ret = regmap_read(errmon->regmap, err_info->err_len, &err_length);
> +	if (ret || err_length <= 0)
> +		goto done;

return the error.

Wait, you could return 0 here, are you sure about that?

> +
> +	if (err_length > MAX_READ_BLOCK_LENGTH)
> +		err_length = MAX_READ_BLOCK_LENGTH;
> +
> +	memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
> +	ret = regmap_noinc_read(errmon->regmap, err_info->err_data, err_data, err_length);
> +	if (ret < 0)
> +		goto done;

return the error, no need for a goto in this function.

> +
> +	/*
> +	 * The output of Core/Memory/PCIe/Others UE/CE errors follows below format:
> +	 * <Error Type><Error SubType><Instance><Error Status>\
> +	 * <Error Address><Error Misc 0><Error Misc 1><Error Misc2><Error Misc 3>
> +	 * Where:
> +	 *  + Error Type: The hardwares cause the errors. (1 byte)
> +	 *  + SubType: Sub type of error in the specified hardware error. (1 byte)
> +	 *  + Instance: Combination of the socket, channel,
> +	 *    slot cause the error. (2 bytes)
> +	 *  + Error Status: Encode of error status. (4 bytes)
> +	 *  + Error Address: The address in device causes the errors. (8 bytes)
> +	 *  + Error Misc 0/1/2/3: Addition info about the errors. (8 bytes for each)
> +	 * Reference Altra SOC BMC Interface specification.
> +	 */
> +	count = sysfs_emit(buf, "%02x%02x%04x%08x%016llx%016llx%016llx%016llx%016llx\n",
> +			   err_data[0], err_data[1], *(u16 *)&err_data[2],
> +			   *(u32 *)&err_data[4], *(u64 *)&err_data[8],
> +			   *(u64 *)&err_data[16], *(u64 *)&err_data[24],
> +			   *(u64 *)&err_data[32], *(u64 *)&err_data[40]);
> +
> +	/* go to next error */
> +	ret = regmap_write(errmon->regmap, err_info->err_count, 0x100);
> +done:
> +	return ret ? ret : count;
> +}
> +
> +/*
> + * Output format:
> + * <errType><image><dir><Location><errorCode><data>
> + * Where:
> + *   + errType: SCP Error Type (3 bits)
> + *      1: Warning
> + *      2: Error
> + *      4: Error with data
> + *   + image: SCP Image Code (8 bits)
> + *   + dir: Direction (1 bit)
> + *      0: Enter
> + *      1: Exit
> + *   + location: SCP Module Location Code (8 bits)
> + *   + errorCode: SCP Error Code (16 bits)
> + *   + data : Extensive data (32 bits)
> + *      All bits are 0 when errType is warning or error.
> + */
> +static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
> +				       char *buf, int channel)
> +{
> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
> +	struct smpro_int_error_hdr *err_info;
> +	unsigned int data_lo = 0, data_hi = 0;
> +	unsigned int ret_hi, ret_lo;
> +	unsigned int err_type;
> +	unsigned int value;
> +	int count = 0;
> +	int ret;
> +
> +	/* read error status */
> +	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &value);
> +	if (ret)
> +		goto done;

Same mess here, just return the error.

> +
> +	if (!((channel == RAS_SMPRO_ERRS && (value & BIT(0))) ||
> +	      (channel == RAS_PMPRO_ERRS && (value & BIT(1)))))
> +		goto done;

No error?  Are you sure?

> +
> +	err_info = &list_smpro_int_error_hdr[channel];
> +	ret = regmap_read(errmon->regmap, err_info->err_type, &err_type);
> +	if (ret)
> +		goto done;
> +
> +	ret = regmap_read(errmon->regmap, err_info->err_info_low, &ret_lo);
> +	if (ret)
> +		goto done;
> +
> +	ret = regmap_read(errmon->regmap, err_info->err_info_high, &ret_hi);
> +	if (ret)
> +		goto done;
> +
> +	if (err_type & BIT(2)) {
> +		/* Error with data type */
> +		ret = regmap_read(errmon->regmap, err_info->err_data_low, &data_lo);
> +		if (ret)
> +			goto done;
> +
> +		ret = regmap_read(errmon->regmap, err_info->err_data_high, &data_hi);
> +		if (ret)
> +			goto done;
> +
> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> +				   4, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> +		/* clear the read errors */
> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(2));
> +
> +	} else if (err_type & BIT(1)) {
> +		/* Error type */
> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> +				   2, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> +		/* clear the read errors */
> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(1));
> +
> +	} else if (err_type & BIT(0)) {
> +		/* Warning type */
> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> +				   1, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> +		/* clear the read errors */
> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(0));
> +	}
> +done:
> +	return ret ? ret : count;
> +}
> +
> +#define ERROR_OVERFLOW_RO(_error, _index) \
> +	static ssize_t overflow_##_error##_show(struct device *dev,            \
> +						struct device_attribute *da,   \
> +						char *buf)                     \
> +	{                                                                      \
> +		return smpro_overflow_data_read(dev, da, buf, _index);         \
> +	}                                                                      \
> +	static DEVICE_ATTR_RO(overflow_##_error)
> +
> +ERROR_OVERFLOW_RO(core_ce, CORE_CE_ERRS);
> +ERROR_OVERFLOW_RO(core_ue, CORE_UE_ERRS);
> +ERROR_OVERFLOW_RO(mem_ce, MEM_CE_ERRS);
> +ERROR_OVERFLOW_RO(mem_ue, MEM_UE_ERRS);
> +ERROR_OVERFLOW_RO(pcie_ce, PCIE_CE_ERRS);
> +ERROR_OVERFLOW_RO(pcie_ue, PCIE_UE_ERRS);
> +ERROR_OVERFLOW_RO(other_ce, OTHER_CE_ERRS);
> +ERROR_OVERFLOW_RO(other_ue, OTHER_UE_ERRS);
> +
> +#define ERROR_RO(_error, _index) \
> +	static ssize_t error_##_error##_show(struct device *dev,            \
> +					     struct device_attribute *da,   \
> +					     char *buf)                     \
> +	{                                                                   \
> +		return smpro_error_data_read(dev, da, buf, _index);         \
> +	}                                                                   \
> +	static DEVICE_ATTR_RO(error_##_error)
> +
> +ERROR_RO(core_ce, CORE_CE_ERRS);
> +ERROR_RO(core_ue, CORE_UE_ERRS);
> +ERROR_RO(mem_ce, MEM_CE_ERRS);
> +ERROR_RO(mem_ue, MEM_UE_ERRS);
> +ERROR_RO(pcie_ce, PCIE_CE_ERRS);
> +ERROR_RO(pcie_ue, PCIE_UE_ERRS);
> +ERROR_RO(other_ce, OTHER_CE_ERRS);
> +ERROR_RO(other_ue, OTHER_UE_ERRS);
> +
> +static ssize_t error_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERRS);
> +}
> +static DEVICE_ATTR_RO(error_smpro);
> +
> +static ssize_t error_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERRS);
> +}
> +static DEVICE_ATTR_RO(error_pmpro);
> +
> +#define EVENT_RO(_event, _index) \
> +	static ssize_t event_##_event##_show(struct device *dev,            \
> +					     struct device_attribute *da,   \
> +					     char *buf)                     \
> +	{                                                                   \
> +		return smpro_event_data_read(dev, da, buf, _index);         \
> +	}                                                                   \
> +	static DEVICE_ATTR_RO(event_##_event)
> +
> +EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENTS);
> +EVENT_RO(vrd_hot, VRD_HOT_EVENTS);
> +EVENT_RO(dimm_hot, DIMM_HOT_EVENTS);
> +
> +static struct attribute *smpro_errmon_attrs[] = {
> +	&dev_attr_overflow_core_ce.attr,
> +	&dev_attr_overflow_core_ue.attr,
> +	&dev_attr_overflow_mem_ce.attr,
> +	&dev_attr_overflow_mem_ue.attr,
> +	&dev_attr_overflow_pcie_ce.attr,
> +	&dev_attr_overflow_pcie_ue.attr,
> +	&dev_attr_overflow_other_ce.attr,
> +	&dev_attr_overflow_other_ue.attr,
> +	&dev_attr_error_core_ce.attr,
> +	&dev_attr_error_core_ue.attr,
> +	&dev_attr_error_mem_ce.attr,
> +	&dev_attr_error_mem_ue.attr,
> +	&dev_attr_error_pcie_ce.attr,
> +	&dev_attr_error_pcie_ue.attr,
> +	&dev_attr_error_other_ce.attr,
> +	&dev_attr_error_other_ue.attr,
> +	&dev_attr_error_smpro.attr,
> +	&dev_attr_error_pmpro.attr,
> +	&dev_attr_event_vrd_warn_fault.attr,
> +	&dev_attr_event_vrd_hot.attr,
> +	&dev_attr_event_dimm_hot.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group smpro_errmon_attr_group = {
> +	.attrs = smpro_errmon_attrs
> +};

ATTRIBUTE_GROUPS()?


> +
> +static int smpro_errmon_probe(struct platform_device *pdev)
> +{
> +	struct smpro_errmon *errmon;
> +	int ret;
> +
> +	errmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_errmon), GFP_KERNEL);
> +	if (!errmon)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, errmon);
> +
> +	errmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!errmon->regmap)
> +		return -ENODEV;
> +
> +	ret = sysfs_create_group(&pdev->dev.kobj, &smpro_errmon_attr_group);

You just raced with userspace and lost :(

Always use the default groups of the platform driver for this.  That way
you do not have to do anything special and your files will be created
properly.

> +	if (ret)
> +		dev_err(&pdev->dev, "SMPro errmon sysfs registration failed\n");
> +
> +	return 0;
> +}
> +
> +static int smpro_errmon_remove(struct platform_device *pdev)
> +{
> +	sysfs_remove_group(&pdev->dev.kobj, &smpro_errmon_attr_group);
> +	pr_info("SMPro errmon sysfs entries removed");

Drivers are quiet when all is working properly.

If you set the pointer properly as asked above, you do not have to
remove the group on your own.

Huge hint, if you ever call sysfs_* from a driver, something is probably
wrong.

Same goes for the other drivers in this series, please fix them all up
this way.

thanks,

greg k-h
