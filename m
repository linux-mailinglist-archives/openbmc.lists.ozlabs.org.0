Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA5513EB5
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 00:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq9n16h0Hz3bhK
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 08:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zf0mXXTk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zf0mXXTk; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq9mh1NvFz2yZv
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 08:49:55 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id f38so11635952ybi.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 15:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4y/h2CdaCT5aLcDGH4vyOwMEkajTPv3gIH/CP9hJ7RA=;
 b=zf0mXXTka8NgKEFkBHSJ/qfYmus5/JFJZILWQI1MilIp9S9gi0aQG4qJtwmC4PxuNO
 RSYQMGBFZpxLRocrDGZyJPKpZNDphWcnBj53tOuqOuGeRPirZgNm7F8rPOqCqtQzmLdx
 GaRODpmnNmyCk+M+xuaweNEeOK7dTTwVQdRGyoG4TgIYRP7Zq+EUx0IUUjdxHzuDNXTO
 lWcLeJyZ5yHgxTW+OLrSpG7B57WiYdo+Av7nQUcy7E636Ziu8Bm+Q3bLop4Zl6FkaEUv
 uzBgPzLVLRRwHCCZlDPqYou6rERZyuDVyyB9FFq0UjQcplmLwodBNRB4ZJkSqoIxQ0G5
 Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4y/h2CdaCT5aLcDGH4vyOwMEkajTPv3gIH/CP9hJ7RA=;
 b=LT61lnsh2GXhqh4WpC7kHhBEi5uQ2HHrMRCpSkurcMSFmThn6sn3WEVm95xo0WDYUr
 38FZLU0r0TOZkTya/MhOmx6ese9Rvx1PfsIC3c6J7Ja521MOyQ61LvobifSJfA1QqwB/
 +UCOt7PY8d/sQxduJA+fxb9wdRMfJSRFRjlUbiDja6XcZX59sybtcOHWrpiR8gY+4ca2
 mAgkyvWVK2GY0dqYlTL3pqwNvMfxOWOLLGVnM96nApNJ+EfVU9qaLtD3N+s2aW/BVlyq
 ej3PIQkB23dG9KVCImCK0gZNt6QE8YyKc2bHs2+grpXxjMImsAZiEEgATBTSml1ME5c8
 Wb0A==
X-Gm-Message-State: AOAM5324d1f1yfoDn2trwjkWgPOC+qSfji6oEtdsZsuM2mZG5yOFIqkn
 C0r14ji/1SRpmWgElyKcXqQA4RrbOdIsct5HFScyjg==
X-Google-Smtp-Source: ABdhPJzqCCPSOEN3jFOUYTqgtVwOHJNyh29726bF/LKrEzWJCg+CybXlzXS2RFlHdIdfZ3PbxqUrieuD6UWUK9NlNZM=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr33306209ybr.295.1651186190787; Thu, 28
 Apr 2022 15:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220422105339.78810-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422105339.78810-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Apr 2022 00:49:39 +0200
Message-ID: <CACRpkdbKYYfeVnLBU3o1E6KJAy8gpg70aCxMcEb1SGGdG1Rfkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: Fix irq_of_parse_and_map() return
 value
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 12:53 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>
> Fixes: 2f227605394b ("pinctrl: armada-37xx: Add irqchip support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
