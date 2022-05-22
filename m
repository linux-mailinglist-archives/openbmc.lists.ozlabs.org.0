Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E665308D7
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65dz0nkBz3bkH
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dl7Ft5A/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a36;
 helo=mail-vk1-xa36.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dl7Ft5A/; dkim-atps=neutral
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5WTw0D8Pz300x
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 16:56:49 +1000 (AEST)
Received: by mail-vk1-xa36.google.com with SMTP id u188so105127vku.3
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 23:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qDo9UUCdw4SMj2aM3ERRiVJpDYvO4JgoJi8WdLoZ0lU=;
 b=dl7Ft5A/2X6nUPIBbpqjdW58KNi+xMUoc3zBFTctHHzVONK2CleyYzTWzBi/tDqjiU
 ngBC6pjX9j2B8a4/cHW3x51cqt96agpMOEbL25qEyOhW8WoeaIi4CaqNhxFMoknQqmgX
 Hb92DxvrvrrhyWTQvtBtnpikiCAPoxZYtU0r1Er+KQ7pW9Di4NzF3qO/EB3Fgv6DRroc
 tdToxaiNPp9FWXeYERnMhDVYlPxaO29Q4rdHUVWACuFXi7QauT/ZgeUE6UXika1MryAS
 w+yaEXyIB1vEU7MFvH4ifImAxayMZvQFqJ3jRsn1yM+6XxwcfZA/t9Iad9SzKx1Ftvt4
 aMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qDo9UUCdw4SMj2aM3ERRiVJpDYvO4JgoJi8WdLoZ0lU=;
 b=F+Oxt+my26hNf4OdysABS4jKQfLo7J5E3bGeKmv4F3R38LhY3R7OTRvQSlHTeoczJs
 UIZwJ2qMvruVmVp8VjAT8y0pgqiXu3/i5Qy8+kqVyYLijWb7SX4RR3Zc82Yqm5U6lptH
 MAEwnyOsMyqMxPW+S5AQbVfz500WddbQpSbFgJvPNgbENXhFkTRdat2Vyuh6zvdS+Kt6
 2mSrHlbQkxvym6aKcwGu8KGsnu2AxK7gqgYVQ9VLELV9J7N7lRPE6ymZNY1JQ1ANBME/
 hy1hJob7WZBM6Xf/wR/PM4dNAPnvw0FGMT7zxKRLJDnXeGMbUPrf0lJ+toopX/OLz0Ea
 08xw==
X-Gm-Message-State: AOAM5312JUEM58PbP8294fXlpwQKfr/LU8h/b/zJPHHyrZwmLE+2WXch
 Z8fXWEeb1prl9XIsVXllVzI8SPRJtTlNdLjozBg=
X-Google-Smtp-Source: ABdhPJzSFsR0sEXSSM5qtNrvyCk4BshQuchdzAr1Kwogd9LEeS00mSfb8t/DqERH2KTXWr8GoqbKL8OpiYoYlSFsncY=
X-Received: by 2002:a1f:1d11:0:b0:357:733d:a6d with SMTP id
 d17-20020a1f1d11000000b00357733d0a6dmr1374013vkd.26.1653202607265; Sat, 21
 May 2022 23:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-9-warp5tw@gmail.com>
 <Yoh/nEYPu++LZSvb@shikoro>
In-Reply-To: <Yoh/nEYPu++LZSvb@shikoro>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 22 May 2022 09:56:36 +0300
Message-ID: <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: npcm: Remove own slave addresses 2:10
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
 krzysztof.kozlowski+dt@linaro.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jarkko.nikula@linux.intel.com, 
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev, 
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de, 
 olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>, 
 Avi Fishman <Avi.Fishman@nuvoton.com>, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 May 2022 15:30:44 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Sat, May 21, 2022 at 8:58 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> > NPCM can support up to 10 own slave addresses. In practice, only one
> > address is actually being used. In order to access addresses 2 and above,
> > need to switch register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature removed support of SA >=
> > 2. Also fix returned slave event enum.
>
> Is the spinlock contention so high? The code paths do not really look
> like hot paths to me. A bit sad to see this feature go.
>

The module has two seperate banks, accessible with a bit change. The
first one is used
for most of the runtime operations. Second bank is used mostly during init.
Unfortunetly, the first two own slave addresses are in the first bank
and the other
8 are in the second bank.

Every time the module switchs from master to slave mode, those
registers are accessed.
In theory, a spinlock can be used to protect those registers.
In practice, none of our customers use the extra addresses.
In fact they only need one.

The driver also does not allow you to register more then one slave per bus,
so this HW feature was not fully available to begin with.

So when we encounter a deadlock with this spinlock we decided to get rid of this
unused feature and get both a stable fix for the issue + performance benefits.
We work closely with all our customers so we know that this HW
feature is useless to them.

> >  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> >       NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> >       NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
>
> Why do we keep this array if we drop the support?
>
This array represents the HW so we left it as-is. But I agree it can
be shortened to one\two.

> > @@ -604,8 +602,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
> >                       i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
> >               iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
> >               return 0;
> > -     }
> > -     if (addr_type == I2C_ARP_ADDR) {
> > +     } else if (addr_type == I2C_ARP_ADDR) {
>

addr_type type can be one of several options.
The code was
if (addr_type is 1st option)
...
if (addr_type is 2st option)
...
etc.

Adding that else is more accurate, but ommiting this change works as well.

> I might be wrong but this looks like a seperate change?
>
> > @@ -924,11 +918,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
> >       for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
> >               if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
> >                       break;
> > -             i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> > +             if (bus->state == I2C_SLAVE_MATCH) {
> > +                     i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> > +                     bus->state = I2C_OPER_STARTED;
> > +             } else {
> > +                     i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> > +             }
> >               ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
> >               bus->slv_wr_buf[ind] = value;
> >               bus->slv_wr_size++;
> > -             i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> >       }
> >       return I2C_HW_FIFO_SIZE - ret;
> >  }
> > @@ -976,7 +974,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
> >       if (nwrite == 0)
> >               return;
> >
> > -     bus->state = I2C_OPER_STARTED;
> >       bus->operation = I2C_WRITE_OPER;
>
> This is definately a seperate change!
>

OK, we will move the last two to a separate patch. BTW, this change
appears in the title as well.

But now I'm not sure: if you already apply for-next patches [1:7], and
we change patch [8:10]
do we need to re-submit [1:7]?

> All the best!

Thanks, Wolfram, for your review!
Much appreciated

Tali
