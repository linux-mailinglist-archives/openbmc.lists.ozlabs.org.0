Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE6580FF7
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 11:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsWrT0N62z3bw6
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 19:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l6SHg/J5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l6SHg/J5;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsWr54DQJz3bnT
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 19:31:15 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id z25so21870572lfr.2
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IL3Z4+bwdRS3yxOZTNpNZKdqvlk3APcJ7jcbsYJVSmk=;
        b=l6SHg/J5A0OUd8PSnS43zbEUAINghMLi0ClY87M7YZJOU1SRfY0cZpGXsr1ju7YAAk
         /DR22tO/5n9CPiQeYtI+j6BnoywwsnfcU5ICBFO2BJd/7QvwoKtUpsMqZ62BXuTSRnaK
         iX9My8uqm5wq3kROf9GWBFLp59n+0zotuzXO8qjqLLnd3VHsivnceSKRbNhfPUSGKCcG
         ywxKtTMFpsQz6+gSRsJRwZtdWALuA1QLRYtz+hiQqv69/mtTFr7ToR5loJxRq6vxaE8f
         bS0YfTZaK+bdlHfd8rXL5I1J2G4v63GuRjrWQr5tzwFWcMpnA1j8lBgOVVlHoPqqWshS
         gjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IL3Z4+bwdRS3yxOZTNpNZKdqvlk3APcJ7jcbsYJVSmk=;
        b=0qSbNI0KNzDoDRrpBdVe6Ddg6o9q3QUESCZmnlNf9p+mG5Tu/eo07Sgp8ZCab11Gvn
         14zwuRi9Ohko1qaKdNJIbbtyCQd8y52/Nz4+emHIeD734vLQfo6+meVd3ctCTX2g92v+
         Qo9wHocvBua93S+vScML+zuCrR6MEn2CgwP/qVDkurS0g/FDKaRA7EkyJ0NcqFypGbT8
         cPixUQevNB62I4yKte7IJfHiVNuBRnIwD5QnLVhoFa5kvJ2H0x5u7r7emF/l5e8hF94x
         fI+cArZUvYrWLbohshtTV6Ha+XfnJJb9AhsHn8gTiSC9t9dHtjkibx222tS27xuSqXDC
         WQzQ==
X-Gm-Message-State: AJIora+WQgu02sbwjblhPIJNjOiDl/OFNVndJokA4mKwA5ODRfPpQWNm
	C5ElqVk4eOQ6QlzdcObsrSIdWlV3i5XOSgDLrCI=
X-Google-Smtp-Source: AGRyM1uL6DT83C459zUSdYi1GQWszpd4iNJjtzhdOjGifSm4yOssdUqu+X+HBkYa0gNl/VFvJe/TlxbmoZl5MFHL4M0=
X-Received: by 2002:a05:6512:693:b0:48a:7c23:1896 with SMTP id
 t19-20020a056512069300b0048a7c231896mr6390732lfe.111.1658827869026; Tue, 26
 Jul 2022 02:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220722114136.251415-1-tmaimon77@gmail.com> <20220722114136.251415-2-tmaimon77@gmail.com>
 <20220725225650.GA2898332-robh@kernel.org>
In-Reply-To: <20220725225650.GA2898332-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 26 Jul 2022 12:30:57 +0300
Message-ID: <CAP6Zq1j0pKHsX20t4ep9-6B_5pTe5MzkU__245F6tW7wFJESiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: spi: npcm-pspi: Add npcm845 compatible
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comments.

On Tue, 26 Jul 2022 at 01:56, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jul 22, 2022 at 02:41:35PM +0300, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM845 PSPI.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> > index b98203ca656d..a4e72e52af59 100644
> > --- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> > +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> > @@ -3,7 +3,8 @@ Nuvoton NPCM Peripheral Serial Peripheral Interface(PSPI) controller driver
> >  Nuvoton NPCM7xx SOC support two PSPI channels.
> >
> >  Required properties:
> > - - compatible : "nuvoton,npcm750-pspi" for NPCM7XX BMC
> > + - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.
>
> Who/What is Polog? Board/BMC vendor? If so, that should not be in SoC
> bindings.
>
> > +                             "nuvoton,npcm845-pspi" for Arbel NPCM8XX.
>
> Same for Arbel.
Poleg and Arbel are the name of the BMC SoC, will be removed next version.
>
> To answer your question on fallback, just put:
>
>     "nuvoton,npcm845-pspi", "nuvoton,npcm750-pspi" for NPCM8XX BMC
In the document?
because I don't remember doing so in other documents that I use fallback.
I need to do it in ymal files as well?
>
>
> >   - #address-cells : should be 1. see spi-bus.txt
> >   - #size-cells : should be 0. see spi-bus.txt
> >   - specifies physical base address and size of the register.
> > --
> > 2.33.0
> >
> >

Best regards,

Tomer
