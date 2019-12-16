Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FE123B73
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 01:19:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cwcL2VZSzDqLK
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 11:19:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cDvF2GpCzDqRL
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 08:29:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 12:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="205238953"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2019 12:43:55 -0800
Subject: Re: [PATCH v11 13/14] hwmon: Add PECI cputemp driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-14-jae.hyun.yoo@linux.intel.com>
 <28432b99-0c04-c123-0391-d502053a39ab@roeck-us.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b27d91f5-38f5-eddb-afff-b2c6e457bf19@linux.intel.com>
Date: Mon, 16 Dec 2019 12:43:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <28432b99-0c04-c123-0391-d502053a39ab@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Dec 2019 11:17:36 +1100
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
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Alan Cox <alan@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

On 12/12/2019 10:24 PM, Guenter Roeck wrote:
> On 12/11/19 11:46 AM, Jae Hyun Yoo wrote:
>> This commit adds PECI cputemp hwmon driver.
>>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Alan Cox <alan@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> Reviewed-by: James Feist <james.feist@linux.intel.com>
>> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> Changes since v10:
>> - Added Skylake Xeon D support.
>> - Added DTS temperature which is more thermal control friendlier than Die
>>    temperature.
>> - Fixed minor bugs and style issues.
>>
>>   drivers/hwmon/Kconfig        |  14 ++
>>   drivers/hwmon/Makefile       |   1 +
>>   drivers/hwmon/peci-cputemp.c | 448 +++++++++++++++++++++++++++++++++++
>>   drivers/hwmon/peci-hwmon.h   |  46 ++++
>>   4 files changed, 509 insertions(+)
>>   create mode 100644 drivers/hwmon/peci-cputemp.c
>>   create mode 100644 drivers/hwmon/peci-hwmon.h
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 23dfe848979a..b6604759579c 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1349,6 +1349,20 @@ config SENSORS_PCF8591
>>         These devices are hard to detect and rarely found on mainstream
>>         hardware. If unsure, say N.
>> +config SENSORS_PECI_CPUTEMP
>> +    tristate "PECI CPU temperature monitoring client"
>> +    depends on PECI
>> +    select MFD_INTEL_PECI_CLIENT
>> +    help
>> +      If you say yes here you get support for the generic Intel PECI
>> +      cputemp driver which provides Digital Thermal Sensor (DTS) thermal
>> +      readings of the CPU package and CPU cores that are accessible 
>> using
>> +      the PECI Client Command Suite via the processor PECI client.
>> +      Check <file:Documentation/hwmon/peci-cputemp.rst> for details.
>> +
>> +      This driver can also be built as a module. If so, the module
>> +      will be called peci-cputemp.
>> +
>>   source "drivers/hwmon/pmbus/Kconfig"
>>   config SENSORS_PWM_FAN
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 6db5db9cdc29..d6fea48697af 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -144,6 +144,7 @@ obj-$(CONFIG_SENSORS_NTC_THERMISTOR)    += 
>> ntc_thermistor.o
>>   obj-$(CONFIG_SENSORS_PC87360)    += pc87360.o
>>   obj-$(CONFIG_SENSORS_PC87427)    += pc87427.o
>>   obj-$(CONFIG_SENSORS_PCF8591)    += pcf8591.o
>> +obj-$(CONFIG_SENSORS_PECI_CPUTEMP)    += peci-cputemp.o
>>   obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>>   obj-$(CONFIG_SENSORS_PWM_FAN)    += pwm-fan.o
>>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)    += raspberrypi-hwmon.o
>> diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
>> new file mode 100644
>> index 000000000000..70ced9f9299f
>> --- /dev/null
>> +++ b/drivers/hwmon/peci-cputemp.c
>> @@ -0,0 +1,448 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2018-2019 Intel Corporation
>> +
>> +#include <linux/hwmon.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/mfd/intel-peci-client.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include "peci-hwmon.h"
>> +
>> +#define DEFAULT_CHANNEL_NUMS   5
>> +#define CORETEMP_CHANNEL_NUMS  CORE_NUMS_MAX
> 
> Why not just use CORE_NUMS_MAX ?

