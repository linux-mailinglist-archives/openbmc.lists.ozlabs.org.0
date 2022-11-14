Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E80627A3A
	for <lists+openbmc@lfdr.de>; Mon, 14 Nov 2022 11:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9lXc4Pnkz3cHs
	for <lists+openbmc@lfdr.de>; Mon, 14 Nov 2022 21:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cjIVuxX4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cjIVuxX4;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9lX427N5z2yR9
	for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 21:13:55 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id x102so1299748ede.0
        for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWpDJZx8s8TqHa3dJij9Er/yWcw9t9Zuq4Q2LMKSWTc=;
        b=cjIVuxX4EEpXLMXV2WzT6KB3lCTMfAzo5a/4HH4bnaQj8WYSdU2b4hOg/1XuhEFqTm
         MIVJcOjRmnpDTodd9l48wPFyNzSjQk58K0mfSytAiALhZ3F+2BZSxvDVJzQkbaE+EP5z
         o/pd2iHNzokxzR4uDeZa7hytJoY8Kw7SkFftbAQIeyHk6G+zS/sdZ7fw0sA2bYXhhhc7
         5812tgdjdoHIx+pn1Xk8Ehd7iPIwmzXzELEnCVoAgqHVyJsIyrdXf8NngIuamDquzjNQ
         U76qfYjMshYPaUzDSFNsNU20vSf1Rj0i/wEPpmqDg2cIZdOzVQZlwV4DnUNfd2azOCtN
         ffEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWpDJZx8s8TqHa3dJij9Er/yWcw9t9Zuq4Q2LMKSWTc=;
        b=NO9x1OeXK95yLRTU88pCY8rFkll/0a11ohhZRPpvrd7q50w1y8pU3AA/soG3YlhHQR
         kirZ0UVzGqTu9SiQNcyoF3UlRzYvLcfPGxi13TQz3VyU0wx6kiqT1s/hf2sRDFOBUhma
         CJJbFdCRFFhCHs9znIshS5gQFuFrRQ24X91Y3ikEeALBdvgmTpYnmJF2wqgC6Cv7YHqe
         IWMe2mn5Ot4x637lrBF1Kd2HsyPWFAh/E4+q6/QhehOuZ5BPFQ3qKUV8AynAyR+x3mgb
         gwe3sdmJMR4gRQ6BOeZsrQxxnqCDLALE7WjX/3+LPQYxFhU1fEyot6pxzlbeixTMY7GI
         GZew==
X-Gm-Message-State: ANoB5pnOfwc77BDBgcIw7GB6vFWk4hsW7xvUfd3yp0ab5+VZwuwpjhKz
	oW9J0H44RUtjisAS/0Vn8v0Ca5g6oQaGL/tJ0gl/3Q==
X-Google-Smtp-Source: AA0mqf5EFr3zFnVVb9aA5hK6QctCVyxWWEaL3OJbKudAWnizBxBvsdlv7Ut8KhK4OsxnKbIUo3GwC1JBgOIcKRhKfsc=
X-Received: by 2002:a50:ee13:0:b0:463:a83c:e0af with SMTP id
 g19-20020a50ee13000000b00463a83ce0afmr10150851eds.158.1668420827920; Mon, 14
 Nov 2022 02:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
 <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
 <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com> <CAKUZ0+Hy5suFg9VZ8-+cH7kGc5KLqUnf9hjnT+iaw+a1HF8x0A@mail.gmail.com>
In-Reply-To: <CAKUZ0+Hy5suFg9VZ8-+cH7kGc5KLqUnf9hjnT+iaw+a1HF8x0A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Nov 2022 11:13:36 +0100
Message-ID: <CACRpkdYbS_syVwgc=YndkV-DpEF0K8NpH6WzP=g0AFpN+OTN8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Jim Liu <jim.t90615@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 14, 2022 at 9:38 AM Jim Liu <jim.t90615@gmail.com> wrote:

> Our sgpio module has 64 pins output and 64 pins input.
> Soc have 8 reg to control 64 output pins
> and  8 reg to control 64 input pins.
> so the pin is only for gpi or gpo.
>
> The common property ngpio can be out or in.
> so i need to create d_out and d_in to control it.
> customers can set the number of output or input pins to use.
> the driver will open the ports to use.
> ex: if  i set d_out=9   and d_in=20
> driver will open two output ports and three input ports.
>
> Another method  is the driver default opens all ports , in this
> situation the driver doesn't need d_out and d_in.

Finally I get it!

Some of the above should go into the binding document so that
others understand it too.

Have you considered splitting this into 2 instances with 2 DT nodes:
one with up to 64 output-only pins and one with up to 64 input-only pins?
That means more nodes in the DT and more compatibles. If all
the registers are in the same place maybe this is not a good
idea.

If you feel you need to keep the two properties, create something custom
for your hardware because this is not generally useful, e.g.

nuvoton,input-ngpios = <...>
nuvoton,output-ngpios = <...>

By this nomenclature it also becomes more evident what is going on.

Yours,
Linus Walleij
