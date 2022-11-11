Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA58627568
	for <lists+openbmc@lfdr.de>; Mon, 14 Nov 2022 05:46:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9cGg4CNjz3cK9
	for <lists+openbmc@lfdr.de>; Mon, 14 Nov 2022 15:46:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gMWqAgtl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gMWqAgtl;
	dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7tjN0g28z3cC5
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 20:30:31 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id a27so2398596qtw.10
        for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 01:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcplOxG0knUnUxNr+LPhGG5rifvaq3v/b4kjjm7Hk9U=;
        b=gMWqAgtlwha7T0RuWBUIAhI8hmWUr58eKaXkF867nIpBNQBPjol+/ErwjP9ZEiZDS5
         OxkyhvY64ZJt5QGK4qGoF0r1Bnol5QeE0dpZJ0xA5soNX8RacKIVeQXfZuB7/vx80fLb
         ylGeQv7DAMBFa8EfYdlk/yrwHIe+NRU02Rrykj/bFOkr0/D6LHT+17C2abxOmttGhsrW
         zeqtIBo8xm5MTPznLqui3aL8/fthEGYH+FR434zi3D9/E0JDssTjODasKNwrLcnBmEtT
         M87E/kPleNKORbDL5ADhi2VlHUBvuO9wg95K7/LrgDcdm4Jk0MVOwyg0t9c7lHCyfso3
         RM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcplOxG0knUnUxNr+LPhGG5rifvaq3v/b4kjjm7Hk9U=;
        b=T0dwWFX+TpHfHms7AGxfOHpY6qd5xB3oI7YpTyrT7kjPZZx3ulQiQuzIzV2gUCC6fO
         FZROhoSTKLhG50uVU5f0nX+2xE+3jpu+dIwn5UdN9WezOqE9mmDsbukpzgCsQrfQYY8D
         saKM5gTf7Q/8BOG0ryDI30LGMU1jq2vJ1rxdCqsTMmr7Lv+xZQcBZ99ouIl2fupoBGYz
         K8Rp252PY33AUnw1tt/y+y6zrlto1EYoGuIMXnV7vSuH6hNVJPsj2kk1xlVtVvmURScH
         bFoHcUMlXlCO/IavppxFuIoiemaJZca9pRMI1fqKRfLzAe3qF51fKl3M7TUvEDn14UeK
         WxdA==
X-Gm-Message-State: ANoB5pl8NyBOzVkFEQhJk35RovDwA+Lf6WoNcoaVtaobuYjI0PiDeXWR
	t0mr4kpWqdCPLfFVqZh7RGZb0dO6ylsB3IHnpnI=
X-Google-Smtp-Source: AA0mqf5jxCXN/bBnVjpOV5BnLl7pV/IC9HKZa6r7vr9BndNgoNaCs/7sPZwrN/elijNNi1COkOeNsjtKkOZtUXUn2vs=
X-Received: by 2002:ac8:6905:0:b0:3a5:8423:ebb7 with SMTP id
 bt5-20020ac86905000000b003a58423ebb7mr508480qtb.593.1668159026522; Fri, 11
 Nov 2022 01:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
In-Reply-To: <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Fri, 11 Nov 2022 17:30:15 +0800
Message-ID: <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Nov 2022 15:46:24 +1100
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

Hi Linus and Krzysztof

This is a special feature of npcm750.
it's not a normal gpio.
It's similar to aspeed sgpio.

The spec as below:

The full name is "serial I/O expansion"  interface.
The NPCM7xx and NPCM8xx include two SGPIO modules.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
Each module includes eight input ports and eight output ports.
Each port can control eight pins.
Input ports only can be input ,output is so on.
So support up to 64 input pins and 64 output pins.

-S_CLK:
The clock is generated by APB3, so users can set the bus frequency and
the driver will set the spgio divided reg to
generate a similar clock to sgpio bus.

-D_out:
the output data is the serial data needed to connect to hc595 and the
data will output to hc595 parallel pins.
you can use dts nout_gpios to create the number of pins.

-D_in
this pin need to connect to hc165 and get the serial data from hc165.
you can use dts nin_gpios to create the number of pins.

LDSH:
this pin is used to get input data or send output data.
the user can't control this pin.
one operation cycle is include input and output
beginning the signal, the  LDSH is low and now will send output serial data ,
after finished output serial data the LDSH will be high and get serial
input data.

If you have any questions or are confused please let me know.
Your comments are most welcome.

Best regards,
Jim


On Wed, Nov 9, 2022 at 5:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 8, 2022 at 10:29 AM Jim Liu <jim.t90615@gmail.com> wrote:
>
> > +  nin_gpios: true
> > +
> > +  nout_gpios: true
>
> My comment from v1 still holds.
> I'd say just drop these two, it's too much trying to protect
> the users from themselves.
>
> > +  bus-frequency: true
>
> Given that you have clocks already, what does this actually specify?
> Which bus? The one the GPIO is connected to? Why is it different
> from the frequency from the clocks? And what is it used for, why does
> it need to be specified? So many questions.
>
> A description is necessary.
>
> I guess the : true means it is picked up from the core schemas somehow
> but that doesn't make me smarter.
>
> Yours,
> Linus Walleij
