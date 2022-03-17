Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4A4DD2EC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:12:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSG04mm6z30Dv
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:12:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HtQ8698j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HtQ8698j; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKN1r5xSBz301K
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 10:01:51 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v130so12897684ybe.13
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjpeHshr55oXVbRkRUel/sp4CJH7Ek81QT6z+rRB6S8=;
 b=HtQ8698j/GkuPOZp01hGhOmnDThwuykSIVbzZT8HLyvOMehvriKXIHX3PT+MEnXiuu
 9lwzZcsl1IkVVuTIBPZbV5ekm6upDD5S6p6Kl0b7eXclg6iINdHjGxQrKPXdldyuBUsg
 h23/4Q6kkdZ+Etckx4W8ponNMzQ3iRuFDpKSS6Zd/JLP+p0lEYCynNvRPmlClU03Onro
 grI/EMU8xcuHkARp5fDq1FopIwxeXkki1ZHaOsyS0ftNmZinm327BN43hb9lMeYXrq7z
 uzc4oLY/xeBkyTT9bD5cv3Q4uvoEt6o3ccWfoYik6eiY20eZ0Uvsd/AniL+StFDalV+t
 eXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjpeHshr55oXVbRkRUel/sp4CJH7Ek81QT6z+rRB6S8=;
 b=G5Pe/x4zWZFvg2Rz+oNRM9JBlB0LEzxAxdrt2a1JdEbUsUAx7QgvGvioxLPdGwZKQH
 jsL/Yr6kNY9mfKzxbZXFIltYKsNvSdzSKRzN1CNtwN6KVYo75/fmD5G/6nzgInupDejc
 hV8tq0RoGSG1sxHBpBczEopB8d3vve6GtIpEk1jB2YW4L+gpV+g6JliYewuE+5xCwJ/E
 NeoT+UCDQTjSpJPFS8q9JNAIse5HVLkwEtL453kuhbgTbH45iJg+239Bm8ZWD9vo53UH
 jEX641TjTe4+V142VLo7B7/3oib36CyUCajtxHJldwu33eUkaJF355fPhzekdRo73IwF
 j35A==
X-Gm-Message-State: AOAM532qMb47kOoDq4U300cHEz+n23YW8kFK2NAyQCJWTYEqOnWpx1k0
 nXWuBng9iPA8B+nzSUG3/eAVrzg/pnYh2fC41T0Pjw==
X-Google-Smtp-Source: ABdhPJxUH7FDJL8h8BnBMwdlrY2wLUcnT5H3QzKOyq8DCn5DLiSJpxwc/UeAB4reijZISa/1f6WVJpXdp16QsqcRX/Y=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr7372536ybi.492.1647558107436; Thu, 17
 Mar 2022 16:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Mar 2022 00:01:35 +0100
Message-ID: <CACRpkdafKz7hqinCgWrKuSQjefaN7cZgLbhiYUtVXg3=mrELow@mail.gmail.com>
Subject: Re: [PATCH 07/18] dt-bindings: irqchip: intel,
 ixp4xx: include generic schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: Nishanth Menon <nm@ti.com>, Bert Vermeulen <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 Suman Anna <s-anna@ti.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Burton <paulburton@kernel.org>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, John Crispin <john@phrozen.org>,
 Birger Koblitz <mail@birger-koblitz.de>, linux-oxnas@groups.io,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 12:57 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
