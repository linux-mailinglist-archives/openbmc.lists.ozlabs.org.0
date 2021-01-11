Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C45102F10B9
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 12:00:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDrMS26gzzDqWk
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:00:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gy9HrkGM; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDrLW4rPWzDqWX
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 21:59:10 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id q1so2926860ion.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2wik1k8wO8Jyoif5d78A11nB/JTzooGqdkG0WG+ZVw=;
 b=gy9HrkGMIehrhbE9p6YUc2ea/bpZWfOAf9fzcbRi4U0/UVrE2g/n6SkrwltRdCLd9y
 G1aUkNDFy108nxvFNz1pYP/Y7DBzU8ro4/JZP9m+RSoD6Jit5IHjA5xHdvYK432UrpJF
 IgPk6hwBYpbbFS41HggvU0GgODPFQDobhQrJCy7TzgKb5Gthw+xg+nXITheSPR5zixmf
 PwCoMGD1ahmSfcff4Q+mcqxbi2IOy8bhi8hr0RBDssE6/KSllwvKQZF+M1/m0jWofZFv
 UslGO2ECkaWHdNm6MTZYX3tmlrZhOxtEwy40ElYfxjFiwhC0J7KApx79iwIcO5umRM4f
 atsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2wik1k8wO8Jyoif5d78A11nB/JTzooGqdkG0WG+ZVw=;
 b=tPOwek23O8VSPYnFt6uwXzTK1s0GPyGBK7n6YbMo3xrHkuO7fo9moi0f41ODl/YU5H
 XL7cRfxJPY9KL90dp/ZZNNXDE9t9s/OaxlEAD3TUgfzS3P1FT5WWo3ymUzF5oNjrJlIy
 tlUvCDBgYOmj8UIInyEYjxobusgAngygGJgOey5zMD0V1vnu8t2h7OOF2NMkSKHqKLqb
 cxMs0fNtAQGBDdmUywWDB9QmxmipNzh2yisVMR5he0pjEzblagqW2NAAscEJPMOqDbim
 xwXUPYfD/FAxJcVTu21dxOGm4F+pHld76dtqiWslctssP4UT6/PYc5/YbBwKz/HXMGJA
 JSxA==
X-Gm-Message-State: AOAM530d3l3OTIYJDqwMvufC6WF9SCZqSfqjqspKwLEPP4H8JfXvLWV4
 M8JRPkRTkuSAZbhdaHBpOlzBVtqR4J88OmrpxA==
X-Google-Smtp-Source: ABdhPJxl2NEdQMvWo83u+ctoQRm7cQJfbI57zV89ZOV2q6umb34TEhRmqH5Q0NVSuIRpmgBo2zWkkoN/OtxZk6WOa4A=
X-Received: by 2002:a05:6602:59e:: with SMTP id
 v30mr13809541iox.37.1610362746462; 
 Mon, 11 Jan 2021 02:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-10-tmaimon77@gmail.com>
 <CACPK8Xero9SneESq6c0HUkZcg0Eg-OJtZMKM2TDtvL_hx+UrwQ@mail.gmail.com>
