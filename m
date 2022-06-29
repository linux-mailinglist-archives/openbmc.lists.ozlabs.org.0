Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94955F8B9
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 09:21:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXtDt3zbzz3cfG
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 17:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z2Wf04+S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z2Wf04+S;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXtDT67XVz3bpc
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 17:21:13 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id i1so16497542wrb.11
        for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h0aE44H0l9SXbgiaJfN+DV/BzgvxjSMjdc6IRKA2+Ls=;
        b=Z2Wf04+SH05Dc1kNh5vD4FnwNCGjpLfJJB/j+jPG+x0x2My2mOmZldJjHR0UqNUFS7
         CIWr2Lu9aTTGnC/UshgrUF8n5JwEjZIKP5/XfdV9fNq+qpkLIAmChT3kpwm1rRWKmepJ
         9O8hKtLUzPSsz1kqc9udLneXsgskzMUvuifO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h0aE44H0l9SXbgiaJfN+DV/BzgvxjSMjdc6IRKA2+Ls=;
        b=0h28UAsehlZuDov9uRqsnnbpKnh9kAfxh6v/HaF8LoU5LGGIMs24uEEFaxfUaMoxI4
         U8LvBwpCsrzxrpeO9GD2Z/Uzdak2R9Umy0UGw8xCgT9RJo+u4oO0GREvw5aERIWLXxF1
         mxS2JGaUha1AfW4RZbpAxhHMA8xN3gD+US3Hy1KdJimU1azdPLg6PpWtg+IUHiETkQSk
         ko0iKdpCaFDaPuY54LkasvkWbds/HSNZk30L0If82qIuLA/YnA2/lzPAhfyk1KCbdIA7
         29qIi4q0ybPNJ3hDGNZlaedDC2phhSi2OXZI7fk7n9HXp/BQPpk916es+r0Y8fv9Qw0l
         maxA==
X-Gm-Message-State: AJIora/oSQPbi12nAmPeW3xDF9NQOeZuc6w6+Cw7coOuQLzjRBLoinrA
	/Tlc3/NapfVlZJKgFDAU7AqklZUHwjpLvNA1FE0=
X-Google-Smtp-Source: AGRyM1sT7hf29TH2BTQHh/vNIbrg2Lv39jYaxlxN5FoMDOlSboBSjbnFgMCxZJWfZAgmK1ubKVMh3/M/pQ6jXkUVQX0=
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr1558683wrm.3.1656487266509; Wed, 29 Jun
 2022 00:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220628162044.1121337-1-clg@kaod.org> <20220628162044.1121337-2-clg@kaod.org>
In-Reply-To: <20220628162044.1121337-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jun 2022 07:20:53 +0000
Message-ID: <CACPK8XdvBq77NNixLapuB18Xp=Q3k2aRgj47j9nz-dv2BaxTeQ@mail.gmail.com>
Subject: Re: [PATCH linux 1/5] spi: aspeed: Fix window offset of CE1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 16:20, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The offset value of the mapping window in the kernel structure is
> calculated using the value of the previous window offset. This doesn't
> reflect how the HW is configured and can lead to erroneous setting of
> the second flash device (CE1).
>

Did you want to include a Fixes tag?

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 3e891bf22470..5a995b5653f1 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -398,7 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi =
*aspi,
>                 windows[cs].cs =3D cs;
>                 windows[cs].size =3D data->segment_end(aspi, reg_val) -
>                         data->segment_start(aspi, reg_val);
> -               windows[cs].offset =3D cs ? windows[cs - 1].offset + wind=
ows[cs - 1].size : 0;
> +               windows[cs].offset =3D data->segment_start(aspi, reg_val)=
 - aspi->ahb_base_phy;

Is subtracting the base address correct for the 2400/2500?

>                 dev_vdbg(aspi->dev, "CE%d offset=3D0x%.8x size=3D0x%x\n",=
 cs,
>                          windows[cs].offset, windows[cs].size);
>         }
> --
> 2.35.3
>
