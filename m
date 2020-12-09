Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E12D4B5D
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 21:15:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrpFT30DzzDqvh
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 07:15:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.75.70; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=xptSBv7w; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrpDN6wcDzDqnV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 07:14:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCSSPJWl4UtdyALGFFq1T/Vt0AQ/4rDVIpkMgbe5YIIq2Wn60VAlx+7XNJB46Yx8lpUnxFFTx+Xp9MBedKuN4d8fwrxE2CQDzorCK3OZ9tXv6yABJQuG8VUYsOWXokPKoZnnFFBxBke99xB3wILwrpgn1RCspPe6NOoQ9kDfhXf641VyTXTtjrTzyDqZFke0mAwNbZhDesDGV/Aw6DAjVfMsX+3B6cwEg43cimsjILCa6Y4W33d5fozt970ubp+ijV/gH46d3ZD5Ov5KXUBI9M2/WwOUsItFFnCIseqjxuyDKvi9Sm44lgu63KOe4k5+mqVeR0HzVP358+bnDGQrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCaj6J4CugDxV/i0rpP0m5TrKCtydTiR7VogpaiCqtw=;
 b=IeRl9d4W4/5oxrjy2s9mw79sf4b1Fa3Aki5ryzqbrchKzY23E09FKRoc6tnSqoLxATjnvD4V5wElhMk6Jw44r/XunmCbFh0RJkXlrQKLTjmdIXFIr77DRdDPDdl2tQ7quCglfHqrWBqBhYWMcgAmHbPaz2cDBz71uGfDdOEyA8fwlbsPuXN+rAl1XjPUvcfikDSxbdwbslY7OwLtvRVmcDQH2Ac+VRka16D6vHeslZvkTXJaZWlOWSULMA898ouoVHVrXvm3mKH1s7ng2gxx1ug2O/8kS5FBZ16IVx14a25i+9YpVV2AjIrgz/qbAr8zVSHBNIG6QV6e742xM82Fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCaj6J4CugDxV/i0rpP0m5TrKCtydTiR7VogpaiCqtw=;
 b=xptSBv7wS+Ojfpph1k+JpTc9BQKPJfw3uifIgiPs7lFIwlXIsOVvWTec4LFKRBTcFIhkmdkNhIQXhVAholjHzKLRIOM3PR4uqArfCtW9SBGvEtFCYtXqg5ioez92/85PvX4/tZSR/Um17YQBnxZZWoJDb1jjGrGVonx7Lws75Vc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 20:14:19 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::71ef:be22:6a7d:b4b7]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::71ef:be22:6a7d:b4b7%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 20:14:19 +0000
