Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499EC376973
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 19:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcHLy25bJz2yhr
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 03:22:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMWuPbnO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jMWuPbnO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcHLg1Nslz2yXH;
 Sat,  8 May 2021 03:22:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14F4561466;
 Fri,  7 May 2021 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620408119;
 bh=tAp8HMPCWwh+NHuRDeCEmS0cp+aQxiTRacpv+7HZQaA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jMWuPbnOx6U5JZ6lRhEBYIFqNUnKAwzdc5WQfVuFRGqAC2rekeI9FxYRtfcVBjKuM
 97WoLmGZ1f1xezdG2Mm7GDXQkdgtPie37cHlyxL9E/d3wzas81leEO2jGQJfrcrRhb
 KMnBTLrq4TULos6RHk2OFJ8hDdyR7n71XyrFno4m3EGZkyLY2UtBu6XtEZYVn/YFIs
 qSdkZX5JN5kVDZCJS+nczGgDSWspBE1R0IFRCuHst3zdUpb/WuylLIZmfWww8BVmvf
 gZmhsm6y0H/21HbZdM+/lpZu4oq+aFbW0Neda4grx0UZ4qNgcsshKrMsuDKlwCUkqe
 3dlNkERzA9Iww==
Received: by mail-ej1-f51.google.com with SMTP id a4so14747102ejk.1;
 Fri, 07 May 2021 10:21:58 -0700 (PDT)
X-Gm-Message-State: AOAM531F/RwxPj5KHXNUVheFnojo3p9QkQnD7Z/lOcJdRplgE9XZb3MS
 9uLVct9u9s6Dox8Nfs5dInNClHgYcsJ5OAuQRw==
X-Google-Smtp-Source: ABdhPJxlHzBX1kiOwdryT4JxLp1ZW5TdkQ+pgCxGNOoI/UqgbP1iECA3RgBAMWk0XjgD5TeZd/KBEkXxO5L1SMOtnxE=
X-Received: by 2002:a17:906:a0c6:: with SMTP id
 bh6mr11119997ejb.359.1620408117401; 
 Fri, 07 May 2021 10:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-2-steven_lee@aspeedtech.com>
 <20210507011324.GA1119409@robh.at.kernel.org>
 <20210507031348.GA23749@aspeedtech.com>
In-Reply-To: <20210507031348.GA23749@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 May 2021 12:21:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLywL6J_uVVquhOMevb6Geed-A2o7fzHQPKvVQxe4gscA@mail.gmail.com>
Message-ID: <CAL_JsqLywL6J_uVVquhOMevb6Geed-A2o7fzHQPKvVQxe4gscA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: mmc: sdhci-of-aspeed: Add an example
 for AST2600-A2 EVB
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Hongweiz@ami.com" <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 6, 2021 at 10:14 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The 05/07/2021 09:13, Rob Herring wrote:
> > On Thu, May 06, 2021 at 06:03:08PM +0800, Steven Lee wrote:
> > > AST2600-A2 EVB has the reference design for enabling SD bus
> > > power and toggling SD bus signal voltage by GPIO pins.
> > >
> > > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> > > power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> > > connected to a 1.8v and a 3.3v power load switch that providing
> > > signal voltage to
> > > SD1 bus.
> > >
> > > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > > disabled.
> > > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> > > signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> > > enabled, SD1 signal voltage becomes 1.8v.
> > >
> > > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > > GPIOV3 as power-switch-gpio.
> > >
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 101 +++++++++++++++++-
> > >  1 file changed, 97 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > index 987b287f3bff..de7e61b3d37a 100644
> > > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > @@ -45,10 +45,16 @@ patternProperties:
> > >
> > >      properties:
> > >        compatible:
> > > -        enum:
> > > -          - aspeed,ast2400-sdhci
> > > -          - aspeed,ast2500-sdhci
> > > -          - aspeed,ast2600-sdhci
> > > +        oneOf:
> > > +          - items:
> > > +              - enum:
> > > +                  - aspeed,ast2400-sdhci
> > > +                  - aspeed,ast2500-sdhci
> > > +                  - aspeed,ast2600-sdhci
> > > +          - items:
> > > +              - enum:
> > > +                  - aspeed,ast2600-sdhci
> > > +              - const: sdhci
> >
> > Why are you adding 'sdhci'. That's not useful as a compatible given how
> > many quirks different implementations have.
> >
> >
>
> It is for passing the dtbs_check of the second example.
> Without this definition, many device trees have the following
> error:
>
> ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> Additional items are not allowed ('sdhci' was unexpected)

I would probably fix the dts files then. Does anything depend on 'sdhci'?

Rob
