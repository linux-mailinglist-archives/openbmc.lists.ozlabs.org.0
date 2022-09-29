Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 363535EF2C1
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:53:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdTG16xybz3c73
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:53:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TP+0EWB2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TP+0EWB2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdTFb437gz2xnb
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:53:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A351EB82344;
	Thu, 29 Sep 2022 09:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93E8C433C1;
	Thu, 29 Sep 2022 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664445197;
	bh=R1NvDgZRtrXVFA3NssmHZXzvdQTGba15W5h1CTKdip8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TP+0EWB2thnu0XkLsi+Vrcx3gYJ+laRcE+nOsq+vSDXdSt10J+Ed4OXlHxt1bHW3E
	 fJSGWFBf77MH+Fbc9m3oFVbv3xyeXnkPNBNJknUWWzoWIBcb8ae7nK9dW8bUdmljKU
	 55+dmoe5i3yEcRyeNEdbZc2cccUDs0aiiNRe31GM=
Date: Thu, 29 Sep 2022 11:53:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YzVrBZOatELcfDc5@kroah.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-4-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 04:43:15PM +0700, Quan Nguyen wrote:
> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v9:
>   + Fix ugly static struct define                               [Greg]
>   + Remove unused defines and update documentation              [Quan]
>   + Add minor refactor code                                     [Quan]
>   + Fix messy goto                                              [Greg]
>   + Update SPDX licence                                         [Greg]
>   + Use ATTRIBUTE_GROUPS()                                      [Greg]
>   + Use dev_groups instead of sysfs_create_group() to avoid
>   racing issue with user space                                  [Greg]
>   + Refactor code to fix unnecessary initialization issue       [Quan]
>   + Refactor code to avoid clever encoding issue                [Quan]
>   + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
>   + Add minor code refactor                                     [Quan]
> 
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
>  drivers/misc/smpro-errmon.c | 529 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 542 insertions(+)
>  create mode 100644 drivers/misc/smpro-errmon.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 358ad56f6524..b9ceee949dab 100644
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
> index ac9b3e757ba1..bbe24d4511a3 100644
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
> index 000000000000..d1431d419aa4
> --- /dev/null
> +++ b/drivers/misc/smpro-errmon.c
> @@ -0,0 +1,529 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ampere Computing SoC's SMpro Error Monitoring Driver
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
> + *
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +/* GPI RAS Error Registers */
> +#define GPI_RAS_ERR		0x7E
> +
> +/* Core and L2C Error Registers */
> +#define CORE_CE_ERR_CNT		0x80
> +#define CORE_CE_ERR_LEN		0x81
> +#define CORE_CE_ERR_DATA	0x82
> +#define CORE_UE_ERR_CNT		0x83
> +#define CORE_UE_ERR_LEN		0x84
> +#define CORE_UE_ERR_DATA	0x85
> +
> +/* Memory Error Registers */
> +#define MEM_CE_ERR_CNT		0x90
> +#define MEM_CE_ERR_LEN		0x91
> +#define MEM_CE_ERR_DATA		0x92
> +#define MEM_UE_ERR_CNT		0x93
> +#define MEM_UE_ERR_LEN		0x94
> +#define MEM_UE_ERR_DATA		0x95
> +
> +/* RAS Error/Warning Registers */
> +#define ERR_SMPRO_TYPE		0xA0
> +#define ERR_PMPRO_TYPE		0xA1
> +#define ERR_SMPRO_INFO_LO	0xA2
> +#define ERR_SMPRO_INFO_HI	0xA3
> +#define ERR_SMPRO_DATA_LO	0xA4
> +#define ERR_SMPRO_DATA_HI	0xA5
> +#define WARN_SMPRO_INFO_LO	0xAA
> +#define WARN_SMPRO_INFO_HI	0xAB
> +#define ERR_PMPRO_INFO_LO	0xA6
> +#define ERR_PMPRO_INFO_HI	0xA7
> +#define ERR_PMPRO_DATA_LO	0xA8
> +#define ERR_PMPRO_DATA_HI	0xA9
> +#define WARN_PMPRO_INFO_LO	0xAC
> +#define WARN_PMPRO_INFO_HI	0xAD
> +
> +/* PCIE Error Registers */
> +#define PCIE_CE_ERR_CNT		0xC0
> +#define PCIE_CE_ERR_LEN		0xC1
> +#define PCIE_CE_ERR_DATA	0xC2
> +#define PCIE_UE_ERR_CNT		0xC3
> +#define PCIE_UE_ERR_LEN		0xC4
> +#define PCIE_UE_ERR_DATA	0xC5
> +
> +/* Other Error Registers */
> +#define OTHER_CE_ERR_CNT	0xD0
> +#define OTHER_CE_ERR_LEN	0xD1
> +#define OTHER_CE_ERR_DATA	0xD2
> +#define OTHER_UE_ERR_CNT	0xD8
> +#define OTHER_UE_ERR_LEN	0xD9
> +#define OTHER_UE_ERR_DATA	0xDA
> +
> +/* Event Data Registers */
> +#define VRD_WARN_FAULT_EVENT_DATA	0x78
> +#define VRD_HOT_EVENT_DATA		0x79
> +#define DIMM_HOT_EVENT_DATA		0x7A
> +
> +#define MAX_READ_BLOCK_LENGTH	48
> +
> +#define RAS_SMPRO_ERR		0
> +#define RAS_PMPRO_ERR		1
> +
> +enum RAS_48BYTES_ERR_TYPES {
> +	CORE_CE_ERR,
> +	CORE_UE_ERR,
> +	MEM_CE_ERR,
> +	MEM_UE_ERR,
> +	PCIE_CE_ERR,
> +	PCIE_UE_ERR,
> +	OTHER_CE_ERR,
> +	OTHER_UE_ERR,
> +	NUM_48BYTES_ERR_TYPE,
> +};
> +
> +struct smpro_error_hdr {
> +	u8 count;	/* Number of the RAS errors */
> +	u8 len;		/* Number of data bytes */
> +	u8 data;	/* Start of 48-byte data */
> +	u8 max_cnt;	/* Max num of errors */
> +};
> +
> +/*
> + * Included Address of registers to get Count, Length of data and Data
> + * of the 48 bytes error data
> + */
> +static struct smpro_error_hdr smpro_error_table[] = {
> +	[CORE_CE_ERR] = {
> +		.count = CORE_CE_ERR_CNT,
> +		.len = CORE_CE_ERR_LEN,
> +		.data = CORE_CE_ERR_DATA,
> +		.max_cnt = 32
> +	},
> +	[CORE_UE_ERR] = {
> +		.count = CORE_UE_ERR_CNT,
> +		.len = CORE_UE_ERR_LEN,
> +		.data = CORE_UE_ERR_DATA,
> +		.max_cnt = 32
> +	},
> +	[MEM_CE_ERR] = {
> +		.count = MEM_CE_ERR_CNT,
> +		.len = MEM_CE_ERR_LEN,
> +		.data = MEM_CE_ERR_DATA,
> +		.max_cnt = 16
> +	},
> +	[MEM_UE_ERR] = {
> +		.count = MEM_UE_ERR_CNT,
> +		.len = MEM_UE_ERR_LEN,
> +		.data = MEM_UE_ERR_DATA,
> +		.max_cnt = 16
> +	},
> +	[PCIE_CE_ERR] = {
> +		.count = PCIE_CE_ERR_CNT,
> +		.len = PCIE_CE_ERR_LEN,
> +		.data = PCIE_CE_ERR_DATA,
> +		.max_cnt = 96
> +	},
> +	[PCIE_UE_ERR] = {
> +		.count = PCIE_UE_ERR_CNT,
> +		.len = PCIE_UE_ERR_LEN,
> +		.data = PCIE_UE_ERR_DATA,
> +		.max_cnt = 96
> +	},
> +	[OTHER_CE_ERR] = {
> +		.count = OTHER_CE_ERR_CNT,
> +		.len = OTHER_CE_ERR_LEN,
> +		.data = OTHER_CE_ERR_DATA,
> +		.max_cnt = 8
> +	},
> +	[OTHER_UE_ERR] = {
> +		.count = OTHER_UE_ERR_CNT,
> +		.len = OTHER_UE_ERR_LEN,
> +		.data = OTHER_UE_ERR_DATA,
> +		.max_cnt = 8
> +	},
> +};
> +
> +/*
> + * List of SCP registers which are used to get
> + * one type of RAS Internal errors.
> + */
> +struct smpro_int_error_hdr {
> +	u8 type;
> +	u8 info_l;
> +	u8 info_h;
> +	u8 data_l;
> +	u8 data_h;
> +	u8 warn_l;
> +	u8 warn_h;
> +};
> +
> +static struct smpro_int_error_hdr list_smpro_int_error_hdr[] = {
> +	[RAS_SMPRO_ERR] = {
> +		.type = ERR_SMPRO_TYPE,
> +		.info_l = ERR_SMPRO_INFO_LO,
> +		.info_h = ERR_SMPRO_INFO_HI,
> +		.data_l = ERR_SMPRO_DATA_LO,
> +		.data_h = ERR_SMPRO_DATA_HI,
> +		.warn_l = WARN_SMPRO_INFO_LO,
> +		.warn_h = WARN_SMPRO_INFO_HI,
> +	},
> +	[RAS_PMPRO_ERR] = {
> +		.type = ERR_PMPRO_TYPE,
> +		.info_l = ERR_PMPRO_INFO_LO,
> +		.info_h = ERR_PMPRO_INFO_HI,
> +		.data_l = ERR_PMPRO_DATA_LO,
> +		.data_h = ERR_PMPRO_DATA_HI,
> +		.warn_l = WARN_PMPRO_INFO_LO,
> +		.warn_h = WARN_PMPRO_INFO_HI,
> +	},
> +};
> +
> +struct smpro_errmon {
> +	struct regmap *regmap;
> +};
> +
> +enum EVENT_TYPES {
> +	VRD_WARN_FAULT_EVENT,
> +	VRD_HOT_EVENT,
> +	DIMM_HOT_EVENT,
> +	NUM_EVENTS_TYPE,
> +};
> +
> +/* Included Address of event source and data registers */
> +static u8 smpro_event_table[NUM_EVENTS_TYPE] = {
> +	VRD_WARN_FAULT_EVENT_DATA,
> +	VRD_HOT_EVENT_DATA,
> +	DIMM_HOT_EVENT_DATA,
> +};
> +
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
> +		return ret;
> +	/* Clear event after read */
> +	if (event_data != 0)
> +		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
> +
> +	return sysfs_emit(buf, "%04x\n", event_data);
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
> +	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
> +	if (ret)
> +		return ret;
> +
> +	/* Bit 8 indicates the overflow status */
> +	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
> +}

Where is the Documentation/ABI/ entry for this field?

Please put that in the same commit so that it is easier to validate that
you really did document everything properly.

thanks,

greg k-h
