Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFB625D25
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 15:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81T46mv9z3fsF
	for <lists+openbmc@lfdr.de>; Sat, 12 Nov 2022 01:35:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PeZS2Cec;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PeZS2Cec;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N817n0Kq7z3fXX
	for <openbmc@lists.ozlabs.org>; Sat, 12 Nov 2022 01:20:19 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id q9so13032511ejd.0
        for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 06:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XnWoqHqROPGOcHnPLYRMUbIWz7bYGAQqwcf2qs2Ipc=;
        b=PeZS2Cec6kqzUIH/C6si5K5+55feIDD54TJPB19WX4Zcoql/RyX4YgLOpYMHgn4XHh
         9yRdI++voSchETEZQNwseFKrJo6xkO2WVjPYcY71RIeYBEL38KmwtXSPYUaF+aD7PfZ2
         s70iFz5H6e+Rd60Nvywe33lLde8Vra+pmA7Va1+doOoTIjkR9sh5eywJ2JL+lJFMPDuM
         zjXwP+wdJwrBp/qXzd6hXHMkW8yW8ZGdKRD7B2cmd4rYhtZMYnPQkq3Ywgg5tFhuQZd+
         QCL9HXsVCJcDPrMW2dY3UJHGOylAgruM448ZhHeUV/hllLejfdj/bmM+Va1eTVtXV7ig
         Jptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XnWoqHqROPGOcHnPLYRMUbIWz7bYGAQqwcf2qs2Ipc=;
        b=pZ3IsWr1dCIdGjB3teysq6s3CfNJki1Fs55qaNCzVFGjFtUKn4BT99r6sxL9ZSdU+T
         sz8K1EjKqn+qteYuCYPse5rWCjt6ros8MiXZghmHFRL+IUBt1g39jwaqEIncIG4nLw0C
         FnQNEaLxV5GIQg+TGZWxqUH/OimCxF9cl7HjsAlqj22buFoVNhx/hc/Hko7XBMSThKFR
         wEcx7nYyy7KSjDBNFULN5ws/PGNnzvz0OGd8Rx8B66kC1TiQw//CR03ZF0K6ffxKZSRk
         GWQ1T7GM2c5aT59U2eEgvQRAMp4r39MGtLjQPVLcRFKuEqMcCJITstXQghjv3Av+dA7e
         Lfzg==
X-Gm-Message-State: ANoB5pmSlf81Ff7hM5LSIfFmhCeT0rtoTRAgoV95KJEZG99HHy1HQmjL
	J+kSnpU5nme4CDY8lUgkmvDr3znKYDmwjkGpaN4X1Q==
X-Google-Smtp-Source: AA0mqf4RBAVXKNecwLciDe0WJIDDV+587AIbknjYLqIA0UyJubGVzkQkzChS6pa5mn54/eWVP8ecSisCZ6otgHH5YbU=
X-Received: by 2002:a17:906:b44:b0:7ad:b8c0:3057 with SMTP id
 v4-20020a1709060b4400b007adb8c03057mr1992303ejg.440.1668176414026; Fri, 11
 Nov 2022 06:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com> <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
In-Reply-To: <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Nov 2022 15:20:02 +0100
Message-ID: <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com>
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

On Fri, Nov 11, 2022 at 10:30 AM Jim Liu <jim.t90615@gmail.com> wrote:

> -D_out:
> the output data is the serial data needed to connect to hc595 and the
> data will output to hc595 parallel pins.
> you can use dts nout_gpios to create the number of pins.
>
> -D_in
> this pin need to connect to hc165 and get the serial data from hc165.
> you can use dts nin_gpios to create the number of pins.

In the example it seems you enable d_out and d_in for *all* 64
pins, correct? So they are all either input or output.

That in effect turns them into GPIOs, so I don't see the problem
with simply always doing this?

Just that things are configurable doesn't mean we always need
to provide means to configure them.

If you have a use case where the user wants to control this, then
that is another thing. Otherwise just make all pins input and output
and wait for a usecase that needs more control, maybe it will
never appear.

Yours,
Linus Walleij
