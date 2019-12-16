Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72C123B77
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 01:21:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cwft5CXdzDqZ1
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 11:21:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Leh+onp1"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cDjL63kGzDqRL
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 08:21:26 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id x184so6322342pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=NIsiOPIXGNdPj2KeSYFK0YZfg6aOCR5rYXMYdDTxxjg=;
 b=Leh+onp1c6334yt/mm+fFaM9lLR5NyudDQon1Vm+d+zouiogxkNO9Udu6U0ilXLZAK
 oAEBpEhg7LfX7GSrYmjwQeNY5eQwcUngig+Lhl0UUzbWbzOOemFmxuDrug+XIUnvXu1e
 xhJVAjywS/FrI2507lqJNncqe9hBQghN74/i0aKa2/BHrQR7I6fFqy+J7V7+URNwG3wd
 R/TdzXt1WE/pk43Wn+8pcyReJYwAn8Ty/IC0sohoCX+VIvzwSjg6jHuj34Pg8ujZWe1y
 +BA1Bs8DG53nkgN/WZCTuaCrYFTa/tD0tGOSw4Mv/TYybb7Gty50NmOPk1HGUBcyxPz/
 gAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=NIsiOPIXGNdPj2KeSYFK0YZfg6aOCR5rYXMYdDTxxjg=;
 b=GJLihuaHjxAJO9NceVXdbW0fcURhfN/Xk/9clUoJ23oIaLwne0+PBYYqsBsEFtey7E
 Xt+4MdO7uq14Mx1yPoiRCyBLxBcA+eFwOxkMr0IdCoEzh/2Vm7TRUgQ7iHC5doxsYv5p
 A8oJiaqZ36AWkcDkAZHhjGyoAYLzs25QVjHp/24jK9LWfTdqmlxdvvKYIScGoxx7N1aZ
 m1eRCyZVF6csPj8oHwmGmknv3Q1Fyl9YwMNtqTjwWk9GOeEf8T4h6ZZdjeYmCQN3xAMS
 PSpP4pPu8Lbt97yqWY9khA9i1EgY5OiXZzNbO1USZj6uXb6J/MlFEI2Kt6fVHKxcj3CT
 BOeA==
X-Gm-Message-State: APjAAAV2k/tQ/ruH6miPVCDX59M1t+dAfwLLEK89IKpOuFN086zvm/gj
 uY2H6BwMMDIHHuT4wFjxKsc=
X-Google-Smtp-Source: APXvYqwMJME3LORIz+L/PbewupGbLPbnaMhEHCZv3ap7ixap1Q0Z1HQjfP2Tmx6HbqS5s8g/QX7bZA==
X-Received: by 2002:a63:904c:: with SMTP id a73mr21103525pge.335.1576531282840; 
 Mon, 16 Dec 2019 13:21:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w11sm23510386pfn.4.2019.12.16.13.21.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Dec 2019 13:21:21 -0800 (PST)
Date: Mon, 16 Dec 2019 13:21:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v11 14/14] hwmon: Add PECI dimmtemp driver
Message-ID: <20191216212120.GA12089@roeck-us.net>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-15-jae.hyun.yoo@linux.intel.com>
 <d75aaad9-ae07-feeb-966a-899ecfe9d4b3@roeck-us.net>
 <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 18 Dec 2019 11:17:37 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Randy Dunlap <rdunlap@infradead.org>, Tomer Maimon <tmaimon77@gmail.com>,
 devicetree@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Eric Sandeen <sandeen@redhat.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 David Kershner <david.kershner@unisys.com>, Wu Hao <hao.wu@intel.com>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>,
 Johan Hovold <johan@kernel.org>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Alan Cox <alan@linux.intel.com>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 01:04:31PM -0800, Jae Hyun Yoo wrote:
