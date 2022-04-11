Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C724FB572
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 09:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcLp05wHZz3bc4
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 17:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U0XUaMQ5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U0XUaMQ5; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcLnS1kyVz3bcn
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 17:58:03 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id o16so13160056ljp.3
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IMcasM2PXwFO3pPL8keGLKPAAlGEHPxLC32XHN34NLQ=;
 b=U0XUaMQ5tt4vKUweVNbljOWAJtiPEYBd5YlbplTVAuToU4xiavT1C7ARxnf1EBCCBH
 MnCHlB+ZkZ4JAj7CG2Tiq+1QdnUZ1NTVZykJlt4ODm9pni0CXwlVCm5LSiSAp/bHWbJb
 lgjQaPDDBcRYPYta5T4ctVgKgHPH3zMoA75HjCQGNvXkS4UFJxPS8BpyEXvhEsYWxxAx
 kZb82CUVQZmolyF8OzFEVGi+zJA/0afLmLRwjU49E2VfP8YNrL7555POqrnHeod7ep8b
 MNq6N0nC/7fhFg3KvgJ25aIiUqaLgzlE+J7Go3kwC+hJtJVRIuda9asI1ZEfjVqB28/a
 X1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IMcasM2PXwFO3pPL8keGLKPAAlGEHPxLC32XHN34NLQ=;
 b=5EyHd3q/KMvm24TlFSWxVUJWVjl4xlEuuzUBMdbZ0wEqhcQ6X3iXilPnNmfcVDcjrG
 TA8Nmvl+Go2j3sT/ZF5E6SLv91Kc8Id+byXcFkpywdrq8eGqcKq+VqejKaArDCi8V/r1
 N898Micp5xEtvUPNeDHBf5V54dT6k15BWoFsoHnno+40MYRj+q3iqCEIAjPQcFovrpq0
 8bhavPWdCj0Kj2MmDQPANNszzVzx/2cf7/U7TfP80owvnXDRd4kFuNcEupnhbDTp/K5F
 DzIQngJEOSjFSOI7UESwgwbPUjdL8TXj/8FXBUPQ40synNkyUTlg+4JDyDSIvG+M6FhZ
 A+nw==
X-Gm-Message-State: AOAM533zzW6M6orSZ7Fo0ckDJcHLw2h5wYXvY+9io03yqQclIw1BfTPy
 iunoINE0tOtYLtI8IRp34wmxQ4ABujO2WNXwKjA=
X-Google-Smtp-Source: ABdhPJyPAAdguzOq292jJl/qwqyh/fbTfn44rqQap5nOluCafw7d/O4zQ36Mqdux7bn5CWzO66s3VyAKwZ5+TQdv6jo=
X-Received: by 2002:a2e:9b18:0:b0:24b:61f3:7beb with SMTP id
 u24-20020a2e9b18000000b0024b61f37bebmr3100487lji.487.1649663879833; Mon, 11
 Apr 2022 00:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-3-ctcchien@nuvoton.com>
 <YlBrbV2rstunqrW6@zn.tnic>
In-Reply-To: <YlBrbV2rstunqrW6@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 11 Apr 2022 15:57:48 +0800
Message-ID: <CAHpyw9eR9tcg9TSXnecOgJJsxSm=B=FyqKV9kOXd9We=o+RjKA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

thanks for your comment
I will revise it

B.R.
Medad

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B44=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=881:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Mar 22, 2022 at 11:01:51AM +0800, Medad CChien wrote:
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    ahb {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +        mc: memory-controller@f0824000 {
> > +            compatible =3D "nuvoton,npcm750-memory-controller";
> > +            reg =3D <0x0 0xf0824000 0x0 0x1000>;
> > +            interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +        };
> > +    };
> > +
>
> .git/rebase-apply/patch:73: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
