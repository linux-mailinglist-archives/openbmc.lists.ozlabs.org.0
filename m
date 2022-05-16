Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B389527E95
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 09:30:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rWG6jBdz3cK8
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:30:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.43.201; helo=4.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 558 seconds by postgrey-1.36 at boromir;
 Mon, 16 May 2022 17:30:02 AEST
Received: from 4.mo552.mail-out.ovh.net (4.mo552.mail-out.ovh.net
 [178.33.43.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1rVy3rxXz3cGR
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 17:30:01 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5ECC321DA7;
 Mon, 16 May 2022 07:20:37 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:20:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001e18fa46d-3347-47f6-9108-8713955a4707,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a4bc0da6-cab0-c9c4-4171-51d5167b2b96@kaod.org>
Date: Mon, 16 May 2022 09:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] hw: aspeed: Ensure AST1030 respects uart-default
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-4-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-4-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b9b26e7f-ae49-43dc-bc86-caf57d9614fe
X-Ovh-Tracer-Id: 18105877877467483058
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
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
> The AST1030 machine initialization was not respecting the Aspeed SoC
> property "uart-default", which specifies which UART should be connected to
> the first serial device, it was just always connecting UART5. This doesn't
> change any behavior, because the default value for "uart-default" is UART5,
> but it makes it possible to override this in new machine definitions using
> the AST1030.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index bb8177e86c..faafb800f3 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -215,9 +215,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
> -    /* UART5 - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> +    /* UART - attach an 8250 to the IO space as our UART */
> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +                   aspeed_soc_get_irq(s, s->uart_default),
>                      38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>   
>       /* Timer */

