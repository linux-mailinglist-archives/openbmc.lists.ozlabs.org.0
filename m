Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D26A64DA
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 02:32:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRGtR0TNXz3c3N
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 12:31:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=J/riPlxo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=J/riPlxo;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRGsQ6Rq3z3cDM;
	Wed,  1 Mar 2023 12:31:06 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id i34so47719347eda.7;
        Tue, 28 Feb 2023 17:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dybzwFbIjgT2tCtgfGWmH+b0sBN7xN33eq9JJI1azg4=;
        b=J/riPlxooPKy5grH00GRJCM5uKoB0fQ7BcgtmA31Ea8U9JI/gwZgjclb6Z3xaZT0Fo
         QXV9SSx5KLNPvbMceyjFlh9ND8zhaGPu+k9/cwYb0ZBmwjbPaJT+ELkB6UNuT3j58Y3Y
         Llee33BEF4XxFxmBMTU/tN3wHDJ5Y1UupTC+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dybzwFbIjgT2tCtgfGWmH+b0sBN7xN33eq9JJI1azg4=;
        b=I32e4O1uSN3zCpfSEOsFYELDKTismA6OAHN2JipCXD4zJ8cjFJ8GoBIF38gWrwKZSb
         LcA7pDOLwVrx9MEhlrWYqgUtXrGY8kFJ08WeIvD7VDNIUlIASjHyRcaQ+3n1dPdrP1xw
         m9kI5DMcHHYDhPP+1NQGdW5PG9aPLEAR98xwTtaGJNe1jb6+9g0SJkW9BcX2tgVAoRzA
         +Hvqp+NelPrmKxjeOoYmyxNyGMJLSYvOtevsBUVoIf2j9l/8E5WOCAQzRFUs8MvQltul
         n8h3f9PHq6wOc5QvZSPbFcxRJj3mxxG4mDbQVAgkhjMW4PUR7jDjzCE8pQui5Yn1B1Fq
         Et1Q==
X-Gm-Message-State: AO0yUKUbv1/H0bguYSqqAJa4tainyaQaIgw6XEQeHUKrcTNdCD5FDM/S
	on8nWIlb23LGogfh+9hN/VGzP5IYoMklP5WGFrU=
X-Google-Smtp-Source: AK7set8Rn7FrLIlyvtyXdzxIzlBOnS8eTiidZS6gad+90wWt7ADj5drCop6N8jGvqo5xdx0JPax4+93ppbEOjC6kDXc=
X-Received: by 2002:a50:9f4b:0:b0:4bc:5e2e:592 with SMTP id
 b69-20020a509f4b000000b004bc5e2e0592mr61110edf.7.1677634263803; Tue, 28 Feb
 2023 17:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20230224000400.12226-1-zev@bewilderbeest.net>
In-Reply-To: <20230224000400.12226-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 01:30:51 +0000
Message-ID: <CACPK8Xe2MA+hv3FH=eQ0toy94hQbtFgLvKxvW5k1vahQpkO+RQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: aspeed: ASRock BMC updates
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 24 Feb 2023 at 00:04, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This patch series contains a few small device-tree updates for ASRock
> BMCs: an LED polarity fix for romed8hm3, enabling the ast2500 PECI
> device on e3c246d4i, and a SPI flash clock frequency fix for both.

Thanks. I'll apply these once we have a -rc1.

Cheers,

Joel

>
> Thanks,
> Zev
>
> Changes since v1 [0]:
>  - Added patch 3 correcting SPI flash clocks
>
> [0] https://lore.kernel.org/linux-devicetree/20230203105405.21942-1-zev@bewilderbeest.net/
>
> Zev Weiss (3):
>   ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
>   ARM: dts: aspeed: e3c246d4i: Add PECI device
>   ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks
>
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 6 +++++-
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> --
> 2.39.1.438.gdcb075ea9396.dirty
>
