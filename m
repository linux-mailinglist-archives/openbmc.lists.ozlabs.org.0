Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C58A2A346
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2025 09:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpVnS50csz3bXn
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2025 19:36:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738830985;
	cv=none; b=clri4wS5rIBe9WArsgPL6XmJWOjtAOn7Ov68DCKYXaE9Xu7CowyXNxKT3UYBT3EoXhIKuK/Y0hcdh+G8jgEhXaynJIlggBl2pPhDmRRNd5dDsTsD8qA7mva7VFa6ayAqsdRzeobNDinkPZoEgfuwDiG1woeNiIhOoiQa0Q4nk/TzoEJ1X5xCQG9O6in1OqJBc5vewn9K8rsQZ2DBDGAGoiKmV1SFKP8WBxys9JnXrurZ7q6KW/zuoHUVU19F7ZDxPN253vyg8tHbKTB7ofM/RNJ1MV99L44Q65IQPvoNY2Iica44W504wzasim3BZUL5rdZtfC67UUK/UyGluJxQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738830985; c=relaxed/relaxed;
	bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUOF6DTwCTTbL8Na0KCtTWSS2/C+JaIc0N6Cn87SZkKf3AzUbY9FQt8E07w47lcVQL6srhwB2Qls4p6/JJQ28n6pUhE9R1wBofbFgESLOXYjULIjmqnN/TrrJOkrDJH0yEh6Rx8JtL0Xb170bRNH9/q3uzoBbsCGXjMCYaHLRIgvQBa+fPYa0Gz7vGj4hTIgIekSOm6XGWwHt0Bo6Mlv5JHVlytgjlksHrLy1DCDr70132ILvUEjIhMVQb2oktymfCs2o2Djj7e+gkqtdGvqkX1u9NFRQ15X57XB0nIAHdWPWvRFIppwdkKM9Yd6+DRiGwm6g2WsqMo708JdMBdDQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sk8mGCxg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sk8mGCxg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpVnM4M5Vz2ydW
	for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2025 19:36:22 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so6395031fa.3
        for <openbmc@lists.ozlabs.org>; Thu, 06 Feb 2025 00:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830977; x=1739435777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=Sk8mGCxgoOFQPlP6S4S5EIzWLfWBymdeHbCRySIYpg/V34zNtIXMY7TvBwECJYs5ew
         UhMfGClTNtKIhv4lQOawb9i4IDFuUhPUzVZ8Wo7N9igYKzdPMe0Kmc4lnmZXcUEuV93/
         Xw15zrFZR0OLLoAlvF07TwRvl9laWhMnMCmrb/xqJbR9m/v7IyRyNQdhAqSxAyx7LVfH
         43HlKG6MHrmKjYYBx4iE0jAo6U/rFO5nCQ9aqPaaP/vBZ1EREG8MqbGF3zSsXPQSGqU9
         JJ48oQrL1V2pNdw8qCS+79pd/JY8z75503cq5j+Da4PCCnn6yVdKsGtLcv2LyNDKEdsh
         L72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830977; x=1739435777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=NVZp2LIqU2D8g5HyFv9T9TyIbw1cKWK6bOB4C7/JTrkfl91eDS6Ubt4PHPeojG+q+I
         +vnsz44V2NRIcUVqera2XktUxb1RSDJHw5L+sqfWJgrihKSyCLzTAQo0HlgQp4Ab/cyQ
         vNCfJviuIeUvfrx6PJ4YKJXxy2kqkO4AXmeF7acZa+7o8G5yMOgpkq233B6pBjrvpwiZ
         5KD5UvDI4QZ+U8WsFb1RnPU2sQ1eHWQW4rqrI25BZVVkxG+8TC7Xh///92OzhBkfJXMN
         8aRcA64tevvGmEoGkZDn8T0VZulf/LX4VOQmlAkmJhpAHVI8VU12KCVvnwaKMEz0nw+a
         ewcA==
X-Forwarded-Encrypted: i=1; AJvYcCV8JGcJlksLfiattw2fayBChG993clqd6LLVUYL8gBIRNkuRex5UlvvNTD+oMlGtqJCm2cRynId@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzUITZYVUoi6uglFgfZTjCR5paAFfy2cYhKb9uTiodDj4aY6ot
	uig3/hdqXpyUKi+e7rluBXCv5JsZh/jgl3e+mpbBqBB0G3JUz1p+O8/cbpYBqXK6qRKBKUOCSGQ
	qU/CMeRiQCIaJmIeZ5M9EAPIjgPffSSIL84tijg==
X-Gm-Gg: ASbGnctkz2FTay+W94F5N5TOWaNiptWpk0q+kMfwKjYn2nLQcntWDncZPToWeHcGBwi
	THF95YKGERVS4T7tX+Xkn80dhBMAInRah2Uhv34y1oupJdkewFEj4a1Z8dcodnaqfUUpgAls=
X-Google-Smtp-Source: AGHT+IGqiKXm4L+YeLeVQFHSImQCXh+mD3hItVntIkXUihVI1KeHuhPJBTqcl5axbPLpaaqFc/QuLj084XF3Ho3zDXk=
X-Received: by 2002:a2e:a909:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-307cf314370mr25665811fa.17.1738830976947; Thu, 06 Feb 2025
 00:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20250118031334.243324-1-yuehaibing@huawei.com>
In-Reply-To: <20250118031334.243324-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:36:06 +0100
X-Gm-Features: AWEUYZkX2cnuZf9rPQW-0wMag-z22j76Wt6UnyFkyZ9657h7xwcCtMF7wIeVba8
Message-ID: <CACRpkdbDXYRi-CvWGU-3y3mrVLSTj6EBUtya8X=eruaLBydyYA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
To: Yue Haibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 18, 2025 at 4:00=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:

> fwnode_irq_get() was changed to not return 0, fix this by checking
> for negative error, also update the error log.
>
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Patch applied!

Yours
Linus Walleij
