Return-Path: <openbmc+bounces-282-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1AAE6279
	for <lists+openbmc@lfdr.de>; Tue, 24 Jun 2025 12:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRLqf6gcCz30FR;
	Tue, 24 Jun 2025 20:32:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750761150;
	cv=none; b=a0zBCrrECR1dQG4atf0QZgQ/KvzjQKcrHASiR4VWa3y64CVySb7OhLI7hA6WYdR1SqT6pWwLi5gh53s6xpm7IdT4oHxkzfQD3LohGB0Qh7U1Az70ZkkJ+8TGmOvoBr1Xmu/jrkotOv9Kbbhyi331ZxhlfPN/8iWtDbDJNnwEY/31jmnM1Zk9qjGzVUZG+x2921V6hH2dvJbnxi6kRDHGPTAAIJ4unPDxlnNrRxWxIQCSZPhdVZDI5vQ5Uogj6AqRVT99dCENq66+nt79yf/cC5mOQtJ3qm7cEABauqhst4rc2GuObcJ/FBEwe40nOl+PdzSQC1rXBdS+URrx3VpbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750761150; c=relaxed/relaxed;
	bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B13xd0zH0hAGolzWS5s1dEKU9XB/wL8HgATG/do7yhMzvGLOIz4oi4emzxaSap+2VtJobfnEEm5oAm0SGPtDG31P7MP5B9y/tpYzacmoLKki6b7Pq0UOFwml9EElv0j1YsS+m5g0tgav3jpukCAAzxqWo/YRaJC++kH2LzSU7SXDDY2Ml05zgKhxdoDCUDnRuk+x/z6LOki1drmmgaNenwBdwmU3+metpieQji0tAB07Pd8Mc7ujBm5e6p6xREkX0z5inJPV61YicVAtCG6eXBci3yA+sFEqgHKGX/9CgEXtZF3wbvy1xN6thEdyE1RGyrm4E4TmeNSEhACqOG31RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=E2VhydlX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=E2VhydlX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRLqc5PTyz2xlK
	for <openbmc@lists.ozlabs.org>; Tue, 24 Jun 2025 20:32:27 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-73972a54919so4272747b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 24 Jun 2025 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750761145; x=1751365945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=E2VhydlXWGLH5VQPi4yM4mXxYX0g0/a2OpQUJYJ53LcInxnkTXrU6VyR3mDbszVezm
         3Q9ckvPNoPIGShJcIQYPFzV5H0E1MywKGzYyPnHcoP4gNxR4oW48K12BFyZqzYnpoH3b
         3IY9msjqscOIk4iNDPCMHa+WHec2/KfLzUj+wLsoW77KYhZ5vI34IDl4WTmmnvpRGksb
         QpZ5JNONc5ndZQWH2K4aChQi+FGNs7zpnbc9wCzKii5/QYpwhw2KzQVeUr/bu2q3aple
         Z6Dka7Xb/x7tMD3NVUKcL+8NhWnetlpCp11QkuR4yIXEfMf2pBZSheuV+dSg5v7g/2wj
         BAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761145; x=1751365945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=HsAN6mh1FfiHAFLs9ROMbjkvNLXYGgCsrs6QYS0bytytwnUP1zboTwI1UUgdxxMufZ
         XiPF/v2aMnpl+aRF9GV5cGMOiNegb7pLVRbPGO9vBTTXFMVfL1bIGG3IRp4DkDOzNDgi
         cYGwE///0nUcF+1mboW/csDigp8raKhPaPhoySHayalvVo/D6l7XrssqS1DFNfv7szya
         /Rfp2rBhxeuZ7vG2aMgM+e5ZlGXdHvfJAcoeaWusJb/Tv6duqGTwNgU69/qRmJVFGzXm
         mat15GDt4fzt8B7Zfrbt8NBZE4KEKt7ReNNY4/t10LktE0+bbIegRBlxKM/Nh6N13ltG
         9fLg==
X-Forwarded-Encrypted: i=1; AJvYcCXTkAYWJvBXjWM9Y14txmHc3LZuX8U1cMW7XV9oxexZN4LrcSUMjB/wUhd3wPI6dWSEg+Q3HuMU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJSB4Ze+vrmhzhPEHBVbQgebQynmwIW6WSdeNOno9IXrh3Fuch
	k9lZ3Uv2AQ90TI9C36BCjTnOZmCV0Ro22ddMiAqXgemMfKwiV84tctJ0vMI6+GZVr/U/tHXo6IR
	cWbEPiQyaEqpJaPFMHSoto2kd2sZcoZOy65UA0dqGhA==
X-Gm-Gg: ASbGnct4Y4qqVx9TzYlXA1CKu2QFJ+KCy/bOE/gH5Vc1ILxeGUTw2pBaVCPDTvA+ue4
	8GBIR9jcAUINz9+fuQpzP0KkpdoZwAh5DmYTiYOGJu8dpzLFP+Br4TtQ9mRmFgfyUggTH/P2V3R
	gz0Cgt0mMEjEsCVG/R2smnBFNA+tW3C/pdbxA62LThf0bnVyUuOUO8RQ1vlaaqtnyMY+8=