> Hi Guenter,
> 
> On 12/12/2019 10:32 PM, Guenter Roeck wrote:
> > On 12/11/19 11:46 AM, Jae Hyun Yoo wrote:
> > > This commit adds PECI dimmtemp hwmon driver.
> > > 
> > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > Cc: Jean Delvare <jdelvare@suse.com>
> > > Cc: Alan Cox <alan@linux.intel.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> > > Cc: Joel Stanley <joel@jms.id.au>
> > > Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
> > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > > Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> > > Reviewed-by: James Feist <james.feist@linux.intel.com>
> > > Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > > Changes since v10:
> > > - Added Skylake Xeon D support.
> > > - Added max and crit properties for temperature threshold checking.
> > > - Fixed minor bugs and style issues.
> > > 
> > >   drivers/hwmon/Kconfig         |  14 ++
> > >   drivers/hwmon/Makefile        |   1 +
> > >   drivers/hwmon/peci-dimmtemp.c | 393 ++++++++++++++++++++++++++++++++++
> > >   3 files changed, 408 insertions(+)
> > >   create mode 100644 drivers/hwmon/peci-dimmtemp.c
> > > 
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index b6604759579c..d3370fbab40c 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -1363,6 +1363,20 @@ config SENSORS_PECI_CPUTEMP
> > >         This driver can also be built as a module. If so, the module
> > >         will be called peci-cputemp.
> > > +config SENSORS_PECI_DIMMTEMP
> > > +    tristate "PECI DIMM temperature monitoring client"
> > > +    depends on PECI
> > > +    select MFD_INTEL_PECI_CLIENT
> > > +    help
> > > +      If you say yes here you get support for the generic Intel
> > > PECI hwmon
> > > +      driver which provides Digital Thermal Sensor (DTS) thermal
> > > readings of
> > > +      DIMM components that are accessible using the PECI Client Command
> > > +      Suite via the processor PECI client.
> > > +      Check <file:Documentation/hwmon/peci-dimmtemp.rst> for details.
> > > +
> > > +      This driver can also be built as a module. If so, the module
> > > +      will be called peci-dimmtemp.
> > > +
> > >   source "drivers/hwmon/pmbus/Kconfig"
> > >   config SENSORS_PWM_FAN
> > > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > > index d6fea48697af..4015c4b60bf4 100644
> > > --- a/drivers/hwmon/Makefile
> > > +++ b/drivers/hwmon/Makefile
> > > @@ -145,6 +145,7 @@ obj-$(CONFIG_SENSORS_PC87360)    += pc87360.o
> > >   obj-$(CONFIG_SENSORS_PC87427)    += pc87427.o
> > >   obj-$(CONFIG_SENSORS_PCF8591)    += pcf8591.o
> > >   obj-$(CONFIG_SENSORS_PECI_CPUTEMP)    += peci-cputemp.o
> > > +obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)    += peci-dimmtemp.o
> > >   obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
> > >   obj-$(CONFIG_SENSORS_PWM_FAN)    += pwm-fan.o
> > >   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)    += raspberrypi-hwmon.o
> > > diff --git a/drivers/hwmon/peci-dimmtemp.c
> > > b/drivers/hwmon/peci-dimmtemp.c
> > > new file mode 100644
> > > index 000000000000..974f453f9366
> > > --- /dev/null
> > > +++ b/drivers/hwmon/peci-dimmtemp.c
> > > @@ -0,0 +1,393 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2018-2019 Intel Corporation
> > > +
> > > +#include <linux/hwmon.h>
> > > +#include <linux/jiffies.h>
> > > +#include <linux/mfd/intel-peci-client.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/workqueue.h>
> > > +#include "peci-hwmon.h"
> > > +
> > > +#define DIMM_MASK_CHECK_DELAY_JIFFIES  msecs_to_jiffies(5000)
> > > +#define DIMM_MASK_CHECK_RETRY_MAX      60 /* 60 x 5 secs = 5 minutes */
> > > +
> > > +struct peci_dimmtemp {
> > > +    struct peci_client_manager *mgr;
> > > +    struct device *dev;
> > > +    char name[PECI_NAME_SIZE];
> > > +    const struct cpu_gen_info *gen_info;
> > > +    struct workqueue_struct *work_queue;
> > > +    struct delayed_work work_handler;
> > > +    struct peci_sensor_data temp[DIMM_NUMS_MAX];
> > > +    long temp_max[DIMM_NUMS_MAX];
> > > +    long temp_crit[DIMM_NUMS_MAX];
> > > +    u32 dimm_mask;
> > > +    int retry_count;
> > > +    u32 temp_config[DIMM_NUMS_MAX + 1];
> > > +    struct hwmon_channel_info temp_info;
> > > +    const struct hwmon_channel_info *info[2];
> > > +    struct hwmon_chip_info chip;
> > > +};
> > > +
> > > +static const char *dimmtemp_label[CHAN_RANK_MAX][DIMM_IDX_MAX] = {
> > > +    { "DIMM A1", "DIMM A2", "DIMM A3" },
> > > +    { "DIMM B1", "DIMM B2", "DIMM B3" },
> > > +    { "DIMM C1", "DIMM C2", "DIMM C3" },
> > > +    { "DIMM D1", "DIMM D2", "DIMM D3" },
> > > +    { "DIMM E1", "DIMM E2", "DIMM E3" },
> > > +    { "DIMM F1", "DIMM F2", "DIMM F3" },
> > > +    { "DIMM G1", "DIMM G2", "DIMM G3" },
> > > +    { "DIMM H1", "DIMM H2", "DIMM H3" },
> > > +};
> > > +
> > > +static inline int read_ddr_dimm_temp_config(struct peci_dimmtemp *priv,
> > > +                        int chan_rank,
> > > +                        u8 *cfg_data)
> > > +{
> > > +    return peci_client_read_package_config(priv->mgr,
> > > +                           PECI_MBX_INDEX_DDR_DIMM_TEMP,
> > > +                           chan_rank, cfg_data);
> > > +}
> > > +
> > > +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
> > > +{
> > > +    int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> > > +    int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> > > +    struct peci_rd_pci_cfg_local_msg rp_msg;
> > > +    u8  cfg_data[4];
> > > +    int ret;
> > > +
> > > +    if (!peci_sensor_need_update(&priv->temp[dimm_no]))
> > > +        return 0;
> > > +
> > > +    ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
> > > +
> > > +    switch (priv->gen_info->model) {
> > > +    case INTEL_FAM6_SKYLAKE_X:
> > > +        rp_msg.addr = priv->mgr->client->addr;
> > > +        rp_msg.bus = 2;
> > > +        /*
> > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > +         * Device 11, Function 2: IMC 0 channel 2 -> rank 2
> > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 3
> > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 4
> > > +         * Device 13, Function 2: IMC 1 channel 2 -> rank 5
> > > +         */
> > > +        rp_msg.device = 10 + chan_rank / 3 * 2 +
> > > +                 (chan_rank % 3 == 2 ? 1 : 0);
> > > +        rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
> > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > +        rp_msg.rx_len = 4;
> > > +
> > > +        ret = peci_command(priv->mgr->client->adapter,
> > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > +            ret = -EAGAIN;
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > +        break;
> > > +    case INTEL_FAM6_SKYLAKE_XD:
> > > +        rp_msg.addr = priv->mgr->client->addr;
> > > +        rp_msg.bus = 2;
> > > +        /*
> > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 2
> > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 3
> > > +         */
> > > +        rp_msg.device = 10 + chan_rank / 2 * 2;
> > > +        rp_msg.function = (chan_rank % 2) ? 6 : 2;
> > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > +        rp_msg.rx_len = 4;
> > > +
> > > +        ret = peci_command(priv->mgr->client->adapter,
> > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > +            ret = -EAGAIN;
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > +        break;
> > > +    case INTEL_FAM6_HASWELL_X:
> > > +    case INTEL_FAM6_BROADWELL_X:
> > > +        rp_msg.addr = priv->mgr->client->addr;
> > > +        rp_msg.bus = 1;
> > > +        /*
> > > +         * Device 20, Function 0: IMC 0 channel 0 -> rank 0
> > > +         * Device 20, Function 1: IMC 0 channel 1 -> rank 1
> > > +         * Device 21, Function 0: IMC 0 channel 2 -> rank 2
> > > +         * Device 21, Function 1: IMC 0 channel 3 -> rank 3
> > > +         * Device 23, Function 0: IMC 1 channel 0 -> rank 4
> > > +         * Device 23, Function 1: IMC 1 channel 1 -> rank 5
> > > +         * Device 24, Function 0: IMC 1 channel 2 -> rank 6
> > > +         * Device 24, Function 1: IMC 1 channel 3 -> rank 7
> > > +         */
> > > +        rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
> > > +        rp_msg.function = chan_rank % 2;
> > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > +        rp_msg.rx_len = 4;
> > > +
> > > +        ret = peci_command(priv->mgr->client->adapter,
> > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > +            ret = -EAGAIN;
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > +        break;
> > > +    default:
> > > +        return -EOPNOTSUPP;
> > 
> > It looks like the sensors are created even on unsupported platforms,
> > which would generate error messages whenever someone tries to read
> > the attributes.
> > 
> > There should be some code early on checking this, and the driver
> > should not even instantiate if the CPU model is not supported.
> 
> Actually, this 'default' case will not be happened because this driver
> will be registered only when the CPU model is supported. The CPU model
> checking code is in 'intel-peci-client.c' which is [11/14] of this
> patch set.
> 

That again assumes that both drivers will be modified in sync in the future.
We can not make that assumption.

> > > +    }
> > > +
> > > +    peci_sensor_mark_updated(&priv->temp[dimm_no]);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int dimmtemp_read_string(struct device *dev,
> > > +                enum hwmon_sensor_types type,
> > > +                u32 attr, int channel, const char **str)
> > > +{
> > > +    struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> > > +    u32 dimm_idx_max = priv->gen_info->dimm_idx_max;
> > > +    int chan_rank, dimm_idx;
> > > +
> > > +    if (attr != hwmon_temp_label)
> > > +        return -EOPNOTSUPP;
> > > +
> > > +    chan_rank = channel / dimm_idx_max;
> > > +    dimm_idx = channel % dimm_idx_max;
> > > +    *str = dimmtemp_label[chan_rank][dimm_idx];
> > 
> > Similar to the other patch, I am concerned that this can end up setting
> > *str
> > to NULL at some point in the future.
> 
> Okay. I'll make dynamic label string table generation code for it as
> well.
> 
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int dimmtemp_read(struct device *dev, enum
> > > hwmon_sensor_types type,
> > > +             u32 attr, int channel, long *val)
> > > +{
> > > +    struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> > > +    int ret;
> > > +
> > > +    ret = get_dimm_temp(priv, channel);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    switch (attr) {
> > > +    case hwmon_temp_input:
> > > +        *val = priv->temp[channel].value;
> > > +        break;
> > > +    case hwmon_temp_max:
> > > +        *val = priv->temp_max[channel];
> > > +        break;
> > > +    case hwmon_temp_crit:
> > > +        *val = priv->temp_crit[channel];
> > > +        break;
> > > +    default:
> > > +        ret = -EOPNOTSUPP;
> > > +        break;
> > > +    }
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static umode_t dimmtemp_is_visible(const void *data,
> > > +                   enum hwmon_sensor_types type,
> > > +                   u32 attr, int channel)
> > > +{
> > > +    const struct peci_dimmtemp *priv = data;
> > > +
> > > +    if (priv->temp_config[channel] & BIT(attr) &&
> > > +        priv->dimm_mask & BIT(channel))
> > > +        return 0444;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static const struct hwmon_ops dimmtemp_ops = {
> > > +    .is_visible = dimmtemp_is_visible,
> > > +    .read_string = dimmtemp_read_string,
> > > +    .read = dimmtemp_read,
> > > +};
> > > +
> > > +static int check_populated_dimms(struct peci_dimmtemp *priv)
> > > +{
> > > +    u32 chan_rank_max = priv->gen_info->chan_rank_max;
> > > +    u32 dimm_idx_max = priv->gen_info->dimm_idx_max;
> > > +    int chan_rank, dimm_idx;
> > > +    u8  cfg_data[4];
> > > +
> > > +    for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
> > > +        int ret;
> > > +
> > > +        ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
> > > +        if (ret) {
> > > +            priv->dimm_mask = 0;
> > > +            return ret;
> > > +        }
> > > +
> > > +        for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
> > > +            if (cfg_data[dimm_idx])
> > > +                priv->dimm_mask |= BIT(chan_rank *
> > > +                               dimm_idx_max +
> > > +                               dimm_idx);
> > > +    }
> > > +
> > > +    if (!priv->dimm_mask)
> > > +        return -EAGAIN;
> > > +
> > > +    dev_dbg(priv->dev, "Scanned populated DIMMs: 0x%x\n",
> > > priv->dimm_mask);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int create_dimm_temp_info(struct peci_dimmtemp *priv)
> > > +{
> > > +    int ret, i, config_idx, channels;
> > > +    struct device *hwmon_dev;
> > > +
> > > +    ret = check_populated_dimms(priv);
> > > +    if (ret) {
> > > +        if (ret == -EAGAIN) {
> > > +            if (priv->retry_count < DIMM_MASK_CHECK_RETRY_MAX) {
> > > +                queue_delayed_work(priv->work_queue,
> > > +                           &priv->work_handler,
> > > +                         DIMM_MASK_CHECK_DELAY_JIFFIES);
> > > +                priv->retry_count++;
> > > +                dev_dbg(priv->dev,
> > > +                    "Deferred DIMM temp info creation\n");
> > > +            } else {
> > > +                dev_err(priv->dev,
> > > +                    "Timeout DIMM temp info creation\n");
> > > +                ret = -ETIMEDOUT;
> > > +            }
> > > +        }
> > > +
> > > +        return ret;
> > > +    }
> > > +
> > > +    channels = priv->gen_info->chan_rank_max *
> > > +           priv->gen_info->dimm_idx_max;
> > > +    for (i = 0, config_idx = 0; i < channels; i++)
> > > +        if (priv->dimm_mask & BIT(i))
> > > +            while (i >= config_idx)
> > > +                priv->temp_config[config_idx++] =
> > > +                    HWMON_T_LABEL | HWMON_T_INPUT |
> > > +                    HWMON_T_MAX | HWMON_T_CRIT;
> > > +
> > > +    priv->chip.ops = &dimmtemp_ops;
> > > +    priv->chip.info = priv->info;
> > > +
> > > +    priv->info[0] = &priv->temp_info;
> > > +
> > > +    priv->temp_info.type = hwmon_temp;
> > > +    priv->temp_info.config = priv->temp_config;
> > > +
> > > +    hwmon_dev = devm_hwmon_device_register_with_info(priv->dev,
> > > +                             priv->name,
> > > +                             priv,
> > > +                             &priv->chip,
> > > +                             NULL);
> > > +    ret = PTR_ERR_OR_ZERO(hwmon_dev);
> > > +    if (!ret)
> > > +        dev_dbg(priv->dev, "%s: sensor '%s'\n",
> > > +            dev_name(hwmon_dev), priv->name);
> > > +
> > 
> > Any chance to make this consistent with the other driver ?
> 
> Will change this to:
> 
> if (IS_ERR(hwmon_dev)) {
> 	dev_err(&priv->dev, "Failed to register hwmon device\n");
> 	return PTR_ERR(hwmon_dev);
> }
> 
> > > +    return ret;
> > > +}
> > > +
> > > +static void create_dimm_temp_info_delayed(struct work_struct *work)
> > > +{
> > > +    struct delayed_work *dwork = to_delayed_work(work);
> > > +    struct peci_dimmtemp *priv = container_of(dwork, struct
> > > peci_dimmtemp,
> > > +                          work_handler);
> > > +    int ret;
> > > +
> > > +    ret = create_dimm_temp_info(priv);
> > > +    if (ret && ret != -EAGAIN)
> > > +        dev_dbg(priv->dev, "Failed to create DIMM temp info\n");
> > > +}
> > > +
> > > +static int peci_dimmtemp_probe(struct platform_device *pdev)
> > > +{
> > > +    struct peci_client_manager *mgr = dev_get_drvdata(pdev->dev.parent);
> > > +    struct device *dev = &pdev->dev;
> > > +    struct peci_dimmtemp *priv;
> > > +    int ret;
> > > +
> > > +    if ((mgr->client->adapter->cmd_mask &
> > > +        (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG))) !=
> > > +        (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG)))
> > > +        return -ENODEV;
> > > +
> > > +    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +    if (!priv)
> > > +        return -ENOMEM;
> > > +
> > > +    dev_set_drvdata(dev, priv);
> > > +    priv->mgr = mgr;
> > > +    priv->dev = dev;
> > > +    priv->gen_info = mgr->gen_info;
> > > +
> > > +    snprintf(priv->name, PECI_NAME_SIZE, "peci_dimmtemp.cpu%d",
> > > +         priv->mgr->client->addr - PECI_BASE_ADDR);
> > > +
> > > +    priv->work_queue = alloc_ordered_workqueue(priv->name, 0);
> > > +    if (!priv->work_queue)
> > > +        return -ENOMEM;
> > > +
> > > +    INIT_DELAYED_WORK(&priv->work_handler,
> > > create_dimm_temp_info_delayed);
> > > +
> > > +    ret = create_dimm_temp_info(priv);
> > > +    if (ret && ret != -EAGAIN) {
> > > +        dev_err(dev, "Failed to create DIMM temp info\n");
> > 
> > Does this generate error messages if there are no DIMMS ?
> 
> Yes, this error message will be printed out once if it meets a timeout
> in DIMM scanning when there is no DIMM.
> 

Is that indeed an error, or are there situations where no DIMMs are
detected and that is a perfectly valid situation ? An error message
is only acceptable if this is indeed an error in all situations.

Guenter
