Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8F686CB
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 12:02:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nJx43wFgzDqWM
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 20:02:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qenKTZRr"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nJwH0n8FzDqTk
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 20:01:50 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id e20so2775780iob.9
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r72g4AHaLYsLu+ECpLbOshR1f0RyFtH3KsKDeo19VX4=;
 b=qenKTZRrwpA3m+Rvbzx7aJwKJ3c6QULx3EbIlYCuUP6y9OJLFfkELnN0GQ/XE2odVL
 yIB1XSFQnovfhkxpEqaRycjKX3caAYS2FtuVD0eC3YW+pBSrpR/vg8NFSVCrob/4sDGj
 LPWYOFOa7kC0B21jLpmaGjoKHqFxCK/v2wJUrYC1pqHugJSepfhUAcl//vuILlwm5QPs
 nSJSnlUEJq1TIeDGRQf9NTu9jzN2mWakvrHwjiZEIUN6bKkJX71XJKOgOG9neBPMM0MR
 14W9NSRp6O54zRfMj+LUNzA9jNTKwD4Uh4bEP0ZUzkFyhvTDcW4gooJN0X5JFPvNt5Ht
 PNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r72g4AHaLYsLu+ECpLbOshR1f0RyFtH3KsKDeo19VX4=;
 b=ASUyM0igzzStMyV2uG69CpIakjl/ndON198CkQiXILdIG10wEPXH1hHsTBgXZuoYZu
 3my4PehcSE0YGlUln2r4cC8IkgJMat51WlXRXN+HxP66t2oLizS+DIAk4a41MlHO1Xz8
 ekVmr1jt7LClw7mboSEuVn4Wxi6di+cdw82c2mTL2n71Ct9rwgrxiROlLPQZhwJ3wVPj
 LEyzZUyrKX2rxLSGT/eIAMPk8R2hQ7fCImRjaqHzSPNLTihXgCMmREOgPXK3OdMLnP65
 F+zeF+WJZFx1JrwKG19uQBV3rPi3MMxLp5Lyjseq6geOi9x5lWjJPMc7eTbtIItZWac6
 PNvA==
X-Gm-Message-State: APjAAAVXdByHh2vZY4Q0J8eSEBY/Rq5dnTLHJRxJhdD6MSjAPLMg35uS
 VmKrQOmGIK3c7w+XP2s5LM3FaO3E1N+2f1jUMQ==
X-Google-Smtp-Source: APXvYqxSCDk+fzKKVONVjrymqYcqpaN4MvCEPmUU7sSzkNI6vIArrmTZCtALv27QP/IiPqc7dmvqWYaI0ShuCCiXrKw=
X-Received: by 2002:a5d:9f07:: with SMTP id q7mr22524327iot.21.1563184907080; 
 Mon, 15 Jul 2019 03:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562734889.git.joe@perches.com>
 <d6a9d49c9837d38816b71d783f5aed7235e8ca94.1562734889.git.joe@perches.com>
In-Reply-To: <d6a9d49c9837d38816b71d783f5aed7235e8ca94.1562734889.git.joe@perches.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 15 Jul 2019 13:00:59 +0300
Message-ID: <CAKKbWA4caPMN=h_6bxQ-s9ga+snwsBsMsT05t4vyHWYpLnSH8w@mail.gmail.com>
Subject: Re: [PATCH 02/12] clocksource/drivers/npcm: Fix misuse of GENMASK
 macro
To: Joe Perches <joe@perches.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
I noticed that this is totaly wrong, so I will fix here.
If you wan I will put a separate patch.

On Wed, Jul 10, 2019 at 8:04 AM Joe Perches <joe@perches.com> wrote:
>
> Arguments are supposed to be ordered high then low.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/clocksource/timer-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
> index 7a9bb5532d99..8a30da7f083b 100644
> --- a/drivers/clocksource/timer-npcm7xx.c
> +++ b/drivers/clocksource/timer-npcm7xx.c
> @@ -32,7 +32,7 @@
>  #define NPCM7XX_Tx_INTEN               BIT(29)
>  #define NPCM7XX_Tx_COUNTEN             BIT(30)
>  #define NPCM7XX_Tx_ONESHOT             0x0
> -#define NPCM7XX_Tx_OPER                        GENMASK(3, 27)
> +#define NPCM7XX_Tx_OPER                        GENMASK(27, 3)

It should be:
+#define NPCM7XX_Tx_OPER                        GENMASK(28, 27)
but I need to do another change.

>  #define NPCM7XX_Tx_MIN_PRESCALE                0x1
>  #define NPCM7XX_Tx_TDR_MASK_BITS       24
>  #define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
> --
> 2.15.0
>


-- 
Regards,
Avi
