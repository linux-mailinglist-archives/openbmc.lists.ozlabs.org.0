Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C5152246
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 23:15:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BzXV04SBzDqBj
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 09:15:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=W/PTGTlO; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BzWr2mtYzDqBj
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 09:14:47 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id s7so158811qvn.8
 for <openbmc@lists.ozlabs.org>; Tue, 04 Feb 2020 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OX03tfwcCV2UwLgis9v7ETB8Ult0ya+LOrRKlNilASU=;
 b=W/PTGTlOJvyWRPpNFavQbm39yRX/MQxVqpgcji79HFRjPgaBHLG+QvBYzBCMYJlyT7
 Dayko+NnXKeYxdG+FknxYdY4AvcQ+f8ZYGQ94xYAL/KmZkXSWtIf6Z+rtAfBmuZr7RX4
 FGeZpVugaEGZEwAxn4R47RTswFzGOFD6uPP1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OX03tfwcCV2UwLgis9v7ETB8Ult0ya+LOrRKlNilASU=;
 b=mV793hCmtnZYtTSj7xrW0I7oTfiT2fPffYXG9DGseBgxOQMBXZTenRmOHhkeCkY0Vn
 dSABKs91G2KrLvoTJk4fXQqGIotpOSlfV9w6sbv/e6runpxCbTMLDudynaq4yIID1Z0g
 Yob0yT+zcYk3cpPCV5X81CE7/u8SzbnEo6AIvASytE4N0qPp8/SF+nGx+OAVgzPRr0ID
 r1hMmDF2BOUMrJ/1PX5dPg1ad1wVd04rM+u1vL2YvWIbihRGl3YGNmhCzzOB+FoEygeD
 m0HTXA0KlXMmf8grRpAEC/fkDPojTHABhJKw0c8zLdTJkG8MZ9S6EyYfeFlTzSiZzY2n
 pMDQ==
X-Gm-Message-State: APjAAAVIYG+qA0T35qnuVkrMexSb3RdoxEPkPVlytQXigr8RRtg3wTZ3
 LYj+d9jbwYgU1Mel6gN/BeRTH7ir72oSVkQFaqU=
X-Google-Smtp-Source: APXvYqzdfTW4ieNegeKRADICKOFdAwW5R6O9XnBdLrSwTKrh2IZhq7l3YnF4pOQ8iE3d8cPhD2R5kjwpHLC66qqZh7U=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr29034157qvo.20.1580854484013; 
 Tue, 04 Feb 2020 14:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20200204213037.42100-1-geissonator@gmail.com>
In-Reply-To: <20200204213037.42100-1-geissonator@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Feb 2020 22:14:31 +0000
Message-ID: <CACPK8Xce5oOHEkCYLnmEr2qXAJUtwyw9wOT3Krgz5mm=7y91pQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: witherspoon: Add gpio
 line names
To: Andrew Geissler <geissonator@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
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

On Tue, 4 Feb 2020 at 21:30, Andrew Geissler <geissonator@gmail.com> wrote:
>
> From: Andrew Geissler <geissonator@yahoo.com>
>
> Name the gpios so libgiod will work with them
>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

Please send to the upstream lists for review. CC the GPIO maintainers
too, so we can get their feedback.

> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 515f0f208ee6..d3bbd4fc2539 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -193,6 +193,47 @@
>
>  };
>
> +&gpio {
> +    status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","cfam-reset","","","","","mux","",

fsi-mux

> +       /*B0-B7*/       "","","","","","air-water","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "enable","","","","","","","",
> +       /*E0-E7*/       "data","","","","","","","",

fsi-enable, fsi-data.

> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","checkstop","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "ps1-presence","","rear-fault","rear-power","rear-id","","","",

These last three are LEDs? perhaps we could adopt a convention where
we call them led-<name>.

> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","ps0-presence",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","trans","","","power-button","","",

fsi-trans

> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","",
> +       /*AA0-AA7*/     "clock","","","","","","","",

fsi-clock

> +       /*AB0-AB7*/     "","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +
> +       pin_gpio_a1 {
> +               gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "cfam-reset";
> +       };

It think you want to drop this part.

> +
> +};
> +
>  &fmc {
>         status = "okay";
>
> --
> 2.21.0 (Apple Git-122)

You're building kernels on your mac? :D
