Return-Path: <openbmc+bounces-685-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8DB9DEBE
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 09:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXQsp6Gclz2yrm;
	Thu, 25 Sep 2025 17:52:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758786734;
	cv=none; b=FwtO00zheBvOtte9f2b4B6EeZeCAdc63SepfqmDE+GgEcMLGdBxKx6z4UHnZfL6KpigV+IR6R3r2vVeTj3adPCtYz4KW3V2v4m5i3TgRV1j8u34FQqzaM8OFDmxv2e7mOywLrZWtidc6SwQ/Q1bReR/e1Ymp79CDIPKNi3+/txRH0GjUXSS612eUYEF2hIdBcpAlOuyb9GpSIVrab/EqqNb9mjnATBc8DaMB6pSIEkPjaob33X0MLFUM2m+DL96O2ocHShzlBl6xt4aq9dlMcr/Wk1VZTOkOC2fUMqajqKAEP1esO63+rDmneqY18eTexTLD33Ep52gY4/daHjWZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758786734; c=relaxed/relaxed;
	bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFj+I6NGcPficZYrApjEoPHI4Gb4S8Vo2cI2bMMFfE+IX7EmchCG/8j2N+RDtbPX5xcSvkDCjw3hVuEih4YiCIv33NLQ6RB1yoKdm2MoAqd0l3oxUUgW08OoXLfH+rwQwoacHrmRC76FfHbe0uc6Mx/f6TgBN6ilJXURPo2b2R4cczTjaKLPcOULdU89sp8kmDCUfYBC4bZVVZoxdN3emON2GUDGAG7aAYTTj9B2MHUwLw9sxX38UDta38S5APZ0O/6Qt1fyyz+jQvUTae+3eXWA2eAb7IGJ9AkBC/2gn0BsbdDoGWZ9g7xCkFjqEhQH0PN4VstjoYyD1nk57RJTqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=V6QFZ4+J; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=V6QFZ4+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXQsn0Hz4z2yrP
	for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 17:52:12 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57afc648b7dso777023e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758786728; x=1759391528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=V6QFZ4+JotEbtpgwO0MCxPEliGWvi7Lmi6aeJbaItB4FlFpzVwN2ipUCpFQJUtipbx
         F3ogsoZTvGrJoFw1R+6HBW9Mvk2Na354w+dY11d3cO4d9nc7cqQwomgKDI+kC8Cg1Hvc
         LKWyHEdQztsP2PEds2q6sdwPPMjxD9FODdVR7zI964LF2Mo4mQK/4xkuh3vHwlj7Q4N+
         VBbLx1yRjA6iBkF9I6RpRrBrv9xWw0cBaFJvdXlp82rd0FcmXJS9tx2qqryzGGP2QnbX
         0kmw8fOWMScbeiSnmL65mFEIs1Jz8/y/svQJHdGWOS5M7a1CJNidjOiC69SsFwJPaYuE
         /dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786728; x=1759391528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=anXxuj/rl+JMvyVHHFXSH5WZZ7+H5k/xcxhlYEvPNH/W7hug357v7OPiOhGQlg6JO3
         6ck4yuqUKUg/E3W9IoCcn4Nedk2JKKNpoFB5lIkRNWChkCKG3uBR5wLLfp5AzDiOjsE8
         B0HbH5EvNem3M4BWVKJrD3h3kdaiUyYPk58f0mit411WiqAHbLyGVyM6psFpZNvuuvvu
         FusbhU/0VOl3NGimsQ8OtLGhPMVw2ykDjcXqL/Lh8aBK3uUPk4bleCeU3MO4SYc+4Njk
         FRsp3fYDsZ1FJ/43PmKkcbn13LLGwUF9h6o9ZI67d+rmfNRbXry8hwqpbwf8FJeIg0A9
         AyMw==
X-Forwarded-Encrypted: i=1; AJvYcCVWM9Y/QSLpgRV4wQFhdgorm+uoyuoWqQ97Gdi8eUPYbkJCNGaKmUHnt6e/t/kPq6fXra8f07wI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbgSzRMfcXNnz5Bq2gERxgXFGTlTT7IjPum+4SnpPAzgNdpSNk
	JwrwXFh+2Gj/PRt5/sdl1PG0gkCLDfcvu6MhkqWMlqhVB/QS4/1CpvJL9fCP7xkD6YqSjB3qSzC
	7C7q1luq3MJnitm80wxC/H+mLAOam1zJ6KmsapxolpA==
X-Gm-Gg: ASbGncs6fO2KsHz+0bB1tyJ89/EkUCFK+ximsaG90e0p6gq5ilM3bOiEPy9FLAJQR9J
	UYWfDrAiX2ZfTgeEUxyabSY+OTAMMqnyRs2+1Md6EkETyLSudD2V+K0mKj5ITH4O3cLcHlO3DXc
	HSjkFsaooGaNCMSo0qp9ysSgsZcZeNvqAMvvTJf5bqf3TMZh8+C+g9UN2754/HEvL7wAumifASz
	EtmmEF7dIQCaTS21RQhslxthJ60AZud2MefPQ==
X-Google-Smtp-Source: AGHT+IFjDFQMappKZZFROu+v6o3bME1MjtTxrIbJ3f6pWVz6MpCD55Lk6Fra5LzFmOtZoqCjtC5vbl0PRHtSU8AsH3Q=
X-Received: by 2002:a05:6512:3a8f:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-582d14effcfmr700774e87.24.1758786728179; Thu, 25 Sep 2025
 00:52:08 -0700 (PDT)
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
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org> <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 09:51:56 +0200
X-Gm-Features: AS18NWCh67p36-1DiEra54BRYeOZGMgpqlB-NSoS3MdBtkk6GMB-z9-7UGdMnvw
Message-ID: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The (typeof(foo)) construct is unusual in the kernel, use a more typica=
l
> > syntax by explicitly spelling out the type.
>
> Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> use more common syntax for compound literals") in pinctrl/for-next
>
> > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1=
-13-9f723dc3524a@linaro.org/
>
> Looks like you (slightly) missed your target. The correct link is:
>
>     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Hi Geert,

This is a link to the discussion with Andy as per Linus Torvalds'
recent request to use the Link: tag to point to actually useful
information rather than just the patch's origin. Linus Walleij doesn't
use b4 so the origin link you'd normally expect to be added
automatically is not there at all. That's probably what caused the
confusion.

Bartosz

