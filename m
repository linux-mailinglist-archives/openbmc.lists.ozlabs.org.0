Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42D557287
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 07:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT7kc3fzyz3bsf
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 15:15:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PPC5vEfO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PPC5vEfO;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT7k90X9Sz3bnM;
	Thu, 23 Jun 2022 15:15:28 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id h125-20020a1c2183000000b003a02cc49774so96090wmh.1;
        Wed, 22 Jun 2022 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oPeA0hoICoghXxDRi6yeZio4UQ/8IEJ0AJS1aepLCoY=;
        b=PPC5vEfOOiUED1jMF7smhAcCdLoazsLATSan19A9GSR0SJ+lwhPotJnKxyDlgbgSP1
         sohoypREZdPDd8p1hqHZxKnBKBEz+CGwt5yha1CLMxLhgRVPf404tOIHhO/b++WVZVEa
         LnWH7my/aosu7ZcJWBM6/zJXTkRQ40bp/Qq9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oPeA0hoICoghXxDRi6yeZio4UQ/8IEJ0AJS1aepLCoY=;
        b=N4l5zHOiCUqY9unMa9+3w0n0zab2O65YB5Db/2aT4A6azbNklfuI52z+ZwCi0lsnVp
         Q9sskE4LhRfPa+hjcGYYwXmltCMn27ZffRXHEFI+YuGs81qXzgTBF4Dv2JjXCHxiQQj2
         PZ34pfTegFw0d+JL7GjiwqSHUu2ArepbadLJrR1F17EbJlFFPjVRAclUJQMRl5iSVKFW
         oqbRDVutprUD5BgIpc7Hd9i3nWmXbMkGolVRWznHIhx2HR3XhFY7esgp7Wm6AtG8beyn
         tsKIbFrK/VxIgHhCzc9mkpvx6GrNjWmUPJ5dWWt4rII+91EPen0UT4WpFG+M8R6VgG21
         p8ng==
X-Gm-Message-State: AJIora9fbno5a/vTKaP0pm21agPgTKUpgjR70YQztzZo7o+S+7sXxN/x
	Mbzp55rYltcJadEKSfvy9Re+diS8XxcTebQOGgU=
X-Google-Smtp-Source: AGRyM1u4Z/YtN0xWZHHdwVAqbHPAHfcCY3NJ3W9gw5ET54aG8ykNlJ5ZA86+dwL1I9imO6luKzAx//VpSKtT7snEWkQ=
X-Received: by 2002:a05:600c:1990:b0:39c:81f0:a882 with SMTP id
 t16-20020a05600c199000b0039c81f0a882mr1879834wmq.72.1655961320646; Wed, 22
 Jun 2022 22:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220622161617.3719096-1-clg@kaod.org> <20220622161617.3719096-2-clg@kaod.org>
In-Reply-To: <20220622161617.3719096-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:15:07 +0000
Message-ID: <CACPK8XdeEmv7exWngQkEYs+oj5vV6YjqSvvfuq+5fn8MotxpsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] spi: aspeed: Add dev_dbg() to dump the spi-mem
 direct mapping descriptor
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jun 2022 at 16:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The default value of the control register is set using the direct
> mapping information passed to the ->dirmap_create() handler. Dump the
> mapping range and the SPI memory operation characteristics to analyze
> how the register value has been computed.
>
>   spi-aspeed-smc 1e630000.spi: CE0 read dirmap [ 0x00000000 - 0x04000000 =
] OP 0x6c mode:1.1.1.4 naddr:0x4 ndummies:0x1
>   ...
>   spi-aspeed-smc 1e630000.spi: CE0 write dirmap [ 0x00000000 - 0x04000000=
 ] OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Very handy! Thanks C=C3=A9dric.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-aspeed-smc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 496f3e1e9079..ac64be289e59 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct spi_mem_d=
irmap_desc *desc)
>         u32 ctl_val;
>         int ret =3D 0;
>
> +       dev_dbg(aspi->dev,
> +               "CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d=
.%d.%d naddr:%#x ndummies:%#x\n",
> +               chip->cs, op->data.dir =3D=3D SPI_MEM_DATA_IN ? "read" : =
"write",
> +               desc->info.offset, desc->info.offset + desc->info.length,
> +               op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> +               op->dummy.buswidth, op->data.buswidth,
> +               op->addr.nbytes, op->dummy.nbytes);
> +
>         chip->clk_freq =3D desc->mem->spi->max_speed_hz;
>
>         /* Only for reads */
> --
> 2.35.3
>
