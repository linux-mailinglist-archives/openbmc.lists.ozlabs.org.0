Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D24ED3D2
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 08:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTY4C3vBDz2yPx
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 17:17:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gHU+rFSS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gHU+rFSS; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTY3n1YcMz2xsW;
 Thu, 31 Mar 2022 17:16:52 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id b18so20603318qtk.13;
 Wed, 30 Mar 2022 23:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dgO8zqC7WC/fib4XYuirXf5iop7Wh43rpP9KdHmr0IA=;
 b=gHU+rFSSXlKU+USG/wXOYdDH5qJOU+skcxLJ3YnptpmfQB+2MjNdA5rafhbDw76Xwi
 Z+dQmsBbnXkmqgXGCHRv0/Sc2I/xZYmcC8jfrAZu0RgimhYmjrVFIPKLAWl8xiGUsCnk
 oas7YCrop00X/cr1c/2szyxllv0pT6QvkvLaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dgO8zqC7WC/fib4XYuirXf5iop7Wh43rpP9KdHmr0IA=;
 b=KffCnCs8mTOMU8ocilGszaiB/5ptB5TvwdiLCm7XTsX2K9YH9aBcZALDP4RWFywaq0
 RzdZ51UXTFeT8y4xM7aFp7KUQpQCereoH2ndzUIBw7b6DWw6/9GZmRiwQsBljJFym+I7
 WyFgeHJU1yXD1+BSfuYoNUy4vxp7gsbZU6fewjdvLqVa5GTt1b+Sc7vxmqCcfsqtZkIt
 uWo8eSL4zWv6AwGv6lZzi5Uvruh4M1uTE9/+7w/DHTw62VYcVlXX7XCTBmHGi+OUhCfO
 fSetInWyxTghXmAsVKVKWRhImQmqRPpDN1mff7CcLRWsB/1IuwvBIbjLPShSjAXp5xBp
 kKpg==
X-Gm-Message-State: AOAM533t7loxB2OT3v7pXwgHaYrhiyNn757keIYKups4hd1E4B9J4S8M
 Y9RguH78cU0mMdXMbAhaiokO6zGB3QdgCszCpB0=
X-Google-Smtp-Source: ABdhPJx0f7ZOamDZuctFquKMe7ImfyiAXkszBmDp5Tew9EA05hXkQlU6cG36s1yNYnamTK2Ton+En13ncGVGPFCfGPg=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr2950468qtx.494.1648707408895; Wed, 30
 Mar 2022 23:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220331002914.30495-1-potin.lai@quantatw.com>
 <CACPK8XfzFNqyoa4Fe0sY3usfAd75KAVg2pO8fnW+BzyvSSp9dg@mail.gmail.com>
 <f62f43ad-8eda-c4fc-ad56-04227ef38c9f@kaod.org>
In-Reply-To: <f62f43ad-8eda-c4fc-ad56-04227ef38c9f@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 06:16:36 +0000
Message-ID: <CACPK8Xceo6wozKNbwU8ppvZnK8g1i6z0Hfboy_XDpefFQxGUDA@mail.gmail.com>
Subject: Re: [RESEND][PATCH linux dev-5.15 v2 1/1] mtd: spi-nor: aspeed: set
 the decoding size to at least 2MB for AST2600
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Potin Lai <potin.lai@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/31/22 03:07, Joel Stanley wrote:
> > On Thu, 31 Mar 2022 at 00:29, Potin Lai <potin.lai@quantatw.com> wrote:
> >>
> >> In AST2600, the unit of SPI CEx decoding range register is 1MB, and en=
d
> >> address offset is set to the acctual offset - 1MB. If the flash only h=
as
> >> 1MB, the end address will has same value as start address, which will
> >> causing unexpected errors.
> >>
> >> This patch set the decoding size to at least 2MB to avoid decoding err=
ors.
> >>
> >> Tested:
> >> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
> >> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST=
2600 Decoding)
> >> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50=
200000 ] 2MB
> >> root@bletchley:~# devmem 0x1e631030
> >> 0x00100000
> >>
> >> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> >>
> >> ---
> >> [v1]: https://lore.kernel.org/all/20220304170757.16924-1-potin.lai@qua=
ntatw.com/
> >
> > C=C3=A9dric, can I get an ack from you before I put this in the openbmc=
 tree?
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, I've applied this to dev-5.15.

>
> Thanks,
>
> C.
>
> >>
> >> Changes v1 --> v2:
> >> - add fmc controller into decoding range resize checking
> >> ---
> >>   drivers/mtd/spi-nor/controllers/aspeed-smc.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mt=
d/spi-nor/controllers/aspeed-smc.c
> >> index 416ea247f843..74fa46439246 100644
> >> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> >> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> >> @@ -781,6 +781,18 @@ static u32 aspeed_smc_chip_set_segment(struct asp=
eed_smc_chip *chip)
> >>                           chip->cs, size >> 20);
> >>          }
> >>
> >> +       /*
> >> +        * The decoding size of AST2600 SPI controller should set at
> >> +        * least 2MB.
> >> +        */
> >> +       if ((controller->info =3D=3D &spi_2600_info ||
> >> +            controller->info =3D=3D &fmc_2600_info) && size < SZ_2M) =
{
> >> +               size =3D SZ_2M;
> >> +               dev_info(chip->nor.dev,
> >> +                        "CE%d window resized to %dMB (AST2600 Decodin=
g)",
> >> +                        chip->cs, size >> 20);
> >> +       }
> >> +
> >>          ahb_base_phy =3D controller->ahb_base_phy;
> >>
> >>          /*
> >> --
> >> 2.17.1
> >>
>
