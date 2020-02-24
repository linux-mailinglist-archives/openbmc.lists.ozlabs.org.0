Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE7170E5E
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:20:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sbxf73cqzDqrF
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:20:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=verdurent.com
 (client-ip=2607:f8b0:4864:20::e44; helo=mail-vs1-xe44.google.com;
 envelope-from=amit.kucheria@verdurent.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=verdurent.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=verdurent-com.20150623.gappssmtp.com
 header.i=@verdurent-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tTyvRsQ3; dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R4qb2f7CzDqDX
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 01:55:19 +1100 (AEDT)
Received: by mail-vs1-xe44.google.com with SMTP id a2so5831255vso.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nf8Hhdqzm/gWtkB0ZWHb2rHYmerMHbHruZ0Ukrv/hp8=;
 b=tTyvRsQ3w0ChPxDQdkv7glQk3wtPZb10J3tAyqqzoRHQ8KPQTGzEw7zNYCRWKnZ4q/
 Sp8M/ZgkeF0DtmsdSoX/jaS9Cj+6QBjmmTRJVhrc7HoP/5FhbIeVVDjpdF5PLkBe58vj
 ts7HWtfrr72NlXIevmGqHAfZoSQtS3kdP0RkKaH9LgNtDi+gsiTvRDUVyaaRZ9aMGbcK
 nWLTioIrgs3f4ikzwkQv7LsyiNYZ06XlkRhH7duzXqdMOUtinyzy3B9nZHXoHNW2BDly
 Q6PiovLQ+WSUH/5StMinuKTlSvTQU7SMVrsaqT4aYLh+Nu8jmjojFJaax3RoAahqLwvZ
 0NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nf8Hhdqzm/gWtkB0ZWHb2rHYmerMHbHruZ0Ukrv/hp8=;
 b=LNeX9vy+XqeH8zzPuKiJ+LAspd81qkePLIbg+xfykWQzvc225RbOlLwUT5tE6RuQyz
 bWTyMwXcgBJW2qBWKMP7nct+GHgjoqxvGW1jzuMwPoTUig6axV1HBOa+l17NjoF+eidc
 xXJQ3RZLmb+TJI5/wth3T6Qe2u/xkgg9I2YgK8deSxAHXmltMgnDux3DqGmFTmPG0FYX
 D4gIQzrSrEpw1krz696hIOfQgu6f8+37PvbRUhKsCrZgIzdU5lHG4gnFP2xdUHv/vPiv
 kx9rPhEo98OIS26/kd6ZTbmFAiHBXFTQug/yneN0u2j1znKlw+po/FfOLMoHOcNsAA3T
 dVAQ==
X-Gm-Message-State: APjAAAV2TDl4RPu4+7bNdEVV/kP+DjMGjeli8Zbl2QNiRD1dt+fZFVsj
 7qe6HwhJLvQRGSCTSVyV1ejxt5naSDDhXTjvK4UtzA==
X-Google-Smtp-Source: APXvYqwle+5L5EqgMdMX2NFSAUa3m6tBXE9trHhUlWTILDVFPKISTVy7qlGqCRTcc9lNxiPA7RF35oJihsqFh//dkI4=
X-Received: by 2002:a05:6102:535:: with SMTP id
 m21mr25212006vsa.95.1582556116187; 
 Mon, 24 Feb 2020 06:55:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Mon, 24 Feb 2020 20:25:05 +0530
Message-ID: <CAHLCerP_UW-6CdaOziHTY01cD_6Ou4h0Jj6mOJKj60P4GL9H=w@mail.gmail.com>
Subject: Re: [PATCH 2/7] docs: dt: fix several broken references due to renames
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
Cc: Stuart Yoder <stuyoder@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org,
 lakml <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 22, 2020 at 2:30 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Several DT references got broken due to txt->yaml conversion.
>
> Those are auto-fixed by running:
>
>         scripts/documentation-file-ref-check --fix
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/arm,scmi.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/arm,scpi.txt        | 2 +-
>  .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt         | 2 +-
>  .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt  | 2 +-
>  .../devicetree/bindings/arm/msm/qcom,idle-state.txt       | 2 +-

For qcom idle state and ..

>  Documentation/devicetree/bindings/arm/omap/mpu.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/psci.yaml           | 2 +-
>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 2 +-

For qcom tsens,

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

>  .../devicetree/bindings/display/tilcdc/tilcdc.txt         | 2 +-
>  Documentation/devicetree/bindings/leds/common.yaml        | 2 +-
>  .../devicetree/bindings/leds/register-bit-led.txt         | 2 +-
>  .../devicetree/bindings/memory-controllers/ti/emif.txt    | 2 +-
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt   | 2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml  | 2 +-
>  .../devicetree/bindings/reset/st,stm32mp1-rcc.txt         | 2 +-
>  .../devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml  | 2 +-
>  MAINTAINERS                                               | 8 ++++----
>  20 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
> index f493d69e6194..dc102c4e4a78 100644
> --- a/Documentation/devicetree/bindings/arm/arm,scmi.txt
> +++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
> @@ -102,7 +102,7 @@ Required sub-node properties:
>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>  [2] Documentation/devicetree/bindings/power/power-domain.yaml
>  [3] Documentation/devicetree/bindings/thermal/thermal.txt
> -[4] Documentation/devicetree/bindings/sram/sram.txt
> +[4] Documentation/devicetree/bindings/sram/sram.yaml
>  [5] Documentation/devicetree/bindings/reset/reset.txt
>
>  Example:
> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> index 7b83ef43b418..dd04d9d9a1b8 100644
> --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> @@ -109,7 +109,7 @@ Required properties:
>  [0] http://infocenter.arm.com/help/topic/com.arm.doc.dui0922b/index.html
>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>  [2] Documentation/devicetree/bindings/thermal/thermal.txt
> -[3] Documentation/devicetree/bindings/sram/sram.txt
> +[3] Documentation/devicetree/bindings/sram/sram.yaml
>  [4] Documentation/devicetree/bindings/power/power-domain.yaml
>
>  Example:
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
> index b82b6a0ae6f7..8c7a4908a849 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
> @@ -62,7 +62,7 @@ Timer node:
>
>  Syscon reboot node:
>
> -See Documentation/devicetree/bindings/power/reset/syscon-reboot.txt for the
> +See Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml for the
>  detailed list of properties, the two values defined below are specific to the
>  BCM6328-style timer:
>
> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
> index 115c5be0bd0b..8defacc44dd5 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
> @@ -1,7 +1,7 @@
>  * Hisilicon Hi3519 System Controller Block
>
>  This bindings use the following binding:
> -Documentation/devicetree/bindings/mfd/syscon.txt
> +Documentation/devicetree/bindings/mfd/syscon.yaml
>
>  Required properties:
>  - compatible: "hisilicon,hi3519-sysctrl".
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
> index 06df04cc827a..6ce0b212ec6d 100644
> --- a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
> @@ -81,4 +81,4 @@ Example:
>                 };
>         };
>
> -[1]. Documentation/devicetree/bindings/arm/idle-states.txt
> +[1]. Documentation/devicetree/bindings/arm/idle-states.yaml
> diff --git a/Documentation/devicetree/bindings/arm/omap/mpu.txt b/Documentation/devicetree/bindings/arm/omap/mpu.txt
> index f301e636fd52..e41490e6979c 100644
> --- a/Documentation/devicetree/bindings/arm/omap/mpu.txt
> +++ b/Documentation/devicetree/bindings/arm/omap/mpu.txt
> @@ -17,7 +17,7 @@ am335x and am437x only:
>  - pm-sram: Phandles to ocmcram nodes to be used for power management.
>            First should be type 'protect-exec' for the driver to use to copy
>            and run PM functions, second should be regular pool to be used for
> -          data region for code. See Documentation/devicetree/bindings/sram/sram.txt
> +          data region for code. See Documentation/devicetree/bindings/sram/sram.yaml
>            for more details.
>
>  Examples:
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 8ef85420b2ab..f8218e60e3e2 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -100,7 +100,7 @@ properties:
>        bindings in [1]) must specify this property.
>
>        [1] Kernel documentation - ARM idle states bindings
> -        Documentation/devicetree/bindings/arm/idle-states.txt
> +        Documentation/devicetree/bindings/arm/idle-states.yaml
>
>    "#power-domain-cells":
>      description:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> index 17f87178f6b8..3647007f82ca 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> @@ -42,7 +42,7 @@ properties:
>        be part of GCC and hence the TSENS properties can also be part
>        of the GCC/clock-controller node.
>        For more details on the TSENS properties please refer
> -      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +      Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
>
>    nvmem-cell-names:
>      minItems: 1
