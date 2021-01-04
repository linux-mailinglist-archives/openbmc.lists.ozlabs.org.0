Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E12E984E
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 16:21:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8fVW5cM6zDqcJ
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 02:21:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jURit9Ov; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8f5X2sYzzDqWx
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 02:03:20 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id y19so64816574lfa.13
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 07:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5beBNHMdA1gHacbQ7KCPabulppTZo/UkkRxhQq//fY=;
 b=jURit9OvneWs286wGYUSCwSZ1SOW+Vz2YfUKezNZ/KZnM4F4Hey7qTMZl+Pj6sDy0W
 MOtVRCWuRQqeS3YExg4Rn6SjbIh172IEEGNzyFw7K8BB0lh4Xf3qsk/fwQ096OKPjAJD
 Hu+Xsb3BslA1XieKFl8l78GSqIaG8Zg5LHvOI+o/bK4HJAV8brnBQN419hQFenE/kZKB
 L1nIZXIZhm/Fm2vxnrGctwsWKJu7Eic3nf72YJ5dqb0fX90oSeKIys/ufXlsy6tEJKt5
 qC1j6VWnGVAcAZDCDUdqa3oMvpkpJlViZTqmPg5l16Q6+W9d5v7iNdfOyuy2QM8TJwUU
 1bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5beBNHMdA1gHacbQ7KCPabulppTZo/UkkRxhQq//fY=;
 b=QdGr4isUawNa6+r+IyJkiWbUcaoj51NZOzYct5qP8Nsr/u/TtPj7v1Dryndt9QFFsr
 1Z/VIcSRpY5PTrQ2Ffzm/tHju3NLyvIEOQGYJh3mtKUHM8R/5UYv03qMbtZbAzArBiAv
 i8T01NtKhJwFtRVxhJGYEXZFrsOr5yTk9rvOl6mGtYNPS9OW7JsyYxdAcbWGilTlH4Qf
 N1LYF3KQO4HM8d4tpAOiZ7REHaWNdDBZ5RBuHlRvMCxCtMco5bQI2MzPBAi4KT1QQYQ+
 7LZl+9+bTlmBIJSNnDYMM6kFZRabsktNixAvva4A9reXa8mS6cxEJHy77jrOClByOHp/
 FH2A==
X-Gm-Message-State: AOAM532dyN0egNe41mZS+czlths9zJ7qojr/3UJO2FqD5Xwczkw+pyXA
 Z8eoWfADmoynOBL3q5peU5TG3vJte8pEbWm5jeJsPg==
X-Google-Smtp-Source: ABdhPJyZSo2vs0ioHFInq7433TP/qFV0Cym97cE+YK8oE3Vt6dU5J9kjlu2ZUe6YMN1vnxvH5jtR/kIkKY9sn+ZeSec=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr34335495ljl.467.1609772593270; 
 Mon, 04 Jan 2021 07:03:13 -0800 (PST)
MIME-Version: 1.0
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
 <20201217024912.3198-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Jan 2021 16:03:02 +0100
Message-ID: <CACRpkdbLG5Sc8JjonGjDdJraStoz7PfQxBEb5ai_gktV4whzdQ@mail.gmail.com>
Subject: Re: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 17, 2020 at 3:50 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied for fixes.

Yours,
Linus Walleij
