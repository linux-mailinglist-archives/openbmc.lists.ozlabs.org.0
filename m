Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447FD03F4
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 01:16:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ntWr0jzYzDqKw
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 10:16:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XlU2sto5"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ntVv1mW2zDqHb
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 10:15:33 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id u12so73428pls.12
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 16:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ElRJeyhKKsOWRNeX29+OvPdp21SCBqlQ+7xzxKQTQog=;
 b=XlU2sto5s6pRQEduFFGr41SzIAZYwYciIK3xC5wPc1mqpWq4KVBPYUz7saTs84Q0FS
 q+A//aofU8AJiqFFarBV3VI/Fh6iCHSwqVyIR8HpljvlfSMV15RETN0+6dlRlZv6ktLC
 nMyr0PwfyUEJWeQa7dtqrmRHAfF/LD5xQBldMwWhyEfFVnC/MoaH615NYeaXt9lbnoVW
 YlCnqdsEb3jh7x2gVJGNfgtzy9Ar8y1hXTZ3Ozh8Td6RUDAeKcrsyxhCozXupfanqAkx
 znl7lpdSvbb4h5IjLjutjV+7Sbb61oeXyfC0wvEww1KbwFaESiVyCJjzc4PBEN6LNfQB
 2LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElRJeyhKKsOWRNeX29+OvPdp21SCBqlQ+7xzxKQTQog=;
 b=oIMcud04xcCGgJaBTYqgFZhfMAyj91S0ZwEiQv3zj1Sg+4DiKFeORRj6VwKI0aNgmU
 cj6THGJlNuHrZxTxSppGsuX573Uqdw8z5jBpNDp7HMnzMKZJ41/hZ4FDtx14lJ7WwBTa
 r77RVt67YKxoOHv5NOTdxjPNjrXWgZ+bfoZBsegpdK4T1mhAqx+ue3p658RIr7EdfA+H
 MPVohKwhy/Fe2woa6HR+Gr1bwbPiKGWJBORvvSKg3nqham4WOxEwNdeLt+VzGdqhFqGi
 8xGcGhmSomsb8gnQu1lEhclzob2SB+2mSIlGgfj1ABN8f36uyezZggjPfzolJiD2qYlE
 H/0g==
X-Gm-Message-State: APjAAAXbEM5c9juG52qANKJAu+V8sDR+4bQpxp+gMgsXq+s5kwxiZlSR
 0kfq4Awxfpb7lu7DpyPPZh4RNoO+9mFbMRuIns4HbA==
X-Google-Smtp-Source: APXvYqwwsu/BPIrkCBkEQf4DaZGZnRecPlzEl0anYZMVd06nlI1KDOrUxydhA8gxjHRLobO6utBmN6PYcgD37BIpuus=
X-Received: by 2002:a17:902:7282:: with SMTP id d2mr16453pll.325.1570576530918; 
 Tue, 08 Oct 2019 16:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-5-jae.hyun.yoo@linux.intel.com>
 <20191008201254.GC155928@google.com>
 <29436b73-3473-d34d-0c7a-6f78ff077002@linux.intel.com>
In-Reply-To: <29436b73-3473-d34d-0c7a-6f78ff077002@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 8 Oct 2019 16:15:19 -0700
Message-ID: <CAFd5g4522cSkS_-aJHjc3fqM9nYRjs4DmQx9te3PcPMh8WEMBg@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: aspeed: add buffer mode transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 8, 2019 at 2:10 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Brendan,
>
> On 10/8/2019 1:12 PM, Brendan Higgins wrote:
> > On Mon, Oct 07, 2019 at 04:13:12PM -0700, Jae Hyun Yoo wrote:
> >> Byte mode currently this driver uses makes lots of interrupt call
> >
> > nit: Drop "Byte mode".
>
> 'Byte mode' is one of modes which is described in the datasheet.
>
> Would it be better if I change it like below?
> "This driver uses byte mode that makes lots of interrupt call ..."

Yeah, I think that would probably be clearer.

> >> which isn't good for performance and it makes the driver very
> >> timing sensitive. To improve performance of the driver, this commit
> >> adds buffer mode transfer support which uses I2C SRAM buffer
> >> instead of using a single byte buffer.
> >
> > nit: Please use imperative mood.
>
> I used imperative mood in commit title. The commit message is okay as it
> is.

Hey, that's just what I have been told in the past. I don't actually
feel strongly about it though. If no one else cares, then it is fine.

> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> Tested-by: Tao Ren <taoren@fb.com>
> >> ---
> >>   drivers/i2c/busses/i2c-aspeed.c | 297 ++++++++++++++++++++++++++++----
> >>   1 file changed, 263 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> >> index 40f6cf98d32e..37d1a7fa2f87 100644
> >> --- a/drivers/i2c/busses/i2c-aspeed.c
> >> +++ b/drivers/i2c/busses/i2c-aspeed.c
[...]
> >> @@ -238,6 +260,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
> >>   {
> >>      u32 command, irq_handled = 0;
> >>      struct i2c_client *slave = bus->slave;
> >> +    int i, len;
> >>      u8 value;
> >>
> >>      if (!slave)
> >> @@ -260,7 +283,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
> >>
> >>      /* Slave was sent something. */
> >>      if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
> >> -            value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
> >> +            if (bus->buf_base &&
> >> +                bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
> >> +                !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
> >
> > I think checking for the buf_base all over the place makes this really
> > complicated and hard to read.
> >
> > It might be better to just split this out and have separate handlers
> > based on what mode the driver is running in.
>
> I think you're saying about splitting this irq handler out to:
> aspeed_i2c_slave_byte_mode_irq()
> aspeed_i2c_slave_buffer_mode_irq()
> aspeed_i2c_slave_dma_mode_irq()
>
> Yes, I can do like that but it will bring us two bad things:
> 1. It makes big chunks of duplicate code because most of interrupt
>     handling logic is the same.
> 2. If we are going to change something in irq routine, we need to
>     touch all irq routines if the change is commonly used.
>
> I think, the way this patch uses is better.

I think there are other alternatives. For example, I think you could
abstract over the buffer reading mechanism here.

We might have a method on aspeed_i2c_bus called handle_rx_done() or
something like that which could get called here.

I just really don't want to grow the McCabe's complexity of this
function much more, it is really too high as it is. Nevertheless, I am
open to other suggestions on how to improve this function.

> >> +                    value = readb(bus->buf_base);
> >> +            else
> >> +                    value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
> >>              /* Handle address frame. */
> >>              if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
> >>                      if (value & 0x1)
> >> @@ -275,6 +303,20 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
> >>
> >>      /* Slave was asked to stop. */
> >>      if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> >> +            if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
> >> +                irq_status & ASPEED_I2CD_INTR_RX_DONE) {
> >> +                    if (bus->buf_base) {
> >> +                            len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
> >> +                                            readl(bus->base +
> >> +                                                  ASPEED_I2C_BUF_CTRL_REG));
> >
> > It looks like you have a lot of improvements in here unrelated to adding
> > support for buffer mode.
> >
> > I really appreciate the improvements, but it makes it harder to
> > understand what buffer features you are adding vs. what
> > improvments/modernizations you are making.
> >
> > Can you split this commit up?
>
> No, this isn't an improvement. This code will not be executed if
> transfer mode is byte mode. This is added because data handling pattern
> is different in buffer mode so the collected data in buffer mode should
> be sent when it recieves RX_DONE.

Oh sorry about that, I saw the switch to the
devm_platform_ioremap_resource below and saw all the FIELD_{GET|PREP}
and assumed that some of them were improvements. If
devm_platform_ioremap_resource is the only one, that's fine.

Actually, would you mind (in a separate commit), update the existing
usages to FIELD_{GET|PREP}? It's kind of jarring going back and forth
between them.

> >> +                            for (i = 0; i < len; i++) {
> >> +                                    value = readb(bus->buf_base + i);
> >> +                                    i2c_slave_event(slave,
> >> +                                                    I2C_SLAVE_WRITE_RECEIVED,
> >> +                                                    &value);
> >> +                            }
> >> +                    }
> >> +            }
> >>              irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
> >>              bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> >>      }
[....]
> >> @@ -990,6 +1180,45 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >>              bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
> >>                              match->data;
> >>
> >> +    /*
> >> +     * Enable I2C SRAM in case of AST2500.
> >> +     * SRAM is enabled by default in AST2400 and AST2600.
> >> +     */
> >
> > This probe function is already pretty complicated as it is. Can we move
> > this to a helper function (especially since it only applies to the
> > 25xx)?
>
> Okay, that would be better. I'll add this transfer mode setting logic
> as a helper function.
>
> >> +    if (of_device_is_compatible(pdev->dev.of_node,
> >> +                                "aspeed,ast2500-i2c-bus")) {
> >> +            struct regmap *gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2500-i2c-gr");
> >
> > So this memory is global, right? It is shared by all the busses?
>
> Yes, this is global register area which can be shared by all busses.
>
> > If I am reading this right, then I think we need to protect so that only
> > one bus is accessing this memory at a time.
>
> It will not be accessed at run time but only at probing time. Since we
> don't use multi-threaded probing, we don't need to protect it.

What if this is loaded as a module?

Also, it seems as though turning on SRAM should only happen once. Is
this correct?

> >> +            if (IS_ERR(gr_regmap))
> >> +                    ret = PTR_ERR(gr_regmap);
> >> +            else
> >> +                    ret = regmap_update_bits(gr_regmap,
> >> +                                             ASPEED_I2CG_GLOBAL_CTRL_REG,
> >> +                                             ASPEED_I2CG_SRAM_BUFFER_EN,
> >> +                                             ASPEED_I2CG_SRAM_BUFFER_EN);
> >> +
> >> +            if (ret)
> >> +                    sram_enabled = false;
> >> +    }
> >> +
> >> +    if (sram_enabled) {
> >> +            struct resource *res = platform_get_resource(pdev,
> >> +                                                         IORESOURCE_MEM, 1);
> >> +
> >> +            if (res && resource_size(res) >= 2)
> >> +                    bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
> >> +
> >> +            if (!IS_ERR_OR_NULL(bus->buf_base)) {
> >> +                    bus->buf_size = resource_size(res);
> >> +                    if (of_device_is_compatible(pdev->dev.of_node,
> >> +                                                "aspeed,ast2400-i2c-bus")) {
> >> +                            bus->buf_page = ((res->start >> 8) &
> >> +                                             GENMASK(3, 0)) - 8;
> >> +                            bus->buf_offset = (res->start >> 2) &
> >> +                                              ASPEED_I2CD_BUF_OFFSET_MASK;
> >> +                    }
> >> +            }
> >> +    }
[...]

Cheers
