Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0163714A
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 04:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHkdf3dq1z3cV8
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 14:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lIZI1ea9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lIZI1ea9;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHkd437drz3cG9
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 14:53:58 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id l190so438646vsc.10
        for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 19:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ibvFTSt0J4VAYeyVXQ5CCnRzpDJ2HRj4/uCZvBQlKYQ=;
        b=lIZI1ea90GspCmSWdAPh4eOcPS1DxW9yRWLMR6G4iXgO83Lc/x0YffzED6mXMJXHfn
         In1uhGPB5V2aDlZT93f+y1YF7hCZQUjaRafTAALHO/yxInrl77Hkape1vuUGl3Nl/FlS
         ZqP+tR9NcNWC1iCoeyKstZltZ6G6g2hiP+0oSzn1RYrLo2K6PbsDw7hKoeEg4pl6BVDz
         pQEIDnK9lEGEXGNcvT8AJ9VuvVlcEvDSAQmUZ9sk0Uxykb0gbXkJtHy9RMQNFNVUgIdV
         CbIeCD7w6NabTK1ifrYDwgXr4/6r7CVS/sTC14EX0/11Sy5ibQnU+k2ZWsqBzviOk/HN
         XZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibvFTSt0J4VAYeyVXQ5CCnRzpDJ2HRj4/uCZvBQlKYQ=;
        b=2mCtVrHnzhNBucZzJdKFdKvle8ZYDv2AG4XIq2FrnewCJj8V+UfomBjV8SUdI0ATXE
         gpmrUhr2e745hWDyw46dhhHl+hcVW4E5CHfX76zIc+J6Gt8ofEhOuWDG+HgnViTAHLLY
         dBzYUItQu46yl2GDel32xt1pHZWAHUoS5AxWOypqWjglZupcIKaxkl3G1HUxPXWV/5z/
         gkI14eqZYw0wV4HN0QAj/p98yK+NUkLUG12GGBNk8CoWDVnguAIPJqQYRBSOT5RB+QYO
         PQIaAlN1HTbcT+oxQr+1NgnJK2HoVj24Sn+Dp8OZpi0CzZ6riAQkKWc2LlNR0HjzM5Tz
         PITA==
X-Gm-Message-State: ANoB5pkeVhK5YHG5hw8ahU4vqTogmgc9dogTKOxYCdiKBS2QtKEQmzkP
	gV+HgsaBBXHfBpF5tauTszMdpd3v0bej6TLYFB8=
X-Google-Smtp-Source: AA0mqf46Lbr7HB0RPmlqiRZNVfHotrGzS/F6SPn8v8oWlPmdEytMF+SJBhDHo89CVisCAK3HAM8etqwMVWS/sR+swbU=
X-Received: by 2002:a67:fe52:0:b0:3ad:c930:b9bb with SMTP id
 m18-20020a67fe52000000b003adc930b9bbmr8761570vsr.10.1669262035023; Wed, 23
 Nov 2022 19:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20221122085724.3245078-1-milkfafa@gmail.com> <20221122085724.3245078-4-milkfafa@gmail.com>
 <7561a0c3-c63b-a3f2-efeb-4bb0f4ad03e4@kernel.org>
In-Reply-To: <7561a0c3-c63b-a3f2-efeb-4bb0f4ad03e4@kernel.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 24 Nov 2022 11:53:44 +0800
Message-ID: <CADnNmFqswx3VEFBAxUPbznyct2L880H6i6LghF_tAzZ=wS5T8A@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.

Thanks for your kind reminder. I'll check for this again.

> > +description:
> > +  The Graphics Core Information (GFXI) are a block of registers in Nuvoton SoCs
> > +  that analyzes Graphics core behavior and provides inforomation in registers.
>
> typo: information
>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,npcm750-gfxi
> > +          - nuvoton,npcm845-gfxi
> > +      - const: syscon
> > +      - const: simple-mfd
>
> That's not simple-mfd, you do not have any devices.

These problems will be addressed in the next patch, thanks for the review.

Regards,
Marvin
