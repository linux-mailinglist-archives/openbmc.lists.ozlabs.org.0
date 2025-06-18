Return-Path: <openbmc+bounces-250-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992BADF28B
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 18:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMpxJ3M1Vz30RJ;
	Thu, 19 Jun 2025 02:25:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750263907;
	cv=none; b=jdMAL4XnoaSoumzWMbtCjr0p82vOZuAMU6laFJdNz6WZpjm2HvaQfggZIg/2655NMBygKRax57QOVwMmc8HepVd1mJsFYZdDjC7ZxEwjC0F29L2uIRJuDZOH0qwZuBZJlYjd5CRAIZUrR2fcsK4NSsuAltowut2QuONpPyMN5v+F0x+BhZVMJpSO+5berk8tmANav+M7dsjFwH40oPrnfOJ/pdEjBNfxs6pUFmkcx9t8mOJjLjlJ3heA8rw8SuCaeq+jq8IGZ6LvlpgHjSeJaDSCuq5vQp8FUictq3QBzyDLlEThrm4kMOZ+COWom/LoEFwFFWctp15K38QxDLniwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750263907; c=relaxed/relaxed;
	bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1WospDujWOCU7XR867a64JWG+Npn1+k/eT1zzBx281oKXYe7A0bMS7yPXEUjysp1I0Rr0hmUQeOK4XGMqcemSTSBoE5nTUpqVdDK8q7fvS6v9lJpiScdSbGGvntY3E7sEC/58a5wurpdvlQKHBWm9f9uElBMzOIaxCK4JOYPXMCZrnTcgpzDorHTyKfrlvEsq0aMiC/M/AX14vpJeWKzwIQSB1RppFfmF/Nz1yay07XkFjaRtBl0emfSxEUBQ/f3ViD3p0cKkAOaT2MAJywZEoKFc989imsd4/o2wvUMVKCPcTcHMKS4C7ZyYlj6ZS8/HCBegYnBeBuyedZ1ePaFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qtEleuVP; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qtEleuVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMpxF3Rzrz2yPS
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 02:25:04 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553c31542b1so3595804e87.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750263900; x=1750868700; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=qtEleuVP6ukLLbf3Uohz1wfvdvEkV/KF0g29yHf1eVZrZrgNPaKsbadwmvKDOzpMlN
         DW+u+EYdgJSO8ODX2dVaf7c8ujrGRfkWbGlbjDt9Ww/TnfUzvd4KVyN+PCk2oil+bYUI
         z10kvrkIj6KstxQPNuTx2lq/kXAI8F+r7tTYadEE0yVI6/6CBFNnSr0V6XQ5CMvP6Fr3
         YFCpeVGmIxCgbEpB4Pj8yzqeQDeJ5W18MAR4vjSFTUMNVGuquuxZd4wSA74KuPt8641v
         VLnmCs7FUnSvrKqQo8405qCy8wwcWqN2ynmS37w2sgJpV6nq6tzxTNeX5HCIs3SPMZm/
         R26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263900; x=1750868700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=WCNB8nL33O/mTUpwI4YXSiILIM5leSXDDRwoIx42wsDVeRXECEfw5gqUXk3bWrL0sN
         xqfaAdRfrsqqVFFUOdq5wcgYIiBSa4oPgFOEaDLsp11B3Hw5nUrwLbRbfnSYu/2xGHFo
         x8+8AlUPtL5xGkOF8YNv7oAvmsfZPXUQ+FyydMzqpiQwNdiH1SKjW8zvXV5eCbQL8RBk
         YafyWg2yDYLBnkZdaD8U5ynbTq5OD3g17+cINQsazPfWS0uhhdFitOwBizigmVGwTDnn
         +iK2DaB21KBmwbAk6C40U4HVazYvD/BgJlAJvTk8ykzwUK71FHyi/DVrRYGicAHAnSfj
         QUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVb2EV7sCbwR6l4yVPbkIwLdl0htA77SFtqmZuvN+SA7pgWjI4nYbbiHqAxUE8+1X+kqlm+v+IR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrHVWjTv23b5MhACBkrTNMf8q0av0brq4c/lF3AZ2kz8FLK/t5
	bxdk5h+XhwzYIupaw52NGwGOcfZ0SVaF0nUlrPhKOmXnA6nVe5qhjj08HbM4GpOi7WN4XIoL7Pk
	xMjDBcec7BcbXuwT8G6xEB2e3eDRxB/dilF1NEzulIQ==
X-Gm-Gg: ASbGncu0Pct9LgHkLhyt36Eitn5LlH0iXTZbHZ1On0YpbsYHLDA9BF2ArKL/mSJVRrp
	QX3JqcpZ9k3V34Y/DxvnPavoVp9u9RNKTYrHmEGMXaoj2MGLEAj3IEWdSK02NLDuYjRCumE9JLD
	rBQfs177vnM595b4Z8vOzbj8B/MKRCAvpBUYAZohAuB2CCdMMstNPeU7Dm6lUpME34a8Bn0dNpG
	A==
X-Google-Smtp-Source: AGHT+IFasWzMx4vvKMGThkbIPZ5HFR/Wr5hiH9hJMS02hBIeQh8p7hArmnTCvxt1VaP57eg2rHdU67rWBwbdr9GK3qY=
X-Received: by 2002:a05:6512:1193:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-553b6f50256mr5473373e87.57.1750263900278; Wed, 18 Jun 2025
 09:25:00 -0700 (PDT)
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
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
In-Reply-To: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 18:24:48 +0200
X-Gm-Features: AX0GCFtQiRTdcvRzM4v3bXKNF4ikUT4N9NzJhHCtHKKqoMjJz7WLf-25661k3ho
Message-ID: <CAMRc=Mc9_V8bkD_FyNkxkNoD3Fe7q-CC7ifq3TrD=r8+D_UgKA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Mark Brown <broonie@kernel.org>
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

On Wed, Jun 18, 2025 at 6:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 10, 2025 at 02:33:11PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
>
> I'm seeing boot failures on a UDOOq (an i.MX6 based board) in -next
> today which bisect to this patch (in -next as b908d35d0003cc7).  We get
> a NULL pointer dereference during boot while probing the poweroff driver
> for the system:
>
> [    0.443319] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000 when execute
> [    0.443330] [00000000] *pgd=3D00000000
> [    0.443347] Internal error: Oops: 80000005 [#2] SMP ARM
>
> ...
>
> [    2.522761]  bgpio_dir_out_val_first from gpiod_direction_output_raw_c=
ommit+0x194/0x390
> [    2.533330]  gpiod_direction_output_raw_commit from gpiod_find_and_req=
uest+0x134/0x434
> [    2.541276]  gpiod_find_and_request from gpiod_get_index+0x58/0x70
> [    2.547482]  gpiod_get_index from devm_gpiod_get_index+0x10/0x78
> [    2.553516]  devm_gpiod_get_index from gpio_poweroff_probe+0xe8/0x174
> [    2.559990]  gpio_poweroff_probe from platform_probe+0x5c/0xb4
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

