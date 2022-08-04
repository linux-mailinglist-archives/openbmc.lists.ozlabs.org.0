Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E858963C
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 04:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LytLg1XRFz30Qc
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 12:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BD+fxaAy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BD+fxaAy;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LytLF3tPfz2xjn
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 12:42:27 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id v5so9640063wmj.0
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 19:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PCMHa/d5v1356bafcLDZi+B1VzxgJGp1VCxkVlKl0lQ=;
        b=BD+fxaAy7eOWfKO9B/4Jp3fO5nu4x2TTf7DCo00QgVNz/5E4YQ8DXmg3NpvwZ62z/d
         iD+0JS91jLbyT6IvFG/gbJs8hW7z1KSRn/PwGeh1swt64I4DyPeS1oLrXjvK1r3Aybz2
         9bAWsi5wJMgTSpi4MB61VhNLgcEUZg6+QMFBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PCMHa/d5v1356bafcLDZi+B1VzxgJGp1VCxkVlKl0lQ=;
        b=qBmnzgt4Sr8C56KHytYFd4AHIU37NuMpf09y7+LmpOivUUjbOe66cLloRX9PBVuMWd
         1uiun13K89nuAALsuYN/CS5VZzKXawXce0ZuiHdkliZkNwLuakVmHXMPgFGdY8l41x1y
         WSSw5DidKw0SB4NrL7tu54qIbIWhSccfOVzyf/nkrc3OV/Js2vQnWk1Mv8rFQAvR+o5o
         VGF9l1zaOPlim5gBmpf8qSCv9Gb3WcSa30P6rol1eNwbVRIMySS7Z+lpZnP1dM+gu6LN
         B8s80DJiswfccTYqBLVfORE4Y9p8jfqnVvItT76hhXdniTxEIsoIAnWEfwXTPcdRCvup
         RN8g==
X-Gm-Message-State: ACgBeo0iHKU7eiO4zwDHWuhRsH52AVkT9etLa09u2ETxba6O3mpUHsnp
	awil68mepDE78c+0YQIZHW+cgbFw1YEHqTJzI4or9bWI
X-Google-Smtp-Source: AA6agR7EKJHLwXXsvgH3gvVscRHasnejoVidl+bYhiTme1UAElaxKaYqP4AED8PlTJTHcuHxTXQzwBLiaDQeDzQLlQ0=
X-Received: by 2002:a05:600c:502b:b0:3a3:22c1:ca61 with SMTP id
 n43-20020a05600c502b00b003a322c1ca61mr4449900wmr.10.1659580940604; Wed, 03
 Aug 2022 19:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220719205856.2232070-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220719205856.2232070-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Aug 2022 02:42:07 +0000
Message-ID: <CACPK8XfXEnyDU6qns9z2hH5JjpKr3mv+B1C7Kc-Ajo9S2uEYNw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] mtd: spi-nor-ids: add
 winbond w25q512nw family support
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Jul 2022 at 20:59, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote=
:
>
> Add Winbond w25q512nwq/n and w25q512nwm support.
>
> datasheet:
> https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> This is backport of 47ed8b22fd561b65e8541919becc76ab3d86f7a3 from the u-b=
oot
> upstream.

Thanks, applied.

>
>  drivers/mtd/spi/spi-nor-ids.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/spi/spi-nor-ids.c b/drivers/mtd/spi/spi-nor-ids.=
c
> index 5882eab2e3fc..53e352d8656e 100644
> --- a/drivers/mtd/spi/spi-nor-ids.c
> +++ b/drivers/mtd/spi/spi-nor-ids.c
> @@ -334,6 +334,16 @@ const struct flash_info spi_nor_ids[] =3D {
>                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                         SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>         },
> +       {
> +               INFO("w25q512nwq", 0xef6020, 0, 64 * 1024, 1024,
> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +       },
> +       {
> +               INFO("w25q512nwm", 0xef8020, 0, 64 * 1024, 1024,
> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +       },
>         {
>                 INFO("w25q01jv", 0xef4021, 0, 64 * 1024, 2048,
>                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> --
> 2.25.1
>
