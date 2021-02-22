Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2253E321308
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 10:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkcK86lB8z3cLn
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 20:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=m9IJv5LU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=m9IJv5LU; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkcJx1N8qz30LN
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 20:27:10 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id g9so10201712ilc.3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hQLZEj9iN7V7Wa6Bf/Y6KrV0f8vrXo1b1Pd+1jqrTTY=;
 b=m9IJv5LUsBLiek3p4/0pXkCoDxek1CFJEIhFiAs9dS4NrAyPYJDpWdoZ8v73t06+u3
 Sj7KqGl8uu10Gl/C+inuFrTi0XWVzNTovOUG0gZRxiaqLiwjTn/qSJl/lRWq18ggfyQe
 piZONMWqCkfHQOEG/tLO9mH/tL+n2o3kmoyLmdnBGUSL9drUtHTC438bAYt35/eSP5NA
 lMpI5eH4hiAR8CZ0qsAk0LTwRgXUQxok2hMxWv7rKM8WqxWD83g73roCDx07/iygGXQq
 S+o2ain0CMtQXNrj7IjEfuyqiIcXFYyKO7GvxaRYnfYHkNGk4wDD0BDuIxymwom7HS4i
 8lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQLZEj9iN7V7Wa6Bf/Y6KrV0f8vrXo1b1Pd+1jqrTTY=;
 b=Rt/CSzX3tUFXJnbF5QiZfH0jInK6+gb9FlUlBk1bU7U239LM04xgJAcJicLmugkY1Y
 NyMLw3tA1/8VOPYegJiHeZlJcohIgFdr7nEPS5QSoM1kJkQODXzRKd0ovzDrqNbBn5IX
 EHYzxqlLi2YTWclcsJSuuyly5RYn5OKgOdtPuSBw6KTiGKulCEo90EoJZBqjQ5ivTpoy
 CHRllVlsUy0Rj2TnEYo3kzy6NmyrgOI6ce43z1Pb4vmL73FBcjql/LNp4dY0hQXTBLbk
 6wD/QgyMhojG2MN7sTZX7Mb85fSqKW1a2OEnIbaoRJHXcoygU5mimcr18DZgppDYWHzT
 rwpg==
X-Gm-Message-State: AOAM530tw4gt9w0PKP4BO3WRVeSGozKJpLbb/SVR1tYUBDxHvIAU1NT0
 7VUu2KjosJdp8z3BsaZli9/xZ1gqBAgxFKH/ZFODhQ==
X-Google-Smtp-Source: ABdhPJzs2A/nEMFlFND/SeVe0D5DWStliCbQoJqwBN9p7Oh1CHppoRpTveljZF82RVoV9hd+QrKyEkDwDVqGpAf5PxQ=
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id
 i12mr14452264ilv.200.1613986024863; 
 Mon, 22 Feb 2021 01:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Mon, 22 Feb 2021 10:26:53 +0100
Message-ID: <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Tomer Maimon <tmaimon77@gmail.com>
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
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, Tom.

Yes, I'm using it for testing on real hardware.

BTW. Recent u-boot doesn't work with SD cards. The card doesn't
detect. The last working version was this one:

https://github.com/Nuvoton-Israel/nuvoton-info/tree/master/npcm7xx-poleg/evaluation-board/sw_deliverables/npcm7xx_v2.3

However, u-boot from igps repo:

https://github.com/Nuvoton-Israel/igps/tree/master/ImageGeneration/versions

Has issues too. It doesn't allow me to read more than 4k bytes once at
a time. Thus, to flash the stuff I have manually read chunks from the
SD-card: fat load doesn't work at all and I write that data in raw
partition.

On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Benjamin and Anton,
>
> Sorry for the late reply,
>
> The EVB FIU0-CS0 partitioning is used for testing the EVB and this is why it is different than the OpenBMC flash layout.
>
>
>
> Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to modify the flash partition to OpenBMC use.
>
>
> On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com> wrote:
>>
>> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
>> >
>> > From: "Anton D. Kachalov" <gmouse@google.com>
>> >
>> > This change satisfy OpenBMC requirements for flash layout.
>> >
>> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>> > ---
>> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>> >  1 file changed, 8 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > index bd1eb6ee380f..741c1fee8552 100644
>> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
>> >                                 reg = <0x0080000 0x80000>;
>> >                                 read-only;
>> >                                 };
>> > -                       envparam@100000 {
>> > -                               label = "env-param";
>> > +                       ubootenv@100000 {
>> > +                               label = "u-boot-env";
>> >                                 reg = <0x0100000 0x40000>;
>> >                                 read-only;
>> >                                 };
>> > @@ -195,25 +195,13 @@ kernel@200000 {
>> >                                 label = "kernel";
>> >                                 reg = <0x0200000 0x400000>;
>> >                                 };
>> > -                       rootfs@600000 {
>> > -                               label = "rootfs";
>> > -                               reg = <0x0600000 0x700000>;
>> > +                       rofs@780000 {
>> > +                               label = "rofs";
>> > +                               reg = <0x0780000 0x1680000>;
>> >                                 };
>> > -                       spare1@D00000 {
>> > -                               label = "spare1";
>> > -                               reg = <0x0D00000 0x200000>;
>> > -                               };
>> > -                       spare2@0F00000 {
>> > -                               label = "spare2";
>> > -                               reg = <0x0F00000 0x200000>;
>> > -                               };
>> > -                       spare3@1100000 {
>> > -                               label = "spare3";
>> > -                               reg = <0x1100000 0x200000>;
>> > -                               };
>> > -                       spare4@1300000 {
>> > -                               label = "spare4";
>> > -                               reg = <0x1300000 0x0>;
>> > +                       rwfs@1e00000 {
>> > +                               label = "rwfs";
>> > +                               reg = <0x1e00000 0x200000>;
>> >                         };
>>
>> I recommend just including the openbmc-flash-layout.dtsi file here
>> instead since that contains the common flash layout for most OpenBMC
>> systems.
>>
> Good solution,
> Do you mean nuvoton-openbmc-flash-layout?
>>
>> >                 };
>> >         };
>> > --
>> > 2.30.0.478.g8a0d178c01-goog
>> >
>
>
> Thanks,
>
> Tomer
