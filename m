Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FC3CEDDA
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 22:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTDDB42P6z30KF
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 06:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ipVGO4c4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ipVGO4c4; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTDCv1Lw9z2xZ3;
 Tue, 20 Jul 2021 06:36:59 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so19523214otl.3; 
 Mon, 19 Jul 2021 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZG5QTTbDUE4xpcECJviTidl2M8zGKRu7+yQIhUAxE0=;
 b=ipVGO4c4liPqEMay7hoj0UwxzhbsBPyLKAF89ouSZnKBB0PD1DTQxrG/RohTohqo3g
 QMB3soOnsExwThBV++plqG9FrC3fxsk55RqM101mt5XVyhsTTFFpQQn/wLdtLkhyBMG+
 sro9B68FzsmIpqha1L4om8Cl1EK3X7PfLrE/aMEaZB7SxUrAMLUHq0eooTswj9kawI+v
 EmVnK1Jp1XIfpkYNq1LFJaahLmD/Z9//f9hMZ5elywLtmjD3GrtfWp4zZbv86YNRTYUX
 esPKOKty0B+sjpO9og3ocFM2peuAa/KlOLUuAmYYIdRqaGr3de9nj82srw+GRpKPZ+Sa
 48BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZG5QTTbDUE4xpcECJviTidl2M8zGKRu7+yQIhUAxE0=;
 b=Ry4M7rOYnjQiFZOCzsmF2+rTlJgHj7zJmEHfdDZX/Z/aOhqD4PGWWsarALeuoxEh1G
 hfkKssAvvL9VWHnLCKuLD4oCr0/bC8GIgXN2Tx1xmIU9C0M0MvUBV8VdsjB5+kP5ouv1
 IKh06/LlXlEDbfBDg6LH5GqlpjmqDW6m6UxJtxSefmVsRe+WOYPBhyHksJbiq9jbpnEY
 8Z9+/GRSUj7nbQDm2awdeXq8SZsWNsKFdpWsnV8GVQUGMnwNgHsP1bC9GkBNWBDNeI4g
 xipZrwBdzQejX15zlGbwN9lqIVJKWZwUs/PJhjmTYmUz0bGCM4RYAIkONsOYct1HOFj/
 5nvw==
X-Gm-Message-State: AOAM532aKSCYdxkwEDDE6GQh12u00Crv9bHcZc4kcstFdBNVPOoe2sF4
 qD6nhr96eMxUGtNsh7/voEI=
X-Google-Smtp-Source: ABdhPJx/RqTfz2fkHBeIMZhhtif5abFutFlPhflj+Vm5+DywSKD6zjDbYm2Wbb/+jfEkdU8NwJ9DWw==
X-Received: by 2002:a05:6830:23a7:: with SMTP id
 m7mr1407802ots.17.1626727015480; 
 Mon, 19 Jul 2021 13:36:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c11sm3828659otm.37.2021.07.19.13.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 13:36:55 -0700 (PDT)
Subject: Re: [PATCH 12/14] hwmon: peci: Add dimmtemp driver
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-13-iwona.winiarska@intel.com>
 <20210715175602.GA3043224@roeck-us.net>
 <282c092ec55034bde13c23b90516c2d543f0400d.camel@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <25c9c595-de7f-5229-cec8-ab28e9e3ac49@roeck-us.net>
