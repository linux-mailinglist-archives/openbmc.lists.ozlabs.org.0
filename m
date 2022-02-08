Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F34AD614
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLFl632zz3bT6
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5i2mLyCk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5i2mLyCk; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtLFM45W5z2xsq
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 22:21:57 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id m4so51365946ejb.9
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0bqkP/6kD2dEkTgCubdbv5SGEcZhSAS2Kpi6oik4hU=;
 b=5i2mLyCkBUfIRWek2qWcm/zBcM11Y03MOtIhtz12kWjcGuMWlRSu8EfTFzGlcPaytg
 NNaP8hu1d5WvRHwkqHi7zAOt444rdPN5JI7ZGDgygYNXcgv+mST7i/BgBYsEzk1eUbQN
 0Ze2FF+aCITVaZKXfG0XGhZY8K4GF9L1sswh/Xux5GmLXI0xgji8M+rCJkW/NlPGN4SL
 wHd308PhxidAO8oeEOZWkq+OCYjIOeIHp+f5eazLoAu55A+lBfCzYlG+Py8C2wSjw0/k
 Lbuz6O93L3AqwHg2hRlx//zVK4FiKU0mRVyOKNXjBwZaWCcL501sCik1deDVh9weKU83
 7AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0bqkP/6kD2dEkTgCubdbv5SGEcZhSAS2Kpi6oik4hU=;
 b=x7Fi/BpGFMhPtNWTvMMkrm9Plh5y2X4tRqbVqoeOy2+KBCuC/jyC3n8dVlYL6gawRd
 pHhsKLijHF18oAwZ305zlxAA8eA5fGp3zeoY+5MoiAUfve2xmuGJV274yJCA65/nnb75
 p/tvJ7EvxU32UpuUpnA51P44xIpqO4SVWhT75E+Zp4ubqjn2Bv/GtyWWnui8cZuMEZho
 gRP9ftxpkWxqImYUccMZ5r9HFc1zF8eynaOpkUJ3uf5dMgsX5DV5JYEzU3gN71qW8jFs
 v4Ur4OJwp+vb4AKaHUY2i0yEP7TDyQ2L5traDnmSzvEtnR7pfJRchPzoPS77vVPKwc8E
 SCEw==
X-Gm-Message-State: AOAM533frrmU1+rZVnPllv/UgYFH2ZUaBGwtGXp9Ff0k7KBc8tc3mJAT
 gqXJ1e47ysUworAzrw7VdrKb80WQavSgoSsV4xAyew==
X-Google-Smtp-Source: ABdhPJy72mKz942t5mnsstnJzgdSQgFirWBs0odiUef50w6iscT45TayiO/M7HTYnn3ITd3xgxGBzHLtIU2lxZzJUQk=
X-Received: by 2002:a17:906:ad8e:: with SMTP id
 la14mr3290346ejb.492.1644319313799; 
 Tue, 08 Feb 2022 03:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20220203042134.68425-1-joel@jms.id.au>
 <20220203042134.68425-2-joel@jms.id.au>
In-Reply-To: <20220203042134.68425-2-joel@jms.id.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Feb 2022 12:21:43 +0100
Message-ID: <CAMRc=MfYH=YuFaV-pX0weM5o+i7u7gkQ7d7qg2j-XK2EoN1BkA@mail.gmail.com>
Subject: Re: [libgpiod PATCH 1/7] tools: Clean up scandir memory allocations
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 3, 2022 at 5:22 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The code copied from gpiofind didn't free the memory from scandir.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tools/tools-common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index 0dc3d52668d7..c83e68a2c1e4 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -190,12 +190,17 @@ struct gpiod_chip *chip_by_line_name(const char *name)
>
>                         die_perror("unable to open %s", entries[i]->d_name);
>                 }
> +               free(entries[i]);
>
>                 offset = gpiod_chip_find_line(chip, name);
> -               if (offset >= 0)
> +               if (offset >= 0) {
> +                       free(entries);
>                         return chip;
> +               }
> +               gpiod_chip_unref(chip);
>         }
>
> +       free(entries);
>         return NULL;
>  }
>
> --
> 2.34.1
>

Good catch! It doesn't come up with gpiodetect which is what I tested
with valgrind but does show up for gpiofind and gpioinfo. This patch
however doesn't apply on the current master. Also: I don't really want
new features for the v1.6.x series and we're heavily reworking the
interface. Current version is in the next/libgpiod-2.0 branch but I
should be posting a new version with reworked test suite later this
week. How about working on this feature for the new API right away and
make it part of libgpiod starting with v2.0?

Bart
