Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BB14009F
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 01:14:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM495LF7zDrN8
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:14:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NyP3HYQD; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLmv6nc6zDrBv
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 11:00:47 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id p27so9054767pli.10
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 16:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+iwCOrtzXCfXNM2oxYytzzYwNeWjdNOAu7LDw3Qh0S8=;
 b=NyP3HYQDD+9K0zpdRKeiNbogpQ33jP3JpdbObUCKnZjtyDplicQbt3aOr21x6OG/4O
 7W2Ji0eDpKbm/SYIcpCB8gs9nyrBwJX4B4bLpBuECVyL5LcmxJG/zFIsvcUjPJMIcC2N
 Idi2s6k3iQXF+vd4SQegWpW5uNVfKZdjS0nR3+NpFJvlzn7oYLv9RAaKGZFCkvmUvQRN
 wdFXxR9/OVfG9PUBGiNPbCriDK2I5r+0VapYYGMyznfVsQiXp/oFZpGR+7vYmXC0qops
 6RERJr7ubbPz2Cf5eYDZvoyUV6Sr23s/W6ewzK06kHs0pC9T50uhUpL6MJzXtT7dHkFz
 I07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+iwCOrtzXCfXNM2oxYytzzYwNeWjdNOAu7LDw3Qh0S8=;
 b=lgkFWVwScFUAHPW5ZY+rmB34ooj/qvfGgsufBsO4iHoQEcn2+5QSyrLM9CHvHO8UIa
 /2dP7lMog0falcxGRubaLM1dSoYrXxG0aPBM72bdqMnwWMvXCnpUIk4WZ3I3XM06fwaO
 3QlOhL3qnJdWx13FN2Li4mP4zsn0zizrz/gadNDY8EkzvYar62+bRkirYQAeqau2TVr7
 k9HiQJNLO1H/8hdp/+v5CaVNc/nbTOsBemyveDTOIjG+kKlQF4/c248e/FO67WXjj0FM
 K+VOsRlhX/cjN3PIaYoby9ZfL5e6LQbVhhkerrWNQrGisukrsJExxI/ZX4qzu9IqGJoR
 H52w==
X-Gm-Message-State: APjAAAX15YV/1vu4X4eOyCuG6SHxLKsAzPxYd1x9xcaegk4qytJ1LKyc
 HzRN01xqC1R37vMHD/0Gugc=
X-Google-Smtp-Source: APXvYqxe7TXIb6s7RN+niXhhnnSprP8URDuLBODGxg9IOizVp8Wg2dwYX5zVh79WbsjFsv0J0GP/Xw==
X-Received: by 2002:a17:902:8f8a:: with SMTP id
 z10mr7521216plo.169.1579219242023; 
 Thu, 16 Jan 2020 16:00:42 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::3:489])
 by smtp.gmail.com with ESMTPSA id u20sm25323173pgf.29.2020.01.16.16.00.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Jan 2020 16:00:41 -0800 (PST)
Date: Thu, 16 Jan 2020 16:00:39 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.4 2/2] ARM: dts: aspeed-g6: add usb functions
Message-ID: <20200117000038.GB7867@taoren-ubuntu-R90MNF91>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
 <20200116232525.2819-3-rentao.bupt@gmail.com>
 <20ffa20c-e84b-4d82-a4a5-05e8d82c3a73@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ffa20c-e84b-4d82-a4a5-05e8d82c3a73@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 17, 2020 at 10:26:15AM +1030, Andrew Jeffery wrote:
> 
> 
> On Fri, 17 Jan 2020, at 09:55, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add USB function pins and devices in aspeed-g6 dtsi.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 25 ++++++++++++++
> >  arch/arm/boot/dts/aspeed-g6.dtsi         | 43 ++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi 
> > b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > index 045ce66ca876..7028e21bdd98 100644
> > --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> > @@ -1112,6 +1112,31 @@
> >  		groups = "UART9";
> >  	};
> >  
> > +	pinctrl_usb2ah_default: usb2ah_default {
> > +		function = "USB2AH";
> > +		groups = "USBA";
> > +	};
> > +
> > +	pinctrl_usb2ad_default: usb2ad_default {
> > +		function = "USB2AD";
> > +		groups = "USBA";
> > +	};
> > +
> > +	pinctrl_usb2bh_default: usb2bh_default {
> > +		function = "USB2BH";
> > +		groups = "USBB";
> > +	};
> > +
> > +	pinctrl_usb2bd_default: usb2bd_default {
> > +		function = "USB2BD";
> > +		groups = "USBB";
> > +	};
> > +
> > +	pinctrl_usb11bhid_default: usb11bhid_default {
> > +		function = "USB11BHID";
> > +		groups = "USBB";
> > +	};
> > +
> >  	pinctrl_vb_default: vb_default {
> >  		function = "VB";
> >  		groups = "VB";
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index 99cc7d7ced4d..d344bb278bdb 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -245,6 +245,49 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		ehci0: usb@1e6a1000 {
> > +			compatible = "aspeed,ast2600-ehci", "generic-ehci";
> > +			reg = <0x1e6a1000 0x100>;
> > +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&pinctrl_usb2ah_default>;
> > +			status = "disabled";
> > +		};
> > +
> > +		ehci1: usb@1e6a3000 {
> > +			compatible = "aspeed,ast2600-ehci", "generic-ehci";
> > +			reg = <0x1e6a3000 0x100>;
> > +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&pinctrl_usb2bh_default>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uhci: usb@1e6b0000 {
> > +			compatible = "aspeed,ast2600-uhci", "generic-uhci";
> > +			reg = <0x1e6b0000 0x100>;
> > +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> > +			#ports = <2>;
> > +			clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
> > +			status = "disabled";
> > +			/*
> > +			 * No default pinmux, it will follow EHCI, use an explicit pinmux
> > +			 * override if you don't enable EHCI
> > +			 */
> > +		};
> > +
> > +		vhub: usb-vhub@1e6a0000 {
> > +			compatible = "aspeed,ast2600-usb-vhub";
> > +			reg = <0x1e6a0000 0x300>;
> 
> Shouldn't this be at least 0x350 long for all 20 programmable endpoints?

Good catch. Will fix it in patch v2. Thank you for the quick review.


Cheers,

Tao
