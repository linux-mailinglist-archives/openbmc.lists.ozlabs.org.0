Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F57B59F0
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 20:22:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvOwe4H4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzq7N0dT6z3cN3
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 05:22:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvOwe4H4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzq6m6pBkz3c8D
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 05:22:07 +1100 (AEDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-57b74782be6so18240eaf.2
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696270924; x=1696875724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfENVpQuZdv1PgXfltbR7B/XTb+JunRgWdUE5rSAEv0=;
        b=EvOwe4H4gTQ/Xu2kBt/tq23bNrzUNHMby9Elycy+bgHqRHZ7weDBi/YywFO4n3t3q/
         NdMFoNoLBWYrxCo52L5oekoZIXb7IERpifiV4Tz8yXtP9WCCDeraoMckHJCDqkgS7Mvc
         qLBxCF4PcKm4+07q7SkAMhroJwaB34xDUJalva/6cSs52NT/CDaB2gmOQP41fIcdj4o0
         om0rfJFNeiMRdDY/xpKnfpamST8NVsx+X6thyLEVGxIrCEBbD0J44c85RY49QVTytTh5
         RQnVPUWl5AVmqw5dy2mIvWbTTNdgvni4BWRmO33peKkxZxZ8RXX6jylrHFCgPMjEzX2c
         481g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696270924; x=1696875724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfENVpQuZdv1PgXfltbR7B/XTb+JunRgWdUE5rSAEv0=;
        b=pLR8NhF7jpp+UUxqJDuL61ut8FEDgWqlbx4oKtzZYXeea77FeGgW9FK5iQeOWZVOSG
         otWDTCl1TERnFx0qvm6u9tKZVqsaY6cPjEnraP1mJG69ihhtKXgmfNXOXTYBA1SAGLfV
         wEC7hIzlXmLjuJzTVLUd4vrlpzme5qE3AsgN2l4OdmrQMAaRtoBMWYK+cPcaNqidz8Hn
         k6AHav1DrQEikfJul0XkjPOJEv/+vy31Pkshp6wlIoY8mYTjWeR7zFL+J/7CecJSlRYP
         IA49NMsBZdvVg5DMFRd45lOTePupzs20HbhwQeeNvymY7xTROMEbhvm9px5ENpqUekKO
         PLEg==
X-Gm-Message-State: AOJu0YxL6O0Bzo3TdRqMYjWxo0l5Wxk5WtqGXl8uCCAhBaL7GCtLPD3x
	WqLGzgUkEr0Fl/rm3paOP8gmI5tUUBUyWds3drM=
X-Google-Smtp-Source: AGHT+IHC6KT31UbIzqXi5TZPU7mVY6wLqS+UeMb1ep1LavYVR7vDcy5MaFclxAkz4aB2p3t5R8ulrintOTk3LDBNiM8=
X-Received: by 2002:a4a:3459:0:b0:57b:7b1b:108a with SMTP id
 n25-20020a4a3459000000b0057b7b1b108amr11529642oof.8.1696270924335; Mon, 02
 Oct 2023 11:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231002175052.112406-1-tmaimon77@gmail.com> <20231002175052.112406-3-tmaimon77@gmail.com>
In-Reply-To: <20231002175052.112406-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Oct 2023 21:21:28 +0300
Message-ID: <CAHp75Vd701sE-pkTWYi=PsOpVoBa-fbOm91P3bGLruCn5U1KXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 2, 2023 at 8:51=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> w=
rote:
>
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

...

> +/*
> + * NPCM SDHC MMC host controller driver.
> + *
> + * Copyright (c) 2020 Nuvoton Technology corporation.

Shouldn't it be at least 2020,2023 ?

> + */

...

> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/mmc.h>

+ mod_devicetable.h

> +#include <linux/module.h>
> +#include <linux/of.h>

...

> +       pltfm_host->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> +       if (IS_ERR(pltfm_host->clk)) {
> +               ret =3D PTR_ERR(pltfm_host->clk);
> +               goto err_sdhci;
> +       }
> +
> +       ret =3D clk_prepare_enable(pltfm_host->clk);
> +       if (ret)
> +               goto err_sdhci;

Why not use devm_clk_get_optional_enabled()?

--=20
With Best Regards,
Andy Shevchenko
