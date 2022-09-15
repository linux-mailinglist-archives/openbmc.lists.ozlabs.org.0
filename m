Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2605BA35A
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 01:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTDLZ5Q26z3bxt
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 09:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VeguLffC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VeguLffC;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSjY767s6z30DP
	for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 13:36:25 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id cj27so525215qtb.7
        for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uJffsqDRUOivPZiC/tl2/T1Mr1z4G0FCt64C8blLYZ4=;
        b=VeguLffCxfpspTiwdtq9UYKbMufW723noBqlOXGYv9kyyzX90xkv2vzm2I2PEPmJJO
         boAIMekRhBXHBG5vAF/QLtA3W9Gp+22wTwqels+K66SvO1fO9YieGqy6CVxr4Fk7F4BS
         KUTeULswMGfGvshWz45/zc8Jep/TmSo97GyH7V948bwu4qDtkN+ZeXR6U8urNPdbxjUm
         NbnwEFcxITV8IL1wfCvKNK4GRkZIq5quF3ntXhlP4AwfwWuZ4/6wejY4RmLfL2G1YoKZ
         rHKCYKu4YydlyPA348LQYnDMLm9Hjo4u//s0ftLmErPMSbCdVE8mY8bsou+HyL8nY4Rr
         +xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uJffsqDRUOivPZiC/tl2/T1Mr1z4G0FCt64C8blLYZ4=;
        b=p7LLymmAN0OPtPuuvoxGCTN6Pj2x64VsIOdWezm/fCTwwfz8YDUqzMoNVkjoY/bKFs
         5ORNfNSwwutjaosyrBNWwgomg7vxyiqBkSSCSnGpt1ntiRyJUs+ASVXYhB8pgo3sO/E8
         g0ib97dsY5u5gG9SHykp7G6XDW/QDlXv5wOfZUjnhgYZ29jIXb58G3yR7VXeckvST38p
         3BnBQvjEFwx4Is3O7xUSuPyfNMXbXwk9kgYQKvxyJ5W9UAdQCOgne5wq+3dKkjcvD7bA
         6AEjYClKYQAucWQE+na9kYz/LjFl4JEi0jVFqNDRNQAxGCA7GOLQ1FLTpMlmrbp6RNKu
         gvEA==
X-Gm-Message-State: ACgBeo1iNu9oLEfs74w2I1xOVRxFV3LbxyekZz4FiuQKG40vFBEJshZK
	mqBRgX0DudmbhZyeSPDTlgfk2uNicLTIaX4S5iM=
X-Google-Smtp-Source: AA6agR4c8u6CA4VfIRaIl+yIQVBvxQDaeXAQN44DFOYuEyXUnfD+E++zb5w5jiIL9rOauuVd+M9PPulwORz+2O5YzXE=
X-Received: by 2002:a05:622a:164e:b0:35b:a852:52ca with SMTP id
 y14-20020a05622a164e00b0035ba85252camr21445333qtj.2.1663212980577; Wed, 14
 Sep 2022 20:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220311060936.10663-1-JJLIU0@nuvoton.com> <20220311060936.10663-2-JJLIU0@nuvoton.com>
 <3f77c8c8-4bba-007b-fae9-5fb47f44719c@canonical.com>
In-Reply-To: <3f77c8c8-4bba-007b-fae9-5fb47f44719c@canonical.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Thu, 15 Sep 2022 11:36:09 +0800
Message-ID: <CAKUZ0+HLAxLw8Tio1HZt8TkYag_UGuDktjNbORwPzfRRrEJ0jQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dts: add Nuvoton sgpio feature
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Sep 2022 09:43:48 +1000
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
Cc: KWLIU@nuvoton.com, tmaimon77@gmail.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, CTCCHIEN@nuvoton.com, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof Kozlowski

Thanks for your review.
I am modifying this driver now, and i have some questions.

what's mean "Generic node name." ?
Nuvoton NPCM750 SGPIO module is base on serial to parallel IC (HC595)
and parallel to serial IC (HC165).
and dts node name is followed aspeed dts node name.

Could you give more information??

Best regards,
Jim

On Fri, Mar 11, 2022 at 5:18 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 11/03/2022 07:09, jimliu2 wrote:
> > add Nuvoton sgpio feature
> >
> > Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> > index 3696980a3da1..58f4b463c745 100644
> > --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> > @@ -329,6 +329,36 @@
> >                               status = "disabled";
> >                       };
> >
> > +                     sgpio1: sgpio@101000 {
>
> Generic node name.
>
> > +                             clocks = <&clk NPCM7XX_CLK_APB3>;
> > +                             compatible = "nuvoton,npcm750-sgpio";
> > +                             interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&iox1_pins>;
> > +                             bus-frequency = <16000000>;
> > +                             nin_gpios = <64>;
> > +                             nout_gpios = <64>;
> > +                             reg = <0x101000 0x200>;
>
> In each node first goes compatible, then reg.
>
> Best regards,
> Krzysztof
