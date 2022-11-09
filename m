Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39D6237CE
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 00:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N72146vvxz3cKr
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 10:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Wd6ppp30;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Wd6ppp30;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N720R5jD7z2yyZ;
	Thu, 10 Nov 2022 10:55:35 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id t1so151383wmi.4;
        Wed, 09 Nov 2022 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j51pcpmAt7rygikiVDfge95qbdKBtRf/PjFzkYZrMnc=;
        b=Wd6ppp30utQntCUqz+qW2cMWBmwMs+rr95pprrQ4BHDRQxjd30vD6E/xLK0J4s5ygs
         XFdDT1RYyNMEv8ooKTwg21fWqx4yPRayjTX94hEsCfgP+jITqGcRlT5SkL5BNMlzhTL4
         KN621bpyhvV2Z759F5e+QYGQ6fKGmRLziziwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j51pcpmAt7rygikiVDfge95qbdKBtRf/PjFzkYZrMnc=;
        b=JHulyt/qZ+btr9jOiQyJbLoxTMgUN9Fl41F5KuJNldTcAYVjAkWgurp7NyLaZ1ltj2
         yaSnwvYlGmcsQXC8N4fOKdzOqPNo5K4HiKMu9tfagtb9kaObMJM3kIP9caOia95Wy4yO
         BTCWKANfeylpkMauGoeUNQ4kyXFEBlXl+514zoboEzc0hG4770dpaymsXY6k/kIXjIQT
         5B9iEPY8dJK68bUA5ZYL+RXLD6r6Od0kdwbb0wApZ8/hCz75kr+uOEa7Rnq9d+zX4UpF
         8fS9mdFb3mEbLFJYfUyzKqTCD8b5gmSmbRloQlJqXxWhgdmUD4g5n1Wfn4NPekwayFje
         Q6SQ==
X-Gm-Message-State: ACrzQf0zvj1eQvY7nabNloqBiWgyWLdNAEx3F+8mEd+2+VxNyWGN9xQx
	3QT2lfKvtmZDXrhmnqIBP+1agq3pkSiwpOs8OZU=
X-Google-Smtp-Source: AMsMyM633cR3aqFZIJs92t3FJDeCnj/48LR9q/mCiFCWUWAAUvWB71S7IrPEET1nrwzBbJA7zpjBPNFK4ve3y4WY6Cg=
X-Received: by 2002:a05:600c:a46:b0:3b9:9b97:9304 with SMTP id
 c6-20020a05600c0a4600b003b99b979304mr41506443wmq.34.1668038131488; Wed, 09
 Nov 2022 15:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20221108001551.18175-1-zev@bewilderbeest.net>
In-Reply-To: <20221108001551.18175-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Nov 2022 23:55:19 +0000
Message-ID: <CACPK8XeKA+rFwOGCZam2XZh9v8OndyZeE2sk4-3nb-rKdNeDBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 8 Nov 2022 at 00:16, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This series adds a device-tree for the BMCs of the Delta AHE-50DC
> Open19 power shelf.  The first patch adds a compat entry to the Aspeed
> bindings; the second adds the device-tree itself.
>
> Changes since v1 [0]:
>  - rearranged patch 2 with macros to reduce boilerplate
>  - added ack from Krzysztof on patch 1

Looks good to me, I've put it in the aspeed tree for 6.2.

>
> Thanks,
> Zev
>
> [0] https://lore.kernel.org/lkml/20221105013321.2719-1-zev@bewilderbeest.net/T/
>
> Zev Weiss (2):
>   dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
>   ARM: dts: aspeed: Add Delta AHE-50DC BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 418 ++++++++++++++++++
>  3 files changed, 420 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
>
> --
> 2.38.1
>
