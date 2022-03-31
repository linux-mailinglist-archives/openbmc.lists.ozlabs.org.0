Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A444ED131
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 03:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTQCr1kmJz2xrx
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 12:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TA0QIBbR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TA0QIBbR; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTQCN3KrSz2xBK;
 Thu, 31 Mar 2022 12:07:58 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id f3so18611347qvz.10;
 Wed, 30 Mar 2022 18:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hSQ8OpqytuPI98JaxbvaRvo3JrdDlxJQ1xWweIUPGIA=;
 b=TA0QIBbRmhuRpo7cGT2FZzec8GMWvCszdnRfJMbZ3uRcrUMGhfTn/1/KBnB41xX0AK
 Glwtm7t2X7Ob6U37L+bXed9yfCFiV/Mu+qEHxmYKGu7DraEFlkWiHdAdoB7Br+gV1lhQ
 YZTEajtVvmbDMMomfwDpSMppxkSDXvtg/QvKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hSQ8OpqytuPI98JaxbvaRvo3JrdDlxJQ1xWweIUPGIA=;
 b=djZhvsJW0arSeRDI5BkYOIQnyH/3x+UIpDi8+d6LcC7lYG6dfPq32JtaqSSjmAgP05
 Kwnj5ENFcCEobg0/D8X/ZgJ3ZLzP9Fpta+hjLpDtl/kquNvBpVQ+dXoVOx2xZG6LKdh1
 uYobP+TmbO8G+PMGCDp+O0CLNIHgmPM3EyH3GXClqnaGGTQYMH4MXdZ+NhVvY9+Ccci/
 HHAY2ISjQBZwXQfLGlf5wYFNlJwfMrKAGX27okpjoERsdjm5/wu0bUEljK8YndRRn0uv
 3ZXUhEWsq+zD1bPPyXLBJ/aypa++vILhZSdzTC2bfTVskq7DwdBoTymmL/8ajm5Ztksg
 H9HQ==
X-Gm-Message-State: AOAM53303dh5PywjTRGwviE9qtnwupM4nRKkrp4mpAUKYEq3ipDtCvuU
 xd5XUJ1aj5uMSPqpyoC88isq6jdUhNGmo6M2D1U=
X-Google-Smtp-Source: ABdhPJwJABUEWSuIXOCxj8ACxJS3It4gXLHgqQcJTEf/tMg2wwoL6GoLwmDPtqvul0XIKu6+CRZX08YlG+TVymQQhg8=
X-Received: by 2002:a05:6214:d42:b0:441:831b:fa1b with SMTP id
 2-20020a0562140d4200b00441831bfa1bmr26487391qvr.130.1648688873983; Wed, 30
 Mar 2022 18:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220331002914.30495-1-potin.lai@quantatw.com>
In-Reply-To: <20220331002914.30495-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 01:07:42 +0000
Message-ID: <CACPK8XfzFNqyoa4Fe0sY3usfAd75KAVg2pO8fnW+BzyvSSp9dg@mail.gmail.com>
Subject: Re: [RESEND][PATCH linux dev-5.15 v2 1/1] mtd: spi-nor: aspeed: set
 the decoding size to at least 2MB for AST2600
To: Potin Lai <potin.lai@quantatw.com>
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 00:29, Potin Lai <potin.lai@quantatw.com> wrote:
>
> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
> address offset is set to the acctual offset - 1MB. If the flash only has
> 1MB, the end address will has same value as start address, which will
> causing unexpected errors.
>
> This patch set the decoding size to at least 2MB to avoid decoding errors=
.
>
> Tested:
> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST260=
0 Decoding)
> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200=
000 ] 2MB
> root@bletchley:~# devmem 0x1e631030
> 0x00100000
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
>
> ---
> [v1]: https://lore.kernel.org/all/20220304170757.16924-1-potin.lai@quanta=
tw.com/

C=C3=A9dric, can I get an ack from you before I put this in the openbmc tre=
e?

>
> Changes v1 --> v2:
> - add fmc controller into decoding range resize checking
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/s=
pi-nor/controllers/aspeed-smc.c
> index 416ea247f843..74fa46439246 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -781,6 +781,18 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed=
_smc_chip *chip)
>                          chip->cs, size >> 20);
>         }
>
> +       /*
> +        * The decoding size of AST2600 SPI controller should set at
> +        * least 2MB.
> +        */
> +       if ((controller->info =3D=3D &spi_2600_info ||
> +            controller->info =3D=3D &fmc_2600_info) && size < SZ_2M) {
> +               size =3D SZ_2M;
> +               dev_info(chip->nor.dev,
> +                        "CE%d window resized to %dMB (AST2600 Decoding)"=
,
> +                        chip->cs, size >> 20);
> +       }
> +
>         ahb_base_phy =3D controller->ahb_base_phy;
>
>         /*
> --
> 2.17.1
>
