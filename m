Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1C987CCD
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 04:02:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFDH65DnLz3cMl
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 12:01:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727402511;
	cv=none; b=FBCBvktjUq+NIDVX8tNw3hqFGhIhdrPkGhhuA22dobJQAcKaJ83tAjM0fIwbZisrqsuPkdhhry3HeqB0uzBjFq51zZFaauvUh1t3QnVNWdE3o714g3DZsoOeD+vyqHz8xJj+pqPEpNHfbU2sSEetk+cU0lhCdum+4bFCkmH2E+2GtmhQ9yDz30J/vRxg264aOx/L4STBH+luS5R7+p8X/RTH/FqGBrXCOTeAyWl5FvcQXHEjnpoqENG7691M6JzkqdX/J7GbPGIdwVQzFSglRpq2iI30Q2XgMYce3Gj3zwz9BQ0Ma4XRHogdOToWwfqxKVaAlQX5HH9GSkL2PfKuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727402511; c=relaxed/relaxed;
	bh=rkTECjsLGOP17IwUdNFjlpHyC8AHloYdla7ykRMJQA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaI3aZa/72udkZwWPssJbq+F6yPQu6GCIhyxdGVuiw4Dh/H1EQtWzSj3SSHpMpmY1TZCgDJDzeq7XZ5A1bwE97B9l9aaOVL6CKSUl5n8ahWpD2AvdUsLs0UM2X/Da4mb/elsY+D2+QUq2N485lFDHBA4iiT+Z6OWInG+DNWImkEAp8M5rm0SfrxbQnsLd/bFzYQHADtkYKOIpx9mF6Tz1g4WOz/j6dCZV8fDbUgul0XLffsYgQ7Vi3cT97OJdGnFUJTt5ms6l1ugOhD33EW3QH+SVrmVfa5HOUbHP1IQin9QLyLK1f0wxa2iAZ2/y+vkV/1fOwiRS4BwM4swIyE1qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i430nO8y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i430nO8y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFDH30H5Vz2yj3
	for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2024 12:01:50 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so462410766b.0
        for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 19:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402508; x=1728007308; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkTECjsLGOP17IwUdNFjlpHyC8AHloYdla7ykRMJQA0=;
        b=i430nO8yuxNRhqBeBn4YrlZ1ItSZQWQUFxvLPC1FbCLIrqLsUmArwLr7RBCtpdoTal
         h4Gh+03IEpnmJgYWTmFzyPFO7zGvn1c+7v+wKHYVsDULVjKbmFuuT9psOFT+Li2+RmSw
         Je0yi7s2A9RVtK9r49vYWd/kLkvybv/41N0pew2mrJ3EMy+ZEt7M86gd7lMPAV+EnuxV
         yqEGY7W7lNtO7NCurH74eVImZV7LcNzjRizJmwVy6e2D+/V7QXlSA20sK1hXtdcCVjhn
         go3lPlMsmn2OBRuX79FYW2e5yk10KJGo8HAPgFpBl4yqwnzkAyqNzu5KN8M5/UJlAPwb
         StPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402508; x=1728007308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkTECjsLGOP17IwUdNFjlpHyC8AHloYdla7ykRMJQA0=;
        b=bCEtYjD/ROBPF3JifUZSC8aXZoS/huSb77yP2D+1yZefwyiruDJuUlebJHNdnAjNbN
         l/hD/52Hva+xfNODZxKBwctAhYbHplFAUfIPGHOGM0bQyW+ZUM0Lwt3xPWugKFyJyXSR
         UwRlrKv+IxwPoXbOXNDRKOaGgqldJwSmRmcYxUwTKKwJ1WMp6jqoUEqCs1Z83/xdZTTX
         HXeBs0JHsVrNT84AJu/jQEeL9Y7MlxCgqQtuYNLso/L2H2nvgQlxW8kac6R4qrtniBAO
         z564HMERUcMEKOXs641yByYjNJmUyvWlVzhK+2bkkvw43U2YsFXMsNnjgRBOykNqN3ok
         VXAA==
