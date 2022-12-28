Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3376574B8
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 10:36:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhmcT5Mbnz3bfv
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 20:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ElMpyQfw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ElMpyQfw;
	dkim-atps=neutral
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nhmbw0SKDz3bVq
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 20:35:54 +1100 (AEDT)
Received: by mail-vk1-xa2f.google.com with SMTP id i32so580086vkr.12
        for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 01:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sibGBIP0qfr15zCs+LR1FWj+O5p4xMBAwTb8KT3ZFo=;
        b=ElMpyQfw4EjT7pVErCiIjYzpl5WTibySHAZpxETa4BVArl7fsr9mjYahaMf6ueUx2c
         fEUyFA/phIDj0kaDm1T7kVDXym+9sfa+9uSKDBEqj5DZ9pql1gHqg0vlmt/JBBtGCYIu
         tznZtG8UmydP1EyOcSVE7mSEQgCf+gQTkUQFApLOspcKpw3NX0s0AmHkVGPTG2gUOEoX
         3LKwW5YdaA1BFznohGea70qC55P2RpSE7TCV2ZdAV54U5ivgkl8S0qcjl3lbWcSwOg7h
         8BNGsxMW8nQvtRBZO8WM+xUKQXXmUCjiUz/pAYHrogYIzMuDIFo5TduYS/h1w3+Eo5Wk
         9wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sibGBIP0qfr15zCs+LR1FWj+O5p4xMBAwTb8KT3ZFo=;
        b=UTDn7z/E2PeMznyJUNpJRXJscS7yFlBHrCkSPN5wXzfYf6Efh0NkTOPUYU7+31J/DN
         7UjYs3NEiHiaGGQ1i5u5+bomxOjEghqRp1SkF7r8WXj9xR0Bw4Q6QCVTRh3x3RngxI0M
         A5W436KiJDkhAb2sPMNztOyEMoP4VIBnrNly2HkQ1aKKwHspOUW25/LT4jEJRZFshzSK
         Mm2NlN/U3IEMjvviT/Gj8GWrCev8Z13RGWkIsaW3jbpa80uZ2yBH995UAPx90w+FYQak
         moWV5lbN3W52QGBXJ4EPMQap/qrVB+OHaqBip2m++JRXZ/rHRKVRmRhlrdjrx5p2MXIy
         g+QQ==
X-Gm-Message-State: AFqh2kqpIRkhwNIbs7U1DGy8xbfCvJVWwcvyQCqn6S8dDr66itKLt/sl
	scPe+JOzRFkmHgd2u9u1AspUqbYsDT8Xft9bsNg=
X-Google-Smtp-Source: AMrXdXu2vG/opw86gJxJic7D2pXoI0xu8KoLJ3tKlVtyUwLrpZVECwWc7O02O0XkPUZCRxdlL3IsKI++4Td+5L4funY=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr2717589vke.34.1672220148952; Wed, 28
 Dec 2022 01:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20221223032859.3055638-1-milkfafa@gmail.com> <20221223032859.3055638-3-milkfafa@gmail.com>
 <2a88ee33-91ab-431f-b9ce-472dc64f7430@linaro.org>
In-Reply-To: <2a88ee33-91ab-431f-b9ce-472dc64f7430@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 28 Dec 2022 17:35:37 +0800
Message-ID: <CADnNmFrchhZqv_KzXq1RGQXhFF5A8G_CkXzgT+7Rj+--7cfdtw@mail.gmail.com>
Subject: Re: [PATCH v17 2/3] dt-bindings: edac: nuvoton: Add document for NPCM
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, bp@alien8.de, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > Add dt-bindings document for Nuvoton NPCM memory controller.
>
> Subject: use "memory-controllers" prefix, not edac.

Thanks for the review. I'll correct it in the next patch.

Regards,
Marvin
