Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263AFED82C
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 05:12:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475zsP0cpBzF37q
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 15:12:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="awGowKgU"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475zrl6tYDzF0VD
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 15:11:51 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id u22so21892094qtq.13
 for <openbmc@lists.ozlabs.org>; Sun, 03 Nov 2019 20:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItTygVaIv5PadOofdJmA4DquWB13c1angVPyD5FY5gw=;
 b=awGowKgUs2WYglbHXDyPcgcvSijXtGWxmws1NSOLSVs18wgYb2fQ5Ylu4W+T08NGuI
 Oe3OOf0DT7hztlc4RZYpJUnDmvXqwAjEVd3wUMQ+Kq6jZoWoMjGxZ8cUc2a6GEXDwYjM
 k9GF9OYjmUycko4zpi8955lH/TVayVFl6my9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItTygVaIv5PadOofdJmA4DquWB13c1angVPyD5FY5gw=;
 b=o8zG/sI1xL/r845G2d935jpw30RY1Y591lYeu8EqFlkkw9S/Ay2hC6sQJxkWSb84x9
 yw//GJ/6ZQOh2Zo76UBwv9qDru90nukvfcRvKd9eKD0c6KKdDOIwKp/L6FWMw5n36X6G
 L7IhTZoc/H/g4XMrslhJU9GRrDjF6j34HYXqqed+82EJim0oJdnKe3qsSdOuS9igVQIc
 DcfpOkjH6S8ZPlPivmTuJjrgMOWM9fDGH4y9Y6imaYKQpVniu2bA0uaGqjunmCl/f3yO
 sa6+4DwVRLQbxEsm8ktW6/PDF5F0P8Lrsa1LewH5yRTRsRdbV+k/rSMp0eNKxa6Yw9Xv
 5A3g==
X-Gm-Message-State: APjAAAXfjIY8erz+gc/GhP8XATKjm3MLfymMcN9fNufEDrPioCLvoayG
 uZf+JbThm7YusKT1LvrGp0hK5nBgTRNcG9WTOAc=
X-Google-Smtp-Source: APXvYqxGCcGNaZ5GnxnchD9CXt+uPSpmGzQ/CbkpRNQG9DYNNA2E2Cb45+MY2lIamdOd+CKhnpnIwey3FQo9qxSv9gE=
X-Received: by 2002:ac8:e03:: with SMTP id a3mr10541956qti.169.1572840705500; 
 Sun, 03 Nov 2019 20:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20191104040226.24376-1-joel@jms.id.au>
 <734758c8-66a9-494c-9dff-e7d4c57fb1ec@www.fastmail.com>
In-Reply-To: <734758c8-66a9-494c-9dff-e7d4c57fb1ec@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Nov 2019 04:11:34 +0000
Message-ID: <CACPK8Xdu6eEqAa7kRgBEkfEMeTBD3_yAr+YzVxGEA53sdYmEgg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3] fsi: aspeed: Clean up defines and
 documentation
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 4 Nov 2019 at 04:10, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 4 Nov 2019, at 14:32, Joel Stanley wrote:
> > Some of the registers lacked documetation but now can be properly named.
> >
> > Rename FW to FULLWORD so no one thinks it means 'firmware'.
> >
> > The "enable DMA" comment was setting the FSI access direction for DMA.
> > As the driver does not yet use DMA it can be removed without effect.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> This appears to go on top of my FSI series which goes on top of your other FSI that is a rework of my other FSI series. We should probably start merging these patches :D

They are all merged, with the exception of your alignment one.

Thanks for the review.

> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
> > ---
> >  drivers/fsi/fsi-master-aspeed.c | 34 ++++++++++++++++++++-------------
> >  1 file changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> > index 94e9b4f3418a..8da29fb9a69e 100644
> > --- a/drivers/fsi/fsi-master-aspeed.c
> > +++ b/drivers/fsi/fsi-master-aspeed.c
> > @@ -63,15 +63,23 @@ static const u32 fsi_base = 0xa0000000;
> >  #define OPB0_FSI_ADDR        0x1c
> >  #define OPB0_FSI_DATA_W      0x20
> >  #define OPB0_STATUS  0x80
> > -/* half world */
> > -#define  STATUS_HW_ACK       BIT(0)
> > -/* full word */
> > -#define  STATUS_FW_ACK       BIT(1)
> > -#define  STATUS_ERR_ACK      BIT(2)
> >  #define OPB0_FSI_DATA_R      0x84
> >
> > -#define OPB0_W_ENDIAN        0x4c
> > -#define OPB0_R_ENDIAN        0x5c
> > +#define OPB0_WRITE_ORDER1    0x4c
> > +#define OPB0_WRITE_ORDER2    0x50
> > +#define OPB1_WRITE_ORDER1    0x54
> > +#define OPB1_WRITE_ORDER2    0x58
> > +#define OPB0_READ_ORDER1     0x5c
> > +#define OPB1_READ_ORDER2     0x60
> > +
> > +#define OPB_RETRY_COUNTER    0x64
> > +
> > +/* OPBn_STATUS */
> > +#define  STATUS_HALFWORD_ACK BIT(0)
> > +#define  STATUS_FULLWORD_ACK BIT(1)
> > +#define  STATUS_ERR_ACK              BIT(2)
> > +#define  STATUS_RETRY                BIT(3)
> > +#define  STATUS_TIMEOUT              BIT(4)
> >
> >  /* OPB_IRQ_MASK */
> >  #define OPB1_XFER_ACK_EN BIT(17)
> > @@ -575,19 +583,19 @@ static int fsi_master_aspeed_probe(struct
> > platform_device *pdev)
> >       writel(0x1, aspeed->base + OPB_CLK_SYNC);
> >       writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
> >                       aspeed->base + OPB_IRQ_MASK);
> > -     /* TODO: Try without this */
> > -     writel(0x10, aspeed->base + 0x64); // Retry counter number ???
> > -     writel(0x0f, aspeed->base + 0xe4); // DMA Enable
> > +
> > +     /* TODO: determine an appropriate value */
> > +     writel(0x10, aspeed->base + OPB_RETRY_COUNTER);
> >
> >       writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
> >       writel(fsi_base, aspeed->base + OPB_FSI_BASE);
> >
> >       /* Set read data order */
> > -     writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
> > +     writel(0x00030b1b, aspeed->base + OPB0_READ_ORDER1);
> >
> >       /* Set write data order */
> > -     writel(0x0011101b, aspeed->base + OPB0_W_ENDIAN);
> > -     writel(0x0c330f3f, aspeed->base + 0x50);
> > +     writel(0x0011101b, aspeed->base + OPB0_WRITE_ORDER1);
> > +     writel(0x0c330f3f, aspeed->base + OPB0_WRITE_ORDER2);
> >
> >       /*
> >        * Select OPB0 for all operations.
> > --
> > 2.24.0.rc1
> >
> >
