Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33122156D9F
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 03:30:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G8y84RXwzDqQR
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 13:30:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Vot3Gk5r; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48G8xV2VK9zDqQR;
 Mon, 10 Feb 2020 13:29:34 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id d5so4097740qto.0;
 Sun, 09 Feb 2020 18:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ra0rpldUyx5dQ3cALlEVBxf6hudJtV4wQ0FpwYENXlc=;
 b=Vot3Gk5rrSJb99S4ur/g2DWtP16aRkPxY1kmM1/eWqxjFECGCtYqTEfCzE71cF8MJG
 Y8LpDwico/I/Z9X30DRHGnLWHSQ3F0DIY8zQzeXMy96PomCYJbtqiwlt7ayxu3I2sfqA
 Kz21kD/8LnuRhDY+yWY+iYnwPcnR++Pbyz6k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ra0rpldUyx5dQ3cALlEVBxf6hudJtV4wQ0FpwYENXlc=;
 b=Epu8dlprR73BJPKeRLo0GmSRF53KRFt4BIER5okPeDc9RKqeearkG966qOd016KLdK
 M19tTdr15TItbTjM2KpYmY6bu4roGyUZ/mxgM1IIeuKF7Zuz0DSXIdRwQPMNGtftRMoE
 POV/2v8TSEhA9zT8j54P7UWkyGYAqCiJkwqeCPY32iTRD7Lz7kmfwzEKJcKQY1ciXmBf
 smZkig/pLh/gFyyQ6LElld+QIsq1afgvWxqIzko7N7lFT8gfCUuTKTcVzY/7h6+pIUXS
 O5nUVJGKNQKtYFGQ8RxgN9NOhTBC7GKsQmromDriFiSn7C0NWiK5Jt9Bl2xJ8X24LlAl
 SuWg==
X-Gm-Message-State: APjAAAVkpmt6gCXlNG4DiDKr0iowd9nhOt06cKbl7bly/gXHXcHE1nwc
 AmqKEhFq7r+tgRTEfSUfJ3demdZVP+6BXAQCKc0=
X-Google-Smtp-Source: APXvYqzcGvgfoldOPlRF0oV/3hA3tC1aE/eu4yDH5GYf9atHD8eepmRE6qo+l9/K1/ie+5Ux+ddb5DSELZ856Ev5PVU=
X-Received: by 2002:ac8:6b53:: with SMTP id x19mr2941384qts.220.1581301770229; 
 Sun, 09 Feb 2020 18:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20200206170234.84288-1-geissonator@gmail.com>
In-Reply-To: <20200206170234.84288-1-geissonator@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 02:29:19 +0000
Message-ID: <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@yahoo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Feb 2020 at 17:03, Andrew Geissler <geissonator@gmail.com> wrote:
>
> From: Andrew Geissler <geissonator@yahoo.com>
>
> Name the GPIOs to help userspace work with them. The names describe the
> functionality the lines provide, not the net or ball name. This makes it
> easier to share userspace code across different systems and makes the
> use of the lines more obvious.
>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will wait for  Andrew before merging, but this looks good to me.


> ---
> v3: added more detail to commit message
>     removed linux dev-5.4 from PATCH header
>     removed redundant status from gpio
>     removed blank line
> v2: added upstream to patch
>     prepended fsi- on fsi related gpios
>     prepended led- on led related gpios
>     prepended presence on presence related gpios
>     dropped pin_gpio_a1 definition
> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 515f0f208ee6..2269c73b8987 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -193,6 +193,40 @@
>
>  };
>
> +&gpio {
> +       gpio-line-names =
> +       /*A0-A7*/       "","cfam-reset","","","","","fsi-mux","",
> +       /*B0-B7*/       "","","","","","air-water","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "fsi-enable","","","","","","","",
> +       /*E0-E7*/       "fsi-data","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","checkstop","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "presence-ps1","","led-rear-fault","led-rear-power",
> +                       "led-rear-id","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","presence-ps0",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","fsi-trans","","","power-button","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","",
> +       /*AA0-AA7*/     "fsi-clock","","","","","","","",
> +       /*AB0-AB7*/     "","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +};
> +
>  &fmc {
>         status = "okay";
>
> --
> 2.21.0 (Apple Git-122)
>
