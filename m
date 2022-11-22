Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18383633248
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:41:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGRnD020wz3cL7
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 12:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EtFDMxmv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EtFDMxmv;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGRmb0JrMz2xl6
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 12:41:02 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id cl5so22566846wrb.9
        for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 17:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54RP2IWIIhy2xxrG6c6vLV9h3bx5Ywa0moelQvuO0uI=;
        b=EtFDMxmvIub6AsvD5gUZq2j5iVqjX7b7XEX5dtvzYtqsqABsmsM4uIIZWxNPm9dISL
         fK7m5cnFEK2m/3pm4yVvUsnyMgB7C0F+Z2yN7uo9lmxccGBUlVsGtqskMGcmA/RT2joC
         obhoRSzaSLN2YtWMgaEq9BSTIcc3q02Wiv2Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54RP2IWIIhy2xxrG6c6vLV9h3bx5Ywa0moelQvuO0uI=;
        b=Ma4HonR7m6rJSxr9Aahk+CZ3EpLQIu8+/h8UDHfhz5DZ+yRo6LqiLee5+mEbBMiXLe
         TrOmMvQMk9Kt2fWQDbtcvJ5kN7Ud/ox528bzKUY3UbrH9AIBTaT623/NTbZCpWnljs6W
         wfet0l5G6KFYMXx3I+z2cPvIcvVQNBIXoNFurh4y9mJZIntReEv0lUlSeThHECNNPqtG
         a9Q61ROqbN2D/nD8LnGVcWeQTEO20DjAHy+dmdneJLGCuUUL1CK/gUOxT/yrltQYU2XK
         9856UfznvBtdwQYcg7e+65+m0K5HWU9eEcYT8r6BoHVh8ANc7k2sjkuz1l/XNYEPnNKv
         keug==
X-Gm-Message-State: ANoB5pkuBKbIpMBn2TSjKcQTBgnJOOR1GhfotNna19UsivlaCw+YG68l
	76drAjAUEq9cWWm/RIQL3sW7RrIQUjorqCGQPlw=
X-Google-Smtp-Source: AA0mqf4wL1IspdUOJeOJ/cWD2vinkqtYh79NadtQHo1Z0VjTDwiPzWDFg7XEJZqop4Z+XKeKlDDYRDYQS7jNsQKKF7w=
X-Received: by 2002:a5d:6642:0:b0:236:6a28:eeda with SMTP id
 f2-20020a5d6642000000b002366a28eedamr12437764wrw.315.1669081253980; Mon, 21
 Nov 2022 17:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2022 01:40:42 +0000
Message-ID: <CACPK8XdXrAPMdnn0T6GQiYEK3R4MvwprOZu_Yvmv=WVOfivROg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Nuvoton WPCM450 clock and reset driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-clk@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 4 Nov 2022 at 16:21, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t> wrote:
>
> This series adds support for the clock and reset controller in the Nuvoto=
n
> WPCM450 SoC. This means that the clock rates for peripherals will be calc=
ulated
> automatically based on the clock tree as it was preconfigured by the boot=
loader.
> The 24 MHz dummy clock, that is currently in the devicetree, is no longer=
 needed.
> Somewhat unfortunately, this also means that there is a breaking change o=
nce
> the devicetree starts relying on the clock driver, but I find it acceptab=
le in
> this case, because WPCM450 is still at a somewhat early stage.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
>
> Upstreaming plan (although other suggestions are welcome):
>
> Once reviewed,
>
> - The ARM/dts changes should go through Joel Stanley's bmc tree

I've picked up the standalone patch ("Add clock controller node").

> - The clocksource/timer changes should probably go via Daniel Lezcano and=
 TIP
> - The clock controller bindings and driver should go through the clk tree

Stephen, do you plan on merging this driver for v6.2?

Alternatively, could we get an ack from you and merge this entire
series through Arnd, where we have precedent for merging these initial
support cross-tree patch sets?



> - It probably makes sense to delay the final ARM/dts patch ("ARM: dts:
>   wpcm450: Switch clocks to clock controller") until next cycle to make
>   sure it is merged after the clock driver.
>
>
> v5:
> - Dropped patch 2 (watchdog: npcm: Enable clock if provided), which
>   was since merged upstream
> - Added patch 2 (clocksource: timer-npcm7xx: Enable timer 1 clock before =
use) again,
>   because I wasn't able to find it in linux-next
> - Switched the driver to using struct clk_parent_data
> - Rebased on 6.1-rc3
>
> v4:
> - https://lore.kernel.org/lkml/20220610072141.347795-1-j.neuschaefer@gmx.=
net/
> - Leave WDT clock running during after restart handler
> - Fix reset controller initialization
> - Dropped patch 2/7 (clocksource: timer-npcm7xx: Enable timer 1 clock bef=
ore use),
>   as it was applied by Daniel Lezcano
>
> v3:
> - https://lore.kernel.org/lkml/20220508194333.2170161-1-j.neuschaefer@gmx=
.net/
> - Changed "refclk" string to "ref"
> - Fixed some dead code in the driver
> - Added clk_prepare_enable call to the watchdog restart handler
> - Added a few review tags
>
> v2:
> - https://lore.kernel.org/lkml/20220429172030.398011-1-j.neuschaefer@gmx.=
net/
> - various small improvements
>
> v1:
> - https://lore.kernel.org/lkml/20220422183012.444674-1-j.neuschaefer@gmx.=
net/
>
> Jonathan Neusch=C3=A4fer (6):
>   dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
>   clocksource: timer-npcm7xx: Enable timer 1 clock before use
>   dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
>   ARM: dts: wpcm450: Add clock controller node
>   clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
>   [NOT FOR MERGE] ARM: dts: wpcm450: Switch clocks to clock controller
>
>  .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 +++
>  .../bindings/timer/nuvoton,npcm7xx-timer.yaml |   8 +-
>  arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  29 +-
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-wpcm450.c                     | 375 ++++++++++++++++++
>  drivers/clocksource/timer-npcm7xx.c           |  10 +
>  drivers/reset/Kconfig                         |   2 +-
>  .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
>  8 files changed, 549 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm4=
50-clk.yaml
>  create mode 100644 drivers/clk/clk-wpcm450.c
>  create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h
>
> --
> 2.35.1
>
