Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92B6211E0
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 14:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N67Zd5c9Yz3cFS
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 00:03:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HftOwyrt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HftOwyrt;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N67Z232PGz30Ky
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 00:03:06 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 21so22383517edv.3
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 05:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3T20fdGbELUpw/30bYXW9rk8UUViyvlGwNQtDEeL60=;
        b=HftOwyrtLxzbkKxUC8HfvovTHmxETKauLq+2NZsmwAsaMGT6OQPWRuF5ff1cijRifO
         wITQzfD0MbU45cAGywh7YwS+ps2iau6ZaG2lIqsWGKvD3SY8gBLFkxkCsjFGyd3gmUyQ
         dAATAj4FpkOIkWA4ePVCwkeo3E5jCQeNXyYqkCGU+vsAHVsiH5LoKSmHjAnfAJK+Z7Gt
         d9x2V1epibgaTLN6SV3Jgw3jfliBg0IRYRMgaLmq5Fq0DSXAR+054B+BoCIpg0IyodZ5
         YjoPZmxUjN/VAVz4bhpOBNOXAyX/bC8b4TuCXCqOYiqJkroZnJk7zVEbVD58dvpx0Rc1
         m7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3T20fdGbELUpw/30bYXW9rk8UUViyvlGwNQtDEeL60=;
        b=S/LNNnc8IkTPm7TkAx+G6G4DTXFv/1K0kkbNFT4hhElb0ey2YEDRSKHgRe+hflHnLC
         68bTs/iWeIZfx14W/fsMrGRcnLpnkPwdo56LlrRHrOhzsmeSXQG+5MTjqm3v1+U+8NBk
         8O5TT0wcBW+gxyEOx1CCJg+Oag9Ive7rRKHu/bgnbS4qlInkOJxNqQTKsgeGjguKAeEA
         2ikekj7MhuruswF3is578myZ463Uh2QBBpBqXZXP+5WhKX3os6x6hXXojKM9KJzMrFfk
         mxe2uavmfHs/XwoCbU0X5i5z78shf/b98NLS0pueLoM6dvY1S2KYDQ7Lovu4o5fdypvy
         laQA==
X-Gm-Message-State: ACrzQf1hGNMTtKIkV2d8xCIx+c6M12C4PBsubI32uS6BoJyIPBMdv3kn
	W7Xw/Djk0KUpXQJYgunqGDRrZAOj5pNaX0la4FBg4w==
X-Google-Smtp-Source: AMsMyM76jkge9pSTavwCFjj3qtMVFFWyyr0y/FOcVzLJN3+Hurvyb53krF/r4r33HtFj9uBHLuQAPOvLjzn3W9ENCGY=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr55757302edb.46.1667912581984; Tue, 08
 Nov 2022 05:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-2-JJLIU0@nuvoton.com>
In-Reply-To: <20221108092840.14945-2-JJLIU0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 14:02:50 +0100
Message-ID: <CACRpkdb5NzUcnu6yK6t9CUPVb=FSpSJdWOwHVbJqq5FxapT_RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio:gpio-npcm-sgpio: Add Nuvoton sgpio driver
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jim!

thanks for your patch!

On Tue, Nov 8, 2022 at 10:29 AM Jim Liu <jim.t90615@gmail.com> wrote:

> Add Nuvoton BMC sgpio driver support.
>
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v2:
>    - add prefix
>    - write the enum values in all capitals
>    - remove _init in npcm_sgpio_probe

Overall this looks very good.

But:

> +       u8 nin_sgpio;
> +       u8 nout_sgpio;

These seem to be software constructs, for which you also add
custom device tree bindings.

The purpose seems to be an extra layer of protection, such as
blocking a user from setting some GPIOs as input or output.

I think you should just remove this, the GPIO driver is already
sufficiently low level without the need of protecting the users
from themselves.

Yours,
Linus Walleij
