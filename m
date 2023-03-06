Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC76AB415
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 01:53:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVKnj0nDmz3cBK
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 11:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l2nj+FTr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l2nj+FTr;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVKmz6x9Vz2x9J;
	Mon,  6 Mar 2023 11:52:51 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id cy23so31993022edb.12;
        Sun, 05 Mar 2023 16:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ubliUs4c/D0gi6kNRTGbrhZhzXPXrqrIjYYmRR0+Q1g=;
        b=l2nj+FTrMZkliD4scjoqzTp0KaW/6bL3hwhNloebiM3377CUkhUUcz02ZzS5XK+feU
         PU0pFBJaZDqf0o6CapL7OTvaw4m0VsUHDOaqWjz0bCCQvKy/5Gwrr/ZnqhSOqK9xRrfL
         D7L81LRGXJ4I3kf1cRurQpbPq8KaL6HCfkR40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubliUs4c/D0gi6kNRTGbrhZhzXPXrqrIjYYmRR0+Q1g=;
        b=fCt+ZV8WLO7NN7ltnj4yo9TNpPhYlSYPtLO1w6XJ2tXuahV55B3RofGQ65ZCzSsRIt
         73aN8+ylBD/iB/tPU/nWWILGYiqvZy7YxU+MF1i9cWXnc8JgbaEPnIl6lOIHkZWj4buQ
         8nBESGZcvWVjYWjqhBjJSaONFuO7R1pb3gQamRZ6PE8LjpLA6RFpNQgdOgoNE98VPnp8
         AxvfAVKh+LwPIb4HjcLW0KDA66hwi7vVCEumxjd9nGjRkBtl2GgOFrzepo4vpZxuervO
         o6x8qTmeeh1KryY9ssh9QLhESPbn3g3uNVt9WGiOBy9ev9pWDMMSsSxn8Z8jJnridnKu
         MJew==
X-Gm-Message-State: AO0yUKXz0GJfRvp1Wo3c4qNKQGE8y5xHcpvzIN04o6EaxQAiKZ8QSmmC
	4pQl9irMUv2HbV/LZ4psWF4Kn9gA1nVs4jSrJZE=
X-Google-Smtp-Source: AK7set8NoYry9Yq6J5sNZxc7BnHokFJ8tCFNa0+B50Ai5S744OfZBFpSH9uj+oKRQGyqnrfCD59MdvbyvoJLlcyEUiE=
X-Received: by 2002:a50:9b53:0:b0:4ae:f648:950b with SMTP id
 a19-20020a509b53000000b004aef648950bmr4829258edj.7.1678063966118; Sun, 05 Mar
 2023 16:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20230228102820.18477-1-chanh@os.amperecomputing.com>
 <775059b1-4697-b745-4743-55f7f7a9143e@molgen.mpg.de> <8033851a-6eaf-e4e7-5e80-0a1f7331c67a@amperemail.onmicrosoft.com>
In-Reply-To: <8033851a-6eaf-e4e7-5e80-0a1f7331c67a@amperemail.onmicrosoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Mar 2023 00:52:33 +0000
Message-ID: <CACPK8XfJmjF6cMta=igG7absJwttOv1H7=437_Vq_upeeKmdHA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 5 Mar 2023 at 15:59, Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 01/03/2023 14:51, Paul Menzel wrote:
> > Dear Chanh,
> >
> >
> > Thank you for the patch.
> >
> > Am 28.02.23 um 11:28 schrieb Chanh Nguyen:
> >> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
> >>
> >> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
> >
> > *the* seems a leftover.
>
> Thank Paul,
> I'll remove it.
>
> >
> >> so we use only one of them at the same time. The OCP slot #0 will
> >> be enabled by PCA9539's setting by default.
> >>
> >> Also, enable the OCP Auxiliary Power during booting.
> >
> > Is there a reason not to make this a separate commit?
> >
> >
> > Kind regards,
> >
> > Paul
> >
>
> I wouldn't like to separate it.
>
> This is "Enable NCSI" commit, so I would like to support all configs,
> that make NCSI feature works.

That sounds reasonable.

>
> Thanks,
> Chanh
> >
> >> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >> ---
> >> Changes in v2:
> >>     - Change PCA9539APW node name.                     [Krzysztof]
> >> ---
> >>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
> >>   1 file changed, 36 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> >> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> >> index 4b91600eaf62..1e0e88465254 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> >> @@ -251,6 +251,14 @@
> >>       pinctrl-0 = <&pinctrl_rgmii1_default>;
> >>   };
> >> +&mac3 {
> >> +    status = "okay";
> >> +    pinctrl-names = "default";
> >> +    pinctrl-0 = <&pinctrl_rmii4_default>;
> >> +    clock-names = "MACCLK", "RCLK";
> >> +    use-ncsi;
> >> +};
> >> +
> >>   &fmc {
> >>       status = "okay";
> >>       flash@0 {
> >> @@ -439,6 +447,26 @@
> >>       status = "okay";
> >>   };
> >> +&i2c8 {
> >> +    status = "okay";
> >> +
> >> +    gpio@77 {
> >> +        compatible = "nxp,pca9539";
> >> +        reg = <0x77>;
> >> +        gpio-controller;
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +        #gpio-cells = <2>;
> >> +
> >> +        bmc-ocp0-en-hog {
> >> +            gpio-hog;
> >> +            gpios = <7 GPIO_ACTIVE_LOW>;
> >> +            output-high;
> >> +            line-name = "bmc-ocp0-en-n";
> >> +        };
> >> +    };
> >> +};
> >> +
> >>   &i2c9 {
> >>       status = "okay";
> >>   };
> >> @@ -530,13 +558,20 @@
> >>       /*V0-V7*/
> >> "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> >>               "host0-reboot-ack-n","host0-ready","host0-shd-req-n",
> >>               "host0-shd-ack-n","s0-overtemp-n",
> >> -    /*W0-W7*/    "ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> >> +    /*W0-W7*/    "","ocp-main-pwren","ocp-pgood","",
> >>               "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
> >>       /*X0-X7*/    "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
> >>
> >> "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
> >>               "s1-overtemp-n","s1-spi-auth-fail-n",
> >>       /*Y0-Y7*/    "","","","","","","","host0-special-boot",
> >>       /*Z0-Z7*/    "reset-button","ps0-pgood","ps1-pgood","","","","","";
> >> +
> >> +    ocp-aux-pwren-hog {
> >> +        gpio-hog;
> >> +        gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
> >> +        output-high;
> >> +        line-name = "ocp-aux-pwren";
> >> +    };
> >>   };
> >>   &gpio1 {
