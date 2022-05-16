Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55A0527BF2
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 04:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1jtS5V4qz3bym
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 12:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qy577rTs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qy577rTs; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1jt216qYz30QN
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 12:31:05 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id j4so23460737lfh.8
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4s0OSmePhoJXuHiuMzZo1VwoeuQdSeAInIYJXLS5OyM=;
 b=Qy577rTsVDyHwVUTciphWV+VNPU0RzZ4IdFO25T1sbgmjfn247DhYQoRqZJt/HbXFE
 Zj8Mey1O+VdqkZZ75zH8Bm+J1PAP5/RrBud4ThJBNncM/Z42o929WNGKYOG4/MBvN2Nh
 Q61UEZuPT1fm3yrTtQq9AQ+xgIQ39W8e1VCvdufdTFL0goCFzu7agfSiyJ3E/oqCjafc
 Kk3PfZmbdiRqxvJfdvQaqQbSqvsIwc7cN0QFJqfI+srg1oLQV55jCxiOeM8dyAKl8olC
 uwpBMzz7ZjXDprNlNz9GNVbpZF149gN4LpjWkkFxilg9y+WFyuiW58JfgXvtUl2ciLFw
 H08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4s0OSmePhoJXuHiuMzZo1VwoeuQdSeAInIYJXLS5OyM=;
 b=dtUnlPxDFVIRcjSlE799Qw7P+Z+oN51pMsHV9+CXs1Iv4BtKLPz7nb3vXHulrhrpeW
 LZS5Huy38hMKdfNHrLDx+FSUMSXcp/8VPC30i+yFcmmU4FgCcZ+2BrY7VUuhmv9SdLx2
 QbLMmLESDA9iVJslaAXrxC2xrpszExVPC2nFMJ7qgxlW/XTQxUr2SZjyYfhqOBhCGDTY
 mwttAAfwtlcf5AIvf4WRdIDtA5+GChUF0+y29QJaMHPntWKqEBkWB6mrpuZn8Y2iXr1H
 HrhdmBrHOnBGcbbq8GoZKn7tFsDVe1HxxF6iNugmCnt3odkRD4oVzwn4+8znKFNWv1gP
 aMWQ==
X-Gm-Message-State: AOAM532Y0POhJ8oWF5c1P6aj2GtAtkcq5sNebf3XPS3zCSo9sL+/x5N6
 q83YqXDb0bi4hPR5XR7qYgpmtTGJKm6sOqhZuAc=
X-Google-Smtp-Source: ABdhPJxZq6+lnoKQQOPMomvc/GGVcnlfK80rcb3L0qena45Z2EZ6GSg202Ym+IGA0gz340U5CzyhYcNIOBuICW8aYzY=
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id
 z3-20020a0565120c0300b0044779127e6bmr11291271lfu.508.1652668259368; Sun, 15
 May 2022 19:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-3-ctcchien@nuvoton.com>
 <8d46eeb8-7926-f842-6105-1975a5adc3fe@molgen.mpg.de>
In-Reply-To: <8d46eeb8-7926-f842-6105-1975a5adc3fe@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 16 May 2022 10:30:48 +0800
Message-ID: <CAHpyw9cvrEKMUpRBWYWp9hDZgA8ALHBkNAQr6ZDqjj4uH-MRTQ@mail.gmail.com>
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

thanks for your comment.

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Thank you for your patch.
>
> Am 10.05.22 um 05:10 schrieb Medad CChien:
> > Document devicetree bindings for the Nuvoton BMC NPCM memory controller=
.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >   .../edac/nuvoton,npcm-memory-controller.yaml  | 61 ++++++++++++++++++=
+
> >   1 file changed, 61 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npc=
m-memory-controller.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory=
-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memo=
ry-controller.yaml
> > new file mode 100644
> > index 000000000000..6f37211796a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-contro=
ller.yaml
> > @@ -0,0 +1,61 @@
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
>
> Just a side note, that in my experience functional like
> <linux-npcm-memory-controller@nuvoton.com> instead of personal addresses
> are useful, as you can configure on your side, who to deliver messages
> to. For example, if you are on sick leave or vacation, you just
> configure to deliver the message to a colleague of yours (or they get
> messages in the first place anyway).
>
> Maybe you can bring that up at Nuvoton.
>

I understand, but we do not have group email  address.
so maybe I should add more maintainers?

> [=E2=80=A6]
>
>
> Kind regards,
>
> Paul

B.R.
Medad
