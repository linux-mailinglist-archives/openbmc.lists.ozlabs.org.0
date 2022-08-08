Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205E58C368
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 08:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1RRP3DJjz3bbj
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 16:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4vcOZhf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4vcOZhf;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1RQz1QfGz2xZB
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 16:40:26 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id dc19so14727422ejb.12
        for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2022 23:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=4PB9dWeFFs7okMUHgyH7NuITCUpW/nF++sHaYJTEdl0=;
        b=I4vcOZhf0FsVzp3vJ8zDM6UWJfW9Tq9wbl8HCoVEOgvMh41kFHaIOLkNLtsyN//FoD
         bKS8ABO9PE78sVCKfMY9B3tCnz3KsWdeWalgquPtkPoWSzWX5fKLpscMP4VW0mGSLX2z
         avXoOSZSBooxU5zEZAOE+HrqnHxc8vm7n+as4tdoP/EpQji70Q4M+cJDeOIGvaV7nA48
         FSWFhz6dV2JRuAMcTDkybMR4WSkv98o2oraOemRy4R7juFcX+AzA/k12VxyURlNTWRuS
         Up65jsWKjxNQb9qAsfYzDbxnGICm1UYMVmXs1IUQ5MaGDSmdaBrMZ+7+58YG8PkySp+f
         UGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=4PB9dWeFFs7okMUHgyH7NuITCUpW/nF++sHaYJTEdl0=;
        b=i2jEb5dRhSpstbogiqvaklBFaJn+2s2AbZxh5mm80avWmIhDcaGW+wBuSf44coR/Aw
         pRO6TdINxHT36qSHqe/kPOzYDsWgxX44Ms0tiieqhesL/yxdWgANQu8OHz6FY9xviKEX
         xahAb8439UZEb2ZMcI50eFYcXWZpvhfnwjJyyXEwmwYoNc/9l4zm+ut+7zzGzitocW46
         CCkrjeVCNHm4gGXYrUFVSsd1NCWrhbJDIAlleRLIL+wFtPEKLZuZggD8UYvrjPzHTQE6
         +VKK6ZpJZkyUNGcBHJUgwq6T2V1oMpsNiMDOwkqXfIKWJKOjwZcvmFZGb3QQud9uomyh
         eV3g==
X-Gm-Message-State: ACgBeo2Rz1jE7vm/B4MrKRN9aCZWG/KiYJ3VP3X1YG0ZIDmJBL2D3UWL
	f+9ctfJJdy3GvaXL28A28N3w44ejQLGMLeFY8ww=
X-Google-Smtp-Source: AA6agR6y6giseEiiXpJKKy0/mCQgNYSFlwjFaxmFRHZe5VLTgiCCnUWW4JFzu/n0UJgvLBjkJfKFwM4QjR+FStuH5Ok=
X-Received: by 2002:a17:907:2815:b0:730:9ec7:9fa1 with SMTP id
 eb21-20020a170907281500b007309ec79fa1mr12343365ejc.567.1659940821469; Sun, 07
 Aug 2022 23:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084340.2268-1-ctcchien@nuvoton.com> <20220610084340.2268-2-ctcchien@nuvoton.com>
 <YrCi1fg+mUPwZ7sX@zn.tnic>
In-Reply-To: <YrCi1fg+mUPwZ7sX@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 8 Aug 2022 14:40:10 +0800
Message-ID: <CAHpyw9dkE65vUiyG-=gvQHGCZ-=nm1AX2EwANGPDAJmfn7sZkQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: edac: nuvoton: add NPCM memory controller
To: Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org, Benjamin Fair <benjaminfair@google.com>, linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, milkfafa@gmail.com, YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Borislav,

Thanks for your comments.
I add milkfafa@gmail.com into this mail thread,
and he is going to follow up this EDAC driver.
He will be in charge of maintaining this driver.
thanks

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B46=E6=9C=8821=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A812:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jun 10, 2022 at 04:43:38PM +0800, medadyoung@gmail.com wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4383949ff654..7f832e6ed4e5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2367,12 +2367,14 @@ L:    openbmc@lists.ozlabs.org (moderated for n=
on-subscribers)
> >  S:   Supported
> >  F:   Documentation/devicetree/bindings/*/*/*npcm*
> >  F:   Documentation/devicetree/bindings/*/*npcm*
> > +F:   Documentation/devicetree/bindings/*/npcm-memory-controller.yaml
> >  F:   arch/arm/boot/dts/nuvoton-npcm*
> >  F:   arch/arm/mach-npcm/
> >  F:   drivers/*/*npcm*
> >  F:   drivers/*/*/*npcm*
> >  F:   include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> >
> > +
>
> That looks like it went in when committing. You can remove it in case
> you have to resend v13.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

B.R.
Medad
