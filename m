Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F62BEB07
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 05:54:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f1K174hVzDqfp
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 13:54:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IlpFPhXI"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f1JS6HXCzDqfd
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 13:54:16 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id u40so1129813qth.11
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3eRmwaTDXkbp5TCoy+++9gP3aspchdhV60Y/lpf4YWg=;
 b=IlpFPhXIfyoqh0Y9wxrhi5S/jfbbhQxMQE29fFOGkjz7B3haJyX9MvxK6BKkyfDB5m
 inI68JcJWX2V95LwTz27l4F9sC1Bx/gxDKRhaX5ndj+N4kOCkoyE0+dh1Qi5pWDpdk0O
 lScfc4qgmLNy2ef/TT3MqMu81octDQG9XTvlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3eRmwaTDXkbp5TCoy+++9gP3aspchdhV60Y/lpf4YWg=;
 b=AhOa3OVesg7ITm+9SA3F2eo0Ox+czBAqOJM6LqaNgiBO8Y/8UfGWEiXsgB9ag3V9yk
 bPC8ynD778gZYW2awVXrnE5uvo3oesCv8agUZqKY7qUn4UEV2OtIq7t/Ce64qbeAZwRI
 0DIEi/03wUAs1XtJSKYyN6i5YE8VfZecOheU42pBZNpl+fXTb+beLbFOGYCJh5rG7mz8
 0gGC5iTeUDhP29gg56pEozPPthIW5mqXUEW8skCOkCcommPm925oSbclcrLwOWQuXYAf
 zQ6Iv1Jkq7ZP2C6bSafiHWVnZ3Gtp9rRPkxr8k2uxa3SMN5xneRj66x/hIuQ56Fw/n3D
 K6Gg==
X-Gm-Message-State: APjAAAX0E7dyezzJtggbbNIcIRTALROtuaLGzD3agEcESgjq0oBnyEx+
 LvZGu11+iAoRjB4lsfx9M1Be85nkq9CMhuMSvnE=
X-Google-Smtp-Source: APXvYqyBprugGpDogMFeMSKb0GAxgVOIVJ5WtTtXeXISu5UDIJ/sHDgG4+8t03bU59IuO4gSiT1M215acnPOrcWFoCo=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr1874024qtd.255.1569470052099; 
 Wed, 25 Sep 2019 20:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-6-clg@kaod.org>
 <533e31cd-6f00-4e49-9c01-1d12bf8dd78a@www.fastmail.com>
In-Reply-To: <533e31cd-6f00-4e49-9c01-1d12bf8dd78a@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 03:53:59 +0000
Message-ID: <CACPK8XdcTbKW8fF1GJTsjqnuT_uqtkxNMO6XXZO84zaEPfWCDw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 05/13] mtd: spi-nor: Add support for
 w25q512jv
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Sep 2019 at 01:42, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 25 Sep 2019, at 22:12, C=C3=A9dric Le Goater wrote:
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

We should send this one upstream.


>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c
> > index 0034e7751239..ff6b719fd267 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2151,6 +2151,8 @@ static const struct flash_info spi_nor_ids[] =3D =
{
> >       { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
> >       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
> >       { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K |
> > SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +     { "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024, SECT_4K |
> > SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > +                     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> >       { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
> >                       SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) =
},
> >
> > --
> > 2.21.0
> >
> >
