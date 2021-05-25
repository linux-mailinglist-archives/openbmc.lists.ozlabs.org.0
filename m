Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396138FC0B
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 09:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq5xW2jMqz3014
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 17:56:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AZs9vA37;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AZs9vA37; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq5xB0LFrz2y6F;
 Tue, 25 May 2021 17:55:57 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id w9so15539377qvi.13;
 Tue, 25 May 2021 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yl4OCRlRmcAtp5Couav0LI2ZiZLwzvAGoLktfuL2BPk=;
 b=AZs9vA371763Gt7PV8In9Cx/J9OiUAch5VP0Sc2PnnEWWKI08ikfd74b21FiQi4joK
 0sz79A9TnJGs2gvhDQVg+fmWnlBgL2GFBnsuS6S/h1zbC02JbK6CR0432QCsDm7SkF8g
 UXDaV8qyfYeb5ErooVY6JkwTj+M5LdtBxAQ3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yl4OCRlRmcAtp5Couav0LI2ZiZLwzvAGoLktfuL2BPk=;
 b=XBRnTquqzhwiYVCRYz9hzWgH3bHKFPPZLJaFTmyB662zpMW8KBMnwUzFYmMYFRJETe
 xPI6XpykTcUvuWB8OMqRrRWO/wFt95ptLYtxb7xd4cUldSCjB00hbn0LQJtBotUvuV5w
 L8yoW9woLJn2dq28JUDQDURFWCfxHBRgFIprt2cZllyNWTB91fvg3CK3pJtSTMFQ6OED
 oHGUemFRe8SmpY8I3m+NFLswZJYZX1m9ynkN508LB0si8NFf7a2HQHv7sSw5FY5XY4j6
 +09Zz+hNUoj+frBJE2tij3IBzw81GDsMw0N7MtwRge/hqJVxnvFtNe7WTTmfz4IaOZ5B
 yOzA==
X-Gm-Message-State: AOAM532Mie2A7WzaUj0BM6ec+A08ZJdj9e8JhVzAAd+RstxiCoBZoAk0
 AkJXK6zWCnoYq8n3qR8O+ZOEgKajhmTcKHsPBcPQOr1Wkko=
X-Google-Smtp-Source: ABdhPJxi5BWYfe16W3K0oHvA+q/LdZiEoyQtjgpmU0M0/vawIdezpEoM84VyVuPMltZpChZ6PxBTLvdvGvuScxGL3IE=
X-Received: by 2002:ad4:5fcb:: with SMTP id jq11mr35355630qvb.61.1621929353765; 
 Tue, 25 May 2021 00:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
In-Reply-To: <20210524073308.9328-1-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 May 2021 07:55:41 +0000
Message-ID: <CACPK8XcfvUQD5xwb=2Va5Sr+bmaWfJMZkh61HK1=J1qLYc84zQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] mmc: sdhci-of-aspeed: Support toggling SD bus
 signal
To: Steven Lee <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 May 2021 at 07:33, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600-A2 EVB has the reference design for enabling SD bus
> power and toggling SD bus signal voltage between 3.3v and 1.8v by
> GPIO regulators.
> This patch series adds sdhci node and gpio regulators in a new dts file
> for AST2600-A2 EVB.
> The description of the reference design of AST2600-A2 EVB is added
> in the new dts file.
>
> This patch also include a helper for updating AST2600 sdhci capability
> registers.

The device trees look good:

Reviewed-by: Joel Stanley <joel@jms.id.au>

I've applied patches 1-3 to the aspeed tree for v5.14. I made a little
fix to patch 3 as it needed to add the new device tree to the
makefile.

When I was testing on my A2 EVB I saw this:

[    1.436219] sdhci-aspeed 1e750100.sdhci: Requested out of range
phase tap 192 for 9 degrees of phase compensation at 1562500Hz,
clamping to tap 15
[    1.450913] sdhci-aspeed 1e750100.sdhci: Requested out of range
phase tap 963 for 45 degrees of phase compensation at 1562500Hz,
clamping to tap 15

Do you know what is happening there?

Cheers,

Joel
