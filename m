Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EBFF1938
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 15:57:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477V4p14lyzF5Tl
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 01:57:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.74.148;
 helo=10.mo173.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 674 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 01:50:52 AEDT
Received: from 10.mo173.mail-out.ovh.net (10.mo173.mail-out.ovh.net
 [46.105.74.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Tx85N03zF5YR
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 01:50:50 +1100 (AEDT)
Received: from player760.ha.ovh.net (unknown [10.109.159.69])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id E02C31212B5
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 15:32:20 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 1C357BD562D9;
 Wed,  6 Nov 2019 14:32:17 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 2/4] clocksource: fttmr010: Parametrise
 shutdown
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191106091705.7416-1-joel@jms.id.au>
 <20191106091705.7416-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f32deb2b-8c9c-f76a-7741-a70b57a815f5@kaod.org>
Date: Wed, 6 Nov 2019 15:32:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106091705.7416-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15669149005465095083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
> In preparation for supporting the ast2600 which uses a different method
> to clear bits in the control register, use a callback for performing the
> shutdown sequence.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  drivers/clocksource/timer-fttmr010.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index fadff7915dd9..c2d30eb9dc72 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -97,6 +97,7 @@ struct fttmr010 {
>  	bool is_aspeed;
>  	u32 t1_enable_val;
>  	struct clock_event_device clkevt;
> +	int (*timer_shutdown)(struct clock_event_device *evt);
>  #ifdef CONFIG_ARM
>  	struct delay_timer delay_timer;
>  #endif
> @@ -140,9 +141,7 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
>  	u32 cr;
>  
>  	/* Stop */
> -	cr = readl(fttmr010->base + TIMER_CR);
> -	cr &= ~fttmr010->t1_enable_val;
> -	writel(cr, fttmr010->base + TIMER_CR);
> +	fttmr010->timer_shutdown(evt);
>  
>  	if (fttmr010->is_aspeed) {
>  		/*
> @@ -183,9 +182,7 @@ static int fttmr010_timer_set_oneshot(struct clock_event_device *evt)
>  	u32 cr;
>  
>  	/* Stop */
> -	cr = readl(fttmr010->base + TIMER_CR);
> -	cr &= ~fttmr010->t1_enable_val;
> -	writel(cr, fttmr010->base + TIMER_CR);
> +	fttmr010->timer_shutdown(evt);
>  
>  	/* Setup counter start from 0 or ~0 */
>  	writel(0, fttmr010->base + TIMER1_COUNT);
> @@ -211,9 +208,7 @@ static int fttmr010_timer_set_periodic(struct clock_event_device *evt)
>  	u32 cr;
>  
>  	/* Stop */
> -	cr = readl(fttmr010->base + TIMER_CR);
> -	cr &= ~fttmr010->t1_enable_val;
> -	writel(cr, fttmr010->base + TIMER_CR);
> +	fttmr010->timer_shutdown(evt);
>  
>  	/* Setup timer to fire at 1/HZ intervals. */
>  	if (fttmr010->is_aspeed) {
> @@ -350,6 +345,8 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
>  				     fttmr010->tick_rate);
>  	}
>  
> +	fttmr010->timer_shutdown = fttmr010_timer_shutdown;
> +
>  	/*
>  	 * Setup clockevent timer (interrupt-driven) on timer 1.
>  	 */
> @@ -370,10 +367,10 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
>  	fttmr010->clkevt.features = CLOCK_EVT_FEAT_PERIODIC |
>  		CLOCK_EVT_FEAT_ONESHOT;
>  	fttmr010->clkevt.set_next_event = fttmr010_timer_set_next_event;
> -	fttmr010->clkevt.set_state_shutdown = fttmr010_timer_shutdown;
> +	fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
>  	fttmr010->clkevt.set_state_periodic = fttmr010_timer_set_periodic;
>  	fttmr010->clkevt.set_state_oneshot = fttmr010_timer_set_oneshot;
> -	fttmr010->clkevt.tick_resume = fttmr010_timer_shutdown;
> +	fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
>  	fttmr010->clkevt.cpumask = cpumask_of(0);
>  	fttmr010->clkevt.irq = irq;
>  	clockevents_config_and_register(&fttmr010->clkevt,
> 

