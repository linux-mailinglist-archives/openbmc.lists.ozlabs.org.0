Return-Path: <openbmc+bounces-135-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C503DAD35D0
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:17:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGnps6zSZz307q;
	Tue, 10 Jun 2025 22:17:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749557829;
	cv=none; b=PbfgQCY3nt5aAH1HtKt3hdKvOyL3du02Kgvtn84H5P1m3mFzGC9LnTT4WtE+UNz+EiOD4HSdeum08bJ03Z/PscV/NHdAVzvZK+WDBkinEaVDVMO7HRF75/QcoV+RcKGqrdQ9TjmT6cMzNQ7cruownBF8RzEfUKmX6CkQbMAqiG1JI4vlVS0zbs0cBBytJK1GSMSESZOmmL3lWUoS0ngEgaN5G3LYJL4rBjcd32C2pUUeQ+0Vt5+Hg3+3648bSMuG/232iWyrMvWVTbOSv0O/FOnmegOiOHLa8A87BIVucB3klYXIPGMlZgEz63zV0O+N6uBJAQo5AVZxiorlBssKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749557829; c=relaxed/relaxed;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEKcbzvrWSjAMb85jNgNBhrmurSd/yHHOBGaqMuqzahpQeK9H7ziag1kEAZcv3zYpymODL6DvdLB8ACjWwZpnbna53mUMG7uQx+Wg0pgHo9rBwHWQ2uDnzlXBJrEKe5LcCiO2feYt8qJh2TvVMJZjN99ozH0YNv5Z3O410ZpLnzc17bPWwMfN2ddVDRLk3IDxcg9HnEel9QqQ0jMoHAyA3x4fkDwJrzBG9cDyCSd4bY9yCIOvKU6EOmfntefSimxH5qlYBl6WV4TMCNVozZ14L276Xx9Hx0Z9EWboKLocizYo4S7srxPcSZm6EtMoB+YFMIk1yNTWuks1Dp7Vt/x0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gxE2J3yi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gxE2J3yi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGnpr4r1Gz306d
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:17:07 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-310447fe59aso51954811fa.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=gxE2J3yiN/zwsCVYRaOWFCrB0wvcWotj4I8QieVNFp9Lx7QsiTdam/gmEMdrgllboJ
         G/3afahfwirFLYLd1oKBacb/YnYRMgJfhIsQ9WFD1shAqaVqVbgimrlDilsMhcEqFg0L
         UY0kEsLbDW6CbMum2aSxajnwhXhSya7zCKtYvwqhffKIn/euyFbZe5sCUVWF0dYm0RRD
         8OO20X2XRo52QiY2zO2ewo5c4fsNIrKgF40veRg9i1tgM9RAWDiFm+652Ko6B7jf6O6M
         9H5aIcDG8CvJwdWT8Ykbw+LO0kTGH6gnJaawZrcjw8rOiTAcJPZRWeRzvCIht0NeBsis
         DWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=YQ3gxS0kl9zWsswJCjp3V9n6ckSQEqFupzY7vWC5e2Kal4D+u98sVpCou4/DWo1WtN
         qDeiwt3SEdvLHf1mCeJYhNDJIANN8UthXPY3ANyEI8i4joCMtx8/WjoBouxnOoQuIfUl
         JqVidOhD6JDrvc0CV8AQPfh/gTm7Shn6O3PHP6Wm/2Oe8uZudMlB7avZIjHVni99RWnB
         OX1NyZRJklOS2o88idxYKxu18DtnQXx2zQtymB/FO3uzeqZ8tCDuBsOo2XggydvO6okt
         bbXltr4iljvCWNzaSeMZPoZqoWb64PvkcrESx4RxXuWE9o08er0timdcCDdfV1O4RVlr
         CEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVaq43jSZrHxrVdUXdxIuAreYlkXJGfjqlYJgZVaGcdGldEKaouPI6ZeAvF/uN4CbW13VeNYghn@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzPl7A1I7x9tvQVgD63OeuprgU5SEsVB2E/nh6cw4V0MOViSZip
	s/TpJ+mqS+IUihyZpUaKoU+kpOHv6ghukS6cJc7TKu4DCT+tGpYkZE6k6ri/oOWxRggMYSlUNeg
	6EjJNhzwkhfKrKWNzeSGzq1qVeFC/eRkTU2BXu+yqJg==
X-Gm-Gg: ASbGnctWCfwK2P/tj22wABAnHNvspW+aIanWS3ZLgQgp1FdH0Wl89d162uPl16nM5nm
	fH2mvVF1+FwVk9dbt9cK0NJopxB5xx/i1ZEjnheI74P4zTmzZIYQG0UvtdvySeNueINAZI7eZB2
	FBD0lo15MfdScGhV8/kqZBy6bIcaCkw6B2za3NG+5/fz0L8LVTdLsNNw==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
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
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.

will you rebase this series on v6.16-rc1, fix the snags and send a new vers=
ion?
It's all nice cleanups so it'd be great to just merge this.

Yours,
Linus Walleij

