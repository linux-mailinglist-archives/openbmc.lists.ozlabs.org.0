Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD97B5BD2
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 22:08:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GRPPz4xB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzsTz70h3z3vYF
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 07:08:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GRPPz4xB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzsSq4wZMz3vc4
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 07:07:54 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c012232792so1680731fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696277271; x=1696882071; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzzKZoEmdCGE7S1RXteRn52a8Z5fDrSNy3okgZBM+pc=;
        b=GRPPz4xBOGR6jxJDlJAZOEK/8i3RyStwPjePdKbINap2c9CIZF1MvLX4yt7BG9SVDK
         SEj/Rq9uxrRlc5jR4OZbavICcO/eOeMLetVXJE+7zrRcU3ALSIhRkDxD7TSerjmqC++s
         qKZnoQn8DYOc6V0IixnExzhmR+DIImipYRWH3w6cJ3XxlqdDrGQqzR93WwvRVkywhlao
         B6BXzEQ0pbhBMQQBg1z+Y4cqwb4y/BaaN8jervCbsLYh0JZMe5FGT5mMD+QkPVElQJ+C
         lfQZ5yiAm4e7FO2HxXCW+4/s6skUb67p1Qy/rwdTHgqijk6Mv94c+oxlze1YD2TDKzYB
         8tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696277271; x=1696882071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzzKZoEmdCGE7S1RXteRn52a8Z5fDrSNy3okgZBM+pc=;
        b=cqfQB+4RdC/A1RdaS5wzmUHpG5xIg05h2m7RsKYC/iTzRxgoT5Suf/7bvrRKl4Foxl
         4PrSJm2y+wEFUp3dKfE5AncJKhP2PgcTSr/jszxsUZO3R65NG2lG7JTsBrK07Z8oxzkN
         U56zQMysZjX0bYpNI3NbP+zlagb2yEUjBj2UNrR/jgIiXpnIS7WsUJOiKs0BO/LdrLf5
         2TWecR9qN/ODcu17EPjx+MOrdJjy/JEh4k874f7kb1roZZl+xwjjF/GiBOIXy7xpUCbB
         DlxbG4CIpUm2f9287AcmQ99JnzHESHuYkSqyKEbJw/wx3FPbEoo+0vKniJNczfV2z1Py
         qxvQ==
X-Gm-Message-State: AOJu0Ywlvc36OhPMfS8DKOf1+uclRAtX2tV4EXtxKb5K/igqPLrBomKf
	E/VVSNscpDWqkcnpWZfiBEGrhXw1Re2ycUpVJnw=
X-Google-Smtp-Source: AGHT+IHfAwfrbZiXrWiDIVYFKatdO7nPRT0KeuksW27VNFvfFxPfriAmuquY7kqLS5l/DTLOc9tMmisPbwCaGXu9QRo=
X-Received: by 2002:a2e:868e:0:b0:2c0:cd8:2bdc with SMTP id
 l14-20020a2e868e000000b002c00cd82bdcmr10560836lji.24.1696277270845; Mon, 02
 Oct 2023 13:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231002194138.125349-1-tmaimon77@gmail.com> <20231002194138.125349-3-tmaimon77@gmail.com>
 <CAHp75VfDcqTAVhZmo-q8v8c8TKwZUjQMr2-0RBarYDDJD1+TZw@mail.gmail.com>
In-Reply-To: <CAHp75VfDcqTAVhZmo-q8v8c8TKwZUjQMr2-0RBarYDDJD1+TZw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 2 Oct 2023 23:07:39 +0300
Message-ID: <CAP6Zq1gnjDUSWqe2aNMfMx-Ksdx_Mw6skCu4ecRC4na2A-UNkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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

Hi Andy

Thank a lot Address in V5

On Mon, 2 Oct 2023 at 22:46, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
>
> On Mon, Oct 2, 2023 at 10:41=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com=
> wrote:
> >
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
>
> ...
>
> > +       pltfm_host->clk =3D devm_clk_get_optional_enabled(dev, NULL);
> > +       if (IS_ERR(pltfm_host->clk)) {
> > +               ret =3D PTR_ERR(pltfm_host->clk);
> > +               goto err_sdhci;
> > +       }
>
> ...
>
> > +err_sdhci_clk:
> > +       clk_disable_unprepare(pltfm_host->clk);
>
> Now this is leftover that leads to unbalanced reference counting.
>
> --
> With Best Regards,
> Andy Shevchenko
