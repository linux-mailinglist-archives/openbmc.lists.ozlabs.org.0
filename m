Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA82E0544
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 05:09:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0NBh47KLzDqQZ
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 15:09:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LcJ6hqjg; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0N9q6YcQzDqPR;
 Tue, 22 Dec 2020 15:08:28 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id b64so10862363qkc.12;
 Mon, 21 Dec 2020 20:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lferK7S/WcuZtuM8G00rHoo+wxuBCDmc8Awl4Gm4XE=;
 b=LcJ6hqjgmBAF3xenw/wLMRvZFXCxq5WfdX0WYJkCtYW+AWEWFGMR2Ejt+j75UFN9Zi
 Q7j6VLS5nIvfMZJLi6g6fT+oqP766/otVRSBnLMYqA/pqOAT2Ftt3DoM/ApQKlUHigkX
 3U8IrKrq1yuC7eIT12I4mjZ35Wwp16Y+R/Yl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lferK7S/WcuZtuM8G00rHoo+wxuBCDmc8Awl4Gm4XE=;
 b=F/A1Lvqnqu1DdMguRJ34ArWl/8HUPvq8XYPmm/QcCZfjEGVbMsd+Z9PILYdzLi5ROf
 N7XQ9O/Bxo4h5dH5OqWy8I2Xx0A/swx+rCPfq+IHWD5NQsCKfE9WVn7U9fuTlXc5o0uM
 t+Ygo0hYUME9Dv1Ng4MYYtbSujo6DQ3hfDj0f+cUIC8NVrH2GDVVO64aCBPCw4+MAIZx
 qRcdyfkUw8+wKlG7PQ3UfDeiJm18Qij7wluou9KBvhALhdvKc5zO9lIh1Aim1/3FZhyb
 GxODraM8PAUSBAEfGxJ7/+cGWsmhLeUp8ilvl8hWnfJU8lz2gJ6EBtTNoayS4WsZzS0q
 A4qg==
X-Gm-Message-State: AOAM531Nfi7U5qKUEHmfbX1/XUTVsAlvur7huh1Qcv5wJ1qyeiDEMbqO
 x5Y07Z1EYsT1c/qenmKTFydXCqvrFwF063Y3PNI=
X-Google-Smtp-Source: ABdhPJxOJe0aczqoEqz1cNRhFogu+B29Eal0/8X5iQGiNPeLLyhWKCYJdy4Trd8iFlfSL98eHlhm7D5RyKOBwJpQMIM=
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr20267871qkm.66.1608610104425; 
 Mon, 21 Dec 2020 20:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20200915184525.29665-1-zev@bewilderbeest.net>
 <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
In-Reply-To: <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 04:08:12 +0000
Message-ID: <CACPK8Xe9uPMHHkNGmUL+xm4MKBvOzNd-3bCLGc7UuZW_QkhUog@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Dec 2020 at 21:40, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Tue, Sep 15, 2020 at 01:45:25PM CDT, Zev Weiss wrote:
> >The ast25xx and ast26xx have, respectively, two and three configurable
> >slave device addresses to the ast24xx's one.  We only support using
> >one at a time, but the others may come up in an indeterminate state
> >depending on hardware/bootloader behavior, so we need to make sure we
> >disable them so as to avoid ending up with phantom devices on the bus.
> >
> >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >---
> > drivers/i2c/busses/i2c-aspeed.c | 50 +++++++++++++++++++++++++++------
> > 1 file changed, 41 insertions(+), 9 deletions(-)
> >
> > <snip>
>
> Ping...any thoughts on this patch?

Apologies for the delay, this one slipped through the cracks.

The rework is fine, and lends itself to supporting the other addresses
in the future. However, a simpler fix would be to construct reg 0x18
from zero, so only the functions that are supported are enabled.

static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
{
    u32 addr_reg_val, func_ctrl_reg_val;

    /* Set slave addr. */
    addr_reg_val = slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
    writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);

    /* Turn on slave mode. */
    func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
    func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
    writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
}

You could go further and ensure slave mode is always disabled unless
requested by clearing 0x18 when 0x00 is cleared at aspeed_i2c_init.

Cheers,

Joel

>
>
> Thanks,
> Zev
>
