Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680B26C32D
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 15:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs0wD6YXWzDqBl
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 23:15:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Em6XgWp6; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs0v41J50zDqVk
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 23:14:55 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id i22so10300007eja.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8c70bjdvGVrcsac+XpFC4DW7+UbOmn2FO+QEpKETtU=;
 b=Em6XgWp6dhDu4a2sVPZc1dCkrMGHLQvdRAi+t0cgxe6Z2wZ4BP+F/sVngK1Z+kkLis
 uDZT2tBXQlDep2WXS1WMr2OBzVgIravmSa/gd9+DJeWGuD3UOkJZyORqmQP4J/r90n4v
 6eHKLQdKoLYSbUpg/7FGjXbE/rwfe0Lu+ZEgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8c70bjdvGVrcsac+XpFC4DW7+UbOmn2FO+QEpKETtU=;
 b=YKbAUrIy7Jy06nLMvuglzxv1rFffmzuPc/Bc4HgcQyrIyzZqlikBBKujYyOBhzCStm
 3J82qtMSx89Ao6ZxEfKmwq7TneI5Q51UZEE6nPG0HXc+DgonvadApW2ngmk8AB55oasV
 RWREPWCFQhMo9bTMt1wMO3f5Fvrr4tky/aX6AnQYG9UwmsG5QOr7Ql8N5ZvRcBqC4ALC
 y++IKjmoaPZmrWQ2TuSBuLKxV2vLNSIPbwFltwLW6tN1ocgikcCyIVeMTrXD3TtpvZBC
 mwCPaFGhS4i2OTAu4YDoWa3C3MHIVEinGfk7efxesaliYW8J0SdxV6mhCJVnuQwHbTTw
 +pdg==
X-Gm-Message-State: AOAM530IgtK0/FjU5kWrbFKat4/H5LWL9pYto8rdZ9W8Uh1g315OH+H0
 PISuyNtxeFnIDFBSnE282ikhGUwTnwYLslcdMzo=
X-Google-Smtp-Source: ABdhPJyEymYowEXN9Sqs2b7MV5IulS2sjphlMu8IRCGDHXmKJR9ZNsWTTJa6UtJWYJncIfBGvRQ86hfTja+eDRuW9Os=
X-Received: by 2002:a17:906:441:: with SMTP id
 e1mr2604781eja.396.1600262092781; 
 Wed, 16 Sep 2020 06:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200916125554.195749-1-tmaimon77@gmail.com>
In-Reply-To: <20200916125554.195749-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Sep 2020 13:14:40 +0000
Message-ID: <CACPK8XcobhqHG1tQgjY2PH_Lvf3LLfzn7Ex=DVhBO58cUKv2jQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm: dts: add and modify device node in NPCM7xx
 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
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

Hi Tomer,

On Wed, 16 Sep 2020 at 12:56, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set adds and modify device tree nodes in the NPCM7xx
> Baseboard Management Controller (BMC) device tree.

Thanks Tomer. I smoke tested these by booting on the npcm730 qemu
machine. Are you able to submit the gsj device tree (or get someone
who has worked on that to do so?) for inclusion too? Similarly for the
runbmc device tree.

We also lack a nuvoton configuration. We can submit one, or rely on
the multi_v7 for upstream testing. What would you prefer?

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

Does the STMMAC only appear in the 750 (and not the 730)? I was
wondering why it appeared in the 750 dtsi and not the common dtsi.

Cheers,

Joel

>
> The following device node modified:
>         - NPCM7xx timer.
>         - NPCM7xx clock constants parameters.
>
> NPCM7xx device tree tested on NPCM750 evaluation board.
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
> Tomer Maimon (3):
>   arm: dts: modify NPCM7xx device tree clock parameter
>   arm: dts: modify NPCM7xx device tree timer register size
>   arm: dts: add new device nodes to NPCM750 device tree
>
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 974 +++++++++++++++++-
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 404 +++++++-
>  .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  24 +-
>  4 files changed, 1522 insertions(+), 37 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
>
> --
> 2.22.0
>
