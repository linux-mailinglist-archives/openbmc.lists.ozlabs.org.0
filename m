Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CC480940
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 13:54:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNZHP4mRVz3bmf
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 23:54:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNZH51G9fz2yV7
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 23:54:07 +1100 (AEDT)
Received: by mail-qv1-f45.google.com with SMTP id q4so16278824qvh.9
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 04:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZJRShB4R17XUyA+Lmky9Eq7KbI1a01Ayw4czD8PmLMk=;
 b=vlIixv1OzZ9iC33lr82HxPFSxAbTLzfEowrmnGdHKwdwLnWN8Y2nMPTEFHENz/Wd13
 m25eMQXZg3KcxyKJURe0wCG189WZZawabsDg5xxQQkAFSNgUsd98tInaJ74Vz9CHNguK
 /rUgPsZLwK5AUvCvrl1ALL7QhHnAk5kXiUSXj08n64udMmwbNYbPSqjgjOg4W4ppEbgE
 Ov3vtxAL9oIWEA0begYfaPgv9ia/wbrKrXd/axwuHOaxGY6qoTjpWETU8QHMTruCIqpk
 5+ACN4G3LZo4D7gSWKN/OkQAk05+saMK68xVOdbD4eaME8elTXLCIrleGBofwiMSu3VG
 iMLA==
X-Gm-Message-State: AOAM532NaxUrqFnHH9WutTVzC5dTW7gwjjTH+3i9IWaWoCHPMDV2QKCs
 wOCIZy0BQDZhU/CDaeH2aA==
X-Google-Smtp-Source: ABdhPJy/fzYGUO6kMogbqR18MjovZaSQSfYizR9m/aisbNPZJViok+Nkn+4LdRkBGt95ydX9TJxItg==
X-Received: by 2002:a05:6214:500a:: with SMTP id
 jo10mr18668993qvb.17.1640696044298; 
 Tue, 28 Dec 2021 04:54:04 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id j16sm15759721qtx.92.2021.12.28.04.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 04:54:03 -0800 (PST)
Received: (nullmailer pid 685117 invoked by uid 1000);
 Tue, 28 Dec 2021 12:54:00 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227183251.132525-2-krzysztof.kozlowski@canonical.com>
References: <20211227183251.132525-1-krzysztof.kozlowski@canonical.com>
 <20211227183251.132525-2-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/8] dt-bindings: rng: atmel,
 at91-trng: convert Atmel TRNG to dtschema
Date: Tue, 28 Dec 2021 08:54:00 -0400
Message-Id: <1640696040.235226.685116.nullmailer@robh.at.kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Matt Mackall <mpm@selenic.com>, Tali Perry <tali.perry1@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 27 Dec 2021 19:32:45 +0100, Krzysztof Kozlowski wrote:
> Convert the Atmel TRNG bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/rng/atmel,at91-trng.yaml         | 46 +++++++++++++++++++
>  .../devicetree/bindings/rng/atmel-trng.txt    | 16 -------
>  2 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rng/atmel-trng.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1573492


rng@e2010000: compatible:0: 'microchip,sama7g5-trng' is not one of ['atmel,at91sam9g45-trng', 'microchip,sam9x60-trng']
	arch/arm/boot/dts/at91-sama7g5ek.dt.yaml

rng@e2010000: compatible: Additional items are not allowed ('atmel,at91sam9g45-trng' was unexpected)
	arch/arm/boot/dts/at91-sama7g5ek.dt.yaml

rng@e2010000: compatible: ['microchip,sama7g5-trng', 'atmel,at91sam9g45-trng'] is too long
	arch/arm/boot/dts/at91-sama7g5ek.dt.yaml

