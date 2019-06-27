Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7C57A70
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 06:07:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5wC3ZC1zDqLY
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 14:07:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NVXpmGHH"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z5vY4p1CzDqJ1;
 Thu, 27 Jun 2019 14:07:19 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id p15so1025996qtl.3;
 Wed, 26 Jun 2019 21:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odEtYfSJdPci4PPgC6CMfIE2a3S4KfjZvHhAIm9Si2o=;
 b=NVXpmGHHe7707LTsMucUvOxwzqModa7uwKn6y782AkEHVmiQE37lGR+CCTV7KeaR4K
 Ipa2RoDO3ChzEM+/WUWhSOcMdUzPWKsf7B4l66NIlneOj25x+RcLt+JfAA7Ty7muPfix
 A4+9c0tMB0L8UkSC75MkDbLb/YA6L3lXGrlhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odEtYfSJdPci4PPgC6CMfIE2a3S4KfjZvHhAIm9Si2o=;
 b=rbmc92zhRK4CNnK99uQ0794n2yNcF6bWppplAuz5zQyGBbu+IgvA+Zyx1wADLx3SBP
 iI3T3TI8j80J/AgNKKZlX2QQEdrtf0m2JvA45kOhhhhbquxwFa6FUvgV50PGV+gvPgQ2
 ZAbi0qZuMh9j9sXCRMc/9tuITvBbQC3JLULeVJz1e8MXxSfaoYQ2VwexfSPgXlhXoBnw
 XPFGXVqwhZHxlHK/vS4QWfiOTkJ1Xf/2jbpsIcO+Nfkk+Zzxs1FKvQRVSet40EMUCqS0
 u/YnWqQFBgWOyJAfUk+3q0XBeOo4q9+/IzKIf/MFwydlUCCv5XwVn23FNtLcq73AoFXX
 fCcA==
X-Gm-Message-State: APjAAAW/VU3CHnfTWt3Y43kBJOFpJCYRJCeZD48bAwuCN9/AAnFuE4xU
 GnSpN0GyVVmQIJFQciM+62B6eEsLbjoO6XkKK1o=
X-Google-Smtp-Source: APXvYqyRm1YLTsTM11LFxi70F1EclLRg6D57JwIALT0GIHZ3dVSDFeeVIzBTEVCsbfHG/lF/8yIhuseiBKeTXBZy+D0=
X-Received: by 2002:a0c:a8d2:: with SMTP id h18mr1493936qvc.16.1561608435486; 
 Wed, 26 Jun 2019 21:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
 <226afe63-cc86-4920-abc1-025bdda32063@www.fastmail.com>
In-Reply-To: <226afe63-cc86-4920-abc1-025bdda32063@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jun 2019 04:07:03 +0000
Message-ID: <CACPK8Xd3Cf8zRSTLVbcTQTu+4aEp1qhmkaFAF4AcfJMkky3gYQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document
 in two
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jun 2019 at 04:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 27 Jun 2019, at 13:02, Joel Stanley wrote:
> > On Wed, 26 Jun 2019 at 07:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Have one for each of the AST2400 and AST2500. The only thing that was
> > > common was the fact that both support ASPEED BMC SoCs.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 +++++++++++++++++++
> > >  ...-aspeed.txt => aspeed,ast2500-pinctrl.txt} | 63 ++-------------
> > >  2 files changed, 85 insertions(+), 58 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > >  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-aspeed.txt => aspeed,ast2500-pinctrl.txt} (66%)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > > new file mode 100644
> > > index 000000000000..67e0325ccf2e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > > @@ -0,0 +1,80 @@
> > > +=============================
> > > +Aspeed AST2400 Pin Controller
> > > +=============================
> > > +
> > > +Required properties for the AST2400:
> > > +- compatible :                         Should be one of the following:
> > > +                               "aspeed,ast2400-pinctrl"
> > > +                               "aspeed,g4-pinctrl"
> > > +
> > > +The pin controller node should be the child of a syscon node with the required
> > > +property:
> > > +
> > > +- compatible :                 Should be one of the following:
> > > +                       "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > > +                       "aspeed,g4-scu", "syscon", "simple-mfd"
> >
> > I think we can use this as an opportunity to drop the unused g4-scu
> > compatible from the bindings. Similarly for the g5.
>
> I Wonder if we should eradicate that pattern for all the aspeed compatibles?

Yes. We've settled on ast2x00,aspeed-<foo> for most of them. If you're
aware of others we should remove them from the bindings.

I think we've stopped any new users of the gx style from getting merged.
