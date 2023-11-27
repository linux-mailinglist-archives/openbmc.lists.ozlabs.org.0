Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 344027F9A7B
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 08:05:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z1dHd5bX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdxSV0Tdkz3cSN
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 18:05:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z1dHd5bX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdxRs0HBVz3bTt;
	Mon, 27 Nov 2023 18:05:12 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00c200782dso555694366b.1;
        Sun, 26 Nov 2023 23:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701068703; x=1701673503; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njKIqe2mNiRdX5LaAFqRQiCwPnpSDRZxDJdhCHqWXjY=;
        b=Z1dHd5bXkZvGmgQZ7PbfbRXRKFWvueKWCIYNbhu3l6PkBIuIfl3B1w61aieIouhBoz
         9kbxUDu2+a3RLcwqrMdOfsXXXjeNsGNsgaX6IMNAb1rDlOLJJ8VGS1lSECVWQCM5buBs
         flzAX5uuJ8PbTO3pRL9TxKaRVbHU3xyYyveb51FVmbAyy9O/3ZYjtgj6lYEcZURYp1JW
         3bLwOoBAdx/sohT7RUByUfZ9eTgACQ1kUVcwBjYiV4qkhrYkAM+4c/FjtjqCz0b6abCJ
         DQ4orlWujWbP0dYD7iirErQJaDns2qTawrqOI0cNzB2OExGEADKvUW4WyJBxR6Ts8PzC
         a4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068703; x=1701673503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njKIqe2mNiRdX5LaAFqRQiCwPnpSDRZxDJdhCHqWXjY=;
        b=Qde68aFQ3qjAQMVAg6936L0kRb3cI/wHi8rNZlro7i5JIRcFuj8R/kRECox7xusk9t
         WHdoYeuxxRJSY2WU90h3SR4ItWqj5g0dREWEebtPvD7pUtc9e9hurJQiRqNJiRqSvvvh
         iRV6jX89I5zpLCVFqDb/xiAkrL4UiK9gZhBbMVvJcK5NbCIQgxp1WDZUpp4onYrJG7fr
         Mh3CMKLGpzoYQfCjc4QCCpDEptssB6TivW0sztn95al4QoQGBubsAPG5sbc9w8/JVRjq
         qu91GT/aAEnvPM1meZqVh715NutvpvOWuEBVh/jpYqRY1ndBPUe4N1S1X+5hAzQNP1RP
         jS+A==
X-Gm-Message-State: AOJu0Ywu3IO44AsUNLX30LiDEx9ZuV6BmG/Kq1B1xYVJWB0YNFKJ1hGS
	iSXtgDJQvMIzDV+YXep+uKFGqVcKix19Fni0GN8=
X-Google-Smtp-Source: AGHT+IGxqUO5X+l6WGxxe/nXpbFmqbv3pQHqKJ3PxzE2p4nS4DzebTb7Js9cjbYVIzm9Dcn6VgNxA/Er0b8cuJFP/4s=
X-Received: by 2002:a17:906:66c1:b0:9ff:77c2:e67f with SMTP id
 k1-20020a17090666c100b009ff77c2e67fmr7216953ejp.33.1701068702634; Sun, 26 Nov
 2023 23:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20231120091746.2866232-1-chou.cosmo@gmail.com> <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
In-Reply-To: <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Mon, 27 Nov 2023 15:04:51 +0800
Message-ID: <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in SLAVE_READ_PROCESSED
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: linux-arm-kernel@lists.infradead.org, jae.hyun.yoo@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, cosmo.chou@quantatw.com, joel@jms.id.au, linux@roeck-us.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
at 11:23 AM:
>
> On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> > commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> > in interrupt handler") moved most interrupt acknowledgments to the
> > start of the interrupt handler to avoid race conditions. However,
> > slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> > is handled.
> >
> > Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> > the problem that the next byte is not sent correctly.
>
> What does this mean in practice? Can you provide more details? It
> sounds like you've seen concrete problems and it would be nice to
> capture what it was that occurred.
>
> Andrew

For a normal slave transaction, a master attempts to read out N bytes
from BMC: (BMC addr: 0x20)
[S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]

T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L294
That is, BMC stretches the SCL until ready to send the 1st_B.

T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
the ISR, so that BMC does not stretch the SCL, the master continues
to read 2nd_B before BMC is ready to send the 2nd_B.

To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L302

Cosmo
