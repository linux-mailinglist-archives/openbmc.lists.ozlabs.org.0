Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB8925515
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 10:11:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jMf3INRp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDXY60vHRz3cXH
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 18:11:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jMf3INRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDXXZ5kFtz30YZ
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 18:10:53 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6515867cf33so4024447b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2024 01:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719994250; x=1720599050; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yApJbS1J982Mr43KG6Io+vzWvPNEiwgyhvcxzbp7YPg=;
        b=jMf3INRpb45hzEqw9wjS0EmLVXkk8IzKN7cVnlr4XdHsm6WalYrABKzdwUOuM8ttWw
         Yrz5YlbJExfeHdRkFFJVLq97hl51I04PbUpy16oPlwDXAHOCMaj3ClX6NjQrpRR1PbUK
         C8TGfil/06kiIX+BVnOzN2PSxc6x6Nr5GcoEFbvav9PVccC26gVe1qRi55Qv0prJaiB2
         2B2jiIvYgUPmW1CgcwyaWbxMMuAdlljIzd34ET+hNdtu55JQB9w3NUx4QVu8SvDnaEOy
         alSPyXjmq/Do3aFtCeu0+Wf+owKVQQbVp4tkV3p5OwAXFUkYkPVwEEcTmtWegOERmaCD
         HOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994250; x=1720599050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yApJbS1J982Mr43KG6Io+vzWvPNEiwgyhvcxzbp7YPg=;
        b=Y7O8S6C4wuCAT998nVtOe3zsdMidoL2F+aO5+rSV0nXGtgIOGwD8//TBVFx4f/6diE
         CK1UnRVuaiYuhyEUBVfRUgmcznYti2zV+cnXefdx9zH1vMB2kecw7h1Nr1YEzMY0Zo9Y
         MjZU/IL7Jhe9YNgtuLXceJKXN43tZU/LIolL8L3yigNpI890+0iXyI7bWqpGbHlyUPKp
         CAYm+VRcILf955Qe/GjrpnVrTrDWHSenfK1KyMN9sYbXyy8ZpafZKDCmYezTYq6ysltM
         zNXdsirbI/BuUUCA6nHJ4OSqACx9yN5S4MrBnDi/+3kTkAoFMb8kb1HvS0OVqrXybuM4
         j4AQ==
X-Gm-Message-State: AOJu0YxuBO3ikGCijIFt7RHq4ySF3/QdecXaI+ZIkbzM3AOUg+kfShOp
	a9xdfxqs5oVpYPrD+gfRo4DsvEUMmyWN7sYuaWJGwAxT2Z5mLksD7cq+qLnU7yutm8WJW8roemh
	kvLVGvFCV+Bp4hgdnmyxbLMf+vGU=
X-Google-Smtp-Source: AGHT+IGPxgUjiRnaLsjlyPZgK34qt1lNxC2XaPINRxEBR6rKIJTaW1iiPk3sCn+8mGgZuTa55BmuIjYXP5ada3a2HXI=
X-Received: by 2002:a81:844e:0:b0:63b:b829:dcdc with SMTP id
 00721157ae682-64c7123c021mr102245637b3.1.1719994250368; Wed, 03 Jul 2024
 01:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240701071048.751863-1-tmaimon77@gmail.com> <20240701071048.751863-3-tmaimon77@gmail.com>
 <fdd1058734e27094c15585bb0c735ebb9635b24e.camel@codeconstruct.com.au>
In-Reply-To: <fdd1058734e27094c15585bb0c735ebb9635b24e.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 3 Jul 2024 11:10:39 +0300
Message-ID: <CAP6Zq1jLQpqK9jxQOKH1-3dhz4cgYJGDBQiER24mLwsudaE=PA@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 2/6] dt-bindings: clock: npcm845: Add reference
 25m clock property
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,


On Wed, 3 Jul 2024 at 09:09, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> > The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
> > clock property.
> >
> > The new required clock property does not break the NPCM8XX clock ABI
> > since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
> >  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++
>
> The patch subject is quite misleading - this isn't modifying the
> binding at all, rather the actual devicetrees.
>
> Has this work been sent upstream?
It was sent months ago but is added to the clock node and not the reset node.
Now the clock reference is represented in the reset node but since the
clock driver has so many versions I am not sure this solution will be
accepted :-(
This is why I prefer to wait until the clock maintainer approves the
driver and then I could proceed with the other clock device tree
patches.

but with the OpenBMC Linux kernel is a different story since we have
customers that need to use the clock driver we need to send the
current full solution and not part like I did with the Vanilla upstream.

>
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index ecd171b2feba..41d345448430 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -52,6 +52,7 @@ rstc: reset-controller@f0801000 {
> >                       reg = <0x0 0xf0801000 0x0 0x78>;
> >                       #reset-cells = <2>;
> >                       nuvoton,sysgcr = <&gcr>;
> > +                     clocks = <&refclk>;
>
> Why not add `#clock-cells` here while we're at it (squash patch 3/6
> into this one)?
because it is not part of the clock reference
>
> Andrew

appreicate your understanding!

Tomer