For better readability in below code to represent max core numbers
as core temp channel numbers. If you don't like it, I'll use
CORE_NUMS_MAX as it is for the core temp channel numbers.

>> +#define CPUTEMP_CHANNEL_NUMS   (DEFAULT_CHANNEL_NUMS + 
>> CORETEMP_CHANNEL_NUMS)
>> +
>> +struct temp_group {
>> +    struct peci_sensor_data die;
>> +    struct peci_sensor_data dts;
>> +    struct peci_sensor_data tcontrol;
>> +    struct peci_sensor_data tthrottle;
>> +    struct peci_sensor_data tjmax;
>> +    struct peci_sensor_data core[CORETEMP_CHANNEL_NUMS];
>> +};
>> +
>> +struct peci_cputemp {
>> +    struct peci_client_manager *mgr;
>> +    struct device *dev;
>> +    char name[PECI_NAME_SIZE];
>> +    const struct cpu_gen_info *gen_info;
>> +    struct temp_group temp;
>> +    u64 core_mask;
>> +    u32 temp_config[CPUTEMP_CHANNEL_NUMS + 1];
>> +    uint config_idx;
>> +    struct hwmon_channel_info temp_info;
>> +    const struct hwmon_channel_info *info[2];
>> +    struct hwmon_chip_info chip;
>> +};
>> +
>> +enum cputemp_channels {
>> +    channel_die,
>> +    channel_dts,
>> +    channel_tcontrol,
>> +    channel_tthrottle,
>> +    channel_tjmax,
>> +    channel_core,
>> +};
>> +
>> +static const u32 config_table[DEFAULT_CHANNEL_NUMS + 1] = {
>> +    /* Die temperature */
>> +    HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
>> +    HWMON_T_CRIT_HYST,
>> +
>> +    /* DTS margin */
>> +    HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
>> +    HWMON_T_CRIT_HYST,
>> +
>> +    /* Tcontrol temperature */
>> +    HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
>> +
>> +    /* Tthrottle temperature */
>> +    HWMON_T_LABEL | HWMON_T_INPUT,
>> +
>> +    /* Tjmax temperature */
>> +    HWMON_T_LABEL | HWMON_T_INPUT,
>> +
>> +    /* Core temperature - for all core channels */
>> +    HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
>> +    HWMON_T_CRIT_HYST,
>> +};
>> +
>> +static const char *cputemp_label[CPUTEMP_CHANNEL_NUMS] = {
>> +    "Die",
>> +    "DTS",
>> +    "Tcontrol",
>> +    "Tthrottle",
>> +    "Tjmax",
>> +    "Core 0", "Core 1", "Core 2", "Core 3",
>> +    "Core 4", "Core 5", "Core 6", "Core 7",
>> +    "Core 8", "Core 9", "Core 10", "Core 11",
>> +    "Core 12", "Core 13", "Core 14", "Core 15",
>> +    "Core 16", "Core 17", "Core 18", "Core 19",
>> +    "Core 20", "Core 21", "Core 22", "Core 23",
>> +    "Core 24", "Core 25", "Core 26", "Core 27",
>> +};
>> +
> 
> What happens if CPUTEMP_CHANNEL_NUMS is increased in the future,
> and some of this array includes NULL pointers because this file
> doesn't track CORE_NUMS_MAX ?

Okay. It's reasonable concern. I'll fix it to make this driver generate
the core temp label strings dynamically based on detected CPU generation
information.

