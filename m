Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 330326225A8
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 09:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6dkC5Rspz3cJv
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 19:41:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wn17EPbL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wn17EPbL;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6djc560gz2yyZ
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 19:41:21 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so44800286ejc.4
        for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2022 00:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD7P+b1uJUWmfha0UC290WbFB/lsLxBpOULEsetw2oY=;
        b=Wn17EPbLbvZsY5ILrWq0J+sZeBPdyBQs/4D+UZ+7nTpCWqN8Un+9B8xFnza+Aqbw5z
         nhf9NOhO7ojI4ojvp8zAOouAvJE5vgU/NLvIvSxdA3bn8Fe4cTZXxgEs7uOUjU26rQgK
         KjtH4YvLA/C/c0MMGxagw+vTPl7ptmwRE1jGgzlEQRW7hPpJXswRpM1WGJmMXWtampCB
         JMNTWcB0VTdBgsE4WbG6hX7DlylHAFx0z2py/oqCG0pVpqFGlx0Y+Ty58RdmFqIX4NU3
         3FjTjxjejf1hXJZuN6SY1aAh7zzdqBSf5x6FubRfG02AuwKZb+xxv2iz3LhBpPYyEAo3
         tqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD7P+b1uJUWmfha0UC290WbFB/lsLxBpOULEsetw2oY=;
        b=Np9WO1rM+CBfO9S0kYkuWR6yLUZ84IlOB5MhRio5zUgToKavF/dbgrfc5nFwH/TpuZ
         OfPWiR7zSct4BYF1Yp5PsaYSW/SsHaZ8Azwi0iYcdw8KCGWLslOWcq8p3KTfrOBCLNY1
         xVGZr/EoyUVv7hDlfL5pWwOxuIuIsPr3BwsOHhL76qBSRxG7v4/YjKgK7qIVAsN/ScXr
         c2JUrQ/fDiDYLdzSm1GuperpNPqm9NCJwRJgFxs/MUULOmlVcDxDAH/HNxVrOc1xvnjt
         O4ijEU3MObhT+2gt4JYUbIQhY8yMHPd1FBuLsO+JbGJc95qwFmxA1tS5MXpDjAt2dkge
         HESA==
X-Gm-Message-State: ACrzQf1jw3vQmMnNmizYVcFc0Q/tavQvngYMz+lCjlLf0ezW9fXK9DPx
	iJw9jk3yUYqrJByxKwCQ9cPTLdKqAoxQ2tOVqgLIOA==
X-Google-Smtp-Source: AMsMyM77dNEurx0K4wYpHOaGDDYKf9s8IrljC312Fyhe5ZOrTX25Qqzgql5RjsUYV6qF2rC8phpcgEBboZwOfgFaKuY=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24184204ejc.690.1667983275461; Wed, 09
 Nov 2022 00:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 09:41:04 +0100
Message-ID: <CACRpkdaUv0=Q4X3VyN6hDZKTrchKpiA-H-aBSnj+8CWU6=TfXQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Nuvoton WPCM450 FIU SPI flash controller
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Nov 5, 2022 at 7:59 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Jonathan Neusch=C3=A4fer (8):
>   pinctrl: nuvoton: wpcm450: Refactor MFSEL setting code
>   pinctrl: nuvoton: wpcm450: Fix handling of inverted MFSEL bits

I just applied these two patches to the pinctrl tree, it looks like they
can be applied independently of the others so I just did.

So no need to resend these or include me on subsequent patch
series.

Yours,
Linus Walleij
