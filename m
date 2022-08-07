Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF7B58BA20
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 09:52:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0s4R5P8hz3053
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 17:52:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XGMyyc5W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XGMyyc5W;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0s434qj1z2xjl
	for <openbmc@lists.ozlabs.org>; Sun,  7 Aug 2022 17:52:02 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id v2so149514lfi.6
        for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2022 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dJ6lR10UqT/svxgk5HLkzmMbK4zBIcx20Yej7ar36t8=;
        b=XGMyyc5WU146GHv0QrCf1AOo0rhlUQXkxD5+jlAka0Bl8ngJ94avjqdprGhCdYBQty
         X4KVU0dP4rvH57xfRRxOQY3zGO9bsi+etLPvDmEL4tXXGTVRJZ0Fswh/dSdRMzqs3/GG
         JBylky7KzNCyMi1ZOHFlVVFWKBwMq183rp9iWKLiHRJsezL89FRtEpXNhaSEBK+lrXZv
         mTe2OjnX8x7qQ8olcn2Mo+BWzcQJiQWY0IQFedy9t0dF44zN5oQ19aBZhmYPVZ3wGRjE
         GfcN4Of7upv2NgEC2wSF0tC912tAGHTKW4BRue6Aecbj5OC46OhxoIJQViLQNs8gnp6o
         SoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dJ6lR10UqT/svxgk5HLkzmMbK4zBIcx20Yej7ar36t8=;
        b=ifV7C1O7xrMdWaBKBopfwxJ4tL7XNgEwWoCLCZguRXRIfF2xVWJi3v5mxuJ9leYhEx
         /76r5jmXj7dDPA24V47qnShxZSZk9qn7XdifIrQc9Lt5n+8QRErejylPRfSnyCEutMWi
         I0gkTdG7oJR71fqA4XO47T3S/KMkCz67W8E0LfMLGRNszuNIQhIxHiFnAXVNl1FRwziS
         mW9OIIC92VmTZNNErnQEqUevaZnj0KKMQ5vo0rWAR2ZenKTjCQm3+YynaDOBjH0kK7pR
         p0Lv+hKGM36jHsA8TSvp0X+kVal+ZJ/ki4rf6RsvdoR6AjiXbOFcX6SSxlAJDo7jx7QG
         3qdg==
X-Gm-Message-State: ACgBeo3ioGsNbdm7EQbSCzhbQYI5JcqwIy/z5wWYmklV2ztEk1q9MTSh
	II39FSx8hUB99VML+qPOOHpKFaRPUuy2Zt2tNP0=
X-Google-Smtp-Source: AA6agR4V/VrijA2jOsVzxZ7/8/SHHrOYwWX5/nci78brP/zjC9MoIstaGIPRY80wqK73i0+0xJA+/s0BVB0qXfOMxlI=
X-Received: by 2002:a19:6d0d:0:b0:48a:8b3c:e28 with SMTP id
 i13-20020a196d0d000000b0048a8b3c0e28mr4190351lfc.265.1659858716318; Sun, 07
 Aug 2022 00:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220804181800.235368-1-tmaimon77@gmail.com> <10e93907-49ef-a3e6-e0b4-0b3e5f236f44@linaro.org>
In-Reply-To: <10e93907-49ef-a3e6-e0b4-0b3e5f236f44@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 7 Aug 2022 10:51:45 +0300
Message-ID: <CAP6Zq1ju4=PSiCuDaCi2NQTniaXBwmv5Qn6LoLayGmiayDCvYg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, minyard@acm.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your review.

On Fri, 5 Aug 2022 at 09:36, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 04/08/2022 20:18, Tomer Maimon wrote:
> > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> > string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Your previous commit adding that compatible was simply wrong and not
> matching the driver and it is not the first time. I think all Nuvoton
> patches need much more careful review :(
Will do and sorry about all the mess...
>
> You forgot the fixes tag:
>
> Fixes: 84261749e58a ("dt-bindings: ipmi: Add npcm845 compatible")
Will add the tag next version.
>
>
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