X-Forwarded-Encrypted: i=1; AJvYcCVy9sZ6TX/edYDOqKc9TpvfmqUH+0Jtt4YAmB4uGU0pJ20icyAxJcew+YinWkERLNXynPn4gaCJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDRZAZrTSCJ+OTUC0f6eBduT2S6ePbAdLpABoWFh6SY2dSg9AJ
	p2N8CV1eeZCMdl1rARbonSo9bw9PVNy/RkX82oJzVkp0DwBAAbUzp7k9ZftPKJJUcX4JSeOQH7b
	ezbfnGm49ta7uNMRtgY4QwcAJ/w==
X-Google-Smtp-Source: AGHT+IEZoctL8CVImNJMZdfqDrbfmGmv0+KZg1Q9jtDnJdIOA4H9s6GPic5UlvyL1JjK5tLPN+4Y+w5mAOimJVKqtg8=
X-Received: by 2002:a17:907:d1a:b0:a8d:592d:f56 with SMTP id
 a640c23a62f3a-a93b167a9ffmr512809166b.31.1727402507806; Thu, 26 Sep 2024
 19:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-3-kfting@nuvoton.com>
 <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
In-Reply-To: <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 10:01:36 +0800
Message-ID: <CACD3sJZuy_6e8hgY9_+gJpHFpOZx_KY=hAb9CY0PtqYP=FMhMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER condition
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your feedback.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> patch looks good, but...
>
> On Fri, Sep 20, 2024 at 06:18:16PM GMT, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > If not clearing the BB (bus busy) condition in the BER (bus error)
> > interrupt, the driver causes a timeout and hence the i2c core
> > doesn't do the i2c transfer retry but returns the driver's return
> > value to the upper layer instead.
> >
> > Clear the BB condition in the BER interrupt and a software flag is
> > used. The driver does an i2c recovery without causing the timeout
> > if the flag is set.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2b76dbfba438..2d034503d8bc 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -334,6 +334,7 @@ struct npcm_i2c {
> >       u64 nack_cnt;
> >       u64 timeout_cnt;
> >       u64 tx_complete_cnt;
> > +     bool ber_state;
>
> I need some comment here, what is this ber state? You described
> it in the commit log, but people won't be browsing much of the
> commit log rather than the code itself.
>
> You could perhaps mention the meaning as:
>
>         bool ber_state; /* brief description */
>

Understood. I'll add some descriptions.

> and...
>
> >  };
> >
> >  static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
> > @@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i=
2c *bus)
> >       if (npcm_i2c_is_master(bus)) {
> >               npcm_i2c_master_abort(bus);
> >       } else {
> > +             bus->ber_state =3D true;
> >               npcm_i2c_clear_master_status(bus);
> >
> >               /* Clear BB (BUS BUSY) bit */
> > @@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_ada=
pter *_adap)
> >               dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not s=
tuck",
> >                       bus->num, bus->dest_addr);
> >               npcm_i2c_reset(bus);
> > +             bus->ber_state =3D false;
> >               return 0;
> >       }
> >
> > @@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_ada=
pter *_adap)
> >               if (bus->rec_succ_cnt < ULLONG_MAX)
> >                       bus->rec_succ_cnt++;
> >       }
> > +     bus->ber_state =3D false;
> >       return status;
> >  }
> >
> > @@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >
> >       } while (time_is_after_jiffies(time_left) && bus_busy);
> >
> > -     if (bus_busy) {
> > +     if (bus_busy || bus->ber_state) {
>
> /*
>  * Check the BER (bus error) state, if it's true means that blah
>  * blah blah, while when it's false blah blah blah and we should
>  * or should not do blah blah blah
>  */
> if (bus_busy || bus->ber_state) {
>         ...
> }
>

Understood. Your comments will be addressed.

> Thanks,
> Andi
>
> >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> >               npcm_i2c_reset(bus);
> >               i2c_recover_bus(adap);
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone
