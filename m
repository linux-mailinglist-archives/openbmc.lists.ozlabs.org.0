Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B62F7301
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:46:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHBXy2hWLzDsXN
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 17:46:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZlF5C4ZA; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHBWc0n8lzDsW0
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 17:45:15 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id z20so5390978qtq.3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 22:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gh8HhSlmCSBWaojzE/HYuUCAntaz40S9lB/wGlDSsMw=;
 b=ZlF5C4ZAmg7iOj8Bm7W9PQvjj15VnAhJcRJ8k6rE5esZwlCT7tdznWRLBSonra7cTm
 gj268XwI78eiRZdse80tzC+abSJRFeHM+SDp+CzcowWCY8f77OkeSXsGWYNBixoMC8F5
 b3jCrXpbo/xnTOSzf9ZFGnzhjStJSgEaqcs3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gh8HhSlmCSBWaojzE/HYuUCAntaz40S9lB/wGlDSsMw=;
 b=htKPt4sMjr6ira6YEF/Bb4Uox4wEuhAZ6DkikQQH0II8XkxDSc21iuT5CjUMzG6vLY
 ym0wDaYlz87L4lOKg6XPmY3JT8De0Uo6cFcv72k24I1dCmz5u7QGbgDDjcyoLn0NMTbv
 cZbYX3ANbuc5naZ0r/vqo6pptt38unr4gkvYnGhyLjeQ5XtPZjXMzumzdqT1kywA4MII
 AWlqPkiJvRs174n8b3sEE0CkNRNj0cyd2y6JKex+w14sMu77Jy8hz593Vx/jXNFr59Zk
 0bH7eCKMZ81GUxGpj1cfcjxuKJQFd2q1WFo4xg7qiHUoAm/DRf2jIfYRkjKfcfwIUrMo
 /1Gg==
X-Gm-Message-State: AOAM532O3vkrHeOI2yWbBCp8nVQvtdoo/igkAVf7HZKp9klKjrqYb1IG
 OJt4d8+lWglkcrztpwwOH/A16eSOz9wtHEJdJLk=
X-Google-Smtp-Source: ABdhPJwasVdMnRYgtlBSoCQU9ecDTNaPx/5Pz0RwzoOeeREW9iq68iJNKQ6pPdZ1btEm3h1GO7ZbG9hLV0ZUJz/Qrek=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr10622328qtd.263.1610693112688; 
 Thu, 14 Jan 2021 22:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 06:45:00 +0000
Message-ID: <CACPK8XeRNG0BybuG0is0oeMCffg=sMMObYR3t0ssAx2BpBNt3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 00/12] Add NPCM7xx patches to dev-5.8
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Wed, 13 Jan 2021 at 20:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> In this patch set we will like to align with relevant modifications
> in Nuvoton OpenBMC Linux kernel 5.4.

I've reviewed some of the patches. There is some work to be done
before some of them will be accepted for mainline, but nothing that
blocks them from being in the openbmc tree, so I have merged the
series.

I've bumped the kernel in meta-nuvoton, please review that change:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/39742

Cheers,

Joel

>
> Linux upstream current status:
>         1. npcm7xx clock driver - adding read only
>                 flag to divider clocks, Will be sent to Linux community.
>         2. Adding NPCM ADC calibration - Will be sent to Linux vanilla,
>                 but I am not sure it will be approved.
>         3. Add DT restart priority and reset type support - sent to Linux
>                 community la but havent approved yet.
>         4. persist configuration to the pin control driver - asked by a c=
ostumer,
>                 didnt sent to Linux community.
>         5. Add HGPIO pin support to NPCM7xx pinctrl driver - will be sent
>                 to Linux community
>         6. JTAG master driver - will be sent to Linux community once we w=
ill
>                 have BMC folder.
>
> Changes since version 2:
> - Address comments from Joel Stanley
>
> Changes since version 1:
> - Address comments from Jonathan Neusch=C3=A4fer: removing trailing white=
space
>         in NPCM watchdog documentation.
> - Adding Stanley Chu to NPCM JTAG master driver
>
>
> Tomer Maimon (12):
>   clk: npcm7xx: add read only flag to divider clocks
>   dt-binding: iio: add syscon property to NPCM ADC
>   iio: adc: add calibration support to npcm ADC
>   dts: npcm750: add fuse regmap support node
>   dt-binding: watchdog: Add DT restart priority and reset type
>   watchdog: npcm: Add DT restart priority and reset type support
>   pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
>   pinctrl: pinconf: add pin persist configuration
>   pinctrl: npcm7xx: Add pin persist configuration support
>   spi: npcm-pspi: Add full duplex support
>   dt-binding: bmc: add NPCM7XX JTAG master documentation
>   misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver
>
>  .../bindings/bmc/npcm7xx-jtag-master.txt      |  38 +
>  .../bindings/iio/adc/nuvoton,npcm-adc.txt     |   2 +
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  34 +
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   6 +
>  drivers/clk/clk-npcm7xx.c                     |  70 +-
>  drivers/iio/adc/npcm_adc.c                    | 178 ++++
>  drivers/misc/Kconfig                          |   6 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/npcm7xx-jtag-master.c            | 840 ++++++++++++++++++
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 130 ++-
>  drivers/pinctrl/pinconf-generic.c             |   3 +
>  drivers/spi/spi-npcm-pspi.c                   |  75 +-
>  drivers/watchdog/npcm_wdt.c                   | 117 ++-
>  13 files changed, 1404 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-ma=
ster.txt
>  create mode 100644 drivers/misc/npcm7xx-jtag-master.c
>
> --
> 2.22.0
>
