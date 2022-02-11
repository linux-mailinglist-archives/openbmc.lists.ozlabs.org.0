Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE084B1AE9
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 02:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvwQ95xksz3cBr
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 12:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hE/Mrs0O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hE/Mrs0O; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvwPq2HGzz2yMt
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:04:46 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j2so20686391ybu.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WsTiTpIPXd6aBVRDWWCsW2EfHImVRBu7uRe/2mtmvMo=;
 b=hE/Mrs0OT4PJEvvcSBW//N5IldkDiXP8QA8UXh6EUPg2m7sgepjbdSVH+YRKBY3QFF
 a5/XUpkCzfPY3wLcdHeRPOOWiHRzJX5iLHRp/rhZXAEgVFWb2kCc0jQjK9jkPjth8baS
 +SOfsi88n5gCkWBefJdLXdpRv9Sk8q3cKpl2RU0uBFtwaBTO3w2BZTvEjvrI4u7yw+uM
 8VUBEoTAxYHIlXAbNeBdu+5rzGI6Qu1v3d2T9BKeN1AiCpuOyAoOJJBm7cc8iVHZ8Edm
 hsjw53+KzB5w4jjKF7GFI35WTcf6mL82oIre7eqJ5K6FZXnmghyatq7Kc8zOXWjB4LWB
 +7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WsTiTpIPXd6aBVRDWWCsW2EfHImVRBu7uRe/2mtmvMo=;
 b=2CuMBLvxhplT82FC10x9uBiYwSVdKzsKqQ9L2xwQ6X+YUFufkuS9UZVdkQ06m8nQMR
 ZNYMqSpCiAHEhTurE+3UEdYZY5v7WYVR1Um9YaxhzwOdfu6Z9guYMQCdSXNlQ76a+xAb
 s9+HWGBwo/QlAPC5z/YmgEQW2ohuzAYuMvh8iaga3MF1y1FYrBdR5jGL09e8M8fQArFN
 C9Sky16J8biTPatgO0BPNho4PezdjZYM7IBsNVDM4wNUNW6MUazoDw4xp8mdgZMsvA7H
 50VOe69k5mFN8YEsgpLKjAeuoQtBRE4Cinp1vFgO70hpcqOg62GzLzdykXxXLOepohiw
 fErw==
X-Gm-Message-State: AOAM532W9pNlhfQOMmGDUAZ9hhiy74aHkrKh8spRkoCkpHXrj59TD9ZI
 5h7ZtpU2RCA8YlL6BxbuJaV+GvoxtJfIbLHbUBdnxg==
X-Google-Smtp-Source: ABdhPJx8k/neEG8CQ2DJYegDVZpGIz+78Gj9mxX8H5U/x2yDSI9sCRLGpI/0cV62BDxBuVS7AyEpooCPglR+uu9KsbU=
X-Received: by 2002:a81:b343:: with SMTP id r64mr10383367ywh.268.1644541483360; 
 Thu, 10 Feb 2022 17:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20220205155332.1308899-1-j.neuschaefer@gmx.net>
 <20220205155332.1308899-2-j.neuschaefer@gmx.net>
In-Reply-To: <20220205155332.1308899-2-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 02:04:32 +0100
Message-ID: <CACRpkdYJnB1HnEt29p3G_fUEMMHoXMmuKBkUHAGV5sKUpiU3eg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: nuvoton: npcm7xx: Use %zu printk format
 for ARRAY_SIZE()
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 5, 2022 at 4:53 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> When compile-testing on 64-bit architectures, GCC complains about the
> mismatch of types between the %d format specifier and value returned by
> ARRAY_LENGTH(). Use %zu, which is correct everywhere.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3b588e43ee5c7 ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO dri=
ver")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>
> v3:

Applied this v3 rather than the other version.

Yours,
Linus Walleij
