Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7A34F501
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 01:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F95Fr1hDBz3bwc
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 10:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q8okifF2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Q8okifF2; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F95FZ5ZTvz2y89;
 Wed, 31 Mar 2021 10:27:13 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id g24so13220180qts.6;
 Tue, 30 Mar 2021 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3/mQcvUwNsY/UJc2jxu3Abaa2D2bXGCJS30gIHPjEs=;
 b=Q8okifF2x7Cis24xXyTCsqdK6HSPnuU+16cgfbDheWc8gugJ8X+B/ISr+bIh+Jo4GJ
 Ft5oK8XVv+9fMVUiuGcSdRLYEpDj1o5+MvtnoxIxsauXhAGJwhviS9YUW6ZgMidlx1UW
 GGxnpmetsT/F4eGykAZdpSBR/TkVjXqfxF7Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3/mQcvUwNsY/UJc2jxu3Abaa2D2bXGCJS30gIHPjEs=;
 b=NBz4ttut3fnzBw8P5gW9OWbKc7tys60vx9QNfXliqfBmXoGhLKOkKWFp195dGBjaUl
 5Xdyna31K5k/CX6Hdyq7dc2BfoRBNJwuPsZ2BMxRe3Vuu0SyT+wuB8LSG2WQmnvMaUUW
 chRXME+4RmFP741ZlXDM94aLLvi2zTuAn8s0WoqPzJ50GomyNtoAvS3RT5hLIN7fJ4t1
 1f37Q8N1lam8EZO/Goz2/TvsFUMilHQ14r9yszCDEdNiXlwiFglYNB46K/PtAP8ny/Go
 ogs6/D2LHVker7DN3v9jPVh3TJMBX246fnxkn8mCQlDLKwQKrWlUOKA4AjES8MBM0wiH
 AzVg==
X-Gm-Message-State: AOAM5322QBUGZdBSw3PW0Grsw+tGBxpE1O1pMZcMI1olELAt4fHsCtjG
 K54O7ToHCCIRBhY2Nu9AZeW9E9alYVUujVwJ6/4=
X-Google-Smtp-Source: ABdhPJzEEpS2qBWaoDRJ4nevrrO4IATNTcu8uGU7/niHD9Gdp4fHrFKbwgSR99OPio8OGSwp13rYrGb8mGgTwFaYaCE=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr235856qtr.176.1617146828454;
 Tue, 30 Mar 2021 16:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-3-zev@bewilderbeest.net>
 <20210330223902.GA837825@robh.at.kernel.org>
In-Reply-To: <20210330223902.GA837825@robh.at.kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Mar 2021 23:26:56 +0000
Message-ID: <CACPK8Xcfcsz7KCdfLuweGGbaxVKczhMb7+nxA9TMbsAbAbhi3g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: update for aspeed,
 sirq-active-high
To: Rob Herring <robh@kernel.org>
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
Cc: - <devicetree@vger.kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, linux-serial@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Mar 2021 at 22:39, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 29, 2021 at 07:23:37PM -0500, Zev Weiss wrote:
> > Update DT bindings documentation for the new incarnation of the
> > aspeed,sirq-polarity-sense property.
>
> Why?
>
> This isn't a compatible change.

We want to depreciate support for this property. It should have never
been added to the bindings; in it's current form it describes a
relationship that afaict doesn't exist ("This unrelated register over
here dictates the polarity of your virtual serial port IRQ"). See
https://lore.kernel.org/lkml/20200812112400.2406734-1-joel@jms.id.au/

The intent is to remove it from both the bindings and the code.
There's already no users of it in any device tree.

How would you like Zev to go about doing this?

Cheers,

Joel

>
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> > index f54cae9ff7b2..0bbb7121f720 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -13,7 +13,7 @@ allOf:
> >    - $ref: /schemas/serial.yaml#
> >    - if:
> >        required:
> > -        - aspeed,sirq-polarity-sense
> > +        - aspeed,sirq-active-high
> >      then:
> >        properties:
> >          compatible:
> > @@ -181,13 +181,11 @@ properties:
> >    rng-gpios: true
> >    dcd-gpios: true
> >
> > -  aspeed,sirq-polarity-sense:
> > -    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +  aspeed,sirq-active-high:
> > +    type: boolean
> >      description: |
> > -      Phandle to aspeed,ast2500-scu compatible syscon alongside register
> > -      offset and bit number to identify how the SIRQ polarity should be
> > -      configured. One possible data source is the LPC/eSPI mode bit. Only
> > -      applicable to aspeed,ast2500-vuart.
> > +      Set to indicate that the SIRQ polarity is active-high (default
> > +      is active-low).  Only applicable to aspeed,ast2500-vuart.
> >
> >  required:
> >    - reg
> > @@ -227,7 +225,7 @@ examples:
> >          interrupts = <8>;
> >          clocks = <&syscon ASPEED_CLK_APB>;
> >          no-loopback-test;
> > -        aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
> > +        aspeed,sirq-active-high;
> >      };
> >
> >  ...
> > --
> > 2.31.1
> >
