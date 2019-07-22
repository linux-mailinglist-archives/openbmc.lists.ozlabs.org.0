Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BFB6FBFA
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 11:16:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sbZF4v4czDqMp
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 19:16:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sbYZ3mpBzDqDS
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 19:15:29 +1000 (AEST)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hpUPe-0002hE-2R; Mon, 22 Jul 2019 11:15:18 +0200
Date: Mon, 22 Jul 2019 11:15:17 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH] [v3] clocksource/drivers/npcm: fix GENMASK and timer
 operation
In-Reply-To: <CAKKbWA5AuDRDuczTd+tonhc7hi3L=nKX5MCjbspOvAPNR9odyg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907221111060.1782@nanos.tec.linutronix.de>
References: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
 <CAKKbWA5nwsa5kcZ8GCuC3WKJptb6RtZ65izFphd=KaALqeg+BA@mail.gmail.com>
 <CAKKbWA5AuDRDuczTd+tonhc7hi3L=nKX5MCjbspOvAPNR9odyg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 15 Jul 2019, Avi Fishman wrote:

> clocksource/drivers/npcm: fix GENMASK and timer operation

Don't repeat the subject line please

> NPCM7XX_Tx_OPER GENMASK() changed from (27, 3) to (28, 27)

Please do not write down WHAT the patch does. That can be seen from the
patch itself. Tell why this is wrong and what's the potential problem.

> Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
> it did not cause an issue
> 
> in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
> read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
> take effect.
> 
> npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
> in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
> confusing.
> 
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  drivers/clocksource/timer-npcm7xx.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-npcm7xx.c
> b/drivers/clocksource/timer-npcm7xx.c
> index 8a30da7f083b..9780ffd8010e 100644
> --- a/drivers/clocksource/timer-npcm7xx.c
> +++ b/drivers/clocksource/timer-npcm7xx.c
> @@ -32,7 +32,7 @@
>  #define NPCM7XX_Tx_INTEN               BIT(29)
>  #define NPCM7XX_Tx_COUNTEN             BIT(30)
>  #define NPCM7XX_Tx_ONESHOT             0x0
> -#define NPCM7XX_Tx_OPER                        GENMASK(27, 3)
> +#define NPCM7XX_Tx_OPER                        GENMASK(28, 27)
>  #define NPCM7XX_Tx_MIN_PRESCALE                0x1
>  #define NPCM7XX_Tx_TDR_MASK_BITS       24
>  #define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
> @@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct
> clock_event_device *evt)
> 
>         val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>         val &= ~NPCM7XX_Tx_OPER;
> -
> -       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>         val |= NPCM7XX_START_ONESHOT_Tx;
>         writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> 
> @@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct
> clock_event_device *evt)

Your mail client mangled the patch so it does not apply:

patching file drivers/clocksource/timer-npcm7xx.c
Hunk #1 FAILED at 32.
patch: **** malformed patch at line 49: clock_event_device *evt)

See Documentation/process for hints about sending patches with various mail
clients. Send the patch to yourself first and try to apply it yourself.

Thanks,

	tglx
