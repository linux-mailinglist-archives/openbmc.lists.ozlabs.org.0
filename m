Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C6389A01
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlqFR3vZVz306y
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hV289Pn1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hV289Pn1; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlqF94ftTz2xv6;
 Thu, 20 May 2021 09:43:24 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id k127so14526113qkc.6;
 Wed, 19 May 2021 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZj61H+nZldX9VF8Rk7SoLRZEnhdWQ15nrHYMIdlXL8=;
 b=hV289Pn1fzt0l5vYzw9Zco9XFbeqr0tKlwl117wL+ReIbVLezHs/xFwIcMKafGIL/r
 Ceq9AJkQHisWMOwWZVoe+E3BdzypGyKrbGtP5GVg+wjxmevjIE5q30D1Z3rQCTBmbzyl
 JopSkzzu13aCRFAkE3C3pYN93lb/AFgpuiOcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZj61H+nZldX9VF8Rk7SoLRZEnhdWQ15nrHYMIdlXL8=;
 b=BlLk7aoWLrokntCP7ClAje46dwKt/i0j7gY9n/HTAA+gM2/uh+totCvyK3m4Ad1Hju
 /AVrASPRBj1CXukQ+v0kfW/Ju/9jYRg6+zqI0EXlowpheaj8BRuWKTa3p2b3c4RBI3KT
 yVBRYZmPDVsJAtMRlteuALdxiDpzr/FacCnqKRyA/unBMYQKr3AsK1WQXLxDHQaMNUuS
 t/hxAl4qMCihDr43ej35xjzueK8tTnJU5VnEgwlYU6eWPYo0HKti3UXaed/C9y3b0/VB
 j6xM5+9ZUZU5HcpBaHZvtErpB8nzWTrP4rXuaeEYREZ7yvJBz4AJngpoL6T/TKSZ65GW
 zhlQ==
X-Gm-Message-State: AOAM532LuXAWR6F2HTMJ/3zWlwUs79lC4jZtiUQqV7aHJEAbAn0A9O4o
 Nm0PbN7Q0uYTcyNLXHHkAhd0fKl0y7zHZ7vdJn4=
X-Google-Smtp-Source: ABdhPJyUszWiuobnzOy5L9VplXiMBG9qLzJjbpbR0WfzIFw8cspGiZ3PnAV6tV3oDvUEgCvPn/rTmcBK9mwiyYTq9ws=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr1331345qkc.66.1621467800517; 
 Wed, 19 May 2021 16:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-5-quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-5-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 May 2021 23:43:08 +0000
Message-ID: <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> With Tx done w/wo ACK are ack'ed early at beginning of irq handler,

Is w/wo a typo? If not, please write the full words ("with and without")

> it is observed that, usually, the Tx done with Ack irq raises in the
> READ REQUESTED state. This is unexpected and complaint as below appear:
> "Unexpected Ack on read request"
>
> Assumed that Tx done should only be ack'ed once it was truly processed,
> switch to late ack'ed this two irqs and seen this issue go away through
> test with AST2500..

Please read Guneter's commit message
2be6b47211e17e6c90ead40d24d2a5cc815f2d5c to confirm that your changes
do not invalidate the fix that they made.  Add them to CC for review.

Again, this is a fix that is independent of the ssif work. Please send
it separately with a Fixes line.

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
>
>  drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 3fb37c3f23d4..b2e9c8f0ddf7 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>
>         spin_lock(&bus->lock);
>         irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -       /* Ack all interrupts except for Rx done */
> -       writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> +       /*
> +        * Ack all interrupts except for Rx done and
> +        * Tx done with/without ACK

Nit: this comment can be on one line.


> +        */
> +       writel(irq_received &
> +              ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>         irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
> @@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>                         "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>                         irq_received, irq_handled);
>
> -       /* Ack Rx done */
> -       if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
> -               writel(ASPEED_I2CD_INTR_RX_DONE,
> -                      bus->base + ASPEED_I2C_INTR_STS_REG);
> -               readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -       }
> +       /* Ack Rx done and Tx done with/without ACK */
> +       /* Note: Re-use irq_handled variable */

I'm not sure what this note means.

> +       irq_handled = 0;
> +       if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
> +               irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
> +       if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
> +               irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
> +       if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +       writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);

Are you intentionally only acking the bits that are set when we read
from STS_REG at the start of the handler? If not, we could write this
instead:

writel(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
ASPEED_I2CD_INTR_TX_NAK,
        bus->base + ASPEED_I2C_INTR_STS_REG);

If you only want to ack the bits that are set, then do this:

  writel(irq_received &
            (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
ASPEED_I2CD_INTR_TX_NAK),
         bus->base + ASPEED_I2C_INTR_STS_REG);

That way, you can avoid all of the tests.

> +       readl(bus->base + ASPEED_I2C_INTR_STS_REG);

When you move this, please add a comment that reminds us why we do a
write-then-read (see commit c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a).

> +
>         spin_unlock(&bus->lock);
>         return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
> --
> 2.28.0
>
