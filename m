Return-Path: <openbmc+bounces-253-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36BADF34A
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 19:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqkB0jFxz30Vn;
	Thu, 19 Jun 2025 03:00:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750266034;
	cv=none; b=bAiX78mI7FsOCV8GBUyBs5RrR2ZRAv8fvRhap1mpX4DIc1YpKxvSliXEspiD4+5t/Nt1VkoJZy4eb+mLJNDVHowqtcfYRSX2AMwBVuqjvTxYYGssLKLzgj0iI22M6VD235l5qZVqvP2nnV1SwN0VHkc/TvMOmzvIAvdCGMn+yUBNkJFu0rvMI54sFuAW6ZL4T/VlbyNIbiBUx44/IhJJSl6J8fW2+JmBTCdEdVSmX3Ca7DO+EDth3T3M1ziPabOlmdPHAlcYZmlJM2lwATFonM7IUsv4ha6QGLxBajei1TwNrjh9EZa+ekTr//QbFOf6QDPMH839Kn/y1NgMSnLPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750266034; c=relaxed/relaxed;
	bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwORF1KCzcvn0LQxkljeZBngOvQuC4CFEP+aXISafRESQxBmv1we9Dsbt2MDutAfcnJTU2oBHHaC/KUGx12ybfQTcxewGCoeJd48YJQZxpLj8SIcGwx/EiwSg7CQHTHkgVwyrxLCLVeJVUmfnQNaktMUwwfoOgWnx7vWXwkxiN4Br30jMPrkGFuMmDT5Q8iwbAmvI4rmbCgABzdxwBKVo7TvMXZPJZPGnoaaMrZJT0BmWHHCg+Rp9oPnfxJXwG7Yr6/8APb1Ju3YU+4XBqckdmLQ0GI5e0ny3lZefP+XBe3WrJTOBVggf44Q4d+svehY1SI+qjlV3hZz2p8YZuGikQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=P46jWfUD; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=P46jWfUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqk90KdMz30Vf
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 03:00:33 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-553241d30b3so6333636e87.3
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=P46jWfUDg9rN+5BxyNdPTgpGqkFjG3gy5qkb8RNS6CimNNWd/6bTSRplpDhzJ558dB
         GtfBB/Ri0sUy1Q6XQ6DxxxiI7yfr1mke9ZYku0Y5FD45JxL+a03FjYsUbe3o9U7Jrw7L
         hto4rkbAG+aofNtMQLoaWLLrz29/zR+PLMuCZz8Q5lQryjYRRJij27AWqjRHwCpQdMnI
         EnuxZ130JEnATAWAe2xT6+hxVwWgMrtqrUlEncYrm6zUF34XzgBJtoF4SPyLD3sXKJnZ
         bu6ksTOcVGxl2aulFPY1HXbjMW5RffkTNZVSB9IrY6Ly9qUFT/q+pqzIxA9GykRaMW1v
         G15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=uXKE/i5Do3cfVI/fkGH2oc+GTQ7IIrpYnc7fKQwAt0UW665JqYWzNFXWu3KzWgU1k3
         R9bQLoED4ZoyOXpnkR53zD6xrsXBFqKQ9HfjxNa5D6lpNGrEKBOhh/p9oN+0kYcZbxDv
         FjoZ/k0U8fJ/Cc7O+ihs0jdTlZokA2m/Lu91Wed7+8cGmzblqBAkQFLDscWUEdgM+kEY
         G9aXHL8XWOHY0Wq5tLq08uf1/JROY6ntixmVt1Julvbc/ZYN1whLgwb13/w0b+WgttFM
         t3EoULO9GsLTlbXi9u95YrhtY0W8dnk9yYuOu+2/ak/N+PSMb/0nfHSna9BapOlnYXXg
         4Iew==
X-Forwarded-Encrypted: i=1; AJvYcCVTV9p9HQqr4/QQtS6lK05FTod7mBWf80FBH8nZlGtm1yaP7FEY9ifISv2O2/fCzHFzv319Hcns@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkUYGYo4apw1XPPCm3CAUsHbsl+lg0tdGUjno3UD9N+BJPBGFy
	UYq15OjSxYWThguS3NeY7CcEvYmYC1lKLwfUyzWbCTTDX6SAu4gPVYYWajSvLUefgsWTBhRdyDD
	t0lnGwWAkWcsbmQU73wTN7JMcHUYm3AwuuuMN4Qo5Yw==
X-Gm-Gg: ASbGncvQQXZF6rSbyLXGtqe9PIklIPpRsWdgIg+RICRsa9sldN5DJYa+gDvT2PzxzdB
	/w91315cnZIlA40PXG/8sA6Qw5oNQ/E8EdjHq/yFqOCaQuDVB1xkl+ndZOhy277bUbF2OoDLmw6
	uj6cOVsJ+dT2poi+Ux77rlYEnyakqcGDaSEs41L7gnwcNqdU8F2acqRgTjl+Kt9thE0q4sSnz8B
	w==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 6:43=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> A few more changes are needed to avoid NULL pointer dereference
> (observed on RasbperrryPi5), because this driver calls ->set method
> internally:
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb23..57622f45d33e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc,
> unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio=
,
>                                  int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>
>          return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct
> gpio_chip *gc, unsigned int gpio,
>                                     int val)
>   {
>          bgpio_dir_out(gc, gpio, val);
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int
> gpio,
>                                     int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          bgpio_dir_out(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
> Do You want a formal patch with the above changes, or will You just
> amend them to the updated patch?
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