X-Google-Smtp-Source: AGHT+IH4g1PvpyLx7WVlvE2Rf2SzPuo0lTBgVHeaA3gkX79aw74S2PH91wSbnem7obavXSVF9XsoiTDpbAuofP1c8K8=
X-Received: by 2002:a05:6a20:9144:b0:1f5:7f56:a649 with SMTP id
 adf61e73a8af0-22026e92ae5mr23934878637.13.1750761145008; Tue, 24 Jun 2025
 03:32:25 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com> <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
In-Reply-To: <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 24 Jun 2025 18:32:14 +0800
X-Gm-Features: AX0GCFsx2E4YDWQnsy0elvsMGQiKKzms4nqUpfwtdkeIHeCrPd6S9MlAaN8RRsQ
Message-ID: <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: change debug level in irq handler
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andi Shyti <andi.shyti@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Paul;

Thanks for your reply and sorry for the late reply, I was trying to
figure out why this log occurred,
 it's quite hard to reproduce.

I traced all the master and slave states, and eventually found that
the behavior matches
the description in commit b4cc1cbba519. The issue has already been
fixed in that commit
 it was caused by a state machine bug that led to the interrupt not
being handled correctly.

see: https://github.com/torvalds/linux/commit/b4cc1cbba519

(The state transitions between the master and slave here rely on interrupts=
.
 When the signal waveform is incomplete (such as during power off/on),
it may cause state errors or brief unresponsiveness, resulting in some
log prints.)

On Thu, Jun 19, 2025 at 7:18=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Jian,
>
>
> Thank you for the patch.
>
> Am 18.06.25 um 12:21 schrieb Jian Zhang:
> > In interrupt context, using dev_err() can potentially cause latency
> > or affect system responsiveness due to printing to console.
> >
> > In our scenario, under certain conditions, i2c1 repeatedly printed
> > "irq handled !=3D irq. expected ..." around 20 times within 1 second.
>
> Any idea, why you hit this error at all?
>
> > Each dev_err() log introduced approximately 10ms of blocking time,
> > which delayed the handling of other interrupts =E2=80=94 for example, i=
2c2.
> >
> > At the time, i2c2 was performing a PMBus firmware upgrade. The
> > target device on i2c2 was time-sensitive, and the upgrade protocol
> > was non-retryable. As a result, the delay caused by frequent error
> > logging led to a timeout and ultimately a failed firmware upgrade.
> >
> > Frequent error printing in interrupt context can be dangerous,
> > as it introduces latency and interferes with time-critical tasks.
> > This patch changes the log level from dev_err() to dev_dbg() to
> > reduce potential impact.
>
> Thank you for the patch and the problem description. Hiding an error
> condition behind debug level is also not good, as administrators might
> miss hardware issues. I do not have a solution. Is there something
> similar to WARN_ONCE? Maybe the level should be a warning instead of
> error, because the system is often able to cope with this?
Yeah, I'm a bit unsure as well. Maybe I can use dev_err_ratelimited()?

>
> The code is from 2017, so should be well tested actually, shouldn=E2=80=
=99t it?
>
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > ---
> >   drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 1550d3d552ae..38e23c826f39 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >       switch (bus->slave_state) {
> >       case ASPEED_I2C_SLAVE_READ_REQUESTED:
> >               if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> > -                     dev_err(bus->dev, "Unexpected ACK on read request=
.\n");
> > +                     dev_dbg(bus->dev, "Unexpected ACK on read request=
.\n");
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_READ_PROCESSED;
> >               i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
> >               writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> > @@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               break;
> >       case ASPEED_I2C_SLAVE_READ_PROCESSED:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "Expected ACK after processed read.\n");
> >                       break;
> >               }
> > @@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               /* Slave was just started. Waiting for the next event. */=
;
> >               break;
> >       default:
> > -             dev_err(bus->dev, "unknown slave_state: %d\n",
> > +             dev_dbg(bus->dev, "unknown slave_state: %d\n",
> >                       bus->slave_state);
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> >               break;
> > @@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >
> >       /* We are in an invalid state; reset bus to a known state. */
> >       if (!bus->msgs) {
> > -             dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> > +             dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> >               if (bus->master_state !=3D ASPEED_I2C_MASTER_STOP &&
> > @@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >                       irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> >                       goto error_and_stop;
> >               } else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_AC=
K))) {
> > -                     dev_err(bus->dev, "slave failed to ACK TX\n");
> > +                     dev_dbg(bus->dev, "slave failed to ACK TX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_TX_ACK;
> > @@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               fallthrough;
> >       case ASPEED_I2C_MASTER_RX:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> > -                     dev_err(bus->dev, "master failed to RX\n");
> > +                     dev_dbg(bus->dev, "master failed to RX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_RX_DONE;
> > @@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               goto out_no_complete;
> >       case ASPEED_I2C_MASTER_STOP:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP)=
)) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "master failed to STOP. irq_status:0x%x\n=
",
> >                               irq_status);
> >                       bus->cmd_err =3D -EIO;
> > @@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> >               goto out_complete;
> >       case ASPEED_I2C_MASTER_INACTIVE:
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "master received interrupt 0x%08x, but is inactiv=
e\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> > @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void=
 *dev_id)
> >
> >       irq_remaining &=3D ~irq_handled;
> >       if (irq_remaining)
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "irq handled !=3D irq. expected 0x%08x, but was 0=
x%08x\n",
> >                       irq_received, irq_handled);
> >
>
>
> Kind regards,
>
> Paul

Jian.

