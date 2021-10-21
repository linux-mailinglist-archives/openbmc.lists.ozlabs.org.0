Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE95435AE6
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZcyp3VzVz2yn7
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 17:29:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Td2fY8rz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Td2fY8rz; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZcyL1MLBz2xY1;
 Thu, 21 Oct 2021 17:29:11 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id h20so5852495qko.13;
 Wed, 20 Oct 2021 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0e08ZBM6li1C7tIxn5UtaiVKx16gPUU53/VSVrg5fJo=;
 b=Td2fY8rzFcaK0Z8RxrmdaIX5MS//Nz7s/uqzHILWSw/VIPmQfG3YXqAP3T1TWwk4LQ
 eMvK7Ag7S9dMbVvXNTU8YFYN2X6ZGEwsN9UDFtp2yhjHSGFoVOMfTWUlJ93HGpFvj+hT
 stQqNCSOAwW1/HSCSJGI9Ad5OtyUezsZ8YbT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0e08ZBM6li1C7tIxn5UtaiVKx16gPUU53/VSVrg5fJo=;
 b=gT69jSeU18GlRrzSThrDK5WK141/TUHJ1XuSm03e7XLsiQpAy80uprGu2zIOJrW9BF
 hxX5t+IIGoG4cfGBjBg7beXUP0zZXqmitr/p5BK2TeGqjHxyf6XF4zFTop8C+dWI+KxZ
 g+pJGfOuTDOaOhRHh1AliMKuyXZRTHX4icd7z0D3kPSSuZ1ffQsa2WVvaH3mngCi53M3
 nmLO0WcZcbiqVCqI2FzkhKmhB3wGjymvpIjQGIBUWn3pc7bsBL9JTbENOUUjNPe9QBpM
 lyTvLxBfxC2d8tCAxNeN8G1jseA5v232yeKgMp/2xCk3ta+iBf56/wyCTs5BPfdAhgph
 7Zpg==
X-Gm-Message-State: AOAM531T4leiJ3HHeZGcc+ckqueCzqbALKawyBoDIHo6Q2VeAubXp+42
 PVKddkUn8ed7lOYebjytDdVlr0N/CeNk9X6Q2v4=
X-Google-Smtp-Source: ABdhPJzYRyu7h/1T0GKhoPH0Q6POzzEPYiGIWsiuBu5bnlqmFPvMvmpbey9PZ3ED3wlZtCpFep2wbVDF16aMVFxE040=
X-Received: by 2002:a05:620a:4010:: with SMTP id
 h16mr3013062qko.292.1634797748541; 
 Wed, 20 Oct 2021 23:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
 <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:28:56 +0000
Message-ID: <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>
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
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 8 Oct 2021 at 04:35, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 27 Sept 2021 at 02:31, Chia-Wei Wang
> <chiawei_wang@aspeedtech.com> wrote:
> >
> > The 'reg-io-width' properties are not used by LPC drivers
> > nor documented as part of bindings. Therefore drop them.
>
> I assume they are there due to the lpc having a 'syscon' compatible.
> THey are documented in the syscon bindings:
>
> Documentation/devicetree/bindings/mfd/syscon.yaml
>
> Andrew, do you have any comments?

Andrew indicated to me that he agreed with my observation: the
properties should be present as they are used by the regmap/syscon.

>
> >
> > This is in preparation to move aspeed-lpc.txt to YAML schema.
> >
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
> >  arch/arm/boot/dts/aspeed-g6.dtsi | 1 -
> >  3 files changed, 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index c5aeb3cf3a09..45a25eb4baa4 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -345,7 +345,6 @@
> >                         lpc: lpc@1e789000 {
> >                                 compatible = "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
> >                                 reg = <0x1e789000 0x1000>;
> > -                               reg-io-width = <4>;
> >
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> > index 73ca1ec6fc24..8e1d00d8445e 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -436,7 +436,6 @@
> >                         lpc: lpc@1e789000 {
> >                                 compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
> >                                 reg = <0x1e789000 0x1000>;
> > -                               reg-io-width = <4>;
> >
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index 1b47be1704f8..0d1aae6887cd 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -490,7 +490,6 @@
> >                         lpc: lpc@1e789000 {
> >                                 compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
> >                                 reg = <0x1e789000 0x1000>;
> > -                               reg-io-width = <4>;
> >
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > --
> > 2.17.1
> >
