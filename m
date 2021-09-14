Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576240AA04
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7xzT6QSTz2yK3
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JPSceBsm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JPSceBsm; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7xyy4Fmrz2xMF;
 Tue, 14 Sep 2021 18:56:09 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id x5so10695491qtq.13;
 Tue, 14 Sep 2021 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmC8BFtcIlu9tQDDEKEhJinzoMTwWxx2bKO3/mR5MTk=;
 b=JPSceBsmY+QUXryhoZVm4DgV8iWoUmwYcm18FTyzDrk/eV5SFl9eUANl11xbIdpeLo
 gtwHfP4cONJSlsxSLTw8FmABzzJeGsIulJ8YrNvKUzr50G2ZajaCLMz8T7yCj/f03oHY
 tqZsivBj1WD5sd+t7ujW3drsfawHE2PLbsQXbwY28NXxvWyXw/8vC20IqCjNcC/VG7PP
 PBaiNWXyfgcPyfA90eo27E29zCd72LrvwSpJVmjl8CHEcd8ZYW1b4oxqGZW79v8G/feL
 WRqirc2Rp4Lc55pyP60D0D/mgZqsRGBNAAVL13jpvLZEVnTpzQ+RFGgV0/4m+LwkCLjB
 czSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmC8BFtcIlu9tQDDEKEhJinzoMTwWxx2bKO3/mR5MTk=;
 b=OYxvn1ij8D5D4kB981UKdjSSkqyCR0I9TdrIgvnd36j2Sjj6HeQehONGD9gJv+CftT
 19ynMqC9Vz7G9AjOd3DbYt+dCG9ASrl14wa3QLNtvsytjbxYo8WRHu8bC7znuJcNkuaS
 xRLxG2H4YUtHP6qt4movyY5qoVQhG3SUa/5ASCu314LiWP2/V5tcIBU5O9ZvkBYSfRKZ
 t7qBUfplY0Ov5G0+FwcFg+ZSEuOhOHikgLvIugRaDTvbxFuYzrPS9ND4PeiaPkZSrqu5
 qn4Vy8F6snLNkqJUmpv5GSjIJSE8mUWnVKW40e3ZqYVMeshmuPlyTIkYPqG1QBG495b6
 HLmg==
X-Gm-Message-State: AOAM532U/rwnCRR0zBI5Hsp91xko9BNnYENVIr7rPQtT6WsU4trdXpbY
 SCGB44MsVr8R1vKR4q3/qod0r9TmSBSislBj220=
X-Google-Smtp-Source: ABdhPJyMESNiGETQ+IsMCvvHJh6G9CiPmXvtgztSYZvFfT9hrfiEN26fn2I7eW7z6QdmoFTMJpHOtPRP78t81PX+xvQ=
X-Received: by 2002:ac8:4156:: with SMTP id e22mr3638684qtm.308.1631609766079; 
 Tue, 14 Sep 2021 01:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210819055227.140980-1-liuxiwei@inspur.com>
 <CANFuQ7A5jLXftmfLn_W93MuDF8heL88BPQRL_rkYk+bj0_Db0w@mail.gmail.com>
 <CACPK8XfbJbU8zPzTri3o+zbSf82iUuGUXmFL5TwsdPHKLnTNTQ@mail.gmail.com>
In-Reply-To: <CACPK8XfbJbU8zPzTri3o+zbSf82iUuGUXmFL5TwsdPHKLnTNTQ@mail.gmail.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 14 Sep 2021 16:55:55 +0800
Message-ID: <CANFuQ7A6xbM571ds+aq-QUmLxUZ-FUjKukPqGV-irt8X_j=fkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding
To: Joel Stanley <joel@jms.id.au>
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

Thanks!

On Tue, Sep 14, 2021 at 4:45 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 14 Sept 2021 at 08:16, George Liu <liuxiwei1013@gmail.com> wrote:
> >
> > Hey Joel:
> > do you have any comments at this patch?
> >
> > Thx -- George Liu
> >
> > On Thu, Aug 19, 2021 at 1:52 PM George Liu <liuxiwei1013@gmail.com> wrote:
> > >
> > > Signed-off-by: George Liu <liuxiwei@inspur.com>
>
> It looks okay to me.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> I have applied it for 5.16.
>
> > > ---
> > >  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > > index 1752f3250e44..d0c3acbf6c8c 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > > @@ -3,6 +3,7 @@
> > >  #include "aspeed-g5.dtsi"
> > >  #include <dt-bindings/gpio/aspeed-gpio.h>
> > >  #include <dt-bindings/leds/leds-pca955x.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > >
> > >  / {
> > >         model = "FP5280G2 BMC";
> > > @@ -902,4 +903,10 @@ fan@7 {
> > >
> > >  };
> > >
> > > +&kcs3 {
> > > +       status = "okay";
> > > +       aspeed,lpc-io-reg = <0xca2>;
> > > +       aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> > > +};
> > > +
> > >  #include "ibm-power9-dual.dtsi"
> > > --
> > > 2.30.2
> > >
