Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8E39B60F
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 11:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxHhL4zpVz303t
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 19:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zInM2KVN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zInM2KVN; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxHh60wqrz2xg5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 19:36:06 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id i9so13067327lfe.13
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jun 2021 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aYp1Adr5CMzSylwvBButnic0kZJJSgzI/e/jfoc5XXY=;
 b=zInM2KVNPb/0QPFcMUuLjrX59X+MSPyOsPXAiH3/QeJdWAGWbbnaRTPHS24RvPGmhr
 1c/s7uWCp98bhXSvtHnmma4hxMKj2wkELcRP+NW8x4BhYVcl7Wb9OOmOAoZonNLEktjv
 f2GNReyAgIRUBqQ8e7dj4F0fjf2WoHlRjuhmhoG/EVs4gN3buzRA5qQ5eVJpspTvDXS7
 4kXp7Z6GCmiEQiovkQ6T+dw7y2+dMgjt9+vbFYwK6JWAMY0KocQsTXw4Cm6oKlnnJb0j
 KuJ5dOhdjhcfWgh6ghhZpWAQeFdQTklOzHk9JKZfwIMnCavpwhvEG5mnqRGyRTrrfBBV
 Go7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aYp1Adr5CMzSylwvBButnic0kZJJSgzI/e/jfoc5XXY=;
 b=kVJyUetcsqL1nr19q1l09SYuBqKAyOnUmggd9VBTwbzA92lwzci0ridTY73ayoWu8M
 HUbEQ9LId4Y28Ls63OsxxNdnZUW1FkvvPjaeka0ovFsVSYZaJ7MmOWR9UdXO0oI3iEd3
 F+OxwK7btF72N6lni5LU1BhTcRANRvDGz+9mbtnF7vMOpeZGKtAmGbe/OumLrjqlm+H6
 Y8e3LCpmxcGenXjSMhgTXGMyTQmDQ120kXZzGXaSMVLuGcTDyj/+9voluKN/5LKdISw2
 MvMNZuPT7Z1GJ+2/qb0bSv2SECGxxeJJ1Z1774KPbU0WwaKu0pBMLUYcDMem3nakIRCx
 pHcQ==
X-Gm-Message-State: AOAM5307RaDjIfakIvkQ8Oqd6Dn/buJetkwNZf11Wqg7G/xVRGhg8sDO
 ECrjZX2JsG74xPGiEj9hEsFevRQS8kf6KvTsPvyPDA==
X-Google-Smtp-Source: ABdhPJwRz2Ggev+bmlNahkOO4PO7MbTDQi1yWOTrON9QwGEWdv0Ln2lES8Z8v6XjQDOxumVe/uHb7ZSWxPmgPct3veg=
X-Received: by 2002:a19:c753:: with SMTP id x80mr2236380lff.586.1622799359520; 
 Fri, 04 Jun 2021 02:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-5-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-5-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 11:35:48 +0200
Message-ID: <CACRpkdY6c750Dnh2H_6uEhOHJv-kLd_OpHqnuDKu4DQezZ2C_w@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan!

thanks for your patch!

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> +  interrupts: true

maxitems 4 right?

Make an enum:

interrupts:
  - description: what IRQ0 is for
  - description: what IRQ1 is for
  - description: what IRQ2 is for
  - description: what IRQ3 is for

And describe how these interrupts are used. Because I am suspicious that th=
ey
actually correspond to 4 different GPIO blocks, which should then be their =
own
nodes.

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    pinctrl: pinctrl@b8003000 {
> +      compatible =3D "nuvoton,wpcm450-pinctrl";
> +      reg =3D <0xb8003000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +      interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
> +                    3 IRQ_TYPE_LEVEL_HIGH
> +                    4 IRQ_TYPE_LEVEL_HIGH
> +                    5 IRQ_TYPE_LEVEL_HIGH>;

So these.

> +      rmii2 {
> +        groups =3D "rmii2";
> +        function =3D "rmii2";
> +      };
> +
> +      pinctrl_uid: uid {
> +        pins =3D "gpio14";
> +        input-debounce =3D <1>;
> +      };

I challenge you here and encourage you to put a node for each
GPIO "port":

  port0: gpio@0 {
 ....
  };
  port1: gpio@1 {
 ....
  };


> +    gpio-keys {
> +      compatible =3D "gpio-keys";
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&pinctrl_uid>;
> +
> +      uid {
> +        label =3D "UID";
> +        linux,code =3D <102>;
> +        gpios =3D <&pinctrl 14 GPIO_ACTIVE_HIGH>;

Would be gpios <&port0 14...>

Yours,
Linus Walleij
