Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBC7C5221
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 13:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S59bM58vVz2yW2
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 22:31:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S59Zt6TZLz2xgp;
	Wed, 11 Oct 2023 22:31:32 +1100 (AEDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S59ZJ0pD6z6K5Wx;
	Wed, 11 Oct 2023 19:31:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 11 Oct
 2023 12:31:24 +0100
Date: Wed, 11 Oct 2023 12:31:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v5 1/3] ipmi: Move KCS headers to common include folder
Message-ID: <20231011123123.00000394@Huawei.com>
In-Reply-To: <20231010122321.823-2-aladyshev22@gmail.com>
References: <20231010122321.823-1-aladyshev22@gmail.com>
	<20231010122321.823-2-aladyshev22@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 10 Oct 2023 15:23:19 +0300
Konstantin Aladyshev <aladyshev22@gmail.com> wrote:

> The current KCS header files can be utilized by both IPMI drivers
> (drivers/char/ipmi) and MCTP driver (drivers/net/mctp). To be able to
> use them in both cases move the headers to 'include/linux' folder.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Not particularly important but I wonder if
include/linux/kcs/bmc.h
include/linux/kcs/bmc_client.h
include/linux/kcs/bmc_device.h

might be a cleaner choice given that you are moving them.

I don't care that much though so up to you :)

Jonathan

> ---
>  drivers/char/ipmi/kcs_bmc.c                           | 8 +++-----
>  drivers/char/ipmi/kcs_bmc_aspeed.c                    | 3 +--
>  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c                 | 2 +-
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c                   | 2 +-
>  drivers/char/ipmi/kcs_bmc_serio.c                     | 2 +-
>  {drivers/char/ipmi => include/linux}/kcs_bmc.h        | 0
>  {drivers/char/ipmi => include/linux}/kcs_bmc_client.h | 3 +--
>  {drivers/char/ipmi => include/linux}/kcs_bmc_device.h | 3 +--
>  8 files changed, 9 insertions(+), 14 deletions(-)
>  rename {drivers/char/ipmi => include/linux}/kcs_bmc.h (100%)
>  rename {drivers/char/ipmi => include/linux}/kcs_bmc_client.h (97%)
>  rename {drivers/char/ipmi => include/linux}/kcs_bmc_device.h (96%)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> index 8b1161d5194a..d29a8505d6ed 100644
> --- a/drivers/char/ipmi/kcs_bmc.c
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -5,15 +5,13 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/kcs_bmc.h>
> +#include <linux/kcs_bmc_client.h>
> +#include <linux/kcs_bmc_device.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> -#include "kcs_bmc.h"
> -
> -/* Implement both the device and client interfaces here */
> -#include "kcs_bmc_device.h"
> -#include "kcs_bmc_client.h"
>  
>  /* Record registered devices and drivers */
>  static DEFINE_MUTEX(kcs_bmc_lock);
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 72640da55380..3dc0dfb448f5 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -10,6 +10,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> +#include <linux/kcs_bmc_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -21,8 +22,6 @@
>  #include <linux/slab.h>
>  #include <linux/timer.h>
>  
> -#include "kcs_bmc_device.h"
> -
>  
>  #define DEVICE_NAME     "ast-kcs-bmc"
>  
> diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> index cf670e891966..bf1001130a6c 100644
> --- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> +++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> @@ -8,6 +8,7 @@
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/ipmi_bmc.h>
> +#include <linux/kcs_bmc_client.h>
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -17,7 +18,6 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> -#include "kcs_bmc_client.h"
>  
>  /* Different phases of the KCS BMC module.
>   *  KCS_PHASE_IDLE:
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> index 7961fec56476..160553248a93 100644
> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/kcs_bmc_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -17,7 +18,6 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> -#include "kcs_bmc_device.h"
>  
>  #define DEVICE_NAME	"npcm-kcs-bmc"
>  #define KCS_CHANNEL_MAX	3
> diff --git a/drivers/char/ipmi/kcs_bmc_serio.c b/drivers/char/ipmi/kcs_bmc_serio.c
> index 1793358be782..24df7144a189 100644
> --- a/drivers/char/ipmi/kcs_bmc_serio.c
> +++ b/drivers/char/ipmi/kcs_bmc_serio.c
> @@ -5,12 +5,12 @@
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/list.h>
> +#include <linux/kcs_bmc_client.h>
>  #include <linux/module.h>
>  #include <linux/sched/signal.h>
>  #include <linux/serio.h>
>  #include <linux/slab.h>
>  
> -#include "kcs_bmc_client.h"
>  
>  struct kcs_bmc_serio {
>  	struct list_head entry;
> diff --git a/drivers/char/ipmi/kcs_bmc.h b/include/linux/kcs_bmc.h
> similarity index 100%
> rename from drivers/char/ipmi/kcs_bmc.h
> rename to include/linux/kcs_bmc.h
> diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/include/linux/kcs_bmc_client.h
> similarity index 97%
> rename from drivers/char/ipmi/kcs_bmc_client.h
> rename to include/linux/kcs_bmc_client.h
> index 6fdcde0a7169..f6350c9366dd 100644
> --- a/drivers/char/ipmi/kcs_bmc_client.h
> +++ b/include/linux/kcs_bmc_client.h
> @@ -5,8 +5,7 @@
>  #define __KCS_BMC_CONSUMER_H__
>  
>  #include <linux/irqreturn.h>
> -
> -#include "kcs_bmc.h"
> +#include <linux/kcs_bmc.h>
>  
>  struct kcs_bmc_driver_ops {
>  	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
> diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/include/linux/kcs_bmc_device.h
> similarity index 96%
> rename from drivers/char/ipmi/kcs_bmc_device.h
> rename to include/linux/kcs_bmc_device.h
> index 17c572f25c54..65333b68c0af 100644
> --- a/drivers/char/ipmi/kcs_bmc_device.h
> +++ b/include/linux/kcs_bmc_device.h
> @@ -5,8 +5,7 @@
>  #define __KCS_BMC_DEVICE_H__
>  
>  #include <linux/irqreturn.h>
> -
> -#include "kcs_bmc.h"
> +#include <linux/kcs_bmc.h>
>  
>  struct kcs_bmc_device_ops {
>  	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enable);

