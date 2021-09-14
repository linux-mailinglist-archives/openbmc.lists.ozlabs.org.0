Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBEC40A98A
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7xl72czRz2yHZ
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Cvn9Hen1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Cvn9Hen1; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7xkg2hTxz2xtN;
 Tue, 14 Sep 2021 18:45:29 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id u21so10696054qtw.8;
 Tue, 14 Sep 2021 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iK9P8vIFFT9oL8kQTe19y5v8KSqHawUgdc7tgu6jnMk=;
 b=Cvn9Hen1/zE/gCFNdbOMTSnCeR6Aaqfbmqxiwpzv7qfd+HzLbclvWSoFLy7wrbgTvN
 NHoUf1vWsKtIlAcIz8r9ZxQbR7l8T5lbAtczKvCpz+1zGAuKERCwBVPdRTK8OKSyUwdk
 FjMAXQ1I8T8JmOjhkX0l+QcQ5LWaNvrQD2T/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iK9P8vIFFT9oL8kQTe19y5v8KSqHawUgdc7tgu6jnMk=;
 b=dFu6GyQ4Jg0To/lLXcCwxZfpmx6V19td30P/5aZo9qvbc27gryf/hZoFKlCb4189h7
 yRGBvH6dMqBGrALH/q+SLGDl+k6Bm9T3RvGXcIuhaOGLSIBgfzKapWdGo+/4lBiGaqVt
 A9PPiJZmMXknLsu5xfJ7lXhDzEi5CDzGQ9kbWT54A44aF7W//afYlhypNhfo3zxskM3e
 BRV5EA9BiT59xdaAaNCR2sYf20+5rN6veYd/R/lCGT3GKDaC5VhORwDoetu+69Wguyyd
 tL2JIS/MP1RNoX54Z+aLR3PQQ2g00vmJ4lcM57+lsqM2NqGEcNOuU5kEbym11iddaxZE
 30ng==
X-Gm-Message-State: AOAM530/Yi7N7DBVDENnzTOtmyrJrIlHz4jdcUYTGycpwU9PocHNXBMn
 awwku0VvqnVjLS4Ek5L1PyfdBO77/H1NeCpzHKk=
X-Google-Smtp-Source: ABdhPJwCWePNRUMT/Z0Tlj9D9n6UOcZX8cM3kXTZaf8wa4u/vSDJ52fustyWsztQJwELkActhXZKT85BQMHRjNmGVZQ=
X-Received: by 2002:ac8:7dca:: with SMTP id c10mr3452405qte.259.1631609125669; 
 Tue, 14 Sep 2021 01:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210819055227.140980-1-liuxiwei@inspur.com>
 <CANFuQ7A5jLXftmfLn_W93MuDF8heL88BPQRL_rkYk+bj0_Db0w@mail.gmail.com>
In-Reply-To: <CANFuQ7A5jLXftmfLn_W93MuDF8heL88BPQRL_rkYk+bj0_Db0w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Sep 2021 08:45:13 +0000
Message-ID: <CACPK8XfbJbU8zPzTri3o+zbSf82iUuGUXmFL5TwsdPHKLnTNTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding
To: George Liu <liuxiwei1013@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, George Liu <liuxiwei@inspur.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 08:16, George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hey Joel:
> do you have any comments at this patch?
>
> Thx -- George Liu
>
> On Thu, Aug 19, 2021 at 1:52 PM George Liu <liuxiwei1013@gmail.com> wrote:
> >
> > Signed-off-by: George Liu <liuxiwei@inspur.com>

It looks okay to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have applied it for 5.16.

> > ---
> >  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > index 1752f3250e44..d0c3acbf6c8c 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > @@ -3,6 +3,7 @@
> >  #include "aspeed-g5.dtsi"
> >  #include <dt-bindings/gpio/aspeed-gpio.h>
> >  #include <dt-bindings/leds/leds-pca955x.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> >
> >  / {
> >         model = "FP5280G2 BMC";
> > @@ -902,4 +903,10 @@ fan@7 {
> >
> >  };
> >
> > +&kcs3 {
> > +       status = "okay";
> > +       aspeed,lpc-io-reg = <0xca2>;
> > +       aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> > +};
> > +
> >  #include "ibm-power9-dual.dtsi"
> > --
> > 2.30.2
> >
