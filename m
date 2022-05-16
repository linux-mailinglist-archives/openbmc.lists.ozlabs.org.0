Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77B527E71
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 09:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rJq24wMz3c8G
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:21:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=217.182.185.173;
 helo=smtpout4.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Mon, 16 May 2022 17:21:00 AEST
Received: from smtpout4.mo529.mail-out.ovh.net
 (smtpout4.mo529.mail-out.ovh.net [217.182.185.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1rJX6qf4z2ybB
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 17:21:00 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1197910028E11;
 Mon, 16 May 2022 09:20:58 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:20:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ac001822-d446-48a0-8c9e-03cc33ed083d,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6193e078-0819-16c3-389c-304a30089636@kaod.org>
Date: Mon, 16 May 2022 09:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/5] hw: aspeed: Introduce common UART init function
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-5-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ea3d32f0-c9d9-4fcb-9fbc-b1a3abddeed6
X-Ovh-Tracer-Id: 18111788852229999538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
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
Cc: peter.maydell@linaro.org, Jamin Lin <jamin_lin@aspeedtech.com>,
 zev@bewilderbeest.net, andrew@aj.id.au, irischenlj@fb.com,
 openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/16/22 08:23, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




> ---
>   hw/arm/aspeed_ast10x0.c     |  7 ++-----
>   hw/arm/aspeed_ast2600.c     |  7 ++-----
>   hw/arm/aspeed_soc.c         | 16 ++++++++++++----
>   include/hw/arm/aspeed_soc.h |  1 +
>   4 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index faafb800f3..938615d55f 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -15,7 +15,6 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/qdev-clock.h"
>   #include "hw/misc/unimp.h"
> -#include "hw/char/serial.h"
>   #include "hw/arm/aspeed_soc.h"
>   
>   #define ASPEED_SOC_IOMEM_SIZE 0x00200000
> @@ -215,10 +214,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default),
> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* Timer */
>       object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a9523074a0..b0a4199b69 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -11,7 +11,6 @@
>   #include "qapi/error.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
> -#include "hw/char/serial.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "hw/i2c/aspeed_i2c.h"
> @@ -372,10 +371,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7008cd1af7..912798a9c9 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -303,10 +303,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> @@ -544,3 +542,13 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>   {
>       return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
>   }
> +
> +void aspeed_soc_uart_init(AspeedSoCState *s)
> +{
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +
> +    /* Attach an 8250 to the IO space as our UART */
> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 669bc49855..02a5a9ffcb 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -164,5 +164,6 @@ enum {
>   };
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
> +void aspeed_soc_uart_init(AspeedSoCState *s);
>   
>   #endif /* ASPEED_SOC_H */

