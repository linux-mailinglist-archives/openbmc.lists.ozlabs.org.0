Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EA650B4D
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 13:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbJfp1ND2z3c73
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 23:19:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UkeSJy17;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UkeSJy17;
	dkim-atps=neutral
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbJdr4Zcnz3c7d
	for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 23:18:39 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id c26so2026364uak.5
        for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvLnmu4Wq8jjqUUGJ/Mh5PFJXWDf0nAdtM6JdYMI7IU=;
        b=UkeSJy17prYpZznPUkfkZ6vitltPqv/vkSPQAc8jUKhELnuYIlrCWeNqjwfscstCMM
         Xpwd0/+MFN16pkQ623U24NKZdrv+/iBaKhhG103g2iUbI7v8Mgsgs0tOBZ3k2qfR59DQ
         woEWK/LkIftDiLxjR7vIEJRjiQtsrROPuVaGdWXDPdcb7xRFvctRVWq67/cYwzRICso4
         QkrSCctqIn5k0LGtb7c53c9dvFgbmVAqvosfcu7J0Lx1TGSjzowx3aNdWRZZWONhm9Bs
         QdVDsgP7Ntkw1mdJbDc5KER0cBo+ShJk5oqtpdqDIlTVJKxGIb75V6pf1N1yNIMJyLM+
         iuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvLnmu4Wq8jjqUUGJ/Mh5PFJXWDf0nAdtM6JdYMI7IU=;
        b=jvnb6sDPDmgoYfyge5nO+1j6QJfgjcvFT6iUbMxGlKRBVCH1RM+DHlhNJn72bIw47N
         itAPsUkhp0u/2Vn/tkDoj4VnwFFr0fH7UE2KcJo2pyi9crHyOI3xTCJDHuqyttWa2buY
         C8K6EAFavBTdN9t9onmTUfXXqhvo3+D5HG5WlAgRSRj916SmxkS5GgNKfKPHYWblNCMo
         EEqbmFzRXMJW1Fsj3Ir+8U1kzI+9MhY6+CTw/ttUFRyBWsvTWf52RaO4UtTZlK1Sp7cG
         GGAT3xOz7sb3s960kLzgXzFUSeLL0zr9E8SGt8XAefl3ybhzQLnTGPduoYHeen2Fdw/W
         THBg==
X-Gm-Message-State: ANoB5pn7KOffrKVzQiE68dfxqNvGkfv0AI/HvdsEvsvYIymzDzVuF914
	k4Wya0ZE/nwqbUWX/x+G5Zo6fw9Y65Wn37m6080=
X-Google-Smtp-Source: AA0mqf6nPovE1C1F5nKtDRiSxN9ZxHW96bV9sRtMh92ObF0Wj6j/kYZTZ8GwxdeFNjnyhJRKl4rgO3vbKrWzAbdtNQg=
X-Received: by 2002:a9f:23ca:0:b0:3d7:3610:45fc with SMTP id
 68-20020a9f23ca000000b003d7361045fcmr52992500uao.120.1671452316259; Mon, 19
 Dec 2022 04:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20221216073141.3289309-1-milkfafa@gmail.com> <20221216073141.3289309-3-milkfafa@gmail.com>
 <525fd984-0b67-8e11-d13c-7c4ee1853c4e@linaro.org> <22a055a9-a14b-e8b7-84e2-b091a05a3ba4@linaro.org>
In-Reply-To: <22a055a9-a14b-e8b7-84e2-b091a05a3ba4@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 19 Dec 2022 20:18:25 +0800
Message-ID: <CADnNmFrvDWg6kK==Yje_RrOO=V-DBJiBhtOF84yC-aKvwBQrQA@mail.gmail.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: edac: nuvoton: Add document for NPCM
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, bp@alien8.de, ctcchien@nuvoton.com, james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for the review.

> > So this is a 16th version but through this entire year you never Cced
> > the maintainers... You did not send a single version to the memory
> > controller maintainers.
> >
> > I don't know why it is so big problem to use scripts/get_maintainers.pl.
>
> Although maybe the reason for this is that it was being put in edac
> directory... eh...

I should check the CC list for each version anyway. I'm sorry about that.

> > +++ b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
>
> filename based on compatibles, so nuvoton,npcm-memory-controller.yaml

> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
>
> No blank lines.

> > +    ahb {
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
>
> Why do you need this node in the example?

These problems will be addressed in next patch. Thank you.

Regards,
Marvin
