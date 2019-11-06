Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FDF19C3
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 16:19:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477VZC1x74zF4PQ
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:19:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.49.208; helo=20.mo7.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2305 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 02:18:53 AEDT
Received: from 20.mo7.mail-out.ovh.net (20.mo7.mail-out.ovh.net
 [46.105.49.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477VYT4FfNzF3lW
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 02:18:49 +1100 (AEDT)
Received: from player771.ha.ovh.net (unknown [10.108.42.75])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 8995913D2E3
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 15:40:23 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player771.ha.ovh.net (Postfix) with ESMTPSA id C1FD4BD1CDFD;
 Wed,  6 Nov 2019 14:40:19 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 4/4] clocksource: fttmr010: Add support for
 ast2600
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191106091705.7416-1-joel@jms.id.au>
 <20191106091705.7416-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b8e22055-4546-0a6a-3c7d-a73f6eb861bf@kaod.org>
Date: Wed, 6 Nov 2019 15:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106091705.7416-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15805101419091626923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06/11/2019 10:17, Joel Stanley wrote:
> The ast2600 has some minor differences to previous versions. The
> interrupt handler must acknowledge the timer interrupt in a status
> register. Secondly the control register becomes write to set only,
> requiring the use of a separate set to clear register.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  drivers/clocksource/timer-fttmr010.c | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index 8a79025339d0..688d540ebddd 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -37,6 +37,11 @@
>  #define TIMER3_MATCH2		(0x2c)
>  #define TIMER_CR		(0x30)
>  
> +/*
> +  Control register set to clear for ast2600 only.
> + */
> +#define TIMER_CR_CLR		(0x3c)
> +
>  /*
>   * Control register (TMC30) bit fields for fttmr010/gemini/moxart timers.
>   */
> @@ -163,6 +168,16 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
>  	return 0;
>  }
>  
> +static int ast2600_timer_shutdown(struct clock_event_device *evt)
> +{
> +	struct fttmr010 *fttmr010 = to_fttmr010(evt);
> +
> +	/* Stop */
> +	writel(fttmr010->t1_enable_val, fttmr010->base + TIMER_CR_CLR);
> +
> +	return 0;
> +}
> +
>  static int fttmr010_timer_shutdown(struct clock_event_device *evt)
>  {
>  	struct fttmr010 *fttmr010 = to_fttmr010(evt);
> @@ -244,6 +259,17 @@ static irqreturn_t fttmr010_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t ast2600_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = dev_id;
> +	struct fttmr010 *fttmr010 = to_fttmr010(evt);
> +
> +	writel(0x1, fttmr010->base + TIMER_INTR_STATE);
> +
> +	evt->event_handler(evt);
> +	return IRQ_HANDLED;
> +}
> +
>  static int __init fttmr010_common_init(struct device_node *np,
>  		bool is_aspeed,
>  		int (*timer_shutdown)(struct clock_event_device *),
> @@ -404,6 +430,13 @@ static int __init fttmr010_common_init(struct device_node *np,
>  	return ret;
>  }
>  
> +static __init int ast2600_timer_init(struct device_node *np)
> +{
> +	return fttmr010_common_init(np, true,
> +			ast2600_timer_shutdown,
> +			ast2600_timer_interrupt);
> +}
> +
>  static __init int aspeed_timer_init(struct device_node *np)
>  {
>  	return fttmr010_common_init(np, true,
> @@ -423,3 +456,4 @@ TIMER_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
>  TIMER_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
>  TIMER_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init);
>  TIMER_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init);
> +TIMER_OF_DECLARE(ast2600, "aspeed,ast2600-timer", ast2600_timer_init);
> 