Date: Mon, 19 Jul 2021 13:36:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <282c092ec55034bde13c23b90516c2d543f0400d.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/19/21 1:31 PM, Winiarska, Iwona wrote:
> On Thu, 2021-07-15 at 10:56 -0700, Guenter Roeck wrote:
>> On Tue, Jul 13, 2021 at 12:04:45AM +0200, Iwona Winiarska wrote:
>>> Add peci-dimmtemp driver for Digital Thermal Sensor (DTS) thermal
>>> readings of DIMMs that are accessible via the processor PECI interface.
>>>
>>> The main use case for the driver (and PECI interface) is out-of-band
>>> management, where we're able to obtain the DTS readings from an external
>>> entity connected with PECI, e.g. BMC on server platforms.
>>>
>>> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> ---
>>>   drivers/hwmon/peci/Kconfig    |  13 +
>>>   drivers/hwmon/peci/Makefile   |   2 +
>>>   drivers/hwmon/peci/dimmtemp.c | 508 ++++++++++++++++++++++++++++++++++
>>>   3 files changed, 523 insertions(+)
>>>   create mode 100644 drivers/hwmon/peci/dimmtemp.c
>>>
>>> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
>>> index e10eed68d70a..f2d57efa508b 100644
>>> --- a/drivers/hwmon/peci/Kconfig
>>> +++ b/drivers/hwmon/peci/Kconfig
>>> @@ -14,5 +14,18 @@ config SENSORS_PECI_CPUTEMP
>>>            This driver can also be built as a module. If so, the module
>>>            will be called peci-cputemp.
>>>   
>>> +config SENSORS_PECI_DIMMTEMP
>>> +       tristate "PECI DIMM temperature monitoring client"
>>> +       depends on PECI
>>> +       select SENSORS_PECI
>>> +       select PECI_CPU
>>> +       help
>>> +         If you say yes here you get support for the generic Intel PECI hwmon
>>> +         driver which provides Digital Thermal Sensor (DTS) thermal readings
>>> of
>>> +         DIMM components that are accessible via the processor PECI
>>> interface.
>>> +
>>> +         This driver can also be built as a module. If so, the module
>>> +         will be called peci-dimmtemp.
>>> +
>>>   config SENSORS_PECI
>>>          tristate
>>> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
>>> index e8a0ada5ab1f..191cfa0227f3 100644
>>> --- a/drivers/hwmon/peci/Makefile
>>> +++ b/drivers/hwmon/peci/Makefile
>>> @@ -1,5 +1,7 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   
>>>   peci-cputemp-y := cputemp.o
>>> +peci-dimmtemp-y := dimmtemp.o
>>>   
>>>   obj-$(CONFIG_SENSORS_PECI_CPUTEMP)     += peci-cputemp.o
>>> +obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)    += peci-dimmtemp.o
>>> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
>>> new file mode 100644
>>> index 000000000000..2fcb8607137a
>>> --- /dev/null
>>> +++ b/drivers/hwmon/peci/dimmtemp.c
>>> @@ -0,0 +1,508 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +// Copyright (c) 2018-2021 Intel Corporation
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bitops.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/module.h>
>>> +#include <linux/peci.h>
>>> +#include <linux/peci-cpu.h>
>>> +#include <linux/units.h>
>>> +#include <linux/workqueue.h>
>>> +#include <linux/x86/intel-family.h>
>>> +
>>> +#include "common.h"
>>> +
>>> +#define DIMM_MASK_CHECK_DELAY_JIFFIES  msecs_to_jiffies(5000)
>>> +#define DIMM_MASK_CHECK_RETRY_MAX      60 /* 60 x 5 secs = 5 minutes */
>>> +
>>> +/* Max number of channel ranks and DIMM index per channel */
>>> +#define CHAN_RANK_MAX_ON_HSX   8
>>> +#define DIMM_IDX_MAX_ON_HSX    3
>>> +#define CHAN_RANK_MAX_ON_BDX   4
>>> +#define DIMM_IDX_MAX_ON_BDX    3
>>> +#define CHAN_RANK_MAX_ON_BDXD  2
>>> +#define DIMM_IDX_MAX_ON_BDXD   2
>>> +#define CHAN_RANK_MAX_ON_SKX   6
>>> +#define DIMM_IDX_MAX_ON_SKX    2
>>> +#define CHAN_RANK_MAX_ON_ICX   8
>>> +#define DIMM_IDX_MAX_ON_ICX    2
>>> +#define CHAN_RANK_MAX_ON_ICXD  4
>>> +#define DIMM_IDX_MAX_ON_ICXD   2
>>> +
>>> +#define CHAN_RANK_MAX          CHAN_RANK_MAX_ON_HSX
>>> +#define DIMM_IDX_MAX           DIMM_IDX_MAX_ON_HSX
>>> +#define DIMM_NUMS_MAX          (CHAN_RANK_MAX * DIMM_IDX_MAX)
>>> +
>>> +#define CPU_SEG_MASK           GENMASK(23, 16)
>>> +#define GET_CPU_SEG(x)         (((x) & CPU_SEG_MASK) >> 16)
>>> +#define CPU_BUS_MASK           GENMASK(7, 0)
>>> +#define GET_CPU_BUS(x)         ((x) & CPU_BUS_MASK)
>>> +
>>> +#define DIMM_TEMP_MAX          GENMASK(15, 8)
>>> +#define DIMM_TEMP_CRIT         GENMASK(23, 16)
>>> +#define GET_TEMP_MAX(x)                (((x) & DIMM_TEMP_MAX) >> 8)
>>> +#define GET_TEMP_CRIT(x)       (((x) & DIMM_TEMP_CRIT) >> 16)
>>> +
>>> +struct dimm_info {
>>> +       int chan_rank_max;
>>> +       int dimm_idx_max;
>>> +       u8 min_peci_revision;
>>> +};
>>> +
>>> +struct peci_dimmtemp {
>>> +       struct peci_device *peci_dev;
>>> +       struct device *dev;
>>> +       const char *name;
>>> +       const struct dimm_info *gen_info;
>>> +       struct delayed_work detect_work;
>>> +       struct peci_sensor_data temp[DIMM_NUMS_MAX];
>>> +       long temp_max[DIMM_NUMS_MAX];
>>> +       long temp_crit[DIMM_NUMS_MAX];
>>> +       int retry_count;
>>> +       char **dimmtemp_label;
>>> +       DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
>>> +};
>>> +
>>> +static u8 __dimm_temp(u32 reg, int dimm_order)
>>> +{
>>> +       return (reg >> (dimm_order * 8)) & 0xff;
>>> +}
>>> +
>>> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
>>> +{
>>> +       int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
>>> +       int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
>>> +       struct peci_device *peci_dev = priv->peci_dev;
>>> +       u8 cpu_seg, cpu_bus, dev, func;
>>> +       u64 offset;
>>> +       u32 data;
>>> +       u16 reg;
>>> +       int ret;
>>> +
>>> +       if (!peci_sensor_need_update(&priv->temp[dimm_no]))
>>> +               return 0;
>>> +
>>> +       ret = peci_pcs_read(peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank,
>>> &data);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>
>> Similar to the cpu driver, the lack of mutex protection needs to be explained.
>>
> 
> Sure, it will be consistent for the two drivers.
> 
>>> +       priv->temp[dimm_no].value = __dimm_temp(data, dimm_order) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +       switch (peci_dev->info.model) {
>>> +       case INTEL_FAM6_ICELAKE_X:
>>> +       case INTEL_FAM6_ICELAKE_D:
>>> +               ret = peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd4,
>>> &data);
>>> +               if (ret || !(data & BIT(31)))
>>> +                       break; /* Use default or previous value */
>>> +
>>> +               ret = peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd0,
>>> &data);
>>> +               if (ret)
>>> +                       break; /* Use default or previous value */
>>> +
>>> +               cpu_seg = GET_CPU_SEG(data);
>>> +               cpu_bus = GET_CPU_BUS(data);
>>> +
>>> +               /*
>>> +                * Device 26, Offset 224e0: IMC 0 channel 0 -> rank 0
>>> +                * Device 26, Offset 264e0: IMC 0 channel 1 -> rank 1
>>> +                * Device 27, Offset 224e0: IMC 1 channel 0 -> rank 2
>>> +                * Device 27, Offset 264e0: IMC 1 channel 1 -> rank 3
>>> +                * Device 28, Offset 224e0: IMC 2 channel 0 -> rank 4
>>> +                * Device 28, Offset 264e0: IMC 2 channel 1 -> rank 5
>>> +                * Device 29, Offset 224e0: IMC 3 channel 0 -> rank 6
>>> +                * Device 29, Offset 264e0: IMC 3 channel 1 -> rank 7
>>> +                */
>>> +               dev = 0x1a + chan_rank / 2;
>>> +               offset = 0x224e0 + dimm_order * 4;
>>> +               if (chan_rank % 2)
>>> +                       offset += 0x4000;
>>> +
>>> +               ret = peci_mmio_read(peci_dev, 0, cpu_seg, cpu_bus, dev, 0,
>>> offset, &data);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               priv->temp_max[dimm_no] = GET_TEMP_MAX(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +               priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +               break;
>>> +       case INTEL_FAM6_SKYLAKE_X:
>>> +               /*
>>> +                * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>> +                * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>> +                * Device 11, Function 2: IMC 0 channel 2 -> rank 2
>>> +                * Device 12, Function 2: IMC 1 channel 0 -> rank 3
>>> +                * Device 12, Function 6: IMC 1 channel 1 -> rank 4
>>> +                * Device 13, Function 2: IMC 1 channel 2 -> rank 5
>>> +                */
>>> +               dev = 10 + chan_rank / 3 * 2 + (chan_rank % 3 == 2 ? 1 : 0);
>>> +               func = chan_rank % 3 == 1 ? 6 : 2;
>>> +               reg = 0x120 + dimm_order * 4;
>>> +
>>> +               ret = peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               priv->temp_max[dimm_no] = GET_TEMP_MAX(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +               priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +               break;
>>> +       case INTEL_FAM6_BROADWELL_D:
>>> +               /*
>>> +                * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>> +                * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>> +                * Device 12, Function 2: IMC 1 channel 0 -> rank 2
>>> +                * Device 12, Function 6: IMC 1 channel 1 -> rank 3
>>> +                */
>>> +               dev = 10 + chan_rank / 2 * 2;
>>> +               func = (chan_rank % 2) ? 6 : 2;
>>> +               reg = 0x120 + dimm_order * 4;
>>> +
>>> +               ret = peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               priv->temp_max[dimm_no] = GET_TEMP_MAX(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +               priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +               break;
>>> +       case INTEL_FAM6_HASWELL_X:
>>> +       case INTEL_FAM6_BROADWELL_X:
>>> +               /*
>>> +                * Device 20, Function 0: IMC 0 channel 0 -> rank 0
>>> +                * Device 20, Function 1: IMC 0 channel 1 -> rank 1
>>> +                * Device 21, Function 0: IMC 0 channel 2 -> rank 2
>>> +                * Device 21, Function 1: IMC 0 channel 3 -> rank 3
>>> +                * Device 23, Function 0: IMC 1 channel 0 -> rank 4
>>> +                * Device 23, Function 1: IMC 1 channel 1 -> rank 5
>>> +                * Device 24, Function 0: IMC 1 channel 2 -> rank 6
>>> +                * Device 24, Function 1: IMC 1 channel 3 -> rank 7
>>> +                */
>>> +               dev = 20 + chan_rank / 2 + chan_rank / 4;
>>> +               func = chan_rank % 2;
>>> +               reg = 0x120 + dimm_order * 4;
>>> +
>>> +               ret = peci_pci_local_read(peci_dev, 1, dev, func, reg, &data);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               priv->temp_max[dimm_no] = GET_TEMP_MAX(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +               priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +               break;
>>> +       default:
>>> +               return -EOPNOTSUPP;
>>> +       }
>>> +
>>> +       peci_sensor_mark_updated(&priv->temp[dimm_no]);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int dimmtemp_read_string(struct device *dev,
>>> +                               enum hwmon_sensor_types type,
>>> +                               u32 attr, int channel, const char **str)
>>> +{
>>> +       struct peci_dimmtemp *priv = dev_get_drvdata(dev);
>>> +
>>> +       if (attr != hwmon_temp_label)
>>> +               return -EOPNOTSUPP;
>>> +
>>> +       *str = (const char *)priv->dimmtemp_label[channel];
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type,
>>> +                        u32 attr, int channel, long *val)
>>> +{
>>> +       struct peci_dimmtemp *priv = dev_get_drvdata(dev);
>>> +       int ret;
>>> +
>>> +       ret = get_dimm_temp(priv, channel);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       switch (attr) {
>>> +       case hwmon_temp_input:
>>> +               *val = priv->temp[channel].value;
>>> +               break;
>>> +       case hwmon_temp_max:
>>> +               *val = priv->temp_max[channel];
>>> +               break;
>>> +       case hwmon_temp_crit:
>>> +               *val = priv->temp_crit[channel];
>>> +               break;
>>> +       default:
>>> +               return -EOPNOTSUPP;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types
>>> type,
>>> +                                  u32 attr, int channel)
>>> +{
>>> +       const struct peci_dimmtemp *priv = data;
>>> +
>>> +       if (test_bit(channel, priv->dimm_mask))
>>> +               return 0444;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct hwmon_ops peci_dimmtemp_ops = {
>>> +       .is_visible = dimmtemp_is_visible,
>>> +       .read_string = dimmtemp_read_string,
>>> +       .read = dimmtemp_read,
>>> +};
>>> +
>>> +static int check_populated_dimms(struct peci_dimmtemp *priv)
>>> +{
>>> +       int chan_rank_max = priv->gen_info->chan_rank_max;
>>> +       int dimm_idx_max = priv->gen_info->dimm_idx_max;
>>> +       int chan_rank, dimm_idx, ret;
>>> +       u64 dimm_mask = 0;
>>> +       u32 pcs;
>>> +
>>> +       for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
>>> +               ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP,
>>> chan_rank, &pcs);
>>> +               if (ret) {
>>> +                       /*
>>> +                        * Overall, we expect either success or -EINVAL in
>>> +                        * order to determine whether DIMM is populated or
>>> not.
>>> +                        * For anything else - we fall back to defering the
>>> +                        * detection to be performed at a later point in time.
>>> +                        */
>>> +                       if (ret == -EINVAL)
>>> +                               continue;
>>> +                       else
>>
>> else after continue is unnecessary.
>>
> 
> Ok.
> 
>>> +                               return -EAGAIN;
>>> +               }
>>> +
>>> +               for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
>>> +                       if (__dimm_temp(pcs, dimm_idx))
>>> +                               dimm_mask |= BIT(chan_rank * dimm_idx_max +
>>> dimm_idx);
>>> +       }
>>> +       /*
>>> +        * It's possible that memory training is not done yet. In this case we
>>> +        * defer the detection to be performed at a later point in time.
>>> +        */
>>> +       if (!dimm_mask)
>>> +               return -EAGAIN;
>>> +
>>> +       dev_dbg(priv->dev, "Scanned populated DIMMs: %#llx\n", dimm_mask);
>>> +
>>> +       bitmap_from_u64(priv->dimm_mask, dimm_mask);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
>>> +{
>>> +       int rank = chan / priv->gen_info->dimm_idx_max;
>>> +       int idx = chan % priv->gen_info->dimm_idx_max;
>>> +
>>> +       priv->dimmtemp_label[chan] = devm_kasprintf(priv->dev, GFP_KERNEL,
>>> +                                                   "DIMM %c%d", 'A' + rank,
>>> +                                                   idx + 1);
>>> +       if (!priv->dimmtemp_label[chan])
>>> +               return -ENOMEM;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const u32 peci_dimmtemp_temp_channel_config[] = {
>>> +       [0 ... DIMM_NUMS_MAX - 1] = HWMON_T_LABEL | HWMON_T_INPUT |
>>> HWMON_T_MAX | HWMON_T_CRIT,
>>> +       0
>>> +};
>>> +
>>> +static const struct hwmon_channel_info peci_dimmtemp_temp_channel = {
>>> +       .type = hwmon_temp,
>>> +       .config = peci_dimmtemp_temp_channel_config,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *peci_dimmtemp_temp_info[] = {
>>> +       &peci_dimmtemp_temp_channel,
>>> +       NULL
>>> +};
>>> +
>>> +static const struct hwmon_chip_info peci_dimmtemp_chip_info = {
>>> +       .ops = &peci_dimmtemp_ops,
>>> +       .info = peci_dimmtemp_temp_info,
>>> +};
>>> +
>>> +static int create_dimm_temp_info(struct peci_dimmtemp *priv)
>>> +{
>>> +       int ret, i, channels;
>>> +       struct device *dev;
>>> +
>>> +       ret = check_populated_dimms(priv);
>>> +       if (ret == -EAGAIN) {
>>
>> The only error returned by check_populated_dimms() is -EAGAIN. Checking for
>> specifically this error here suggests that there may be other (ignored)
>> errors. The reader has to examine check_populated_dimms() to find out
>> that -EAGAIN is indeed the only possible error. To avoid confusion, please
>> only check for ret here.
>>
> 
> Makes sense.
> 
>>> +               if (priv->retry_count < DIMM_MASK_CHECK_RETRY_MAX) {
>>> +                       schedule_delayed_work(&priv->detect_work,
>>> +                                             DIMM_MASK_CHECK_DELAY_JIFFIES);
>>> +                       priv->retry_count++;
>>> +                       dev_dbg(priv->dev, "Deferred populating DIMM temp
>>> info\n");
>>> +                       return ret;
>>> +               }
>>> +
>>> +               dev_info(priv->dev, "Timeout populating DIMM temp info\n");
>>
>> If this returns an error, the message needs to be dev_err().
>>
> 
> We need to check each CPU, but it's completely legal that only one processor in
> the systems has populated DIMMs.
> I'd prefer to keep dev_info() or maybe even downgrade it to dev_dbg().
> 

If this is not an error, there should be no message....

> Thank you
> -Iwona
> 
>>> +               return -ETIMEDOUT;

and no error either.

Guenter

>>> +       }
>>> +
>>> +       channels = priv->gen_info->chan_rank_max * priv->gen_info-
>>>> dimm_idx_max;
>>> +
>>> +       priv->dimmtemp_label = devm_kzalloc(priv->dev, channels * sizeof(char
>>> *), GFP_KERNEL);
>>> +       if (!priv->dimmtemp_label)
>>> +               return -ENOMEM;
>>> +
>>> +       for_each_set_bit(i, priv->dimm_mask, DIMM_NUMS_MAX) {
>>> +               ret = create_dimm_temp_label(priv, i);
>>> +               if (ret)
>>> +                       return ret;
>>> +       }
>>> +
>>> +       dev = devm_hwmon_device_register_with_info(priv->dev, priv->name,
>>> priv,
>>> +                                                  &peci_dimmtemp_chip_info,
>>> NULL);
>>> +       if (IS_ERR(dev)) {
>>> +               dev_err(priv->dev, "Failed to register hwmon device\n");
>>> +               return PTR_ERR(dev);
>>> +       }
>>> +
>>> +       dev_dbg(priv->dev, "%s: sensor '%s'\n", dev_name(dev), priv->name);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void create_dimm_temp_info_delayed(struct work_struct *work)
>>> +{
>>> +       struct peci_dimmtemp *priv = container_of(to_delayed_work(work),
>>> +                                                 struct peci_dimmtemp,
>>> +                                                 detect_work);
>>> +       int ret;
>>> +
>>> +       ret = create_dimm_temp_info(priv);
>>> +       if (ret && ret != -EAGAIN)
>>> +               dev_dbg(priv->dev, "Failed to populate DIMM temp info\n");
>>> +}
>>> +
>>> +static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struct
>>> auxiliary_device_id *id)
>>> +{
>>> +       struct device *dev = &adev->dev;
>>> +       struct peci_device *peci_dev = to_peci_device(dev->parent);
>>> +       struct peci_dimmtemp *priv;
>>> +       int ret;
>>> +
>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +       if (!priv)
>>> +               return -ENOMEM;
>>> +
>>> +       priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_dimmtemp.cpu%d",
>>> +                                   peci_dev->info.socket_id);
>>> +       if (!priv->name)
>>> +               return -ENOMEM;
>>> +
>>> +       dev_set_drvdata(dev, priv);
>>> +       priv->dev = dev;
>>> +       priv->peci_dev = peci_dev;
>>> +       priv->gen_info = (const struct dimm_info *)id->driver_data;
>>> +
>>> +       INIT_DELAYED_WORK(&priv->detect_work, create_dimm_temp_info_delayed);
>>> +
>>> +       ret = create_dimm_temp_info(priv);
>>> +       if (ret && ret != -EAGAIN) {
>>> +               dev_dbg(dev, "Failed to populate DIMM temp info\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void peci_dimmtemp_remove(struct auxiliary_device *adev)
>>> +{
>>> +       struct peci_dimmtemp *priv = dev_get_drvdata(&adev->dev);
>>> +
>>> +       cancel_delayed_work_sync(&priv->detect_work);
>>> +}
>>> +
>>> +static const struct dimm_info dimm_hsx = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_HSX,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_HSX,
>>> +       .min_peci_revision = 0x30,
>>> +};
>>> +
>>> +static const struct dimm_info dimm_bdx = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_BDX,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_BDX,
>>> +       .min_peci_revision = 0x30,
>>> +};
>>> +
>>> +static const struct dimm_info dimm_bdxd = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_BDXD,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_BDXD,
>>> +       .min_peci_revision = 0x30,
>>> +};
>>> +
>>> +static const struct dimm_info dimm_skx = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_SKX,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_SKX,
>>> +       .min_peci_revision = 0x30,
>>> +};
>>> +
>>> +static const struct dimm_info dimm_icx = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_ICX,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_ICX,
>>> +       .min_peci_revision = 0x40,
>>> +};
>>> +
>>> +static const struct dimm_info dimm_icxd = {
>>> +       .chan_rank_max  = CHAN_RANK_MAX_ON_ICXD,
>>> +       .dimm_idx_max   = DIMM_IDX_MAX_ON_ICXD,
>>> +       .min_peci_revision = 0x40,
>>> +};
>>> +
>>> +static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.hsx",
>>> +               .driver_data = (kernel_ulong_t)&dimm_hsx,
>>> +       },
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.bdx",
>>> +               .driver_data = (kernel_ulong_t)&dimm_bdx,
>>> +       },
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.bdxd",
>>> +               .driver_data = (kernel_ulong_t)&dimm_bdxd,
>>> +       },
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.skx",
>>> +               .driver_data = (kernel_ulong_t)&dimm_skx,
>>> +       },
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.icx",
>>> +               .driver_data = (kernel_ulong_t)&dimm_icx,
>>> +       },
>>> +       {
>>> +               .name = "peci_cpu.dimmtemp.icxd",
>>> +               .driver_data = (kernel_ulong_t)&dimm_icxd,
>>> +       },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
>>> +
>>> +static struct auxiliary_driver peci_dimmtemp_driver = {
>>> +       .probe          = peci_dimmtemp_probe,
>>> +       .remove         = peci_dimmtemp_remove,
>>> +       .id_table       = peci_dimmtemp_ids,
>>> +};
>>> +
>>> +module_auxiliary_driver(peci_dimmtemp_driver);
>>> +
>>> +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
>>> +MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
>>> +MODULE_DESCRIPTION("PECI dimmtemp driver");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_IMPORT_NS(PECI_CPU);
> 

