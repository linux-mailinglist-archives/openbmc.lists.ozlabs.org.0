Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F395AA7EB
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 08:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJnkX2HXvz303T
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 16:17:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gXbBJGQn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gXbBJGQn;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJnk50ts9z2xHl
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 16:16:43 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id m1so1329084edb.7
        for <openbmc@lists.ozlabs.org>; Thu, 01 Sep 2022 23:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aiWzycCBoIbbruOADleMkCk4b+tj8c7FcfdTIbVcXyE=;
        b=gXbBJGQnKr/0+Kwbk9Pv0NByprxnRUodstMYhyuMmyfTySZ8jRGcj5PRr2i4XmkRp2
         zRvLX6RNK3bu5TBdptCrAyNdHut4CYD5JxU0MCSxH5hkm5gq6707jKq1Z4B+7/9P1hcM
         iFsuH8Prp9lnC9DLLfotwX+jNTbmQuxjIW1KgXKVWpSLCPO0VoXbDCeipJY8JZJRBpgv
         hxtdYXQZQYxqQePUWnikGSEcD2ZRp9XSSJjjVEO8IBtw5L/7YqlXmNDWYxXLh7Eq28uE
         r/RwwG9BDzWVv5S6UY9utfHi8h3fWXMLISU2EW3kYL864OQsTg5s7wBQPG//hInEEKkT
         BnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aiWzycCBoIbbruOADleMkCk4b+tj8c7FcfdTIbVcXyE=;
        b=xPmDUL1eu4EjY1kn5bqR6MjwAXlcjecqDpOXEEzr9JT7zcbQFxYyME5WLRuCBpJjfR
         jmFv0EnHGPkXfcVMescbiTtDtwZrrWo42qQhr/ZNnRysAuXvinSqMihEToB82IfqTRpX
         nIniX3Ua+WxuzZbQsMc/IPzMHEOxx9uW1qPWrYaxRLa8eXLZH8GN2VGkxxNXJRzrT5cL
         EW4WOKl1ouj02S/4m3f1qoQxHDAzcwphxOxMT05aOnrGBwAvSSZnHYa/9sCzQTVPEL+n
         evp6E8/yYE2bygAY1LyWoGCe1YBefb2V8qHLlCLXSoKpth0BujDK/Fdew8cDmensVtbE
         lQsw==
X-Gm-Message-State: ACgBeo0iJoPYzZ2RpWb2wOGbFYRIgZg0BDC9J5negLBPSb2E84ZC3/Xz
	c85QCKOZsKN/z8k+lz/zx6LvgaLV9M0Tb5yF16c=
X-Google-Smtp-Source: AA6agR7ffwCW0E/pGXEIeZCbLWCZa03s3qO/DMl52Zz0jW7ILT8w0hg410F8D96hAnOQk/HPn7gjJ3p/1TCpAEKoFPE=
X-Received: by 2002:a05:6402:1215:b0:448:1431:465e with SMTP id
 c21-20020a056402121500b004481431465emr24048836edw.395.1662099398839; Thu, 01
 Sep 2022 23:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220830022238.28379-1-milkfafa@gmail.com> <20220830022238.28379-3-milkfafa@gmail.com>
 <a3a93acc-434e-4a94-6ba6-6a71f2da8736@linaro.org>
In-Reply-To: <a3a93acc-434e-4a94-6ba6-6a71f2da8736@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 2 Sep 2022 14:16:27 +0800
Message-ID: <CADnNmFqpNxdHTY619MgnSxPbMHw9s9C71GOxKAphWf_xwDGnXw@mail.gmail.com>
Subject: Re: [PATCH v14 2/3] dt-bindings: edac: nuvoton: Add document for NPCM
 memory controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, CS20 KWLiu <KWLIU@nuvoton.com>, Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, devicetree <devicetree@vger.kernel.org>, YSCHU@nuvoton.com, rric@kernel.org, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac <linux-edac@vger.kernel.org>, tony.luck@intel.com, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KFTING <KFTING@nuvoton.com>, James Morse <james.morse@arm.com>, Marvin Lin <kflin@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> > +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
>
> This should be in memory-controllers directory.

> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM Memory Controller Device Tree Bindings
>
> s/Device Tree Bindings//

Thanks for the review. Next version will move YAML to
memory-controllers directory and remove "Device Tree Bindings".

Regards,
Marvin
