Return-Path: <openbmc+bounces-478-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B1EB2BDC5
	for <lists+openbmc@lfdr.de>; Tue, 19 Aug 2025 11:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5l685SvCz2xnM;
	Tue, 19 Aug 2025 19:44:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755596656;
	cv=none; b=hWen40bizj5XJft9dyePzrw4q2UFuR808SUfjad3Qe6jCEefvOoNsl2VDPg4RnNEgaymTYMOYAQoTDw+tdabzU59LEVU7OnB8oK/ZfMiFbnjrmEXvzkARjLPGfGkRcISVFP5u8lvIyqlAfiZwMOY6i1Uwt3kGfa8Wiz9Tjo4OT1KXeTQldztRmA0LiyZXsIxauiSyv+UwpPEJvPcpX5NFEd2+GxkY7updbSzq4KPmI6XKNh3Nrxk1R9qiZSEBxl0dNxIPIaIbcG1apDvz5HeAE6hyR/I9d9WxlhXIEnSKTEnyXtDbV1Y8SSrsjlEPcyLuFelsf5vuUeHpKTqCL0NWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755596656; c=relaxed/relaxed;
	bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho/P3Ti451BX8Cy5hw2W2eUlpkx1q3Akls/zyZQGxPQLbvAV++IuMW4cH/p1pP+I91yid/QnVbY6owwuJ9vn5W0JErgaRoj0T2vyWVC20kRmATjh2k9IOmsiPz88HqHWgwTL7INy1M0pHLI8QrbkqszJI7xKrZdE09AH1nW/2Bsm2Kxh2/lAWPzM0L1gEpomN0XZNQteIRGTbv6JHYrXQW2Zl50u0aEH8ihoz9i82oc313INxqIRyOHoE7tGlrEkaV7Wp5+C68CDXHrWpZdXzcp8vq0+67LBYbrwBG7TKGy5CsYlCCQOgYPeEUhcjiay/L5iQHdfsIFhDHONgTlVyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EJuS8eZi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EJuS8eZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5l673hyRz2xPx
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 19:44:13 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so5729718e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 02:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596649; x=1756201449; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
        b=EJuS8eZiS6rHWeZPiYVMgl4vW33f96RQ+AbfEKi3UGTGzkPWS/+fCsu9Uuzvak4Mqw
         NOK7jLGAyXsAvtYVqg1aX3B2/RM3j7JOCZ5Y2O1F5bpjn58prZ5i/SAMKy7IO8Me8aon
         5s+lRk0G+jZprv4OPNB0I/LRrUyOREXR88m0mnNIPZIe9QcjjnfJzqsgInO8iu9hn2uT
         sHdY98qmyBtrpHs0E3qMhzPs8yxp4QA8ZymgFcb2DIuuToWWSAmR+WmXwlNoT25YUZqj
         KSl8rDkayUMLJlF7FdQ0a9dwJ0AgKnD+kavyhCoV3tUlgxdTtrTyWFzol3RagMwzxaFx
         sd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596649; x=1756201449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
        b=fCdRW7au/Il3v/4kbu1MjcG8uyUrJyededWCugiTzUoU2ZgtdFbJeWbfLnCfgnLaLc
         WNKTtbotIeNG5EsNjHLxIlP9UuJ8sflVdG5We2dgjBxH8aL+pf8CZdOHt7Nckk01NMUY
         iIMHpxBFhxdZMcfjP4ys+bx8QN97e0j5LlGh3iCnFPf6vMZ4otddFD29p5Abxk+MwTEz
         YxkOkfQ9WzMrcNUUzbCk3NzFu/DbJW51yNWkLUGL4R7dp18VMJpnfgpBT+685ZMkr9qg
         vSAKxayw4YU96h+GNDDvCUN2v+pprmTJyVYc1C0S5TZgZYgfLg+scPOFjczm94/sUhCl
         nDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhdvd87ORpR4jIHXq2wVv1NOL3ajPYOkEeqz/y9VnCuRlldLyNYpd29a0FEco3AhYyViqdge7i@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUMsSBOHvMIxwjZ5v+3bm+VGhux8SmG4/dYvEevgZnukebLcZM
	AT/WWKRV/83XVF1FYx4HmfvaHjrOgAYHO/+2hrGUOF3qUe2yVlxG2PJPtNT0MgBpvBJpg7G5XZI
	6AnDEWxQLBb+DNQ7VU3fw/FXT4cNKgABEjdC3bRQJrw==
X-Gm-Gg: ASbGncsoz+aX/jf/kLvUosqWNih/O0Cct5x4TvarlCG+2CR63KoNb7LVQgWVxC4Pjg9
	AnTAFFYnojdk0dUMMje7/prUPrUH1CS0qFKAT3MhpV80N6BUDQwB5/YbYiJT99pJqOQvF0n6D5A
	A9j0a4M6X2XvrG0FJG3VqGGPEldVWM+8aWCiJ1gdDBmXPE4le738tDApO+lj9cio9o1dhEEnPbz
	hOk59uPLRfc
X-Google-Smtp-Source: AGHT+IEb5axoDvieP94ahUcvQF4Cdj/DI1kgL87CBZO05dhRfNXWtWdEPdVzxE8EKpKiDOV7nU9/phOY4imeW35mO0s=
X-Received: by 2002:a05:6512:3984:b0:55b:79e8:bf83 with SMTP id
 2adb3069b0e04-55e00e3ab16mr476219e87.14.1755596649121; Tue, 19 Aug 2025
 02:44:09 -0700 (PDT)
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
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:43:58 +0200
X-Gm-Features: Ac12FXxWHK9Y341YvKoMtvojeGQDJurTuXUIgTK46n0rp4Sv0-QLWOBJFmGfpkc
Message-ID: <CACRpkdYungF_01g0XO=u7meo7pq+9y2YHP5XCBDtKHByee8yPA@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: replace legacy bgpio_init() with its
 modernized alternative
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 11, 2025 at 5:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> We are in the process of modernizing the gpio-mmio interface. This
> series converts all pinctrl drivers calling bgpio_init() to using the
> new variant from linux/gpio/generic.h.
>
> Linus: Please create an immutable branch containing these commits once
> queued as I'll have some more changes comming on top of them - most
> importantly: removing the old interface. I will need them in my tree.

All patches applied to this immutable branch based on v6.17-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-gpio_generic_chip_init

Then I have merged this to my devel branch.

Yours,
Linus Walleij

