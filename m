Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC247AE2FD
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 02:36:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NNPgacSx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvglc3jBSz3cLQ
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 10:36:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NNPgacSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvgkv45HHz2yq2;
	Tue, 26 Sep 2023 10:35:34 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3ab7fb1172cso3867725b6e.3;
        Mon, 25 Sep 2023 17:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695688531; x=1696293331; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDfwvoV6juhNVfFYjv+kFk+nrGJP0YOG7IEbzTcdy7c=;
        b=NNPgacSxrQH36R1Q1NsTLELuBnKvCCUcutez0B1eSqIaD8OFylIvPJ3J5RxC5LZLjx
         9jgbXpabl4IwkHfr4WDUUqKlKRytGicJrXOrl7jbxR0442Eggq7TOpgsUeTUGQB8+nQr
         M7pyh+gW/TPX+UkNOnW+qjLaU9IMPizCvt2pow5ujt2MG5eULcPLCLqEWSTfBgztj+Bc
         VSCc4HbAs3zrjvs1EqA3G8MiJT5yuqJi5kKhzjWSXiEJzREKXsm5Q93R58bjqYCmjmXI
         6yRW/JqoKCnRMIx2TaCbb+fV5oMNR5s9T7BTBVnRVSat6FW/xvzXGFEVnd2dxSJmOt5X
         WsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695688531; x=1696293331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDfwvoV6juhNVfFYjv+kFk+nrGJP0YOG7IEbzTcdy7c=;
        b=tMKHO//B3lq79Fd/bHJasl2gesbd3DGvQ9n2pRn2O/ViJesiU45Ya/KzDRremRnDXy
         NoUbo5PPdNa5OdOAn/3hEU2u1aX1ilTdUakxMIeBV55HFk/yL7OFru6Eh1mRO+xX5D9e
         weTBz/COMCXV8JN1j77J9xHqjqsgZGWxRE5HFjXHX1ifTTqeRl1ufi8ClQcgAS+Bfn3O
         NRUuwx8wFp9VpmRfBnjgCVdWkRw+Z0EYyro4qp38bjR+jEdGZJ7I6hiviJqPxsr8Ruwb
         85twZJOFnx1LA38kGz5MVNWvVULSrFcP3s73Ir3a2JOEGMEeMETwxxhxgWuSRun9dZxr
         RYOw==
X-Gm-Message-State: AOJu0YzxpFlz/ZYYGcePIRZJwBRl99DZy15VhHdpnuDGqS5tajVuhuJd
	d7Gb5ypYj6SVlKH2EY2vRhA=
X-Google-Smtp-Source: AGHT+IFZCmNJnJdBBgZG8mrF9VaaQIQQKbIAtmGU3RLgAWG+zAccdSVW4KNX9t2EvpjwBsxfUTs40w==
X-Received: by 2002:a05:6808:19a2:b0:3a8:5fd6:f4d0 with SMTP id bj34-20020a05680819a200b003a85fd6f4d0mr9300136oib.49.1695688531176;
        Mon, 25 Sep 2023 17:35:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10-20020aa791ca000000b0068fbad48817sm8638053pfa.123.2023.09.25.17.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 17:35:30 -0700 (PDT)
Date: Mon, 25 Sep 2023 17:35:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: aspeed-wdt: Add
 aspeed,reset-mask property
Message-ID: <e6b82ec9-c19b-4210-9251-2beee30c6d90@roeck-us.net>
References: <20230922104231.1434-4-zev@bewilderbeest.net>
 <20230922104231.1434-5-zev@bewilderbeest.net>
 <6df088a6-75ab-42f2-ba39-3f155714ed2d@app.fastmail.com>
 <6b0d4901-d543-4a06-a1e4-7f1558f5361f@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b0d4901-d543-4a06-a1e4-7f1558f5361f@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, g@hatter.bewilderbeest.net, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, "Milton D. Miller II" <mdmii@outlook.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 25, 2023 at 05:04:10PM -0700, Zev Weiss wrote:
