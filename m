Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FD2F0AA0
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 01:38:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDZZG63yqzDqRt
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 11:38:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KE59oYdK; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDZYS23ddzDqRY
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:37:45 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id p14so13391839qke.6
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 16:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=trZHacjG91gOXRMbhmGXTKyZhhQj7l8Z1fvCXrOKDgI=;
 b=KE59oYdKd0txM/1wdfCJTsxhNQs4rzEGkCYDbmgD7W5GYRDnYGDM512X2Qy4TWGIRb
 E2Nu6WanzS8uPxEPYJ5igtxjfVBn+koVKuc7cd5LfD6O/PQJFfq8vT+IO2rQyNL2fj5B
 34L5vIlKaT1qz1ZgAmh2rb/e82VKjWGg4gS1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=trZHacjG91gOXRMbhmGXTKyZhhQj7l8Z1fvCXrOKDgI=;
 b=hUmiI4yse3kpTN0brfxuWZLD6rZuPizRg1POWbY5YIp/zBK/faNFw7X8k6lu0tc5LZ
 5CixwdmS7bPghuFBTBngiyl3XNOT7NB3h4pxws4PdmQlOCezYKCHirKKkKVEoAJqj8Aj
 v+NzhMUqN7peVWYV0D4BAQo3ZmndswUpWg8NL/Iftfd8UfMQfKFJl7z4IKylcIdx8Md5
 TT1gABlKhdilW9IfRAJkRlKecE/jQxCG4wuMVWRjDmbu5tBcsa3YCX9JsJt6+1uMrih7
 Uwjr4KECErdvc/eg6kyyysdAqbGArjXfTVKLc750gHoxpgSojcFATZrRhVBLgkeAon5f
 C7gw==
X-Gm-Message-State: AOAM530Zj+flf9OZGigPz2AO2rBJh6CZRKaUMGx49xi0fHrtW03g6SLB
 y87ZwWHRw2Oi+4EitC6HOq0Vn88d3tgolqEw8eg=
X-Google-Smtp-Source: ABdhPJy28spcYdOyEDKaaPDbVSbcIRD5ccxAG236ml+w15rtwM4mgvCa0nx0d67KZpfvrwnP7o06rsvxVQQrwI5yz6Q=
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr13916723qkm.66.1610325461295; 
 Sun, 10 Jan 2021 16:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
In-Reply-To: <20210105134508.225702-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 00:37:29 +0000
Message-ID: <CACPK8Xd9ryK=LpoT56+xE8wSp1frd3QbkoRuQukO4go5=NYkkA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 00/11] Add NPCM7xx patches to dev-5.8
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

On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> In this patch set we will like to align with relevant modifications
> in Nuvoton OpenBMC Linux kernel 5.4.

Thanks for sending the patches. I can merge them into 5.8, however I
have a v5.10 branch that I plan on moving to imminently.

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

Do you plan on sending it?

>         5. Add HGPIO pin support to NPCM7xx pinctrl driver - will be sent
>                 to Linux community
>         6. JTAG master driver - will be sent to Linux community once we w=
ill
>                 have BMC folder.

As you've noted, I recommend you submit them to mainline ASAP to avoid
extra handling of patches in the openbmc tree.

Cheers,

Joel

>
> Changes since version 1:
> - Address comments from Jonathan Neusch=C3=A4fer: removing trailing white=
space
>         in NPCM watchdog documentation.
> - Adding Stanley Chu to NPCM JTAG master driver
>
> Tomer Maimon (11):
>   clk: npcm7xx: add read only flag to divider clocks
>   iio: adc: add calibration support to npcm ADC
>   dts: npcm750: add fuse regmap support node
>   watchdog: npcm: Add DT restart priority and reset type support
>   dt-binding: watchdog: Add DT restart priority and reset type
>   pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
>   pinctrl: pinconf: add pin persist configuration
>   pinctrl: npcm7xx: Add pin persist configuration support
>   spi: npcm-pspi: Add full duplex support
>   dt-binding: bmc: add NPCM7XX JTAG master documentation
>   misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver
>
>  .../bindings/bmc/npcm7xx-jtag-master.txt      |  38 +
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  32 +
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   6 +
>  drivers/clk/clk-npcm7xx.c                     |  70 +-
>  drivers/iio/adc/npcm_adc.c                    | 191 ++++
>  drivers/misc/Kconfig                          |   6 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/npcm7xx-jtag-master.c            | 840 ++++++++++++++++++
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 130 ++-
>  drivers/pinctrl/pinconf-generic.c             |   3 +
>  drivers/spi/spi-npcm-pspi.c                   |  75 +-
>  drivers/watchdog/npcm_wdt.c                   | 121 ++-
>  12 files changed, 1418 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-ma=
ster.txt
>  create mode 100644 drivers/misc/npcm7xx-jtag-master.c
>
> --
> 2.22.0
>
