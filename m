Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831A8BA8E5
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 10:37:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wBclJInT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW41C52S4z3cWd
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 18:37:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wBclJInT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW40d58X3z2x9T
	for <openbmc@lists.ozlabs.org>; Fri,  3 May 2024 18:36:47 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-de462979e00so9807753276.3
        for <openbmc@lists.ozlabs.org>; Fri, 03 May 2024 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725403; x=1715330203; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRbtQpzidtZ6kk4EqzDd8mAoHGj4dWVE6VSRYNfcIS8=;
        b=wBclJInTw5LD2PxzO7Te0AOHuwy6SbjpOh85LfjsAkKFJFjYYpT+PODBqbWmfWQ6or
         51/jwp82DokknLo9JP1YN7bV3FTqbPmRwIJFFSRxZfrFRCLjrOo7ikS2zhbHAt5TS5uk
         ouSn2SgbihD2sU8eE88DUQkKe4nLvQD6Hm7GkmfoYC0HXlgtesNftjR3vLpuGwlCBjj0
         4yvAuxgKYoKgCrASu0lCsPrkvmYQObX1tV4Yn4jDDvqxQcbhpY9hUtGTiPH4LxVDUgx4
         kg6Rsx7tKTChcD0XBRQo6vYwd4fCekyylo0K2jESCxMjb2osPiwEgw2jGoMQBoggBlCV
         IPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725403; x=1715330203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRbtQpzidtZ6kk4EqzDd8mAoHGj4dWVE6VSRYNfcIS8=;
        b=K4LQhqSKomXgRsx56/BA6Eosn9zF2H5Iwgx12zab8J0168EsMDvgp2Gzsj5Yo5gM5M
         IDiUsumMstV258lLbEXWGkZke4NEK+uwCBktglaI6c8qLVNEi8Jfy/hQeZx5bBA6pi0B
         oGffySOGQL1ACUX8W0ApGM27iAWp+63Vwgyjkp11mZt/XdMBkXIAxSfLM7yueqEE0EYD
         yG3uIDAedM1fdS7bMWb7kQejIuvtWfRKaI3zTkUKx8A2lfOMh6IFf+YzNUNjSeouvgfB
         zJ8fseTx6dFJNRXio7KUYVmJkgwmwxnCqUpgppEkngTDGFR7cwmDKhsYGcUjSTN07zNW
         HLJg==
X-Forwarded-Encrypted: i=1; AJvYcCXnVYCGtkKRhPsdhd+i72HcpKk1EkyRRd9lozXtqI+fzrkmcs0OapVxxSwVGmXwHXrGS2qTV/5DtdlyGyyj8V9m0aIqlBkmUL8=
X-Gm-Message-State: AOJu0YyCh8AGs35ONUPFuUvzSp+NUJpSGeQ3ceGOVIoj0PvpxBixA5Xj
	gkHXoR/Asfz3etsJakzatIiMsLAP3AdcYOQK7pSN1Z+CX+rwOQk8TAWSqI2oqQJQ0Yzbr5X++nN
	04MKsgrwzyJzTvlJwc+X8Op+bGpd78pR4dcdf3w==
X-Google-Smtp-Source: AGHT+IGrx5xrV1BdUb4LcSt8Vhx2IgFFsnaDepsJtNrcYl/dh8fPYD2t0JfZINRBOkX6EZ7ged0A0nKmz0jq9uBixZo=
X-Received: by 2002:a05:6902:2085:b0:de5:9c4b:dd5c with SMTP id
 di5-20020a056902208500b00de59c4bdd5cmr2425440ybb.23.1714725403114; Fri, 03
 May 2024 01:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
In-Reply-To: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 10:36:32 +0200
Message-ID: <CACRpkdbaC9YR9f-q3fNjpH761VmLn2bhaaWpy-6Fhk3apOT8vg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: KWLIU@nuvoton.com, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, dan.carpenter@linaro.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2024 at 9:05=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wrot=
e:

> The generic_handle_domain_irq() function calls irq_resolve_mapping()
> so calling irq_find_mapping() is duplicative and will lead to a stack
> trace and an RCU stall.
>
>
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