In-Reply-To: <CACPK8Xero9SneESq6c0HUkZcg0Eg-OJtZMKM2TDtvL_hx+UrwQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 11 Jan 2021 12:58:31 +0200
Message-ID: <CAKKbWA58wLLot6Ed-9YC=YNwEecjkHNwZtOSPm9fwgACe3zxuQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 09/11] spi: npcm-pspi: Add full duplex
 support
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 11, 2021 at 3:05 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Modify the IRQ handler in the NPCM PSPI
> > driver to support SPI full duplex communication.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/spi/spi-npcm-pspi.c | 75 +++++++++++++++----------------------
> >  1 file changed, 30 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
> > index 87cd0233c60b..92fae0b23eb1 100644
> > --- a/drivers/spi/spi-npcm-pspi.c
> > +++ b/drivers/spi/spi-npcm-pspi.c
> > @@ -197,22 +197,22 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
> >  static void npcm_pspi_send(struct npcm_pspi *priv)
> >  {
> >         int wsize;
> > -       u16 val;
> > +       u16 val = 0;
> >
> >         wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
> >         priv->tx_bytes -= wsize;
> >
> > -       if (!priv->tx_buf)
> > -               return;
>
> It looks like you're removing this check and instead doing it inside
> each case. That seems like a waste, why not leave the single check in?

Even if the tx_buf is NULL, I still need to do the write to
NPCM_PSPI_DATA, since only this write triggers the clock and I need
the clocks for the rx_buf.
and this is why I initialized 'val = 0'

>
> > -
> >         switch (wsize) {
> >         case 1:
> > -               val = *priv->tx_buf++;
> > +               if (priv->tx_buf)
> > +                       val = *priv->tx_buf++;
> >                 iowrite8(val, NPCM_PSPI_DATA + priv->base);
> >                 break;
> >         case 2:
> > -               val = *priv->tx_buf++;
> > -               val = *priv->tx_buf++ | (val << 8);
> > +               if (priv->tx_buf) {
> > +                       val = *priv->tx_buf++;
> > +                       val = *priv->tx_buf++ | (val << 8);
> > +               }
> >                 iowrite16(val, NPCM_PSPI_DATA + priv->base);
> >                 break;
> >         default:
> > @@ -224,22 +224,24 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
> >  static void npcm_pspi_recv(struct npcm_pspi *priv)
> >  {
> >         int rsize;
> > -       u16 val;
> > +       u16 val_16;
> > +       u8  val_8;
> >
> >         rsize = min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
> >         priv->rx_bytes -= rsize;
> >
> > -       if (!priv->rx_buf)
> > -               return;
> > -
> >         switch (rsize) {
> >         case 1:
> > -               *priv->rx_buf++ = ioread8(priv->base + NPCM_PSPI_DATA);
> > +               val_8 = ioread8(priv->base + NPCM_PSPI_DATA);
> > +               if (priv->rx_buf)
> > +                       *priv->rx_buf++ = val_8;
> >                 break;
> >         case 2:
> > -               val = ioread16(priv->base + NPCM_PSPI_DATA);
> > -               *priv->rx_buf++ = (val >> 8);
> > -               *priv->rx_buf++ = val & 0xff;
> > +               val_16 = ioread16(priv->base + NPCM_PSPI_DATA);
> > +               if (priv->rx_buf) {
> > +                       *priv->rx_buf++ = (val_16 >> 8);
> > +                       *priv->rx_buf++ = val_16 & 0xff;
> > +               }
> >                 break;
> >         default:
> >                 WARN_ON_ONCE(1);
> > @@ -298,43 +300,26 @@ static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
> >         struct npcm_pspi *priv = dev_id;
> >         u8 stat;
> >
> > -       stat = ioread8(priv->base + NPCM_PSPI_STAT);
> > -
> >         if (!priv->tx_buf && !priv->rx_buf)
> >                 return IRQ_NONE;
> >
> > -       if (priv->tx_buf) {
> > -               if (stat & NPCM_PSPI_STAT_RBF) {
> > -                       ioread8(NPCM_PSPI_DATA + priv->base);
> > -                       if (priv->tx_bytes == 0) {
> > -                               npcm_pspi_disable(priv);
> > -                               complete(&priv->xfer_done);
> > -                               return IRQ_HANDLED;
> > -                       }
> > -               }
> > -
> > -               if ((stat & NPCM_PSPI_STAT_BSY) == 0)
> > -                       if (priv->tx_bytes)
> > -                               npcm_pspi_send(priv);
> > +       if (priv->tx_bytes == 0 && priv->rx_bytes == 0) {
> > +               npcm_pspi_disable(priv);
> > +               complete(&priv->xfer_done);
> > +               return IRQ_HANDLED;
> >         }
> >
> > -       if (priv->rx_buf) {
> > -               if (stat & NPCM_PSPI_STAT_RBF) {
> > -                       if (!priv->rx_bytes)
> > -                               return IRQ_NONE;
> > -
> > -                       npcm_pspi_recv(priv);
> > +       stat = ioread8(priv->base + NPCM_PSPI_STAT);
> >
> > -                       if (!priv->rx_bytes) {
> > -                               npcm_pspi_disable(priv);
> > -                               complete(&priv->xfer_done);
> > -                               return IRQ_HANDLED;
> > -                       }
> > -               }
> > +       /*
> > +        * first we do the read since if we do the write we previous read might
> > +        * be lost (indeed low chances)
> > +        */
> > +       if ((stat & NPCM_PSPI_STAT_RBF) && priv->rx_bytes)
> > +               npcm_pspi_recv(priv);
> >
> > -               if (((stat & NPCM_PSPI_STAT_BSY) == 0) && !priv->tx_buf)
> > -                       iowrite8(0x0, NPCM_PSPI_DATA + priv->base);
> > -       }
> > +       if (((stat & NPCM_PSPI_STAT_BSY) == 0) && priv->tx_bytes)
> > +               npcm_pspi_send(priv);
> >
> >         return IRQ_HANDLED;
> >  }
> > --
> > 2.22.0
> >



-- 
Regards,
Avi
