Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039EC6003FB
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 00:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrFYM5jMWz3bXG
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 09:44:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=b4WAKvQp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=b4WAKvQp;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrFXj3CHsz3bhd;
	Mon, 17 Oct 2022 09:43:48 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id b4so15890749wrs.1;
        Sun, 16 Oct 2022 15:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDsdEqeSyYndowz7YCRb9tbG1LI9jdAVJZcV10CPOKY=;
        b=b4WAKvQpKxm/VVN+/HaV58gMgbxFzk34sPNg6kh+QcMqPSoaUAIJMybiayxNxS3Ns6
         OhbeYOtq5BOXilCfMdAi0HykbmZSEw9ycZKw4PMEEPvjOXiY5SEh+nCPadeY7rg7qxKY
         Js4KZnD4YsAG4GUDQH5xXN1CcUuuldr1gGRkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDsdEqeSyYndowz7YCRb9tbG1LI9jdAVJZcV10CPOKY=;
        b=mwIUTpdTpv3YGbbjq8IH5Rq7yggOuqDH/vOrnRXqxMvhuax5wvQDDfF642t8BUF+NO
         3YPm+dlMF9WlN10L9QA6diM/Mel6x63qkWTIenjealS9sWSfqudvWpkRARnwGou7aP9v
         N1RbBpJ6+R+dDVmTm+hl04wR5iYXojE3XXR4Crtr7nvjx3kPt4IuuO95JAwIokQcygY+
         5ckMfJZq90MoCxv2Eyagt/Vd7r4OvG3YURfwTjJcQkvjxxFghytO8foDE7GdtTWDSPYN
         1kUjmMRXMPQ6A5sGwaG4VOrD/U5d/EjsMUiy/KabGMuMMkPw1FCVp9F9y0BFLFqg1tDO
         UU8A==
X-Gm-Message-State: ACrzQf2Ow3jVIXM4N6LLigfcpsVRAETeEIXpawAC/ZZgaJLuwEM5NInx
	6bx0taOdAfD+CsV+KryEdskhyj84U0LtiI09l7A=
X-Google-Smtp-Source: AMsMyM6+vvLG/zT8BB8DixOZKoQOE4ds/2ACweWZ+P4b8z80ltXBboupc0jh5MD97+Bmf2y5bMFK/mr1zHT+QkeFydM=
X-Received: by 2002:a5d:6c63:0:b0:230:8257:be9e with SMTP id
 r3-20020a5d6c63000000b002308257be9emr4251960wrz.606.1665960222405; Sun, 16
 Oct 2022 15:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221016155722.3520802-1-clg@kaod.org>
In-Reply-To: <20221016155722.3520802-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 16 Oct 2022 22:43:30 +0000
Message-ID: <CACPK8XfrF2h0zYNPcFwHmGfyohCOYQziqoUAJ6j60bEonFHu0A@mail.gmail.com>
Subject: Re: [PATCH] spi: aspeed: Fix window offset of CE1
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 16 Oct 2022 at 15:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The offset value of the mapping window in the kernel structure is
> calculated using the value of the previous window offset. This doesn't
> reflect how the HW is configured and can lead to erroneous setting of
> the second flash device (CE1).

So .offset is expected to be the absolute address of the window, and
this was okay for the 2400/2500 but was broken on the 2600?

Reviewed-by: Joel Stanley <joel@jms.id.au>


>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem"=
)
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 33cefcf18392..b90571396a60 100644
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
>                 dev_vdbg(aspi->dev, "CE%d offset=3D0x%.8x size=3D0x%x\n",=
 cs,
>                          windows[cs].offset, windows[cs].size);
>         }
> --
> 2.37.3
>
