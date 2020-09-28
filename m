Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0B27AACB
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 11:33:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0HPh4KMWzDqRs
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 19:33:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=f994yyLu; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0HNt1f3JzDqHV
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 19:32:27 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id q21so252827ota.8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDNF7T022JyWaG/OQb4CI8Xuhz9buOvLUwJ6X4clWwY=;
 b=f994yyLuazGIZR6BcQP8C8RzGG+gGZxBIIWs32+PqnBtCfWE98uS+5hbVw/Dtf3K3o
 QdA2qWqAB0lJ+kSHvx5JOfl16R57V8gI2A8d7sUeeTP/H+qpynNEdNZRHa3Utl8QRQWU
 G1Jf92mGKFBHBw1IOrAKNLDa+1krjr12b9bve8RShyz1Xr1BTTF1bsfM+RkL8MyjF5wB
 Tvf2J9wGoE9f5hivMUoU8qElRims1mloDH0k1WhKEY2UCubPusKLrGbtCt/eMEWBGv+O
 oQLuZYxUbWQ8pJ53EvqeQK/nfnxw2uoFLpnCxfvCB0eVUnV2QsKiP551csZo/89FGVw+
 oGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDNF7T022JyWaG/OQb4CI8Xuhz9buOvLUwJ6X4clWwY=;
 b=YboRKpy/PWOXaAAVKe65vnMjEfxUi1VokCMgYZk7+tecsaOfXfbLvJG9o08W4YVKN7
 NEXov5WaspgaRk9jK7F+uj/PlxgYKO47pEUkLmlibPqo6CQ9vyIIUjJRl8xN8wzK/H72
 WzZ/ZBUtdTlOlu8fWkcifsLW+A7NNPx2oTvf4v89UHMqX3tKBQprCAjsv+5YPotgOdcO
 oNfZxQphSdFDJX7H2SChv1B35kcfyUik2mJ3djGFXb7Mh2tTQuNWabL/j/yI+/MD9VhQ
 tB0UWfUv5EWLxEm9hLpX23hYyWi7IQkpNnA2UOABpb7jn0HLit4dpCVf2xYcugW7tLO8
 2A4g==
X-Gm-Message-State: AOAM531mNt2Gnj91L4uSWRezDgW/Ku59UVCHB0+NjyvTsZHIREaWtzhJ
 D1JPH0bPSsi+l5gGVkoCj37gHsRX3VE7y2hrGmwr0A==
X-Google-Smtp-Source: ABdhPJyAu/jBHLi928EW+AwLJKPTFTIOTCorqjKhbJSaNuI7zzepCTpWLarfsXTL+p/iPYBiilzzuhPT9JUcmmON7u8=
X-Received: by 2002:a9d:6a98:: with SMTP id l24mr317440otq.257.1601285544396; 
 Mon, 28 Sep 2020 02:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
 <20200928064303.1961-2-wangzhiqiang.bj@bytedance.com>
 <CACPK8XdPsDHWBes2b++fB_Pn5+AGowE_gs7OPB6eJfxeKALbaA@mail.gmail.com>
In-Reply-To: <CACPK8XdPsDHWBes2b++fB_Pn5+AGowE_gs7OPB6eJfxeKALbaA@mail.gmail.com>
From: =?UTF-8?B?546L5b+X5by6?= <wangzhiqiang.bj@bytedance.com>
Date: Mon, 28 Sep 2020 17:32:13 +0800
Message-ID: <CAH0XSJsXoAUpDybMMx_y-5xTLLnBGm3xFOKaGay+2qa=s6yhBQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH linux dev-5.8 1/2] ARM: dts: Add 64MiB
 OpenBMC flash layout
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 2:50 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 28 Sep 2020 at 06:43, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > This is an alternate layout used by OpenBMC systems
> >
> > The division of space is as follows:
> >
> >  u-boot + env: 0.5MB
> >  kernel/FIT: 5MB
> >  rofs: 42.5MB
> >  rwfs: 16MB
> >
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Looks good to me.
>
> Are you confident your kernel and u-boot will fit as you add features?

yes, I tested it and the bmc booted up. uboot's layout is the same as
the 32M layout.

>
> Do we have a location in the OpenBMC documentation that lists the
> various flash layouts? If not, it would be good to add something at
> github.com/openbmc/docs

Sure I will add it to openbmc/docs.

>
> > ---
> >  .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> >
> > diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> > new file mode 100644
> > index 000000000000..18c8047c1d0c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0+
>
> Add a copyright notice referring to the copyright holder and the year.

done.

>
> > +
> > +partitions {
> > +       compatible = "fixed-partitions";
> > +       #address-cells = <1>;
> > +       #size-cells = <1>;
> > +
> > +       u-boot@0 {
> > +               reg = <0x0 0x60000>; // 384KB
> > +               label = "u-boot";
> > +       };
> > +
> > +       u-boot-env@e0000 {
> > +               reg = <0x60000 0x20000>; // 128KB
> > +               label = "u-boot-env";
> > +       };
> > +
> > +       kernel@100000 {
> > +               reg = <0x80000 0x500000>; // 5MB
> > +               label = "kernel";
> > +       };
> > +
> > +       rofs@a00000 {
> > +               reg = <0x580000 0x2a80000>; // 42.5MB
> > +               label = "rofs";
> > +       };
> > +
> > +       rwfs@6000000 {
> > +               reg = <0x3000000 0x1000000>; // 16MB
> > +               label = "rwfs";
> > +       };
> > +};
> > --
> > 2.25.1
> >
