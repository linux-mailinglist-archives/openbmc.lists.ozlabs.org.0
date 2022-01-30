Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B94A34FC
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 08:47:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jmjw34R5cz3bY0
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 18:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cDs69FRl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cDs69FRl; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jmjvg2N7Rz2xRp
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 18:47:09 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id e17so1218856qvb.8
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 23:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=npCjjwPovRha/N7OPY5Pt5Y8ZEDPZK+wTLJ4YtCTeD4=;
 b=cDs69FRlDNvFX3X+sBEAC9SL+ZNmal9A+aBP3aMK0y+MdRQUQuJVUznv/vLJDO0Piu
 SiUfz2fEY+0QaQ+WTD78QuPmQKz5Rf/rsI0Dcw8dC7i3m0tZtyi4EcWCXfD0c8Oia6om
 CFzJXVyyAiERR2oDepaLqPP/fIhN5jo15zLDyn44kUoy3eHgEOp8Wsr+QFwRU6e7AUb7
 u7V1BVCY4RtLY1YDKG6eSWy9Zknm8RDZNhv1eBRBteoGGrDOvzJuQYdqG7TwWbh14E9J
 b6n93Vahqd+nx9MPuUK00h4O9C9IR9j0fL4LRQjnH9NkiBagWqV1NWYhu1SFKOLUNM6/
 gCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=npCjjwPovRha/N7OPY5Pt5Y8ZEDPZK+wTLJ4YtCTeD4=;
 b=nBNdkbUys2jtwtigNUeNxz+MLFiuD1xZB3qGM1Asx3iKscDB5avqZH3ptJ8hbZN5Zx
 bzO36p6sCGx8M8I92MyiuRLYyQgPbY1v8qOqxZpnM5Q7Of9W8vou2ehuRUwFt9XKyRlC
 3DzqVWtS0GQ+D00rqvjQco461yafPBYUhQ+e29MBLPrUcr5qR4D8pI3OAW5iK8GnsYul
 0hmYS9UeFvert4URGr8Q3ceaU6hyQQYYHUujHkKQVcpUEThgeDbFxYP9+NDoaYXuBOFU
 8OAhnELvQ/dvnUAnGnIbAlMFjIPCYOwmESNk026khhrCBMcncxa+ZR1twujrt9WWuhgx
 KL7g==
X-Gm-Message-State: AOAM530tpqgHzVCmaZFuUc2M9WWS9hPHn/8HbfU+byV2XuTZEVTW7kZm
 Gu4EI6OQIFVi2xGuPWFlii3C5H0gECzKC62kP7A=
X-Google-Smtp-Source: ABdhPJwtWn0MO25kdPw0LJuGltLQ9hXEmZkm48vzz0cfgumCsybfKkx4jTDFfdrB7DQCnNF9vhV7tQLXyoYBiRRIVhM=
X-Received: by 2002:a05:6214:1bc5:: with SMTP id
 m5mr13249076qvc.4.1643528825725; 
 Sat, 29 Jan 2022 23:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
 <c2ec8677-e7a2-c9cd-b291-9785e7e2800c@infradead.org>
In-Reply-To: <c2ec8677-e7a2-c9cd-b291-9785e7e2800c@infradead.org>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 30 Jan 2022 09:46:55 +0200
Message-ID: <CAHb3i=vxghPw57Z=aEe-ns=LaD69eYyCv5VqbKBaARn9ZLfL8w@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: Fix typos
To: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Benjamin Fair <benjaminfair@google.com>, kfting@nuvoton.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: tali.perry@nuvoton.com

Thank you very much !

On Sat, Jan 29, 2022 at 6:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/29/22 01:39, Jonathan Neusch=C3=A4fer wrote:
> > The comments in this driver have a few typos. Let's fix them.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2ad166355ec9b..71aad029425d8 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -781,7 +781,7 @@ static void npcm_i2c_set_fifo(struct npcm_i2c *bus,=
 int nread, int nwrite)
> >               /*
> >                * if we are about to read the first byte in blk rd mode,
> >                * don't NACK it. If slave returns zero size HW can't NAC=
K
> > -              * it immidiattly, it will read extra byte and then NACK.
> > +              * it immediately, it will read extra byte and then NACK.
> >                */
> >               if (bus->rd_ind =3D=3D 0 && bus->read_block_use) {
> >                       /* set fifo to read one byte, no last: */
> > @@ -981,7 +981,7 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bu=
s, u16 nwrite,
> >  /*
> >   * npcm_i2c_slave_wr_buf_sync:
> >   * currently slave IF only supports single byte operations.
> > - * in order to utilyze the npcm HW FIFO, the driver will ask for 16 by=
tes
> > + * in order to utilize the npcm HW FIFO, the driver will ask for 16 by=
tes
> >   * at a time, pack them in buffer, and then transmit them all together
> >   * to the FIFO and onward to the bus.
> >   * NACK on read will be once reached to bus->adap->quirks->max_read_le=
n.
> > @@ -1175,7 +1175,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(str=
uct npcm_i2c *bus)
> >                               /*
> >                                * the i2c module can response to 10 own =
SA.
> >                                * check which one was addressed by the m=
aster.
> > -                              * repond to the first one.
> > +                              * respond to the first one.
> >                                */
> >                               addr =3D ((i2ccst3 & 0x07) << 7) |
> >                                       (i2ccst2 & 0x7F);
> > @@ -1753,8 +1753,8 @@ static void npcm_i2c_recovery_init(struct i2c_ada=
pter *_adap)
> >       /*
> >        * npcm i2c HW allows direct reading of SCL and SDA.
> >        * However, it does not support setting SCL and SDA directly.
> > -      * The recovery function can togle SCL when SDA is low (but not s=
et)
> > -      * Getter functions used internally, and can be used externaly.
> > +      * The recovery function can toggle SCL when SDA is low (but not =
set)
> > +      * Getter functions used internally, and can be used externally.
> >        */
> >       rinfo->get_scl =3D npcm_i2c_get_SCL;
> >       rinfo->get_sda =3D npcm_i2c_get_SDA;
> > @@ -1768,10 +1768,10 @@ static void npcm_i2c_recovery_init(struct i2c_a=
dapter *_adap)
> >
> >  /*
> >   * npcm_i2c_init_clk: init HW timing parameters.
> > - * NPCM7XX i2c module timing parameters are depenent on module core cl=
k (APB)
> > + * NPCM7XX i2c module timing parameters are dependent on module core c=
lk (APB)
> >   * and bus frequency.
> > - * 100kHz bus requires tSCL =3D 4 * SCLFRQ * tCLK. LT and HT are simet=
ric.
> > - * 400kHz bus requires assymetric HT and LT. A different equation is r=
ecomended
> > + * 100kHz bus requires tSCL =3D 4 * SCLFRQ * tCLK. LT and HT are symme=
tric.
> > + * 400kHz bus requires asymmetric HT and LT. A different equation is r=
ecommended
> >   * by the HW designer, given core clock range (equations in comments b=
elow).
> >   *
> >   */
> > --
> > 2.34.1
> >
>
> --
> ~Randy
