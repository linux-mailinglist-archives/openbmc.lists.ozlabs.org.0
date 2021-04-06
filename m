Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3428354D7A
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 09:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDzHq59DVz30CX
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 17:12:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KdszTaHr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KdszTaHr; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDzHZ6Qjfz2yZK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 17:12:24 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id u8so10439497qtq.12
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5X57hpj9N/TvNd5S2l1J4RqgTR6EcEKmtXhWmix2FA=;
 b=KdszTaHrqx+xyn8qsMFIWNbuv7b6FlQmd09pxTpzna/58UV/grRpCcH0Cert0ekM8o
 5PdUjJJFDa8/CZBKMIrKOc/cdg+xBBdmX2WlG8uHXk56CWee2DYD6u5kPZjZxB+Ig6iJ
 Pgsp1Wm3lMPVD+QbtBs+MA/4lBpspbP8RqLNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5X57hpj9N/TvNd5S2l1J4RqgTR6EcEKmtXhWmix2FA=;
 b=FpPLg5hryOzTGgb3vSuJDZx9zMFCJPMxzcKBP51GC8JYdWOrGV/yeVaj/2x8HBnl80
 qF0z+rKw2GedMZ5BMg6AC1p5bfKeWYT5FkhJAAhs+Ik0Qnc/RDZNuHorKCNTGVEMn/wT
 3ehAUE/42CVf9nnGbjfKRDVtamVSDgIhuzYdNR1SZgCiB4pUq/Gi9kXB9z6b6HKjTVW+
 /Sw9s+yycGCEbX747Nx594d/rxdwDtzzjnDOg2gzfhdF1HX9uMyuSiVvZBgTcP0N5COT
 AfXn2cSury1GG/k0hNpriYK3S0wRHWTz4dn7gbdxT6XW3BMQOU2xK33jpet+66oNcs/y
 wbTA==
X-Gm-Message-State: AOAM532JycZKBHvvEUsybOg9TSiY7INK8AfKAsYhCDkEmlSCGwucpKCb
 4/LobwsS27kxVk7B75ClKP0h7++9F65kuA14qCQ=
X-Google-Smtp-Source: ABdhPJyyEvsBS9RbTgyUiGGf5Q93QouL63XtcQTQeb7ZOnvCMxPgj2d9jM4rCNxGGR/Ce0QRQb9Kep7kkDQeJoIHyQs=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr25426456qta.135.1617693140689; 
 Tue, 06 Apr 2021 00:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210401184147.2506-1-aladyshev22@gmail.com>
In-Reply-To: <20210401184147.2506-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Apr 2021 07:12:09 +0000
Message-ID: <CACPK8XdqtEA5N5Vm84=00TnuMm3OfM5CzoNfpmu2_Trn6a8joA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 1/3] dt-bindings: (hwmon/sbtsi_temp) Add
 SB-TSI hwmon driver bindings
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 1 Apr 2021 at 18:41, Konstantin Aladyshev <aladyshev22@gmail.com> wrote:
>
> From: Kun Yi <kunyi@google.com>
>
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.

I've applied this series to dev-5.10.

(In the future, if you're sending more than one patch use a cover
letter - it helps group the patches)

Cheers,

Joel

>
> Signed-off-by: Kun Yi <kunyi@google.com>
> Link: https://lore.kernel.org/r/20201211215427.3281681-4-kunyi@google.com
> Reviewed-by: Rob Herring <robh@kernel.org>
> [groeck: Fixed subject]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> new file mode 100644
> index 000000000000..446b09f1ce94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/amd,sbtsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: >
> +  Sideband interface Temperature Sensor Interface (SB-TSI) compliant
> +  AMD SoC temperature device
> +
> +maintainers:
> +  - Kun Yi <kunyi@google.com>
> +  - Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +
> +description: |
> +  SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> +  interface that reports AMD SoC's Ttcl (normalized temperature),
> +  and resembles a typical 8-pin remote temperature sensor's I2C interface
> +  to BMC. The emulated thermal sensor can report temperatures in increments
> +  of 0.125 degrees, ranging from 0 to 255.875.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amd,sbtsi
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C bus address of the device as specified in Section 6.3.1 of the
> +      SoC register reference. The SB-TSI address is normally 98h for socket
> +      0 and 90h for socket 1, but it could vary based on hardware address
> +      select pins.
> +      \[open source SoC register reference\]
> +        https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sbtsi@4c {
> +                compatible = "amd,sbtsi";
> +                reg = <0x4c>;
> +        };
> +    };
> +...
> --
> 2.25.1
>
