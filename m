Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A71EEF72
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 04:24:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dRLS0J3YzDqx9
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 12:24:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IEzwBJrB; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dRJx4l0hzDql0
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 12:23:29 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id o26so6260375edq.0
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2020 19:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y88f8HJ9+ylxjBp4WArPlxtIYR+GlWKlGYNyVhBiz40=;
 b=IEzwBJrBzFtjOq37Yn54MnuV8NNgHxljr2+D9YPxKcgYG1fKzAuI9d/6GjwaqoT1kE
 HZj9VAxcU2AfGeoXN5tDcFOZu9VhMCJIByrhr9lXij5HFTuqosH6DdzpT52nLEL0uNfL
 wkrgn/X5DKZDfAyrBhz3j65lB1m7cxMjfCCqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y88f8HJ9+ylxjBp4WArPlxtIYR+GlWKlGYNyVhBiz40=;
 b=lXZDn9/5kAEfj/iYXp7wI49v/anQjLbS+5jDLepPUVKdEaadKflETDvlcFzG37ZzGy
 PEMrO0Dpak2WXD3OB4OkG+WlDl1B8gdEQkS7eh44rq8LamlL8/UeRVeX8Aug7PV+KIvn
 6/2WbGQJq2cfkn58bfWh2BrD3P9sun/V/BBz3wE33ydGtMkVoZ8kbsxdyb0ncWTf+ScQ
 a1w9s1T3EkKt8ZqSUFA1C3znW2ZtcbYpli1r83RIukBEgLUE5Fr3IyyNgOZNgHK3CCOb
 O86APueIRDZRWUCU+6iCN7LoA7xyxnVknmGfHjzUIMyGljGFPBKd3afgExOIiwz7WSUQ
 lrow==
X-Gm-Message-State: AOAM530mbuxoaO1KYxza2M6/RrHwBQy94tnWuBRVHl66qIwVwADMzAel
 q9+UU0Nui7imi/edzs9LbdTBYC9+uP3bEj2B+zE=
X-Google-Smtp-Source: ABdhPJwLsNFDoZUnu4O6vUhrDvH70Bp9VvBgrtjplz/ZCZPGtywQFfOI216JcmqygtCdJXPe154qKwTHtqHqx8++0zc=
X-Received: by 2002:a05:6402:1750:: with SMTP id
 v16mr7406076edx.137.1591323803929; 
 Thu, 04 Jun 2020 19:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200603093217.2762-1-Ben_Pai@wistron.com>
In-Reply-To: <20200603093217.2762-1-Ben_Pai@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Jun 2020 02:23:11 +0000
Message-ID: <CACPK8XeAmus2fBsA-bDN6HLjt-53KuJstEmC21Wu1nDSuzSfkw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v1] ARM: dts: aspeed: mihawk: add aliases
 for i2c and add thermal sensor
To: Ben Pai <Ben_Pai@wistron.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, claire_ku@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jun 2020 at 09:32, Ben Pai <Ben_Pai@wistron.com> wrote:
>
> 1.Set the bus id for each mux channel to avoid switching channels
> multiple times
> 2.Set smbus_en of IO expander to 1 in order to be able to read tmp401
> sensor
> 3.Add 8 tmp401 thermal sensors

When you have a list of three things like this in your commit message,
it's often a good indicator that you should send three separate
patches.

I've merged the patch as-is to the OpenBMC tree, but can you please
re-send them to the upstream list as three different commits?

Thanks,

Joel

