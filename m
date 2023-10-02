Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA987B5A07
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 20:30:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j2JvwL8c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzqJS2r86z3cbN
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 05:30:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j2JvwL8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzqHq5XDTz3c4s
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 05:29:58 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c296e6543fso386311fa.3
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696271391; x=1696876191; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmLeKYNGSecYfl9ikGzmRlf+uP/RUxaBYTCk9xIy0Aw=;
        b=j2JvwL8cVuIQnC85KcyRMD+fVHXMXs0WuV4/Wf1QlwtfLz/sgxoHBrfIKgsis9978B
         UPgAScmoOBR6sZ/YqnquWmYhjK43yipQEZqR6/27YGdTsZt5MSSUiM1J8UkQQnlloWmV
         C4TLLTjfYFCENShR9W47bDHloCJTsgEJ28/6NWhQ46Ep7IoFcJwBMa6CAj5GgVBGxo3V
         FAZoYVflBbrw/dkRwBw1UQzOi1943dN6KlxwHFtxfsPHux7Z5/ZTEJ7SsWt1jNeOjFl6
         OoNjhmAXskkDv6GN2Qzn6BjvRU8nGkoYoLhhSo/zGjQciXEe/om0fSbMTUUGSsiPE8Nu
         cpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271391; x=1696876191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmLeKYNGSecYfl9ikGzmRlf+uP/RUxaBYTCk9xIy0Aw=;
        b=Hzh7zSPLzKD3C+8mhRYKwN5Ea0Vk7HJDHGFdR7asBwQ4JQMQP6SaRBQGItHn62ZKrD
         TZC1CRMbUsZzDpcuy/RPdGYkfF/dNhcqLceMxT1yPV7arQEJ+rjkPo2EZmKeYXDBuvI0
         A7LnNRmyJb8mgpNC3QFar4A5vOh1FgZcjCbKfVgzWplAwcPvqBWLKI8fnSDCh20M4Rzd
         WT+BT1KZIjGL6zWzeE15/KpDVA8xx6aGTd8a1V4WvPmDzW0OPavbXflZnRzFsA4TmmWu
         izZhM26M1/SjKrzc6/UojEIpDSBZo8BNttolI6ntB/+b22uDR9fzKRf6b2zUhibn1TSF
         Q4yA==
X-Gm-Message-State: AOJu0Yypnt5yWOVtt2joL5NKwWAuLoEClNcb8woLe2KY5enZmGRWqfTz
	f7Kjrl7XcQ5aLT+kYlxN8iutCfNWUAj2qCkjrKU=
X-Google-Smtp-Source: AGHT+IFMt/wHWyitPjznMpFt2azasGJ7FG/aPXRTTkgmXI2UdwrxaMHvhIW7i3jpWxNdQII5HorAJCWm3hbhEz1OhSY=
X-Received: by 2002:a2e:97c9:0:b0:2bc:cc1a:139c with SMTP id
 m9-20020a2e97c9000000b002bccc1a139cmr9686291ljj.11.1696271391296; Mon, 02 Oct
 2023 11:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231002175052.112406-1-tmaimon77@gmail.com> <20231002175052.112406-3-tmaimon77@gmail.com>
 <CAHp75Vd701sE-pkTWYi=PsOpVoBa-fbOm91P3bGLruCn5U1KXA@mail.gmail.com>
In-Reply-To: <CAHp75Vd701sE-pkTWYi=PsOpVoBa-fbOm91P3bGLruCn5U1KXA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 2 Oct 2023 21:29:40 +0300
Message-ID: <CAP6Zq1jM3=D5PBp1z7=K6LRNJaZe3rEPutXm_xxo7p2Z60sWmQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

Thanks for your comments.

On Mon, 2 Oct 2023 at 21:22, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
>
> On Mon, Oct 2, 2023 at 8:51=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com>=
 wrote:
> >
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
>
> ...
>
> > +/*
> > + * NPCM SDHC MMC host controller driver.
> > + *
> > + * Copyright (c) 2020 Nuvoton Technology corporation.
>
> Shouldn't it be at least 2020,2023 ?
will change to 2023
>
> > + */
>
> ...
>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/mmc/host.h>
> > +#include <linux/mmc/mmc.h>
>
> + mod_devicetable.h
why?
> > +#include <linux/module.h>
> > +#include <linux/of.h>
>
> ...
>
> > +       pltfm_host->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> > +       if (IS_ERR(pltfm_host->clk)) {
> > +               ret =3D PTR_ERR(pltfm_host->clk);
> > +               goto err_sdhci;
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(pltfm_host->clk);
> > +       if (ret)
> > +               goto err_sdhci;
>
> Why not use devm_clk_get_optional_enabled()?
Will do
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,

Tomer
