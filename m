Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED852C8F7
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 02:52:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3WYB6ygKz3c9R
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 10:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VPQenJuW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VPQenJuW; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3WXn5wcrz3bdg
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 10:52:23 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so6463039lfb.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 17:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5igVcgabfc3GpqR+MTampE2W7vmBRqD9HW7OXsIkAag=;
 b=VPQenJuW+OU2IPmWU2GFyZZVSj5wN32qJwvTtwmzGWsd2jWWlVg88/rrpXKyHvRjT3
 Ml/wXy3LfZVPOn3QHJM8giH/EE0Kc+AiGW8Ss5XWWMXCNxna9kEiB3mjPnXRKVCtDUku
 5UVHJx89alZ3m+0KkfExjcSlUaHVHzdfHlbdcfUJPgFAm/4j+53XqocxKIQWqb7BowTh
 AE2vtuJqHk/nH2oNR/basBq1ZU+ZbQ6sO1ZAjwPSzNcWHrJ+6HdNns6FWCo2x+J6+583
 KmnJIrbQrpksPKtbvmIaYPN2K6WKZhAciyRTbLo/Du99PBz0kvzJxxqUvvxu0IEAnMKa
 BiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5igVcgabfc3GpqR+MTampE2W7vmBRqD9HW7OXsIkAag=;
 b=XO+IW0NK3z4kDR6xD4oR4J5oTGAvtRV2+B9dALd9U46jyrSRSqWRCZpG4lmaDK0vcn
 wQZOvjFjkXherkGiqbxJ+OlYnQ25+E6JW9AcTGuPhIusYPpBXPbBm/FohE2Cdv+KJwIe
 OLRc8aBBVOJ4+HN+jIEcfCL7hNURMsKg5n+N1e2SNUw8f4Bop5rumAzOXsnTwPGh2Ljt
 WvM1jCIgRh6tLjZc+/zadvNM6BMz4JrQQoYriqB4FC8FMaMhcBRPJwJnZHQueHpokZ0b
 TANKOSOxctZ8QRE1La9PAASIXhlyBKV3zvLvI9H76NAUZfwLjAoctHfbSlVYsuXRcGSz
 LL7A==
X-Gm-Message-State: AOAM5317DFZFIQFBCNAWkua939IoxyRZR2sxtYZ7avoftSJ2HyYwQf2f
 UIDVaLFKYSyw8D5krvWwWZdbM0bEJtQigCMXMDo=
X-Google-Smtp-Source: ABdhPJzye9D8ZzBG1mW+oOdXc4HL1Ud/n9N+sNSiOtlLukstVs8BE5VN6OqqEqObbwvyuiEqu9nepwH/GRCVRJdO+nA=
X-Received: by 2002:ac2:43a1:0:b0:472:1de:bbdc with SMTP id
 t1-20020ac243a1000000b0047201debbdcmr1492978lfl.48.1652921535991; Wed, 18 May
 2022 17:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-3-ctcchien@nuvoton.com>
 <8d46eeb8-7926-f842-6105-1975a5adc3fe@molgen.mpg.de>
 <CAHpyw9cvrEKMUpRBWYWp9hDZgA8ALHBkNAQr6ZDqjj4uH-MRTQ@mail.gmail.com>
 <564c41fe-08cc-9c19-1506-c7b501458251@molgen.mpg.de>
In-Reply-To: <564c41fe-08cc-9c19-1506-c7b501458251@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 19 May 2022 08:52:04 +0800
Message-ID: <CAHpyw9dGfn8Q5zerjKDLWpVzcA6MmtfhOiJ_b7M1NLUFXDPMcA@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: edac: nuvoton: add NPCM memory
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

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Dear Medad,
>
>
> Am 16.05.22 um 04:30 schrieb Medad Young:
>
> > Paul Menzel =E6=96=BC 2022=E5=B9=B45=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=
=BA=8C =E4=B8=8B=E5=8D=882:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> >> Am 10.05.22 um 05:10 schrieb Medad CChien:
> >>> Document devicetree bindings for the Nuvoton BMC NPCM memory controll=
er.
> >>>
> >>> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>> ---
> >>>    .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++=
++++
> >>>    1 file changed, 61 insertions(+)
> >>>    create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,=
npcm-memory-controller.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memo=
ry-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-me=
mory-controller.yaml
> >>> new file mode 100644
> >>> index 000000000000..6f37211796a3
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-cont=
roller.yaml
> >>> @@ -0,0 +1,61 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controll=
er.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Nuvoton NPCM Memory Controller
> >>> +
> >>> +maintainers:
> >>> +  - Medad CChien <ctcchien@nuvoton.com>
> >>
> >> Just a side note, that in my experience functional like
> >> <linux-npcm-memory-controller@nuvoton.com> instead of personal address=
es
> >> are useful, as you can configure on your side, who to deliver messages
> >> to. For example, if you are on sick leave or vacation, you just
> >> configure to deliver the message to a colleague of yours (or they get
> >> messages in the first place anyway).
> >>
> >> Maybe you can bring that up at Nuvoton.
> >
> > I understand, but we do not have group email  address.
> > so maybe I should add more maintainers?
>
> If there are actually more maintainers, responsible and knowledgeable
> for that driver, than yes, these should be added (until you get a
> function address set up).
>

OK, thanks

>
> Kind regards,
>
> Paul

B.R.
Medad
