Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD3153EDC
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 07:46:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cpr52bpPzDqT8
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 17:46:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kPxNNb1g; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cpq45j72zDqSD;
 Thu,  6 Feb 2020 17:45:50 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id w47so3698969qtk.4;
 Wed, 05 Feb 2020 22:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EVIjHgWrOpnpthbeHK3KwPNytdJutxDfwFaEAYC1gU=;
 b=kPxNNb1gcQ6fkdKVzTu5wRf8dMBIvy78gz+ZmakHsUODJyPFAI9Cxs9Aerh6dtn8ue
 9S3HPYp07C/wCW8bZC0OA1mtnLl8+OkfKuxFq+k5IDzYmqxDYBc+ieFAoNEiOnWFfUZ8
 mFtR5H8qOqrJxBmw1ANT4V4HWd69qwfomQRWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EVIjHgWrOpnpthbeHK3KwPNytdJutxDfwFaEAYC1gU=;
 b=BiuryRS4tJhb/oox73fftt+uvLfTf31XrAoSRsMVrgUpAEWVjcLEbFXDBDt4UghgKm
 SwwQRzoRh+FVPlWWEZf/8x7F/NuE3/bZQ5UXfPo+uOVg4RDDm33lFvefkj5qYLSNSsTa
 gkOLYIPTmWo4Fie+kZ6M4EAXx2YbDPy40eacoXfRo2pFp+XVTmoU7ag1lLtQGVLfTCWG
 pfj6hhCW7gm8g7Cb2PylZkSM2+LD+2pIZErZ8E4HWcRRswPRl9kmYn7s+UYM3ih5bPsb
 Yc+8KbgCp5YgYRm4nXFDUASObfenMgefU8IxfvU0N01bejhZA+QK7RDtv8Clo4VjfjPJ
 1eBw==
X-Gm-Message-State: APjAAAXGc0Tl6WhnIOg9HwJWTB8XboAMYnUiHg1fLNy/Rz9PhvdUscyC
 +XOJFWcPm5PEEUaE84Jc2kBeFjSHvZ2SuwfQO24=
X-Google-Smtp-Source: APXvYqyGXHiEc83j2FSMVVBuD58V9HxdxZyJTom9oCVKE6Ua2SjX6fetXzWVhlF65eXiKXP/Ck/X9d5riSepkdRtgIg=
X-Received: by 2002:ac8:7396:: with SMTP id t22mr1332817qtp.269.1580971547324; 
 Wed, 05 Feb 2020 22:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20200205215511.80333-1-geissonator@gmail.com>
In-Reply-To: <20200205215511.80333-1-geissonator@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2020 06:45:33 +0000
Message-ID: <CACPK8XcGJ61mgCL+vZQEzTmcwu+jZ0hpKrnOz7B7K14y79cvFQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v2] ARM: dts: aspeed: witherspoon: Add gpio
 line names
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

On Wed, 5 Feb 2020 at 21:55, Andrew Geissler <geissonator@gmail.com> wrote:
>
> From: Andrew Geissler <geissonator@yahoo.com>
>
> Name the gpios so libgiod will work with them

Perhaps: "Name the GPIOs to help userspace work with them."

You could also mention that the names are describe the functionality
that the lines provide, and not a net or ball name.

A heads up: when you send patches upstream to the kernel mailing list,
we don't include the "linux dev-X.y" stuff in the subject.

> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> ---
> v2: added upstream to patch
>     prepended fsi- on fsi related gpios
>     prepended led- on led related gpios
>     prepended presence on presence related gpios
>     dropped pin_gpio_a1 definition
> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 515f0f208ee6..2519722928a4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -193,6 +193,42 @@
>
>  };
>
> +&gpio {
> +    status = "okay";

The status=okay is harmless but redundant, as this node is already enabled.

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
> +

Cean up the line of whitespace here.

> +};
> +
>  &fmc {
>         status = "okay";
>
> --
> 2.21.0 (Apple Git-122)
>