> On Sun, Sep 24, 2023 at 07:42:45PM PDT, Andrew Jeffery wrote:
> > 
> > 
> > On Fri, 22 Sep 2023, at 20:12, Zev Weiss wrote:
> > > This property configures the Aspeed watchdog timer's reset mask, which
> > > controls which peripherals are reset when the watchdog timer expires.
> > > Some platforms require that certain devices be left untouched across a
> > > reboot; aspeed,reset-mask can now be used to express such constraints.
> > > 
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > ---
> > >  .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
> > >  include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
> > >  2 files changed, 109 insertions(+), 1 deletion(-)
> > >  create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > index a8197632d6d2..3208adb3e52e 100644
> > > --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > > @@ -47,7 +47,15 @@ Optional properties for AST2500-compatible watchdogs:
> > >  			   is configured as push-pull, then set the pulse
> > >  			   polarity to active-high. The default is active-low.
> > > 
> > > -Example:
> > > +Optional properties for AST2500- and AST2600-compatible watchdogs:
> > > + - aspeed,reset-mask: A bitmask indicating which peripherals will be reset if
> > > +		      the watchdog timer expires.  On AST2500 this should be a
> > > +		      single word defined using the AST2500_WDT_RESET_* macros;
> > > +		      on AST2600 this should be a two-word array with the first
> > > +		      word defined using the AST2600_WDT_RESET1_* macros and the
> > > +		      second word defined using the AST2600_WDT_RESET2_* macros.
> > > +
> > > +Examples:
> > > 
> > >  	wdt1: watchdog@1e785000 {
> > >  		compatible = "aspeed,ast2400-wdt";
> > > @@ -55,3 +63,11 @@ Example:
> > >  		aspeed,reset-type = "system";
> > >  		aspeed,external-signal;
> > >  	};
> > > +
> > > +	#include <dt-bindings/watchdog/aspeed-wdt.h>
> > > +	wdt2: watchdog@1e785040 {
> > > +		compatible = "aspeed,ast2600-wdt";
> > > +		reg = <0x1e785040 0x40>;
> > > +		aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
> > > +				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
> > > +	};
> > 
> > Rob has acked your current approach already, but I do wonder about an
> > alternative that aligns more with the clock/reset/interrupt properties.
> > Essentially, define a new generic watchdog property that is specified on
> > the controllers to be reset by the watchdog (or even on just the
> > watchdog node itself, emulating what you've proposed here):
> > 
> > watchdog-resets = <phandle index>;
> > 
> > The phandle links to the watchdog of interest, and the index specifies
> > the controller associated with the configuration. It might even be
> > useful to do:
> > 
> > watchdog-resets = <phandle index enable>;
> > 
> > "enable" could provide explicit control over whether somethings should
> > be reset or not (as a way to prevent reset if the controller targeted by
> > the provided index would otherwise be reset in accordance with the
> > default reset value in the watchdog controller).
> > 
> > The macros from the dt-bindings header can then use macros to name the
> > indexes rather than define a mask tied to the register layout. The index
> > may still in some way represent the mask position. This has the benefit
> > of hiding the issue of one vs two configuration registers between the
> > AST2500 and AST2600 while also allowing other controllers to exploit the
> > binding (Nuvoton BMCs? Though maybe it's generalising too early?).
> > 
> 
> Sorry, I'm having a bit of a hard time picturing exactly what you're
> suggesting here...to start with:
> 
> > property that is specified on the controllers to be reset by the
> > watchdog
> 
> and
> 
> > or even on just the watchdog node itself
> 
> seem on the face of it like two fairly different approaches to me.  The
> former sounds more like existing clock/reset/etc. stuff, where the
> peripheral has a property describing its relationship to the "central"
> subsystem, and various peripheral drivers are all individually responsible
> for observing that property and calling in to the central subsystem to
> configure things for that peripheral appropriately; if I'm understanding you
> correctly, it might look something like:
> 
>   &spi1 {
>     watchdog-resets = <&wdt1 WDT_INDEX_SPI1 0>;
>   };
> 
> Or maybe something more like how pinctrl works, via phandles to subnodes of
> the central device?
> 
>   &wdt1 {
>     wdt1_spi1_reset: spi1_reset {
>       reg = <0x1c>;
>       bit = <24>;
>     };
>   };
> 
>   &spi1 {
>     watchdog-resets = <&wdt1_spi1_reset 0>;
>   };
> 
> Either way, it seems like it'd be complicated by any insufficient
> granularity in the watchdog w.r.t. having independent control over the
> individual devices represented by separate DT nodes (such as how the AST2500
> watchdog has a single SPI controller reset bit instead of one per SPI
> interface, or its "misc SOC controller" bit governing all sorts of odds and
> ends).
> 
> In the latter case (property on the wdt node), would it essentially just be
> kind of an indirection layer mapping hardware-independent device indices to
> specific registers/bits?  It's not obvious to me what purpose a phandle to
> the peripheral device node would serve (would the wdt driver have a good way
> of identifying what specific peripheral it's pointing to to know what bit to
> twiddle?), but maybe I'm misunderstanding what you're suggesting...
> 
> 
> I guess my other uncertainty is the balance between generalization and
> applicability -- how many other watchdog devices have sufficient comparable
> configurability to make use of it?  I haven't pored over all of them, but
> from a random sampling of 20 so of the other existing wdt drivers I don't
> see any obvious candidates -- the closest I saw were cpwd.c, which
> apparently can distinguish between a CPU reset and a CPU/backplane/board
> reset, and realtek_otto_wdt.c, which can do a CPU or a SOC reset (though I
> don't have any of the hardware docs to know what capabilities other devices
> might provide that the drivers don't use).  Do the Nuvoton BMCs have
> watchdogs with peripheral-granularity reset configuration?
> 

Quite frankly, I don't like where this is going. It is getting way
too complicated. And when something is becoming way too complicated,
I tend to put it on my backburner list. The length of that list quickly
approaches maxint.

Guenter