Subject: Re: [PATCH linux hwmon-next v4 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
To: Kun Yi <kunyi@google.com>, jdelvare@suse.com, linux@roeck-us.net,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20201202165601.1532213-1-kunyi@google.com>
 <20201202165601.1532213-2-kunyi@google.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <db4a3a61-2bb6-f68e-2c48-450c33ad36b5@amd.com>
Date: Wed, 9 Dec 2020 14:13:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201202165601.1532213-2-kunyi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: CH2PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:610:52::39) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.123] (165.204.77.1) by
 CH2PR04CA0029.namprd04.prod.outlook.com (2603:10b6:610:52::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 20:14:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c589bd5-1b50-48bc-c422-08d89c7f02e9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4365:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4365A9C69B384A918266732F96CC0@SA0PR12MB4365.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoWtT0xVyQJgN7eXtRHvDvrJfsi2TPoT9Qp6jG+YWKMYJEDJgruMwS6CreCG74IamSiL0Y934pBSCbGdX/q4tGEO6OuI1LftEH/mw/AcFKIipBmSJjPtgoHHMEXRTi+CQvKaULgdBwpY3G6E6aepaiN/o0It15Hwj7sik4K4pMB7ql3Rmb6sG9QsF0Y3Vg2xVYwHb7orKiZ/7HLzrtupqXPmcGLVAPY5fz0M8iuWdgad4Vh42rpUQxBd5VjyCaopOhfmQI8GW2Lr8FGO/Nm77O/ynrEhXHujOjAaSvu+uUKJEGyYiYoHC5CxYyjjzxCh5BtfSH9AIM43VgKDzvaf7R5rclIm3PxYTUYYKy7leeO9fl/GIRK2MlXvsVDGA0vTCshlFoghYgu6gBwSTBT6Z2xUAyhLRPO/2unKqo9S/GCnKkOSk1GNM6scecJsoIJ+3Zbg2VSUqqp29bNhgwqhyY9BkClnIzRcwZkDoJZcf2u0exUQDQDebgIid5Z5AflJxpXDWqyEIK3K7yJqgGJcXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(508600001)(966005)(6666004)(66476007)(66556008)(45080400002)(4326008)(31686004)(66946007)(186003)(2906002)(52116002)(5660300002)(30864003)(16526019)(86362001)(2616005)(26005)(16576012)(956004)(36756003)(34490700003)(44832011)(8936002)(53546011)(31696002)(8676002)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmN2bm9qVHk4WG56aENrUFhoZk5lOFVVeHRDUEdXMnlkaE1BSlpobWxwU3Ro?=
 =?utf-8?B?QUpJL2g1cXBVZUhxSmY2ZWRRNVJ6ak5UREFhelN0MG01YjcvM3hyNWNlUm0y?=
 =?utf-8?B?M3hPRTBUV2dMOFprdDljZm9wNmdQTG9qSkpBOFR6KzM1SWtIRGRnSllsUmtH?=
 =?utf-8?B?VmI0NFY1eTkrTGZtZlFyR0RsSTdpcEMvUmRPZUJNUUh4ZysvWFIzWE9NOWNO?=
 =?utf-8?B?V0wrR3p3dzlkdGhGRi8yb3V1WUxPT25aS2RORlJmSEFZK1F0eFZpNDFPL1ZR?=
 =?utf-8?B?TWdqUmhoa0JIMW1iOEZQbGRNb01FZGtEUTZZTmI4dlNGSHlJRlFpRGtTbHEy?=
 =?utf-8?B?RGxaSjFwMnFrUS9XaHh0cUd2a25mT1lNUlZ0NW5YT0JUeEFvak9FMWE4VjB0?=
 =?utf-8?B?QUVUbEFxVXA1STBwSVVRVlpZa2R6RU53Mi9XcGNOZGt0a3hyY0FtTm96VlFH?=
 =?utf-8?B?T21ieUVDQTNQbFErWCtPMDZRL0VodDJrc3pmSzNFVUV0TDF6QWIvRFBsWEph?=
 =?utf-8?B?TlkrREQ4dGhvcmk1dmNzczRBd2pUaWJ0SmsvdUc0cXZjWmdFWlpwS2QxZ3Az?=
 =?utf-8?B?Q0NxR3gxbVRob05pQzdkYk1OUy9UNHdMNWpDUlhtcTB6aXBzTHZ6TmYxTTcw?=
 =?utf-8?B?M3FlSkZHVFdIcEIwRklUNjA3VnhRRjlFdldiQkNjYXAvRlA0eC8vc3AzcUtH?=
 =?utf-8?B?Vi9Ha2x0SDZaektadEFmVDUxZndMYVNVdFlOMVZTU29tUTZYd2NDek1Ua200?=
 =?utf-8?B?RlJhTm16Qis3ZU0rRjg5dlJIeklwMERldVdnc2I2UWxMaE9mYmRIbjZUQ3hF?=
 =?utf-8?B?b1VpcC8zUmtrWUZiT3ozdERncjdaWmEvaWEreXJQMm9qcXR2RmNPb1pBQ3c2?=
 =?utf-8?B?dW9tWHhFT01NMHZlNkVkM1VlWmtSVFBXUElxOXB1TzRLcHl1S01HSjQ3eWta?=
 =?utf-8?B?eWx5RlQ0N3oyeW40QW9KYmpaUE9KL1Rud0g0aDNyeVhpVHg1T3pXcG8xcEJT?=
 =?utf-8?B?U0RrQVNXcGhmOHJVb3RXanJ4M2gyTkVBYll4MTVwK2c1NUJ2eW81L2ppd0Fz?=
 =?utf-8?B?VnNqdW5NWHl5c1N2WmNxdFJ2dmlBeDIxYWFnZ2ZQZm13cFpFdG83UkdYdUh6?=
 =?utf-8?B?L2JjL0ZYbkZoRUI1SzNVeThTWWIxVUp3UlExNUZZMVBhenk3Ym5xTGJJSFlV?=
 =?utf-8?B?ZFMvd2w3WE5lT0UyM201MHB0YnJWdXlVU21NQjZBd3Z5NjIxaDhGRWcrL2hP?=
 =?utf-8?B?MURHdUc0YS90K1dGd3pPdWs3NG5qREo0S0N3TDlJZGVuYXNoZVlXUmZNcktN?=
 =?utf-8?Q?VdnNVcXE1/osSuW+avMCZV3FHDmpYhrSrv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 20:14:19.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c589bd5-1b50-48bc-c422-08d89c7f02e9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdSijKc/97yLlIkV1BjRA1iYalfPqjgh1tCPf1cnP1K2vkLnJcklyAjx5nsn4PyPHXfEpP/Yoh2fPMKFel/2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/2/20 10:55 AM, Kun Yi wrote:
> [CAUTION: External Email]
> 
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This commit adds basic support using this interface to read CPU
> temperature, and read/write high/low CPU temp thresholds.
> 
> To instantiate this driver on an AMD CPU with SB-TSI
> support, the i2c bus number would be the bus connected from the board
> management controller (BMC) to the CPU. The i2c address is specified in
> Section 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for
> socket 0 and 90h for socket 1, but it could vary based on hardware address
> select pins.
> 
> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F56255_OSRR.pdf&amp;data=04%7C01%7Csupreeth.venkatesh%40amd.com%7C412ca045665445483a0a08d896e33084%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C1%7C637425250268541698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Xir5Jg%2FgHz8isnXNkmZMTRjg%2FOht%2FSDR4gajR5wVgSU%3D&amp;reserved=0
> 
> Test status: tested reading temp1_input, and reading/writing
> temp1_max/min.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
Series
 Acked-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>

> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/sbtsi_temp.c | 265 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/hwmon/sbtsi_temp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3c059fc23cd6..3d6a809700ae 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1522,6 +1522,16 @@ config SENSORS_SL28CPLD
>           This driver can also be built as a module.  If so, the module
>           will be called sl28cpld-hwmon.
> 
> +config SENSORS_SBTSI
> +       tristate "Emulated SB-TSI temperature sensor"
> +       depends on I2C
> +       help
> +         If you say yes here you get support for emulated temperature
> +         sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called sbtsi_temp.
> +
>  config SENSORS_SHT15
>         tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>         depends on GPIOLIB || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 01ca5d3fbad4..ee8c037919da 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)  += pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)        += raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)      += s3c-hwmon.o
> +obj-$(CONFIG_SENSORS_SBTSI)    += sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)  += sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)  += sch5636.o
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> new file mode 100644
> index 000000000000..6b0a7b9df1f3
> --- /dev/null
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
> + *                compliant AMD SoC temperature device.
> + *
> + * Copyright (c) 2020, Google Inc.
> + * Copyright (c) 2020, Kun Yi <kunyi@google.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> + * the integer part of a temperature value or limit, and "_DEC" registers are
> + * corresponding decimal parts.
> + */
> +#define SBTSI_REG_TEMP_INT             0x01 /* RO */
> +#define SBTSI_REG_STATUS               0x02 /* RO */
> +#define SBTSI_REG_CONFIG               0x03 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_INT                0x07 /* RW */
> +#define SBTSI_REG_TEMP_LOW_INT         0x08 /* RW */
> +#define SBTSI_REG_TEMP_DEC             0x10 /* RW */
> +#define SBTSI_REG_TEMP_HIGH_DEC                0x13 /* RW */
> +#define SBTSI_REG_TEMP_LOW_DEC         0x14 /* RW */
> +
> +#define SBTSI_CONFIG_READ_ORDER_SHIFT  5
> +
> +#define SBTSI_TEMP_MIN 0
> +#define SBTSI_TEMP_MAX 255875
> +
> +/* Each client has this additional data */
> +struct sbtsi_data {
> +       struct i2c_client *client;
> +       struct mutex lock;
> +};
> +
> +/*
> + * From SB-TSI spec: CPU temperature readings and limit registers encode the
> + * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
> + * register encodes the base-2 of the integer portion, and the upper 3 bits of
> + * the "low byte" encode in base-2 the decimal portion.
> + *
> + * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
> + *
> + * Therefore temperature in millidegree Celsius =
> + *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
> + */
> +static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal)
> +{
> +       return ((integer << 3) + (decimal >> 5)) * 125;
> +}
> +
> +/*
> + * Inversely, given temperature in millidegree Celsius
> + *   INT = (TEMP / 125) / 8
> + *   DEC = ((TEMP / 125) % 8) * 32
> + * Caller have to make sure temp doesn't exceed 255875, the max valid value.
> + */
> +static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
> +{
> +       temp /= 125;
> +       *integer = temp >> 3;
> +       *decimal = (temp & 0x7) << 5;
> +}
> +
> +static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
> +                     u32 attr, int channel, long *val)
> +{
> +       struct sbtsi_data *data = dev_get_drvdata(dev);
> +       s32 temp_int, temp_dec;
> +       int err, reg_int, reg_dec;
> +       bool reading_input;
> +
> +       if (type != hwmon_temp)
> +               return -EINVAL;
> +
> +       reading_input = false;
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               reading_input = true;
> +               /*
> +                * ReadOrder bit specifies the reading order of integer and
> +                * decimal part of CPU temp for atomic reads. If bit == 0,
> +                * reading integer part triggers latching of the decimal part,
> +                * so integer part should be read first. If bit == 1, read
> +                * order should be reversed.
> +                */
> +               err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
> +               if (err < 0)
> +                       return err;
> +
> +               mutex_lock(&data->lock);
> +               if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
> +                       temp_dec = i2c_smbus_read_byte_data(data->client,
> +                                                           SBTSI_REG_TEMP_DEC);
> +                       temp_int = i2c_smbus_read_byte_data(data->client,
> +                                                           SBTSI_REG_TEMP_INT);
> +               } else {
> +                       temp_int = i2c_smbus_read_byte_data(data->client,
> +                                                           SBTSI_REG_TEMP_INT);
> +                       temp_dec = i2c_smbus_read_byte_data(data->client,
> +                                                           SBTSI_REG_TEMP_DEC);
> +               }
> +               mutex_unlock(&data->lock);
> +               break;
> +       case hwmon_temp_max:
> +               reg_int = SBTSI_REG_TEMP_HIGH_INT;
> +               reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
> +               break;
> +       case hwmon_temp_min:
> +               reg_int = SBTSI_REG_TEMP_LOW_INT;
> +               reg_dec = SBTSI_REG_TEMP_LOW_DEC;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (!reading_input) {
> +               temp_int = i2c_smbus_read_byte_data(data->client, reg_int);
> +               temp_dec = i2c_smbus_read_byte_data(data->client, reg_dec);
> +       }
> +
> +       if (temp_int < 0)
> +               return temp_int;
> +       if (temp_dec < 0)
> +               return temp_dec;
> +
> +       *val = sbtsi_reg_to_mc(temp_int, temp_dec);
> +
> +       return 0;
> +}
> +
> +static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
> +                      u32 attr, int channel, long val)
> +{
> +       struct sbtsi_data *data = dev_get_drvdata(dev);
> +       int reg_int, reg_dec, err;
> +       u8 temp_int, temp_dec;
> +
> +       if (type != hwmon_temp)
> +               return -EINVAL;
> +
> +       switch (attr) {
> +       case hwmon_temp_max:
> +               reg_int = SBTSI_REG_TEMP_HIGH_INT;
> +               reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
> +               break;
> +       case hwmon_temp_min:
> +               reg_int = SBTSI_REG_TEMP_LOW_INT;
> +               reg_dec = SBTSI_REG_TEMP_LOW_DEC;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
> +       mutex_lock(&data->lock);
> +       sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
> +       err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
> +       if (err)
> +               goto exit;
> +
> +       err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
> +exit:
> +       mutex_unlock(&data->lock);
> +       return err;
> +}
> +
> +static umode_t sbtsi_is_visible(const void *data,
> +                               enum hwmon_sensor_types type,
> +                               u32 attr, int channel)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               switch (attr) {
> +               case hwmon_temp_input:
> +                       return 0444;
> +               case hwmon_temp_min:
> +                       return 0644;
> +               case hwmon_temp_max:
> +                       return 0644;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbtsi_info[] = {
> +       HWMON_CHANNEL_INFO(chip,
> +                          HWMON_C_REGISTER_TZ),
> +       HWMON_CHANNEL_INFO(temp,
> +                          HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
> +       NULL
> +};
> +
> +static const struct hwmon_ops sbtsi_hwmon_ops = {
> +       .is_visible = sbtsi_is_visible,
> +       .read = sbtsi_read,
> +       .write = sbtsi_write,
> +};
> +
> +static const struct hwmon_chip_info sbtsi_chip_info = {
> +       .ops = &sbtsi_hwmon_ops,
> +       .info = sbtsi_info,
> +};
> +
> +static int sbtsi_probe(struct i2c_client *client,
> +                      const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct device *hwmon_dev;
> +       struct sbtsi_data *data;
> +
> +       data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->client = client;
> +       mutex_init(&data->lock);
> +
> +       hwmon_dev =
> +               devm_hwmon_device_register_with_info(dev, client->name, data,
> +                                                    &sbtsi_chip_info, NULL);
> +
> +       return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id sbtsi_id[] = {
> +       {"sbtsi", 0},
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> +
> +static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
> +       {
> +               .compatible = "amd,sbtsi",
> +       },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, sbtsi_of_match);
> +
> +static struct i2c_driver sbtsi_driver = {
> +       .class = I2C_CLASS_HWMON,
> +       .driver = {
> +               .name = "sbtsi",
> +               .of_match_table = of_match_ptr(sbtsi_of_match),
> +       },
> +       .probe = sbtsi_probe,
> +       .id_table = sbtsi_id,
> +};
> +
> +module_i2c_driver(sbtsi_driver);
> +
> +MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
> +MODULE_LICENSE("GPL");
> --
> 2.29.2.454.gaff20da3a2-goog
> 