>
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 449 +++++++++++++++++++-
>  1 file changed, 444 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index f7e935ede919..78451b283d93 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -7,7 +7,52 @@
>  / {
>         model = "Mihawk BMC";
>         compatible = "ibm,mihawk-bmc", "aspeed,ast2500";
> -
> +       aliases {
> +               i2c215 = &bus6_mux215;
> +               i2c216 = &bus6_mux216;
> +               i2c217 = &bus6_mux217;
> +               i2c218 = &bus6_mux218;
> +               i2c219 = &bus6_mux219;
> +               i2c220 = &bus6_mux220;
> +               i2c221 = &bus6_mux221;
> +               i2c222 = &bus6_mux222;
> +               i2c223 = &bus7_mux223;
> +               i2c224 = &bus7_mux224;
> +               i2c225 = &bus7_mux225;
> +               i2c226 = &bus7_mux226;
> +               i2c227 = &bus7_mux227;
> +               i2c228 = &bus7_mux228;
> +               i2c229 = &bus7_mux229;
> +               i2c230 = &bus7_mux230;
> +               i2c231 = &bus9_mux231;
> +               i2c232 = &bus9_mux232;
> +               i2c233 = &bus9_mux233;
> +               i2c234 = &bus9_mux234;
> +               i2c235 = &bus9_mux235;
> +               i2c236 = &bus9_mux236;
> +               i2c237 = &bus9_mux237;
> +               i2c238 = &bus9_mux238;
> +               i2c239 = &bus10_mux239;
> +               i2c240 = &bus10_mux240;
> +               i2c241 = &bus10_mux241;
> +               i2c242 = &bus10_mux242;
> +               i2c243 = &bus10_mux243;
> +               i2c244 = &bus10_mux244;
> +               i2c245 = &bus10_mux245;
> +               i2c246 = &bus10_mux246;
> +               i2c247 = &bus12_mux247;
> +               i2c248 = &bus12_mux248;
> +               i2c249 = &bus12_mux249;
> +               i2c250 = &bus12_mux250;
> +               i2c251 = &bus13_mux251;
> +               i2c252 = &bus13_mux252;
> +               i2c253 = &bus13_mux253;
> +               i2c254 = &bus13_mux254;
> +               i2c255 = &bus13_mux255;
> +               i2c256 = &bus13_mux256;
> +               i2c257 = &bus13_mux257;
> +               i2c258 = &bus13_mux258;
> +       };
>
>         chosen {
>                 stdout-path = &uart5;
> @@ -630,6 +675,55 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +
> +               bus6_mux215: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               bus6_mux216: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               bus6_mux217: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus6_mux218: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               bus6_mux219: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               bus6_mux220: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               bus6_mux221: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               bus6_mux222: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +
>         };
>
>  };
> @@ -644,6 +738,55 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +
> +               bus7_mux223: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               bus7_mux224: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               bus7_mux225: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus7_mux226: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               bus7_mux227: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               bus7_mux228: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               bus7_mux229: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               bus7_mux230: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +
>         };
>
>  };
> @@ -684,6 +827,68 @@
>                 i2c-mux-idle-disconnect;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> +
> +               bus9_mux231: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus0 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus0";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus9_mux232: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus1 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus1";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus9_mux233: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus9_mux234: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
>         };
>
>         pca9545@71 {
> @@ -695,6 +900,68 @@
>                 i2c-mux-idle-disconnect;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> +
> +               bus9_mux235: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus2 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus2";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus9_mux236: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus3 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus3";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus9_mux237: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus9_mux238: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
>         };
>  };
>
> @@ -725,6 +992,68 @@
>                 i2c-mux-idle-disconnect;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> +
> +               bus10_mux239: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus4 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus4";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus10_mux240: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus5 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus5";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus10_mux241: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus10_mux242: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
>         };
>
>         pca9545@71 {
> @@ -736,6 +1065,68 @@
>                 i2c-mux-idle-disconnect;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> +
> +               bus10_mux243: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus6 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus6";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus10_mux244: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       tca9554@39 {
> +                               compatible = "ti,tca9554";
> +                               reg = <0x39>;
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               smbus7 {
> +                                       gpio-hog;
> +                                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                                       output-high;
> +                                       line-name = "smbus7";
> +                               };
> +                       };
> +
> +                       tmp431@4c {
> +                               compatible = "ti,tmp401";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               bus10_mux245: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus10_mux246: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
>         };
>  };
>
> @@ -796,7 +1187,7 @@
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>
> -               i2c@0 {
> +               bus12_mux247: i2c@0 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0>;
> @@ -807,7 +1198,7 @@
>                         };
>                 };
>
> -               i2c@1 {
> +               bus12_mux248: i2c@1 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <1>;
> @@ -818,7 +1209,7 @@
>                         };
>                 };
>
> -               i2c@2 {
> +               bus12_mux249: i2c@2 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <2>;
> @@ -829,7 +1220,7 @@
>                         };
>                 };
>
> -               i2c@3 {
> +               bus12_mux250: i2c@3 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <3>;
> @@ -857,6 +1248,54 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +
> +               bus13_mux251: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               bus13_mux252: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               bus13_mux253: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               bus13_mux254: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               bus13_mux255: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               bus13_mux256: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               bus13_mux257: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               bus13_mux258: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
>         };
>  };
>
> --
> 2.17.1
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
