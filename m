Return-Path: <openbmc+bounces-155-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A66AD4499
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 23:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH1nV3vXRz2xjN;
	Wed, 11 Jun 2025 07:16:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749590205;
	cv=none; b=Nv8o1rAjyhtpi/zywrLtEKeODfy3NrfXw+v4tNJ/oENlD8a7gS23VuV/+F2C5TmSppwBQwT9U1XTVerxV+ZgLlBdbmXlpksLPju8KsuDsyL9lIkLDIwALrzcmPvl62i+3dQ+ZUXjoAR+kSaA8wmUFkkBIKwROJHmBpPcRak64B5xl2b/Rt9uwWGmBDYxanmu4dnrcXiGZDEONCoEFXoLhWn7IzPiToPSnv6KULY4yCoZ1ABAJE9lsKxzvM25pYNan2bz2ymaAumziLdIPKCYF9oWPS7nBBTpdfp4eiWAfmNAw6CDsLHUT1alhf5tAhuRWk9y27ytbuTZ0ZxglJNmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749590205; c=relaxed/relaxed;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/DKBpbqc2uPcx0Or1scMDepgb/WzfPXg6yoZQti2I5D4JETlm/QEYKBy8IWQq5cMPpQfzlKb2En+QtMFzdELXtlF/rWMdT27iFDqUdtHqlvqcMafhqnoHMlUoPxYeqXT1hfhgR0QryUlU587TzRQ6sanbFuMbSKun9fS6lTDb/ecjoB3GPdJXlO4/1fEYNHaB/zC6dZbbmtWi0GzwxDGuLA7KTCpZRYIoxFll6cNowD4/VMXWc7YYkQ1E4lYlJzKXFTru3biAaw2XOjwv8Gy7FyzpK6AfPYJXx649kQvLpuA50S/JPAf1tw7/zHFoOP/ibGYLaKel7xqu5XUwrb6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cMYyRyy6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cMYyRyy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH1nR2l5Hz2xd3
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 07:16:41 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32934448e8bso51538601fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=cMYyRyy6BI9ohugSC9cPiD1rUaWAml9mk+CqhrwXdGD3jXqRaOdjxdni+5VvUZa6Xg
         sRadHZqPscyPD9U3mkn4XnfqJz9HoYQWg1wlHyj75blBbvqzN+oS9mt7CV872YkebRk6
         1MKOsr4R5iCySBeMMHiapLo8gHSI5vA7BCCYdEJfdEf45f+NHJMAHWmlsv3OVj4jVxMn
         rUUQ+qpk+I13SIMeGqF2xAmYLrI4gkdod2EZXB7Oi6XwFADJ0qDqmci391CB4/CU7/dd
         tEM0dpqmoFNYr/iOjMzexu5/AcW0QhN6uVLzptFCgabRL9565uS91n4GdE3FnMG/wE82
         MBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=MRWbFjmft1Ap3494wNciQ2uGmlZ+GaGq/+avB92dusfX82SWymvcIbR1GRkmav0Ktu
         3+XEbBGcGrF5s1KMc+lIA2cMZem6vhR3b+OgaVcXcV37SItd+OT8ZcS6b2y6Tmpi/9Hh
         DyzMvDmmJFkVJI++mjDZtkvKac3qzPpkuLxqIwvJ1xSHOAiWBYdAWnkKpbR07tfHqpX4
         AIjoyZjeFhg6G7uXUu/cuhYQhZfPfk9+5laKuvTznelTVL0MLHDnimQwtSugLZjSIzDc
         aBUSbZ1ZYmbM+oeMlwAef9rdaPf+K9NRuDOVZR+qGSR2kbcZONXnCmCYY9j9051khRWF
         TVtw==
X-Forwarded-Encrypted: i=1; AJvYcCVqRSbozzgK+rIdpOFc7I6oO0aC5LMuFjk+dYZnJvpgty777XbmvnURYcJfFp5vRBoCiuT21YMR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxjR1hhOVo+wbL7+Y+kQO6Z2aDcZjeSu8LXOyLB3D2k9wXkw+Rc
	/EMfU65GEFZQBO0LhtB6sFZ2K9ePbKUw3nYzGPjxD5AACWSpYRT5FS901uIn14q5PrhVg/6emJF
	gfAPX/IHgaBZr0bXcanBTaiPJCiL+Dh48YIb+99xtiQ==
X-Gm-Gg: ASbGncvcS/rE2VwO0Iqr1NFl5E/Ae0vaQDB1ZhRFVL7wxRxj1Ns3JXj5yj87ql+QvtC
	YOBIrwbR2d248bmLXAgiMO68LCgvt02FM2zP3NpWSSBzwgyyrTPpc6mwT/e072Pr6BddmTi9rh7
	jha4GrBjIp0Y9CInf0Z3HYn8fglNLtmRMr06QUpvy1f/c=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
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
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

