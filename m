Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29664E763
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 07:48:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYKRk24dSz3bb6
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 17:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aX+2wM9q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aX+2wM9q;
	dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYKR96b4nz2xlF
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 17:47:33 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id k11so1454783vsr.4
        for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 22:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=txLtQDvzTpy5ap+f5S1nqMLqOhcer94Y5wQ0WtwOPcA=;
        b=aX+2wM9qNl8cgOihVMVDxoi/JUNSm+jjxtY3aRcpQK2IGUcfkb1fw+TYCfI1PCdknU
         G/J+VsW8T2CsBzfpO9AVUHn19PHHjZ6wCU/Jm+dGw0MxwQcZCYej5yS8IemHMrP7iXxP
         CDCWbh1FWMNj+bhGix4v0PXWR5/Av+Feq2vyQdGSja3OHT9ja3N6pVNAAZEu3ZklQ8KE
         Q4Qul0GMb24/XZEb5ng/+1ojoUbjxPO05dQ8BmGyICVC5QSBonqYFUX2a18cXz2MJ7Gr
         BHhRgsUni2hSUsQiVY/iPt2M5NIGBHcwDMun7n8ZpR9a9RWrsioyphjxYISwEwlOO86d
         LRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txLtQDvzTpy5ap+f5S1nqMLqOhcer94Y5wQ0WtwOPcA=;
        b=Lo74cghuIdFpgOg862qJgQD6UZ3hVP9mCo9b0M3YCtmqgfsdz1vL0IQ1eu0O2v62gZ
         Bv3ZegrQSBbwK3cNZtYGCEaKiQSAHyZ4QrRpOJTOQzXM5M8OhqjkNp7505jeMi0HpSWD
         fSBhRyZdTkNW7TZzlCl2SW8uT9Y0v39QMv7GCCoLYMsNl7hKapyjJB0GhBsjRS6uoWn3
         8JzFxvR5NWH2b1VUwi6F82BXm7DTPRM4NEUH3GVOEuMaq4eU3BOSXChkz/dCsZG5s2Kk
         8r6nTA+Hlv53AFUIbD+9pagQlA3zNpRQkKRiJfUpiIBQSBNNfvIghVfXOtaRaidVNmGj
         Nc9g==
X-Gm-Message-State: ANoB5pn/sKHRtaBCyjdWzAezBBTkU0hLEQgT2fqJ5dSiYZzUce8V6AM+
	/W6mYu7iWwxnZ6ixdkcVtqBsYBliqOUUnOUXBmM=
X-Google-Smtp-Source: AA0mqf5Lxb04LUZqGw52cDrLLG0QVwDsfAEI0ScpPVmAEmKbL3q3P5lS5AGexica45gS2sX1dPMDDpONO6iB+KCxBHQ=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr53598501vss.64.1671173248564; Thu, 15
 Dec 2022 22:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20221214092636.810883-1-milkfafa@gmail.com> <20221214092636.810883-3-milkfafa@gmail.com>
 <7e67b2d1-394e-2353-df37-5ae3cac64b9c@linaro.org>
In-Reply-To: <7e67b2d1-394e-2353-df37-5ae3cac64b9c@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 16 Dec 2022 14:47:17 +0800
Message-ID: <CADnNmFptyu_kCdVeFbYUO0vEfLaSniSuz3UmJFiLfv3yF6Gvfw@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] media: dt-binding: nuvoton: Add bindings for NPCM
 VCD and ECE engine
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, benjaminfair@google.com, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for the review.

> > Add dt-binding document for Video Capture/Differentiation Engine (VCD)
> > and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
>
> Subject: drop second, redundant "bindings for".

OK.

> > +++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
>
> Drop blank line.

OK.

> > +    ece: ece@f0820000 {
>
> If this is video codec, then generic node name: "video-codec". "ece" is
> specific, not generic.

OK, will change to "ece: video-codec@f0820000".

> > +++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
>
> Drop blank line.

OK.

> > +  memory-region:
> > +    description:
> > +      CMA pool to use for buffers allocation instead of the default CMA pool.
>
> maxItems: 1

OK.

Regards,
Marvin
