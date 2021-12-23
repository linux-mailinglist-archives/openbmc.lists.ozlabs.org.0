Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E447E448
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 15:02:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKX251SZ2z3c6Q
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 01:02:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.105.233;
 helo=2.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 434 seconds by postgrey-1.36 at boromir;
 Fri, 24 Dec 2021 01:02:06 AEDT
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKX1q04Xcz2xsG
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 01:02:05 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D406E221AB;
 Thu, 23 Dec 2021 13:54:47 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 14:54:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a081eba7-e19d-49e8-8f16-6016c3118453,
 8CA006CF2B51D87471028670A5C113E20BDD9F51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
Date: Thu, 23 Dec 2021 14:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>,
 <openbmc@lists.ozlabs.org>
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-3-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211222092319.2988568-3-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a5ff1ba3-c981-464c-b9c5-a86dcbaffd96
X-Ovh-Tracer-Id: 9198320765851175788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/22/21 10:23, Troy Lee wrote:
> This patch includes i3c instance in ast2600 soc.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Looks good but it is based on the QEMU aspeed branch for OpenBMC.
You should rebase on upstream.

Thanks,

C.

> ---
>   hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
>   include/hw/arm/aspeed_soc.h |  3 +++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f2fef9d706..219b025bc2 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_VUART]     = 0x1E787000,
>       [ASPEED_DEV_FSI1]      = 0x1E79B000,
>       [ASPEED_DEV_FSI2]      = 0x1E79B100,
> +    [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
>   };
>   
> @@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_FSI1]      = 100,
>       [ASPEED_DEV_FSI2]      = 101,
>       [ASPEED_DEV_DP]        = 62,
> +    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>   };
>   
>   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>   
>       object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
>   
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> +
>       object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_APB2OPB);
>   }
>   
> @@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
>   
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
> +
>       /* FSI */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
>           return;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 0db200d813..0c950fab3c 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -21,6 +21,7 @@
>   #include "hw/timer/aspeed_timer.h"
>   #include "hw/rtc/aspeed_rtc.h"
>   #include "hw/i2c/aspeed_i2c.h"
> +#include "hw/misc/aspeed_i3c.h"
>   #include "hw/ssi/aspeed_smc.h"
>   #include "hw/misc/aspeed_hace.h"
>   #include "hw/watchdog/wdt_aspeed.h"
> @@ -53,6 +54,7 @@ struct AspeedSoCState {
>       AspeedRtcState rtc;
>       AspeedTimerCtrlState timerctrl;
>       AspeedI2CState i2c;
> +    AspeedI3CState i3c;
>       AspeedSCUState scu;
>       AspeedHACEState hace;
>       AspeedXDMAState xdma;
> @@ -148,6 +150,7 @@ enum {
>       ASPEED_DEV_FSI2,
>       ASPEED_DEV_DPMCU,
>       ASPEED_DEV_DP,
> +    ASPEED_DEV_I3C,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> 

