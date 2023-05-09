Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BC6FBF45
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 08:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFpJk0Gvxz3fJq
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 16:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QsLNZPOd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=tali.perry1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QsLNZPOd;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFpJ70QrRz3cBF
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 16:33:10 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9659c5b14d8so879284366b.3
        for <openbmc@lists.ozlabs.org>; Mon, 08 May 2023 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683613986; x=1686205986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0qAJplq+FoI0Zp4URt/LobsN3wJwY/Cob7hjfKkbcY=;
        b=QsLNZPOdfTVI15CvYKz6nU5Jx4eYvQygux3+q8UGBogt5ad0FnvVMGb2wzLGF2FtFm
         o27GjsKehAG3gFdyd3oyjHfWPjoUdAopfyE+pifQawsgvbNgaACLebI2URtUWlFJkeLn
         +7vvti8C9anhzhk/2D2sffl2cOAmY2bEua/TMXjqLAR2PSNzgEJcg8qd9FcdD6Z58mIv
         xdDhM0mDv5W8lyg2z1eOdHu/JNcqP7Mr8+uGn0XRyY72p3Pn9Og+Hd8hzJaAQEyCQpK9
         0sKWIAxG2Jk0zPkyeuqbqGSWspGpKbclj2rwJLvyuzG5eDpopeKGDolbz/eTAYv/tnn2
         CBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683613986; x=1686205986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0qAJplq+FoI0Zp4URt/LobsN3wJwY/Cob7hjfKkbcY=;
        b=XyO/eu1TVs/R6p59//nw6NUr/SCfhXRGAuapwAoYxyHqNKBtavoSHnUaeG7aPuDtyK
         BhHBzb9WWNTm6PI+vDej1MgEusyZaxvCU1gxeFsYrj4nrQUyn6g42pJRzPa47rLKUQgO
         AWmNqnqI23FdJSAKMYEsECPe/rfH4XPcVVpxPkm+XRLV9elzQgwrYuQrsyf/Z3li/nu0
         cQUBEUt10xEMgY9qJEWTSEnKWyM1GxINTpzMcffecStmRkOWVTGSmzzCo0cPkMw1r7g+
         Ah2iQt4dweXCmcwMHKBXRfmrC49Q8PWHB98vylKxx7Nmf3EHsAmjEE62TCIs+ZcrKVJ8
         k9Cg==
X-Gm-Message-State: AC+VfDws4UBWwcImJ7ApjQjnGnvZa8i9ESp3AiyWVgR/2Q1D5gt/+BRZ
	3wG7C/g0lCldfF9yq8IX2y+DoNwMoPCuRZuKU6369KdQojo=
X-Google-Smtp-Source: ACHHUZ40Pk/rGGD9Hs1bhsarUFa7aMrDojR7Hhcs9DWiGrJtcqFql8RALK7W2RsmZ6yAnhMOr+wsHb8JIqMeE1socOo=
X-Received: by 2002:a17:907:16a3:b0:967:92c6:1ec1 with SMTP id
 hc35-20020a17090716a300b0096792c61ec1mr4562870ejc.55.1683613985926; Mon, 08
 May 2023 23:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-46-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-46-u.kleine-koenig@pengutronix.de>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 9 May 2023 09:32:54 +0300
Message-ID: <CAHb3i=sP7GgEfc4yKe6E=9HCh=F-D6sKOvM1T22xN_0fyagiKQ@mail.gmail.com>
Subject: Re: [PATCH 45/89] i2c: npcm7xx: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, kernel@pengutronix.de, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks!

Reviewed-by: Tali Perry <tali.perry@nuvoton.com>


On Mon, May 8, 2023 at 11:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 38d5864d0cb5..53b65ffb6a64 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2361,7 +2361,7 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>         return 0;
>  }
>
> -static int npcm_i2c_remove_bus(struct platform_device *pdev)
> +static void npcm_i2c_remove_bus(struct platform_device *pdev)
>  {
>         unsigned long lock_flags;
>         struct npcm_i2c *bus =3D platform_get_drvdata(pdev);
> @@ -2371,7 +2371,6 @@ static int npcm_i2c_remove_bus(struct platform_devi=
ce *pdev)
>         npcm_i2c_disable(bus);
>         spin_unlock_irqrestore(&bus->lock, lock_flags);
>         i2c_del_adapter(&bus->adap);
> -       return 0;
>  }
>
>  static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
> @@ -2383,7 +2382,7 @@ MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
>
>  static struct platform_driver npcm_i2c_bus_driver =3D {
>         .probe =3D npcm_i2c_probe_bus,
> -       .remove =3D npcm_i2c_remove_bus,
> +       .remove_new =3D npcm_i2c_remove_bus,
>         .driver =3D {
>                 .name =3D "nuvoton-i2c",
>                 .of_match_table =3D npcm_i2c_bus_of_table,
> --
> 2.39.2
>
