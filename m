Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D9A6A0FF
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 09:15:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJJKy52Rsz3c8n
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 19:15:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742458531;
	cv=none; b=QMYGelY7wVSRniW2vjNDiifJriihwiC0DBmSIdiaBYQGwUtq0aBB8w05RlY3PRXS3fy+9Om77yOclKkCWfwys1YatYx37B6ZrbqbKk+50TvKw1jh1MqA3jujoICVyp6lVqxx/08Ykj9tcN0UJFzBMfNuw4gAmYPjP4CnfMP7buQaQOjWL21p9+Ee/p+yAM+uSrGLRta0nwePaxLXM670f1WwN7sa9iJkIOrJhFYUo3YPzQE9bJn3S1nPSWaL5GS2GddD/lCWPvO3HeOb6NADTBgcbbSKntZ8g8Tu/7P7evjNI9yorIeAGoifnaXHFppJyAfUw2qeL93CDfumMiHUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742458531; c=relaxed/relaxed;
	bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW/kyQrJT7uooAC557a4uwR3DOKFx/YNgzLkAQKYm+CAynO/OTJu4e3VVdq8NzhGdQinz4e+kEPPQhJFNGRPhDh/oory6Z1n7jPHXu3CfgmCdlDoCj63vnfinne4lLIr+VW+KHtUqFepopxORisSfysxs4czjwV6jnULsU+2ojB3IuW5f/SFbi07h8BeKLcqn7LAHApyIXE4g4aw66ldaCZknWJbnd1FLyxdEvQ2jDyy3s7XQp/OG73TzKSxdFCKIbyzG6txGvLMnpZi1mjrS0nYu3o9m1WbViC3Qg5Efl3vp0iODwX7VaTwTuH7OnpmAeJq7Gulk92ToRCekRkdDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l3dnEu2j; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l3dnEu2j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJJKt1jDkz2yfT
	for <openbmc@lists.ozlabs.org>; Thu, 20 Mar 2025 19:15:28 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549644ae382so709516e87.1
        for <openbmc@lists.ozlabs.org>; Thu, 20 Mar 2025 01:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458525; x=1743063325; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=l3dnEu2jnR3GlKl8ZAppDo9BNXzd7kMIHkCp9P1VExeeA1KpcNugGg/fMNwraXzXQR
         v67jg2tp+I0hyOGMFIdmkquaEmBL2OjU5QbX9/EB5cgrcTTstSKetFfHKW6Hx7BeWhUB
         x3aHVLg4kXDliujuwQSFiBhtC7MjYKBp5k2FHYlL3IuzXa46IGYgAopMlvkAg0uo8Hnr
         ibbF2nXd/BmGBrwDrQw378T5K6T+dqkTfXZJnwCw43L5JwWE62pbfEBuVRYLJa7koKX1
         uxc6J+LK5B7fgUmAEaG4H5Y/8XAp9zGfX8FYeCLii1lMkLUz7XoXWOTBHmul/PmfjpR1
         V4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458525; x=1743063325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=lQt0dgGecd4y/e4ZqKLF9ItRqrGBVNQFAAP6OvEcNxcf2L7Dy4b+vpVZodBNePY7YN
         u1MJy0MF5yGZg7/tLthCM2k2RsJI0mjzHtDYWQtU87E/i9/Ks1ocJnGvs/6WWifYzoVC
         nzGBywgOHBKpXe67bTCwXzkotO93K4AQkFrbMSKH2bpku6/QHmXItHDaAnAynQVAMNDs
         5vfDqxQM9zv/lGNYYwoeUu1M9SvfVlRxHfRZ1eODMvxuwGN1oH464OYl08ExIWpPKHFe
         WcKmpLb3gIAxqABrzDbh/DbZnZlfjUlkiBFJu/l48Q1mIF2fTHg0Cwx2pN1GAXcAYPbx
         VrYg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2jmLpCa1aUcsIrRp1NSdxD1R7o5wnKgbaCMqz+2KdvRgVf4zqCzpJ9TK5YbC0fj+gRiA4M3o@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywtil21pPj+I84hfcVsiZfQtL/4KZ42sYxI2kJXq26zzvGPDLwr
	fuc894xDoExO9uf23Kk5bCbNt9MKXvt5QYnUn9qD3eUO8X28iz+6opql/40fa8wx8IXrNAwgliH
	VLXuMBbg+7aw3yor+tpUCvz8i5Pza15DuabFtUg==
X-Gm-Gg: ASbGncuJmjp408uS17Yj3s/hr4lHmqOFyhquzIuRWdTw9D7uSPWzIkHMYXXdwaP51vE
	FBY3dUVHW9gAXQzVLTMmGFCvStr7zQGGmLmBE45GWT6F9Wkkm0Oa2YS5LTzinuOqHxgl5nbqruC
	RL6NGHLEUsADHDFlfXzzicJbpwvSQeqOhMoQ==
X-Google-Smtp-Source: AGHT+IFt36qrZTs3jVigV6s3o6UseGY3Us8oFZFiBf9nDZO8WAVJKTGbrIYvbTde8JRkHb4C+HxFUH8jfnNdOZIUwPY=
X-Received: by 2002:a05:6512:39c7:b0:549:b13a:5d7f with SMTP id
 2adb3069b0e04-54ad067f248mr760711e87.41.1742458524964; Thu, 20 Mar 2025
 01:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:15:34 +0100
X-Gm-Features: AQ5f1Jq4MkD-TA_HtM3sgjv-P_RV51WIW1wiOeKXspOTGRepAHST2Ro8gvkc5rQ
Message-ID: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Jacky Huang <ychuang3@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Shan-Chun Hung <schung@nuvoton.com>, linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert Nuvoton drivers to use pin control provided data types
> and more of device property APIs.
>
> While doing that, fix one non-critical issue that sparse complains about.
>
> Compile tested only.

Patches LGTM and we are close to the merge window so I have
just applied them.

If there are any issues we can surely fix it up in -next.

Thanks Andy!

Yours,
Linus Walleij
