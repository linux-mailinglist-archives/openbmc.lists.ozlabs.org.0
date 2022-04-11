Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CEF4FB58E
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 10:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcLt21X4Sz3bXq
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:02:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cQkZQcy+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cQkZQcy+; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcLsg1vBwz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 18:01:41 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id z17so618993lfj.11
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dLagX0bznMYseBWYG2xpKUjyrFUW3pN56bkzoSU2tp0=;
 b=cQkZQcy+MHkSXUoI9MDT/c+0IGaIn27ea7X86YOuBUMNrKg83hntaExUO3lD9XId0p
 ly/XPa0D6U2DoNOg3j+gf5pkBCLsW1zW6vvL9c8PjlYdJ4tyQJAvIubVqSEIp2QNQDTF
 5KoGJm0ZiXPohruC2B0c+94CQJV+X/C0xpl70Pt2ejLEWPG4heCAQmGwSfty2je2uFB/
 QkEmv6M2fi3TlglcnxdMYhJ92xTA9jxJ29wn+Kcd4yqcD8Ahhj8ggyKnlkPN3+W4CzsT
 LLhA9bxZEx35GUYJtOOVp5N8aR9yyQu7Eu27bjFvWXgpYATBUszDzcYc1kZ1fnSrmOeO
 TEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dLagX0bznMYseBWYG2xpKUjyrFUW3pN56bkzoSU2tp0=;
 b=NflP0ARVex+33DNGJqAGggauYqYKEvyGIgR2ytxKWwxjxJpeCWqjdUZtfKCecnC6/8
 T/VatTtzQYvYeAVJ7wWRXRMypqrKQaw3Cvnl3dbkDnkTHCWEG617vQV45OZflCYH7LSa
 gwtVK4gAkc3hCA4Eg0iYy2fBFr39WNkDJ2scrj6fZpiAyDZeiOAlaJ4lsYPiZtp4XmKa
 46fErpW3YPIP8YzwENVwSCnwV1JF9OZJKazoE3nL2S1UYjQWXLkDbwaNsktzwOMlInpz
 5WnDQp9uf+ZBuVnkaOfTVOzKUBeP/qDmXHN62stxhD/gFpDpZouvz8L0JuHE9UYoRQbQ
 5SGA==
X-Gm-Message-State: AOAM532v5oojCqpo3We2AcgpzFFAzsIp1nsv60wqBOrd1lPuNhsz7eN4
 ZL9TPsKL2JIQpV3VUGiINYU4MB7SKNrcOTo4vxo=
X-Google-Smtp-Source: ABdhPJxgJUUuROZgRKb0LEDLbuJHGqQUY3ojRGDjYwhHu2TK5fuKy2HxIiB6oeFUznuhvW81hNnfqmy8On1RUDGf9mE=
X-Received: by 2002:a05:6512:262a:b0:45d:b42d:3e46 with SMTP id
 bt42-20020a056512262a00b0045db42d3e46mr20444462lfb.22.1649664096793; Mon, 11
 Apr 2022 01:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-3-ctcchien@nuvoton.com>
 <9cf20395-369a-2738-608d-dd5f1aabe48b@molgen.mpg.de>
In-Reply-To: <9cf20395-369a-2738-608d-dd5f1aabe48b@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 11 Apr 2022 16:01:25 +0800
Message-ID: <CAHpyw9fByk_pyD3pb0MX=p_t1AuD5qXKaECKwrB0uog6ZxX5qw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

thanks for your comments

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Thank you for your patch.
>
> Am 22.03.22 um 04:01 schrieb Medad CChien:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM memory controller.
>
> Please use present tense, and spell *devicetree* without a space. The
> line below even fits in 75 characters:
>
> Document devicetree bindings for the Nuvoton BMC NPCM memory controller.

OK


>
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >   .../edac/nuvoton,npcm-memory-controller.yaml  | 62 ++++++++++++++++++=
+
> >   1 file changed, 62 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npc=
m-memory-controller.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory=
-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memo=
ry-controller.yaml
> > new file mode 100644
> > index 000000000000..97469294f4ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-contro=
ller.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM Memory Controller
> > +
> > +maintainers:
> > +  - Medad CChien <ctcchien@nuvoton.com>
> > +
> > +description: |
> > +  The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
> > +  correction check).
> > +
> > +  The memory controller supports single bit error correction, double b=
it
> > +  error detection (in-line ECC in which a section (1/8th) of the
> > +  memory device used to store data is used for ECC storage).
>
> *memory* fits on the line above?

do you mean I should change the term "memory" to others?

>
> > +
> > +  Note, the bootloader must configure ECC mode for the memory controll=
er.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm845-memory-controller
> > +      - nuvoton,npcm750-memory-controller
>
> Sort the entries?

OK

>
>
> Kind regards,
>
> Paul
>
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    items:
> > +      - description: uncorrectable error interrupt
> > +      - description: correctable error interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - const: ue
> > +      - const: ce
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
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
