Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6679A85D
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 15:48:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CA/2ETqH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkp2s1kb4z3c3s
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 23:48:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CA/2ETqH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkp2F2Cvsz2yDD
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 23:48:03 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-594ebdf7bceso44022237b3.2
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694440076; x=1695044876; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2twria2YbePMccZx/Qu0y72QIVLYKgrTH3il7drNE=;
        b=CA/2ETqHivHBWSIf8t5DeWYfVb0DO+UrsmUgJJ90m4tKn0I0G6nzozMc3oh1khVa8U
         WFREVEp8v9cN85y4fBIYY503tXQ+VYIAZ7uzWHmHaIeWIU5fmFCQlEgMwrZnxXk+FYnv
         9osdoxg8QSoIM2muXuPlFFh2YsUZELyEAoPba4Is5SOH7eN4sNgvIEy1NXn+rPDbmIq4
         AGCN92AmEyLvvsG1qiVogyLb5GIXaFbtjflFXq0NnEcNINPdyZ2vG8TZvRqCoxTHRMg+
         JWFC3PdR4kjc828ALmjB5NFSzcehjsVzQE1a/wI5Jw2cSXXaBxBMnL11k7UELEZzEcbN
         46DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440076; x=1695044876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp2twria2YbePMccZx/Qu0y72QIVLYKgrTH3il7drNE=;
        b=WH1n0tdpviZlCWXVNLqos1FJVDTo5fSOiBOorWonpRXxnP9PV2R7VXtLjfPnlPUufW
         hUUJnjsD/a+KOySbMQW48EgZY+twMXVgiw5RMjd7/Wi6gyPbkAKGpBCK6WszmTQp5AQJ
         HpbRl1WJsszurQ6VIwr9LTDMYRLUZPRyGq3aTsJiOYR8fJ/GizMV+0KE1Cd7lr9Lseni
         i2u1srTCxIGZWlR1vSdr1e1RoqnlPY5HkKUs+wO6R9ZXnwr7jwBBjY08NTqJIQCL/7Kt
         Z7GtyBe3ybqnJ7MBiIa0ok8SvffL5LwR2TRzlOpfmDGoXXfmQ4icRlC6IOxudk/lyOav
         0GmA==
X-Gm-Message-State: AOJu0Yzu6sGjdzmlkZhSs8fLgU/mNknQO330umJNMOLM02v7O7p5LYn4
	GtY0NQv03+53VmF7wlKjLQ2zpi/J0lxGcZYEg+3vdw==
X-Google-Smtp-Source: AGHT+IHVt+3ZnchikFhFDRdBa/VQCJqjPO8/HkZfwGGvKceMtyovgD2bEwrTwVvQ8oiPu7q9EPztaRlWLDT5bTx7a5M=
X-Received: by 2002:a25:1342:0:b0:d64:6cd9:29a4 with SMTP id
 63-20020a251342000000b00d646cd929a4mr7430147ybt.61.1694440076690; Mon, 11 Sep
 2023 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
In-Reply-To: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 15:47:45 +0200
Message-ID: <CACRpkdYyBg3WKaTWy+xHmA4Bp-r0tWWNj8T+VrvST9h0oWeVOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Use pinconf_generic_dt_node_to_map_all()
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: Benjamin Fair <benjaminfair@google.com>, linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023 at 12:07=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use the pinconf_generic_dt_node_to_map_all() helper instead of
> open-coding the same operation, to avoid having to provide custom
> pinctrl_ops.dt_node_to_map() callbacks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied, I hope this doesn't disturb Tomers ongoing work
too much.

Yours,
Linus Walleij
