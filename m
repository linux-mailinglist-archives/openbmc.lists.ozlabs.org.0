Return-Path: <openbmc+bounces-688-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E3B9DFF9
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 10:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXRJm47dxz2ytg;
	Thu, 25 Sep 2025 18:12:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758787928;
	cv=none; b=bd25GLCCZ3bNTAhEagDOwr93jHOCgYAai3RjRSg1WHFUEOfdcoFddKgLCNG7QoNwkcd5pbK7bHcRNic10ISlU7ocEJm0FbNiLi8xrvhMns36ZuBWpU3RwtbCnm5zuf6+gmfUdWLUnuhNtc9LjIc5UUUP4agQCyVHNupBJR6rxLaQ8fwB1mzrG56ZU/xhNkK0JiRA/pwEh9Xy5BKmjEitdzmh7ypwRUaexwVI7uJB5Ub9qE6jYNozZuH5SGZO0pK5TiHTkcRRZOtfJTOkNTK+pPDn0hPeImVteUHWLZwpGjrDwMEpLi+S2uUEjuCnjU0kKdb9/r9WVEsGp2jEa5TJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758787928; c=relaxed/relaxed;
	bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCO0149nrK/Jxsq1E8h2CCD9sTsiKAUk9pRcEQF8syPJCwLLd6rvKQK1qpFddvAOKQVLAOrnv3cdKTlyup9ARGeiXK+TZqECFv2ubxSyOo4ZKTtO4T6XFg4p3mAXyV0CaB5sgW2B+hVbmfvnYTSioxfwDK4P/UdhSnl0YfrrPuZM9Bo4wcIisykuCvw8rTLLfH6XP0KyC5zbNXiKeL1BOGOK1xBJViylVp90JTFcj2niduHyfRbrOVKkMQ8JN398TbMgSTAKm1DVZT9m0D/b8VnV7UZtim0SnzXtw9NYiVtWlV4VMnxcPivahFDxvJhi8NaItlBZ7aziH2hOi6IlGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=R6FfKY01; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=R6FfKY01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXRJl3Pqrz2yrP
	for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 18:12:07 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57933d3e498so698600e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758787924; x=1759392724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=R6FfKY01ytAeiLN0h9vSG30dhKeJdWOrNyTU55HipZhteoIAxcWo6o3FZ17iX3T34s
         GSBNSWef3vVL8XV/b/xfB6HduLMHOrB2yRcrDBEk1wroMIgqnBHB5BGDe4hZonyUJ7ED
         xmEsg952LjtV+S6Xc7b2N4pBoWKRbFGSKxn4oYQe3MnVDG2h4zb1gj0UejaaLiMjUZIm
         9MIx9o4xzemb/4FdOBsz/1ezeLe7Y8SqanYsD36D8M5agc3PxJ1Z96EbL6hC9mTcgKYF
         +YICbQ9ZRT0UWbju/kAsDoCUXvQQsVP8BQgyskZrfKsLxGxo+vS4oCofCKPyrOm8o8d8
         EM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787924; x=1759392724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=gwC7ZY5PRON6eaINVO0gp7iFlpwfGasQ9YXUahNbv/oCGX0xV1gwa94KRYjfSJN2jg
         ymFxrVMjMUEpQeuDxb0nQw4JtJR9ikzcklOdSsXeqqaB8QZKG7hY9uRs7bhPNMUcDD22
         fKZnJLnsapa7NpE7fTA65i4Mg9ZK3RsR7qYbq26Y84wzM8YzAGQdWx7xySbTgViL35Kt
         fn4oxXCx1jbhiwNrOfH61NvLOMt7C63O8gueqy8Abu1yZJEPBGkdvH/tBWTEwCcfXLw2
         trCym4zSLZ9+jtu3Dwfnvif4krRUdoVHgOo9TRUBN6sIB+TztA+9zDYA/djKnuPHVfnH
         VVpA==
X-Forwarded-Encrypted: i=1; AJvYcCVIZI8KY71u+5f84eJ9VQRGJBptUnVRq+/SVi8aaTCJDO1I86K/bvMRqSbKgmklgQWBS5DdkJU3@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyasFfD1h21rgZxwQPcXtpMNwP+V+1/e8e5k/MDcPSkijBhdxQo
	78xq6Q237DBM1xmCwR27hXa0B9ySFpNVqUUaLlkcQFXyLD4Agc9894FWvCvQbpEGAG21T7Gaex8
	SbKjpN6KlkdokViuWnQ3FfZNH+9nJDP8Q0dCVwCQABw==
X-Gm-Gg: ASbGncsOIJnCKiQ7lHdPd+COpkj7L3swk5+1mjlzww+P4fG38B/iYAPyLYhmKtYUj3N
	xmjT8ZA8R4z25jXJnnkQENhIy51LG0X6MCWDYQNR4qOKxa9NQ920vdFSnu/MFpfQ+E3NSMiVOMD
	ikEFQsajJ6vB/ydO5Obt6lQuIT5CgHmC1AFcyH0t7ERk2VVOwuxgjsEyr8yu0It1ndnfhyyAiUs
	lrvfQjh5Y6P5T7TqJk2SDG+/wczXbKDiSF3dg==
X-Google-Smtp-Source: AGHT+IGJf55i3bv2L8+gmNkmzkA9WiH37A1+UEGPjEgNIhsONYzUjkvXwduJeRWAHBQx5JD4yW8UWOq3aNBoELENYBs=
X-Received: by 2002:a05:6512:114a:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-582d073fab8mr832508e87.4.1758787923677; Thu, 25 Sep 2025
 01:12:03 -0700 (PDT)
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
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
In-Reply-To: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 10:11:52 +0200
X-Gm-Features: AS18NWBR36rLL1CtueiFc1sMJzM_SH_VKHScbJyKloWTmjZnMKzJiRko6sa-obs
Message-ID: <CAMRc=MeR3iH7cH4aLuN5T+y5FCFyzpR3BBc4chE7CPAy8Ug2gQ@mail.gmail.com>
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

On Thu, Sep 25, 2025 at 10:03=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The (typeof(foo)) construct is unusual in the kernel, use a more ty=
pical
> > > > syntax by explicitly spelling out the type.
> > >
> > > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl=
:
> > > use more common syntax for compound literals") in pinctrl/for-next
> > >
> > > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part=
4-v1-13-9f723dc3524a@linaro.org/
>
> This is the origin link to the patch (by you) that started the discussion=
.
>
> > >
> > > Looks like you (slightly) missed your target. The correct link is:
> > >
> > >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> This is the link to the comment (by Andy) that questioned the construct.
>
> > >
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> I know ;-)
>
> Given the "Suggested-by: Andy", shouldn't the link point to the email
> with the actual suggestion?
>

Ah, I didn't realize this is what you meant. I wanted to point to the
entire discussion and also this is already in Linus' tree so it's up
to him if he wants to change it.

Bartosz

