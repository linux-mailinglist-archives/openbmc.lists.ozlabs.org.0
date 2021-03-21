Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F87343204
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 11:53:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3DyN4cGpz300D
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 21:53:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h9pTy1bk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h9pTy1bk; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3Dy76ZLbz2yRF
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 21:53:34 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id
 o19-20020a9d22130000b02901bfa5b79e18so13037459ota.0
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FH4wM5G8l5Rn7BVZbm5XSzKGEOouy6YlzFwlfeNn3r0=;
 b=h9pTy1bkFHVsw9FmXhSvwjDj3mG3Le44P3dLCfm4fzu6AwJZrBTjOUFoL2/tNtA/xh
 vFMnnYILnrKdOw5YIf5IYtpaFqjYcVmGhQ/yNRARkExmllNmTPXjMiop5SE97lnL5fih
 MNYSNUFyAykzjsl73isO0KLb6Nk5OoRO5RoaoLoHimvtYf/rvaFIA+I/FZfsBJicrzL+
 X9mZWEsXfPnylLMmrvHLtEF2Rfhlm+5FPwH9fZT4jA0xMrx5rw8ZMLL0ulW3agKh3VMd
 UX3fj/mx0438WWQ5AtVYCImvnIMF8wP3QB8TaRSdxdYhiH4tw+6wtCVz6IFwl4aXfpyD
 pqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FH4wM5G8l5Rn7BVZbm5XSzKGEOouy6YlzFwlfeNn3r0=;
 b=Sp06bmJmDW321UArLQOtSPF20awHqoiO6gkkUwLy1wGC+lJoWG+MzcIBdEkBL0JpQo
 CndXYigWraZ4HtDvbNxD5NDOBsce7QDMzN4jt1hGOaTTrR4wACxoEMugnURwv+QRj6TT
 3M2ehZWTM5hSkjwKuQEuxOlXQED1bB0SsF417lK2y1jj+LopVMRax88/GVBWzG+fDqz0
 n58wYIqmDF8pzKVxcGyN2+fhwdsGFQdxhvebvqybMc3oGpVmig8u0M+SEel6aegjfRDE
 jk0J5G5hIjlEVtgg4rcp2RgOINNndDEIY240hHf7C0tFJC4IUvJ+EYDqY5uTfPRHvv2o
 UVHA==
X-Gm-Message-State: AOAM533t3IlrLUc46JXbfNiRaKrcL3XTFhskT71EJGKgczpTbT5cb8IE
 dVA1ZLXiezxbAvVgwNmqVXd55WVKa5oRdzli9u4=
X-Google-Smtp-Source: ABdhPJx/PzXInhWHLxJmBScN7Fyc+trl4wQeQa9HnWQa/uI9hZyAwBzgxLlNKrKb6KoGZjX4X4LjgUbRrFHyhHo60Lg=
X-Received: by 2002:a9d:ef3:: with SMTP id 106mr7650515otj.24.1616324007958;
 Sun, 21 Mar 2021 03:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 21 Mar 2021 13:07:53 +0200
Message-ID: <CAP6Zq1jdO_kw-B-SX0VNiVqQ1rz1vbt+DJ1quvm286+cbKec1Q@mail.gmail.com>
Subject: Re: [PATCH 00/14] Initial support for Nuvoton WPCM450 BMC SoC
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: multipart/alternative; boundary="000000000000561a5505be09c20a"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000561a5505be09c20a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Thanks a lot for trying to add WPCM450.

Hoever WPCM450 is in EOL for several years and we are not supporting this
product anymore.
As you said it is only available in the secondary market.

Due to it is better not to add the WPCM450 under Nuvoton maintenance.

Again we highly appreciate your support and time on NPCM750 patches.

have a great weekend

Tomer

On Sat, 20 Mar 2021 at 20:17, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et>
wrote:

> This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an
> older
> SoC but still commonly found on eBay, mostly in Supermicro X9 server
> boards.
>
> Patches 1-6 add devicetree bindings for the WPCM450 SoC and its various
> parts.
> Patches 7-11 add arch and driver support. Patches 12 and 13 add a
> devicetree
> for the SoC and a board based on it. Patch 14 finally updates the
> MAINTAINERS
> file.
>
> Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to
> YAML"
> (
> https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.ne=
t/
> )
>
> This series is based on 5.12-rc2, and doesn't cleanly apply to OpenBMC's
> dev-5.10
> branch (there are some trivial merge conflicts).
>
> Jonathan Neusch=C3=A4fer (14):
>   dt-bindings: vendor-prefixes: Add Supermicro
>   dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible string
>   dt-bindings: interrupt-controller: Add nuvoton,wpcm450-aic
>   dt-bindings: serial: 8250: Add nuvoton,wpcm450-uart
>   dt-bindings: timer: nuvoton,npcm7xx: Add wpcm450-timer
>   dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
>   ARM: npcm: Introduce Nuvoton WPCM450 SoC
>   irqchip: Add driver for WPCM450 interrupt controller
>   serial: 8250_of: Add nuvoton,wpcm450-uart
>   clocksource/drivers/npcm: Add support for WPCM450
>   watchdog: npcm: Add support for WPCM450
>   ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
>   ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450
>   MAINTAINERS: Nuvoton NPCM: Add wpcm patterns
>
>  .../devicetree/bindings/arm/npcm/npcm.yaml    |   6 +
>  .../nuvoton,wpcm450-aic.yaml                  |  39 +++++
>  .../devicetree/bindings/serial/8250.yaml      |   1 +
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt  |   3 +-
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    |   3 +-
>  MAINTAINERS                                   |  11 +-
>  arch/arm/boot/dts/Makefile                    |   2 +
>  .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |  40 +++++
>  arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  76 ++++++++
>  arch/arm/mach-npcm/Kconfig                    |  13 +-
>  arch/arm/mach-npcm/Makefile                   |   1 +
>  arch/arm/mach-npcm/wpcm450.c                  |  13 ++
>  drivers/clocksource/timer-npcm7xx.c           |   1 +
>  drivers/irqchip/Kconfig                       |   6 +
>  drivers/irqchip/Makefile                      |   1 +
>  drivers/irqchip/irq-wpcm450-aic.c             | 162 ++++++++++++++++++
>  drivers/tty/serial/8250/8250_of.c             |   1 +
>  drivers/watchdog/npcm_wdt.c                   |   1 +
>  19 files changed, 374 insertions(+), 8 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-ai=
c.yaml
>  create mode 100644
> arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450.dtsi
>  create mode 100644 arch/arm/mach-npcm/wpcm450.c
>  create mode 100644 drivers/irqchip/irq-wpcm450-aic.c
>
> --
> 2.30.2
>
>

