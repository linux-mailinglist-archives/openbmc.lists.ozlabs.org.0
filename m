Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C211F3899DB
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flpwg5D91z302m
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:29:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HAOlx4M7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HAOlx4M7; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlpwP3L7bz2xb6;
 Thu, 20 May 2021 09:28:52 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id v8so14547056qkv.1;
 Wed, 19 May 2021 16:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+sRe31lrHGcUgSFKKGzM5XKzbij36J+nU6GLQsIGJJk=;
 b=HAOlx4M74XjBWQ8LN2fsuibOmX34Rxz0V7tqxzf7ZIWM+X+lRP/M7KyCNN/h19Q2ze
 ou41sL+m6NfWT9Y4u75hnp/iUQWwcpgGnc3lU4BxL1BpRf14BKJUseUHnAKYSRbMoIbB
 8WFQrW9H6mTEzhMJ8n8yJGvDHvomUkP+pmbBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+sRe31lrHGcUgSFKKGzM5XKzbij36J+nU6GLQsIGJJk=;
 b=Y6ZcTjOIFooI3FR3JKRq3bb4I8HiuWLCpeBrunZfQmrphiSN9VEIpy43SdCmGg4aop
 dl1NoTfBFJKcYw5fG9A0TxMLE6WINyLDp1sme28cRQ6vdahh4PRucpLCuCUTh+dd5O67
 2VxqSljRbHLBOOH5dUhjoi2q/sn/nmkniR1SNJSPlhd/njzbg3h9mSTWtbAdW1MxGz65
 5v+6twmR5T944FsD2BMSpxooFJJYGQgRK09uJ9Nhw+QTXFNmZldOrq9P/RyG9IVbaa+h
 H2vwBi9Y6IRP5yU/BLTmwz3a38QK1lpSNb285uUiQtZWKyrR6RaPNny43L7VQuDNOMgM
 OH4g==
X-Gm-Message-State: AOAM533HS0fTliRVoFuyhW3Iq/54+T2btJ0HTxfXT1ABEmFBInjxxD1L
 XAkMFR476sDLh22LytLLkU6ns/3zJIDF8V5qW5M=
X-Google-Smtp-Source: ABdhPJzs/PNVyZHXiN60/U4ROwriKRalRsyur5ioWhvG9uZxMJo/oQyw0WnlQ0RLEb2ucWzVwat0FQEtGAkFU+vY1FU=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr1279089qkc.66.1621466929079; 
 Wed, 19 May 2021 16:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-4-quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-4-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 May 2021 23:28:37 +0000
Message-ID: <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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

Ryan, can you please review this change?

On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> It is observed that in normal condition, when the last byte sent by
> slave, the Tx Done with NAK irq will raise.
> But it is also observed that sometimes master issues next transaction
> too quick while the slave irq handler is not yet invoked and Tx Done
> with NAK irq of last byte of previous READ PROCESSED was not ack'ed.
> This Tx Done with NAK irq is raised together with the Slave Match and
> Rx Done irq of the next coming transaction from master.
> Unfortunately, the current slave irq handler handles the Slave Match and
> Rx Done only in higher priority and ignore the Tx Done with NAK, causing
> the complain as below:
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. expected
> 0x00000086, but was 0x00000084"
>
> This commit handles this case by emitting a Slave Stop event for the
> Tx Done with NAK before processing Slave Match and Rx Done for the
> coming transaction from master.

It sounds like this patch is independent of the rest of the series,
and can go in on it's own. Please send it separately to the i2c
maintainers and add a suitable Fixes line, such as:

  Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
>
>  drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..3fb37c3f23d4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -254,6 +254,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>
>         /* Slave was requested, restart state machine. */
>         if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {

Can you explain why you need to do this handing inside the SLAVE_MATCH case?

Could you instead move the TX_NAK handling to be above the SLAVE_MATCH case?

> +               if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +                   bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {

Either way, this needs a comment to explain what we're working around.

> +                       irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +                       i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +               }
>                 irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>                 bus->slave_state = ASPEED_I2C_SLAVE_START;
>         }
> --
> 2.28.0
>
