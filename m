Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EFBF1995
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 16:10:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477VMQ1H05zF4f0
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:10:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.74.219; helo=8.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 8.mo68.mail-out.ovh.net (8.mo68.mail-out.ovh.net
 [46.105.74.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477VLk4BRFzF3T8
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 02:09:31 +1100 (AEDT)
Received: from player729.ha.ovh.net (unknown [10.108.54.13])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id E6D36147FF7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 15:34:14 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id E006BBF9927F;
 Wed,  6 Nov 2019 14:34:11 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 3/4] clocksource: fttmr010: Set interrupt
 and shutdown
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191106091705.7416-1-joel@jms.id.au>
 <20191106091705.7416-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b97f0f45-24dc-f3fd-742f-36b06221c6af@kaod.org>
Date: Wed, 6 Nov 2019 15:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106091705.7416-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15701237152568150955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
> In preparation for supporting the ast2600, pass the shutdown and
> interrupt functions to the common init callback.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  drivers/clocksource/timer-fttmr010.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index c2d30eb9dc72..8a79025339d0 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -244,7 +244,10 @@ static irqreturn_t fttmr010_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
> +static int __init fttmr010_common_init(struct device_node *np,
> +		bool is_aspeed,
> +		int (*timer_shutdown)(struct clock_event_device *),
> +		irq_handler_t handler)

may be rename handler -> irq_handler. This is minor, just better for 
readability.

C. 

>  {
>  	struct fttmr010 *fttmr010;
>  	int irq;
> @@ -345,7 +348,7 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
>  				     fttmr010->tick_rate);
>  	}
>  
> -	fttmr010->timer_shutdown = fttmr010_timer_shutdown;
> +	fttmr010->timer_shutdown = timer_shutdown;
>  
>  	/*
>  	 * Setup clockevent timer (interrupt-driven) on timer 1.
> @@ -354,7 +357,7 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
>  	writel(0, fttmr010->base + TIMER1_LOAD);
>  	writel(0, fttmr010->base + TIMER1_MATCH1);
>  	writel(0, fttmr010->base + TIMER1_MATCH2);
> -	ret = request_irq(irq, fttmr010_timer_interrupt, IRQF_TIMER,
> +	ret = request_irq(irq, handler, IRQF_TIMER,
>  			  "FTTMR010-TIMER1", &fttmr010->clkevt);
>  	if (ret) {
>  		pr_err("FTTMR010-TIMER1 no IRQ\n");
> @@ -403,12 +406,16 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
>  
>  static __init int aspeed_timer_init(struct device_node *np)
>  {
> -	return fttmr010_common_init(np, true);
> +	return fttmr010_common_init(np, true,
> +			fttmr010_timer_shutdown,
> +			fttmr010_timer_interrupt);
>  }
>  
>  static __init int fttmr010_timer_init(struct device_node *np)
>  {
> -	return fttmr010_common_init(np, false);
> +	return fttmr010_common_init(np, false,
> +			fttmr010_timer_shutdown,
> +			fttmr010_timer_interrupt);
>  }
>  
>  TIMER_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
> 

