Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9931E54D
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 06:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh2tp6rLFz30NM
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 16:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KPXgl+Jp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KPXgl+Jp; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh2tX4qWqz30Hq
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 16:13:55 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 2so433276qvd.0
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 21:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gv57M2Hmq8v3nJoHRiXi4xdui1yLd9S4+2jHDMZjRGk=;
 b=KPXgl+JpmFtJVvdOm8J0xTCgwLAKryALnDbvIymJE3ZnYEiCxoB6HLA4C02wJSbsnL
 SyHuE9mQT3z21HldwB0tnX2mcZVDCwlVezi/53oraUjCgxS219W+nvxdUV0HbekSKt8n
 FJVzrbmFg0msHDR0ty3OEmLxcycQ1skVFU0OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gv57M2Hmq8v3nJoHRiXi4xdui1yLd9S4+2jHDMZjRGk=;
 b=Ijsu8EZMDyWTRw4r4vyfqs9qEC61FtNVnBK1a9TBe7SjmvrHROkdg0QnjEOYeucbBb
 LNnvIIV5ydd3bx41bigZelzuWAx78PZ+DdNnpXYo+sxOeaPE8IiUuJfmvc5xkJoJq4bg
 WAvWtZGYp1CkkzrS4uvgItGKsxNYmmTeHg9zWWSWmU9oIUgpLaGVAEBWjZ6S4yeJqGH+
 jqeQ4MhXaDAqVYPdU7QlmzMaxG8ixYVlcgwFxVfkQLEiHjHNsNMVzM3LD6m35vngAXhH
 MDj0KgS3Dw34BHyJtMV4q9+PEjTSGcnXhpNz7J1m/KR99MYUo9xt7uuv1gbz3LafhCx7
 V0vQ==
X-Gm-Message-State: AOAM531siczmcSDcGmtPPboT46c7plEiIuW+mUDbYObggk5ahZB65SnS
 8lGpDldtR6IqZLMFW0F/LaAP0nivqHWHPXh/8So=
X-Google-Smtp-Source: ABdhPJz1p5nQT3nHx+8Ew5ZAttZvgB2CgafyZ7fVD+0Zs0P+EIiASCZy5lbmbNqvpeHMJaDN366h6LdZAw6sXClHtPY=
X-Received: by 2002:ad4:4693:: with SMTP id bq19mr2548218qvb.43.1613625230334; 
 Wed, 17 Feb 2021 21:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
In-Reply-To: <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Feb 2021 05:13:38 +0000
Message-ID: <CACPK8XeMV4=XKFwLUOZX056D4oobV82ZvsxXkFV-4wvjcgvA4g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout This change satisfy
 OpenBMC requirements for flash layout.
To: Anton Kachalov <gmouse@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 11 Feb 2021 at 16:15, Anton Kachalov <gmouse@google.com> wrote:
>
> Hi, Joel.
>
> This is the correct patch.

Thanks. I didn't get this email; can you resend the patch?

Please send it to the mainline lists, and use get_maintainers.pl so
the nuvoton team can review.

I will apply it to the nuvoton tree for merging next merge window, and
to the openbmc tree.

Cheers,

Joel

>
> On Thu, 11 Feb 2021 at 09:34, <gmouse@google.com> wrote:
> >
> > From: "Anton D. Kachalov" <gmouse@google.com>
> >
> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > index bd1eb6ee380f..741c1fee8552 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> >                                 reg = <0x0080000 0x80000>;
> >                                 read-only;
> >                                 };
> > -                       envparam@100000 {
> > -                               label = "env-param";
> > +                       ubootenv@100000 {
> > +                               label = "u-boot-env";
> >                                 reg = <0x0100000 0x40000>;
> >                                 read-only;
> >                                 };
> > @@ -195,25 +195,13 @@ kernel@200000 {
> >                                 label = "kernel";
> >                                 reg = <0x0200000 0x400000>;
> >                                 };
> > -                       rootfs@600000 {
> > -                               label = "rootfs";
> > -                               reg = <0x0600000 0x700000>;
> > +                       rofs@780000 {
> > +                               label = "rofs";
> > +                               reg = <0x0780000 0x1680000>;
> >                                 };
> > -                       spare1@D00000 {
> > -                               label = "spare1";
> > -                               reg = <0x0D00000 0x200000>;
> > -                               };
> > -                       spare2@0F00000 {
> > -                               label = "spare2";
> > -                               reg = <0x0F00000 0x200000>;
> > -                               };
> > -                       spare3@1100000 {
> > -                               label = "spare3";
> > -                               reg = <0x1100000 0x200000>;
> > -                               };
> > -                       spare4@1300000 {
> > -                               label = "spare4";
> > -                               reg = <0x1300000 0x0>;
> > +                       rwfs@1e00000 {
> > +                               label = "rwfs";
> > +                               reg = <0x1e00000 0x200000>;
> >                         };
> >                 };
> >         };
> > --
> > 2.30.0.478.g8a0d178c01-goog
> >
