Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038A63DDA
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 00:24:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jxhF2qk8zDqXL
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 08:24:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QJMPaDUP"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jxgj5T5kzDqWc;
 Wed, 10 Jul 2019 08:24:15 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id j19so284184qtr.12;
 Tue, 09 Jul 2019 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwhnGsGH9s9hvaDIRuefoQWgAdyMwKo1d1puXU9/I5A=;
 b=QJMPaDUPnlkVwDn/6sEqbuN4FXbIROEPER7JwtQqCYKjxZKOvEEAFEkVxrP6eMaz4m
 ORNrXr1v6bZM9n1qwRAyUvu6vaJ2rXRTyZcjxl3PmIih/YF15f0MWPUVml0U74AwWxqa
 rg64yVusTVylcZuoFSBjgHOHFXAlqbdjWwRfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwhnGsGH9s9hvaDIRuefoQWgAdyMwKo1d1puXU9/I5A=;
 b=Jhfx1sTesscdc7VUrEdQf+xLlxnZ908+9baneUziFxo0k1+M9qPgKx+iu5oSWXuTG8
 dnmbQV1/sQthjaucPZi/Zsd+klbZuZaKhlcwi8SPzn6vLdydGaWFGx01SkcH+aiHL4jc
 X97AvTK85wlDWwhSQGHxQBT/ovgy5+FBW9/S/pwIqIx3ASJuiWmQNy5jUFC+wDt4OuuP
 H58jn1A2+e1UfIVcQpAPzZtStXQ/ybF0Bu01jBZwC5EDQ7KrDDHwCFFHMNpxkk7+717G
 oYq/VtYbZui/ZrcHq5tjDSzOG5N5jsetfcnTj1KmxyDq0u2SncQtqydHS9+JJYlxSo6o
 6cPA==
X-Gm-Message-State: APjAAAXHTgfLV7/QFqfrcsmFHQ+ID3rMA1kVWQdw7OgTsz/H5IlxVGTu
 GGh1cqXlOX8QFWLbPhmiMoFVop6Qq1Od7U1PYJ4=
X-Google-Smtp-Source: APXvYqzqs9dXXghSb0LqZ311PaFNZEFaMWevDygjuV9+I8sK99wO7HPuo3HQ8O4FmfzBiefRO+2x7BGlGtj0XMpfq1E=
X-Received: by 2002:a0c:a8d2:: with SMTP id h18mr22063738qvc.16.1562711052577; 
 Tue, 09 Jul 2019 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190708024749.22039-1-joel@jms.id.au>
 <33f00e308eb93f73a93c8c6d2728a5b4@linux.vnet.ibm.com>
In-Reply-To: <33f00e308eb93f73a93c8c6d2728a5b4@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jul 2019 22:24:01 +0000
Message-ID: <CACPK8XePgyXZ6W3z5e=X3JoSoJ6dvTu89A5eb5nOpqi3-8LdhA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Remove mbox node from
 device tree
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Hongwei Zhang <hongweiz@ami.com>, John Wang <wangzqbj@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 9 Jul 2019 at 21:02, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2019-07-07 21:47, Joel Stanley wrote:
> > This device driver was never upstreamed and so it has been dropped from
> > the tree. Remove the node from systems that had it enabled.
>
> Seems there are other systems that have it enabled, like witherspoon,
> palmetto, zaius, and lanyang, should this be removed from their tree as
> well?

Thanks for taking a close look. The systems I remove it from in this
patch are ones that enabled it in the patch that adds the device tree.
Others had it enabled in a separate patch, which I dropped from
dev-5.2.

Cheers,

Joel

>
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 4 ----
> >  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 4 ----
> >  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 4 ----
> >  3 files changed, 12 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > index c762c02dc716..628195b66d46 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > @@ -235,10 +235,6 @@
> >       flash = <&spi1>;
> >  };
> >
> > -&mbox {
> > -     status = "okay";
> > -};
> > -
> >  &mac0 {
> >       status = "okay";
> >       pinctrl-names = "default";
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> > b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> > index a3d6b71518fc..73319917cb74 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> > @@ -163,10 +163,6 @@
> >       status = "okay";
> >  };
> >
> > -&mbox {
> > -     status = "okay";
> > -};
> > -
> >  &pwm_tacho {
> >       status = "okay";
> >       pinctrl-names = "default";
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > index 270c9236deff..caac895c60b4 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > @@ -317,10 +317,6 @@
> >       flash = <&spi1>;
> >  };
> >
> > -&mbox {
> > -     status = "okay";
> > -};
> > -
> >  &mac0 {
> >       status = "okay";
> >       pinctrl-names = "default";
>
