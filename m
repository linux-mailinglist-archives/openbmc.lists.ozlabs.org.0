Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 231811710B9
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 06:55:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Shj71KMyzDqpq
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 16:55:23 +1100 (AEDT)
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
 header.s=google header.b=dtw6/+Ad; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Shh90kzZzDqpM;
 Thu, 27 Feb 2020 16:54:32 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id v25so1439798qto.7;
 Wed, 26 Feb 2020 21:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JG6Di4Gll3ra/P/kq24/31+1wa1Oo6M8vrUkvuZY4ls=;
 b=dtw6/+Ad0LCrN8QWEFAr0Kq717Kpi210ws5TZRsscrzkH6qznd71bIsRibeXXIii7H
 D9H+5XIcpLvVvDFTfJZyUFQkXPWDmnnbywN7tCgCoP3uFWYPIJOLw3tjCyM+8ShSd5xf
 eb1LJyIBbg3qkOzNsCiwLkZI6M0Uep7JPbw2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JG6Di4Gll3ra/P/kq24/31+1wa1Oo6M8vrUkvuZY4ls=;
 b=W4E5OH57KEfiuND1jbuGuIGM8RO+tyt6l1F3aVNKBUZrGVaB8tNfjFeDT6s+LsulSZ
 TQA4YZ35Qanoz+Egkk+2y9Zr1wpfG66lsNelA6H2DhqerzYvezWK939qaKhI8gdw7mxX
 lx92aWJgFIKHxXycL7drOmu6Fu2YZTeSe6gAN0srFTMGozXKaW58PoH0DC8nNHJ9POWu
 xRZNZOXsrMSsebmNVazgGZKrfhNHSOLv4OwdAyPYM6lB8IZra95UyvRn8cAE3k0BfhMV
 LiwHu/Bz2tDoMhTKTOWNFh03XfxXQkZtM8+tbcGmZv2Fup0ZKVLBImsMzRFAAp7c1fXW
 gYYg==
X-Gm-Message-State: APjAAAUxZ8ANNi8vHLWo8IohOYtOG3LL2tjaJ9UaajibuRyOPVtFONxr
 GFHewSo33Y7s1IaO1ob0+Egx6amhEb+m+qoySbs=
X-Google-Smtp-Source: APXvYqwOTL0JsvR5hVzDIrVzEDRplaPhO41VCXL2WSvZ91+hn3KwgtVR4fKkEaxwcoirvnDYS32rvgGm5x23WhE7Pi0=
X-Received: by 2002:ac8:4244:: with SMTP id r4mr2803245qtm.169.1582782870414; 
 Wed, 26 Feb 2020 21:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-5-rentao.bupt@gmail.com>
 <7a210c19a7793b925275dbd8392e3c1ef538b229.camel@kernel.crashing.org>
In-Reply-To: <7a210c19a7793b925275dbd8392e3c1ef538b229.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Feb 2020 05:54:19 +0000
Message-ID: <CACPK8XeDBeU+c=Fgcj_CYo3AG02+JX9eD4ABkwO64uMXh+hTtQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] ARM: dts: aspeed-g6: add usb functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Tao Ren <rentao.bupt@gmail.com>, Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Feb 2020 at 04:10, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Add USB components and according pin groups in aspeed-g6 dtsi.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this patch through the aspeed tree for 5.7.

Cheers,

Joel


>
> > ---
> >  No change in v3/v4.
> >  Changes in v2:
> >    - added port/endpoint properties for vhub dt node.
> >
> >  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 25 +++++++++++++
> >  arch/arm/boot/dts/aspeed-g6.dtsi         | 45
> > ++++++++++++++++++++++++
> >  2 files changed, 70 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > index 045ce66ca876..7028e21bdd98 100644
> > --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > @@ -1112,6 +1112,31 @@
> >               groups = "UART9";
> >       };
> >
> > +     pinctrl_usb2ah_default: usb2ah_default {
> > +             function = "USB2AH";
> > +             groups = "USBA";
> > +     };
> > +
> > +     pinctrl_usb2ad_default: usb2ad_default {
> > +             function = "USB2AD";
> > +             groups = "USBA";
> > +     };
> > +
> > +     pinctrl_usb2bh_default: usb2bh_default {
> > +             function = "USB2BH";
> > +             groups = "USBB";
> > +     };
> > +
> > +     pinctrl_usb2bd_default: usb2bd_default {
> > +             function = "USB2BD";
> > +             groups = "USBB";
> > +     };
> > +
> > +     pinctrl_usb11bhid_default: usb11bhid_default {
> > +             function = "USB11BHID";
> > +             groups = "USBB";
> > +     };
> > +
> >       pinctrl_vb_default: vb_default {
> >               function = "VB";
> >               groups = "VB";
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi
> > b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index 796976d275e1..0a29b3b57a9d 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -245,6 +245,51 @@
> >                       status = "disabled";
> >               };
> >
> > +             ehci0: usb@1e6a1000 {
> > +                     compatible = "aspeed,ast2600-ehci", "generic-
> > ehci";
> > +                     reg = <0x1e6a1000 0x100>;
> > +                     interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&pinctrl_usb2ah_default>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ehci1: usb@1e6a3000 {
> > +                     compatible = "aspeed,ast2600-ehci", "generic-
> > ehci";
> > +                     reg = <0x1e6a3000 0x100>;
> > +                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&pinctrl_usb2bh_default>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uhci: usb@1e6b0000 {
> > +                     compatible = "aspeed,ast2600-uhci", "generic-
> > uhci";
> > +                     reg = <0x1e6b0000 0x100>;
> > +                     interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> > +                     #ports = <2>;
> > +                     clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
> > +                     status = "disabled";
> > +                     /*
> > +                      * No default pinmux, it will follow EHCI, use
> > an
> > +                      * explicit pinmux override if EHCI is not
> > enabled.
> > +                      */
> > +             };
> > +
> > +             vhub: usb-vhub@1e6a0000 {
> > +                     compatible = "aspeed,ast2600-usb-vhub";
> > +                     reg = <0x1e6a0000 0x350>;
> > +                     interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                     aspeed,vhub-downstream-ports = <7>;
> > +                     aspeed,vhub-generic-endpoints = <21>;
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&pinctrl_usb2ad_default>;
> > +                     status = "disabled";
> > +             };
> > +
> >               apb {
> >                       compatible = "simple-bus";
> >                       #address-cells = <1>;
>