--000000000000561a5505be09c20a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jonathan,<div><br></div><div>Thanks a lot for trying to=
 add WPCM450.</div><div><br></div><div>Hoever=C2=A0WPCM450=C2=A0is in EOL f=
or several years and we are not supporting this product anymore.</div><div>=
As you said it is only available=C2=A0in the secondary market.</div><div><b=
r></div><div>Due to it is better not to add the WPCM450 under Nuvoton maint=
enance.=C2=A0</div><div><br></div><div>Again we highly appreciate your supp=
ort and time on NPCM750 patches.</div><div><br></div><div>have a great week=
end</div><div><br></div><div>Tomer</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 20 Mar 2021 at 20:17, Jonat=
han Neusch=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer@gmx.net">j.neuschae=
fer@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This series adds basic support for the Nuvoton WPCM450 BMC SoC. =
It&#39;s an older<br>
SoC but still commonly found on eBay, mostly in Supermicro X9 server boards=
.<br>
<br>
Patches 1-6 add devicetree bindings for the WPCM450 SoC and its various par=
ts.<br>
Patches 7-11 add arch and driver support. Patches 12 and 13 add a devicetre=
e<br>
for the SoC and a board based on it. Patch 14 finally updates the MAINTAINE=
RS<br>
file.<br>
<br>
Patch 2 requires &quot;dt-bindings: arm: Convert nuvoton,npcm750 binding to=
 YAML&quot;<br>
(<a href=3D"https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschae=
fer@gmx.net/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
lkml/20210320164023.614059-1-j.neuschaefer@gmx.net/</a>)<br>
<br>
This series is based on 5.12-rc2, and doesn&#39;t cleanly apply to OpenBMC&=
#39;s dev-5.10<br>
branch (there are some trivial merge conflicts).<br>
<br>
Jonathan Neusch=C3=A4fer (14):<br>
=C2=A0 dt-bindings: vendor-prefixes: Add Supermicro<br>
=C2=A0 dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible string<br>
=C2=A0 dt-bindings: interrupt-controller: Add nuvoton,wpcm450-aic<br>
=C2=A0 dt-bindings: serial: 8250: Add nuvoton,wpcm450-uart<br>
=C2=A0 dt-bindings: timer: nuvoton,npcm7xx: Add wpcm450-timer<br>
=C2=A0 dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt<br>
=C2=A0 ARM: npcm: Introduce Nuvoton WPCM450 SoC<br>
=C2=A0 irqchip: Add driver for WPCM450 interrupt controller<br>
=C2=A0 serial: 8250_of: Add nuvoton,wpcm450-uart<br>
=C2=A0 clocksource/drivers/npcm: Add support for WPCM450<br>
=C2=A0 watchdog: npcm: Add support for WPCM450<br>
=C2=A0 ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip<br>
=C2=A0 ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450<=
br>
=C2=A0 MAINTAINERS: Nuvoton NPCM: Add wpcm patterns<br>
<br>
=C2=A0.../devicetree/bindings/arm/npcm/npcm.yaml=C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
=C2=A0.../nuvoton,wpcm450-aic.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 39 +++++<br>
=C2=A0.../devicetree/bindings/serial/8250.yaml=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../bindings/timer/nuvoton,npcm7xx-timer.txt=C2=A0 |=C2=A0 =C2=A03 +-=
<br>
=C2=A0.../devicetree/bindings/vendor-prefixes.yaml=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../bindings/watchdog/nuvoton,npcm-wdt.txt=C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 11 +-<br>
=C2=A0arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |=C2=A0 40 +++++<br>
=C2=A0arch/arm/boot/dts/nuvoton-wpcm450.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 76 ++++++++<br>
=C2=A0arch/arm/mach-npcm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
=C2=A0arch/arm/mach-npcm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0arch/arm/mach-npcm/wpcm450.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 ++<br>
=C2=A0drivers/clocksource/timer-npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/irqchip/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0drivers/irqchip/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/irqchip/irq-wpcm450-aic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 162 ++++++++++++++++++<br>
=C2=A0drivers/tty/serial/8250/8250_of.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/watchdog/npcm_wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A019 files changed, 374 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/interrupt-contro=
ller/nuvoton,wpcm450-aic.yaml<br>
=C2=A0create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci=
-ln4f.dts<br>
=C2=A0create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450.dtsi<br>
=C2=A0create mode 100644 arch/arm/mach-npcm/wpcm450.c<br>
=C2=A0create mode 100644 drivers/irqchip/irq-wpcm450-aic.c<br>
<br>
--<br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000561a5505be09c20a--