>> +static s32 ten_dot_six_to_millidegree(s32 val)
>> +{
>> +    return ((val ^ 0x8000) - 0x8000) * 1000 / 64;
> 
> Normally I suggest to use DIV_ROUND_CLOSEST in situations like this
> to improve rounding, but ultimately that is your call.

This is for conversion of 16-bit signed 10.6
(10 bits signed decimal, 6 bits fractional) format to 32-bits signed
integer in millidegree units. It's right as it is.

>> +}
>> +
>> +static int get_temp_targets(struct peci_cputemp *priv)
>> +{
>> +    s32 tthrottle_offset;
>> +    s32 tcontrol_margin;
>> +    u8  pkg_cfg[4];
>> +    int ret;
>> +
>> +    /*
>> +     * Just use only the tcontrol marker to determine if target 
>> values need
>> +     * update.
>> +     */
>> +    if (!peci_sensor_need_update(&priv->temp.tcontrol))
>> +        return 0;
>> +
>> +    ret = peci_client_read_package_config(priv->mgr,
>> +                          PECI_MBX_INDEX_TEMP_TARGET, 0,
>> +                          pkg_cfg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    priv->temp.tjmax.value = pkg_cfg[2] * 1000;
>> +
>> +    tcontrol_margin = pkg_cfg[1];
>> +    tcontrol_margin = ((tcontrol_margin ^ 0x80) - 0x80) * 1000;
>> +    priv->temp.tcontrol.value = priv->temp.tjmax.value - 
>> tcontrol_margin;
>> +
>> +    tthrottle_offset = (pkg_cfg[3] & 0x2f) * 1000;
>> +    priv->temp.tthrottle.value = priv->temp.tjmax.value - 
>> tthrottle_offset;
>> +
>> +    peci_sensor_mark_updated(&priv->temp.tcontrol);
>> +
>> +    return 0;
>> +}
>> +
>> +static int get_die_temp(struct peci_cputemp *priv)
>> +{
>> +    struct peci_get_temp_msg msg;
>> +    int ret;
>> +
>> +    if (!peci_sensor_need_update(&priv->temp.die))
>> +        return 0;
>> +
>> +    msg.addr = priv->mgr->client->addr;
>> +
>> +    ret = peci_command(priv->mgr->client->adapter, PECI_CMD_GET_TEMP, 
>> &msg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Note that the tjmax should be available before calling it */
>> +    priv->temp.die.value = priv->temp.tjmax.value +
>> +                   (msg.temp_raw * 1000 / 64);
>> +
>> +    peci_sensor_mark_updated(&priv->temp.die);
>> +
>> +    return 0;
>> +}
>> +
>> +static int get_dts(struct peci_cputemp *priv)
>> +{
>> +    s32 dts_margin;
>> +    u8  pkg_cfg[4];
>> +    int ret;
>> +
>> +    if (!peci_sensor_need_update(&priv->temp.dts))
>> +        return 0;
>> +
>> +    ret = peci_client_read_package_config(priv->mgr,
>> +                          PECI_MBX_INDEX_DTS_MARGIN, 0,
>> +                          pkg_cfg);
>> +
>> +    if (ret)
>> +        return ret;
>> +
>> +    dts_margin = (pkg_cfg[1] << 8) | pkg_cfg[0];
>> +
>> +    /**
>> +     * Processors return a value of DTS reading in 10.6 format
>> +     * (10 bits signed decimal, 6 bits fractional).
>> +     * Error codes:
>> +     *   0x8000: General sensor error
>> +     *   0x8001: Reserved
>> +     *   0x8002: Underflow on reading value
>> +     *   0x8003-0x81ff: Reserved
>> +     */
>> +    if (dts_margin >= 0x8000 && dts_margin <= 0x81ff)
>> +        return -EIO;
>> +
>> +    dts_margin = ten_dot_six_to_millidegree(dts_margin);
>> +
>> +    /* Note that the tcontrol should be available before calling it */
>> +    priv->temp.dts.value = priv->temp.tcontrol.value - dts_margin;
>> +
>> +    peci_sensor_mark_updated(&priv->temp.dts);
>> +
>> +    return 0;
>> +}
>> +
>> +static int get_core_temp(struct peci_cputemp *priv, int core_index)
>> +{
>> +    s32 core_dts_margin;
>> +    u8  pkg_cfg[4];
>> +    int ret;
>> +
>> +    if (!peci_sensor_need_update(&priv->temp.core[core_index]))
>> +        return 0;
>> +
>> +    ret = peci_client_read_package_config(priv->mgr,
>> +                          PECI_MBX_INDEX_PER_CORE_DTS_TEMP,
>> +                          core_index, pkg_cfg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    core_dts_margin = le16_to_cpup((__le16 *)pkg_cfg);
>> +
> 
> Any special readon for using the helper function here but not
> above ?

Ah, I have to use le16_to_cpup for the above one too. Thanks!

Thanks a lot for your review!

-Jae

