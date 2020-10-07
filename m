Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DC285E59
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 13:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5srl0qHkzDqH4
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 22:42:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ibADa4c8; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sqh2H8JzDqML
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 22:41:34 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id q7so1937970ile.8
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N17VnEsIu34Gcj2d92AACCPEjaWw1N9Hkf92JAEgEGA=;
 b=ibADa4c8zVbJ1vvahEOvd4VRx65VbYoBfkSfKuyVM/p90Nvkf4BstfrPncVCec4iSP
 aLPjZYqG216hpe9L4hi07Q7o0F+X6Ay/6qFBNyQBG/TzpdJeIQPLMp195OVEN1y9PDM5
 IAw+u+ZrPdUvCwZ2qZnyf6SnlbMU/A29lWG70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N17VnEsIu34Gcj2d92AACCPEjaWw1N9Hkf92JAEgEGA=;
 b=FFoLjngccwV0Cuu/XVZhakjP4F8UthK7szE/Q1j+mwx/arSt8hoAoIYY/D7XX3rFhY
 emdW/UHyApkYcEF2ymq6qRsvJUi/7bFhu9DhJCza/yQ5pIs0U5pWx9vIA3yEDGXnhQn1
 J47QU0rsP/USKkDHuBl6UXmNq0VfGIBvHnC9epjn75rwpO0ulta/jjCXfRT87lK+8nEb
 NKUXN4Th7a4lr1xJDr6bcgTgF0XlwXt9KjOcp+32qSAxY0H1RLIZo9YU93UYYJefEICb
 OwMzgK2g5tqSH59PSvhhqt7aYPYvCpqMc8yicZp7Dg2/kICrhDBFn6vKOdF8565+BZYw
 8xLQ==
X-Gm-Message-State: AOAM533Oslk6Q+M4v/DAl7Su5ynsdXVvaGx9X9GsriECkwtDLPII2w2R
 rBjW0aRcZaP3VJp5UgO4Pv3P5Y/rjPa4vGlpRDCg4CAirXk=
X-Google-Smtp-Source: ABdhPJz/r+ehlkOPdveObjrNrhT5nYGNLW4liBrZy4oEKvHxdCFDeWOtreukGOby4kV2yT+CQWXcCXIWhuxEs+X12ao=
X-Received: by 2002:a05:6e02:66b:: with SMTP id
 l11mr2352022ilt.14.1602070891264; 
 Wed, 07 Oct 2020 04:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200929131807.15378-1-tmaimon77@gmail.com>
In-Reply-To: <20200929131807.15378-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:41:19 +0000
Message-ID: <CACPK8Xch0KJW80-ehYxaY=p-OYtx2KWUkMAn8oE_FiqAA-y5yg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] arm: dts: add and modify device node in NPCM7xx
 device tree
To: Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 arm <arm@kernel.org>, SoC Team <soc@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arm/SoC maintainers,

On Tue, 29 Sep 2020 at 13:18, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set adds and modify device tree nodes in the NPCM7xx
> Baseboard Management Controller (BMC) device tree.

This series has been reviewed by myself and we would like to see it
merged for 5.10.

Tomer isn't set up to send pull requests himself at this stage, so I
can send you a pull request (and perhaps continue doing so in the
future, as the "BMC maintainer"). Alternatively if you could merge
this series directly that would be appreciated.

Let me know what you would prefer.

Cheers,

Joel

>
> The following device node add:
>         - NPCM7xx Pin controller and GPIO
>         - NPCM7xx PWM and FAN.
>         - NPCM7xx EHCI USB.
>         - NPCM7xx KCS.
>         - NPCM Reset.
>         - NPCM Peripheral SPI.
>         - NPCM FIU SPI.
>         - NPCM HWRNG.
>         - NPCM I2C.
>         - STMicro STMMAC.
>
> The following device node modified:
>         - NPCM7xx timer.
>         - NPCM7xx clock constants parameters.
>
> NPCM7xx device tree tested on NPCM750 evaluation board.
>
> Changes since version 7:
> Address comments from Joel Stanely: https://www.spinics.net/lists/devicetree/msg380191.html
>
> Changes since version 6:
> Split commits.
>
> Changes since version 5:
> Address comments from Joel Stanely: https://lkml.org/lkml/2020/9/16/994
>
> Changes since version 4:
>  - Tested patches in Linux kernel 5.9.
>
> Changes since version 3:
>  - Tested patches in Linux kernel 5.6.
>
> Changes since version 2:
>  - Remove unnecessary output-enable flags.
>
> Changes since version 1:
>  - Add NPCM reset device node.
>  - Add reset parameters to NPCM driver device nodes.
>
>
> Tomer Maimon (5):
>   arm: dts: modify NPCM7xx device tree clock parameter
>   arm: dts: modify NPCM7xx device tree timer register size
>   arm: dts: add pinctrl and GPIO node to NPCM7XX device tree
>   arm: dts: add new device nodes to NPCM7XX device tree
>   arm: dts: add new device nodes to NPCM750 device tree EVB
>
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 967 +++++++++++++++++-
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 367 ++++++-
>  .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  24 +-
>  4 files changed, 1495 insertions(+), 20 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
>
> --
> 2.22.0
>
