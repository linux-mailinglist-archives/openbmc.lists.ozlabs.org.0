Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4072DE5C
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 11:56:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EFOAAGfy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgP8K62Krz30MN
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 19:56:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EFOAAGfy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgP7j1J1hz2y1d
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2023 19:55:44 +1000 (AEST)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-78cee27c08aso327426241.2
        for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2023 02:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686650139; x=1689242139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwWyCUDuegx+tvkvTGStT67ElUFA4N+9n715czI5oMM=;
        b=EFOAAGfykMNiEdEIHAfYE+irtvjkVom+OCnYLYU3kU0Rke9e1gCAxYxpvkxgFfDTLq
         /IGjpl7MZuDj83JotVbsEk/YqixsvEiYQi9bAp5n+JdxO9Gan3tNXKEjF8mziH+PnJOn
         BmpvoPMpX+6oz9ORNEtky4ww3U8A5SZcXqmNrrEhtttLMzWwv0QhxCEZ7OgZ+ev2oBvi
         kOCmX5nZHqiY1dNRMiAX0ahKpTUrN9Mw65Wz8vfmCnilGw1vLLBSlw8MUU4u2JlMWwAP
         sivKbPprB2Nuk9rdmuuNeg6dQhUREKl2Kq59cBj7z1/ZpHtczZGoI8qP4L72MB6/b7wd
         z8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650139; x=1689242139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwWyCUDuegx+tvkvTGStT67ElUFA4N+9n715czI5oMM=;
        b=hLezoUspWlkyroza4y8DnU0g9Qc7X6UYAJejintjj7HMm69uhVB1HKzn0zqw6K5q37
         yLbRkfKx00p10/MZPBggbJ9Aa+mFUpf1I53TH8KPf5PE63PsLXsvSmhtTYzYthkPrkMi
         5tgXS5iTq6zbeFxEw7JmCuYygIHNKSbI1VrqpFXX6Jsk1WaGMnsp2LVIEOpb/lX7pPXV
         GcMeG8uz+xIlsuxGjAkqZFZRQLy/qdNj2+wn8/mvPK3lfPmu5oyg31a6i+rLFp+V+SSY
         ERf46QD53OytPzBgXD/aau+Tfov/5V6u9yGdkrSrpGTUxTOqE/tqrTjfLjIa6KnsZGyf
         IMlA==
X-Gm-Message-State: AC+VfDz8QF+wHnT9/SrLFRKp/cEv1UViyxqdJnN7gKYIEu124sAxRz42
	BFIKayFJjn0Ls4jgf8NU2xWWdOvAN/tXyTE26To=
X-Google-Smtp-Source: ACHHUZ7e9IsqIAz0PgLSkxZe5wg7yRy8uMMFUo1OILtylLbe/RXl7LMH2ceasVjVOwYCrnYhfuIfG6I7+3mrqQZSYJg=
X-Received: by 2002:a67:b904:0:b0:43b:3978:2434 with SMTP id
 q4-20020a67b904000000b0043b39782434mr4872625vsn.22.1686650138870; Tue, 13 Jun
 2023 02:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230111093245.318745-1-milkfafa@gmail.com> <20230111093245.318745-2-milkfafa@gmail.com>
 <20230612110401.GPZIb7oZPdsPGFzSDc@fat_crate.local> <38c30778-9526-cba6-4ddb-00bcefeb5647@linaro.org>
 <20230612120107.GFZIcJA3zktkiyTS2+@fat_crate.local> <99795947-0584-df42-a28a-aa89d7e21c7e@linaro.org>
 <20230612123925.GGZIcR/dUrcu03z6V+@fat_crate.local> <e0171cb6-54e7-41bd-4b08-fa667fe58ff4@linaro.org>
 <20230612131649.GHZIcawTKBMIQpFD6I@fat_crate.local>
In-Reply-To: <20230612131649.GHZIcawTKBMIQpFD6I@fat_crate.local>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 13 Jun 2023 17:55:27 +0800
Message-ID: <CADnNmFqhNKoV5EfaiMSo9yz-hTaTm+0pGUJyFNH_V8pNVEU36w@mail.gmail.com>
Subject: Re: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory controller
To: Borislav Petkov <bp@alien8.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, tony.luck@intel.com, rric@kernel.org, Benjamin Fair <benjaminfair@google.com>, linux-edac <linux-edac@vger.kernel.org>, CS20 KWLiu <KWLIU@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, ctcchien@nuvoton.com, YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Marvin,
> Please route the DTS (1/3) via Nuvoton SoC tree.

OK, will route the DTS via Nuvoton SoC tree.
Thanks, Krzysztof!

> Patches 2 and 3 queued for 6.5.
Thanks, Boris!
