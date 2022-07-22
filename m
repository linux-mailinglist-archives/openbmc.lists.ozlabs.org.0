Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07257E1F7
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 15:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq8n21LhRz3c17
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 23:05:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Fri, 22 Jul 2022 23:05:11 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq8ml2P91z2xk4
	for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 23:05:10 +1000 (AEST)
Received: from mail-oa1-f49.google.com ([209.85.160.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MpDa5-1niZ7a2aLf-00qm6T for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022
 14:59:57 +0200
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-10d83692d5aso6247322fac.1
        for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 05:59:56 -0700 (PDT)
X-Gm-Message-State: AJIora+hX7lwt5D7XfnKZZ46t+9tQU9mY6PXcjYnA0zPqA0YAupx/xwG
	G9v7zNFo4zwchxUw26atoYX/khBcGFCLB1QQpXg=
X-Google-Smtp-Source: AGRyM1vMjRHI1IDUKbv+qzBIY07jN7IIb+WM6l11w0OpthFdMwRbJ5FA5xnOLQhwQ+CrcLNxnU4NQipl0zyL1l9OZjU=
X-Received: by 2002:a05:6870:6114:b0:10c:6bf:542f with SMTP id
 s20-20020a056870611400b0010c06bf542fmr7505287oae.188.1658494795774; Fri, 22
 Jul 2022 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220722103129.22998-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220722103129.22998-1-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Jul 2022 14:59:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2gLvpLMEyejJtg8J5TLPjuPRUc-aJwTK2Og9pLeQT2Ww@mail.gmail.com>
Message-ID: <CAK8P3a2gLvpLMEyejJtg8J5TLPjuPRUc-aJwTK2Og9pLeQT2Ww@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for ARM/NUVOTON NPCM ARCHITECTURE
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:x4l58EjtO3PjVq/hX8BugEtf4oqhSQqpiYw7uWnZ54x9YNSQiiv
 azieLL6gUduV7+xpY5jAUJv1DMd97I4uxMHjgqUMvJziEIcmctDOFlBTJQQsiMZ4wiEMRa3
 DKgbpVUkCiGtOggSXZ3i0Bfb6p2HKyL+a76B92h+Rf3w0iy+WOj2NVNf/O0mPBWhNL2eUbo
 hMNTR1YhIBHZe7E4KR2bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJ8FUKQKkug=:/vhU1KSuO+z3SdPd02se51
 yQ+kONP0AEgLn5Y9B5ZfvM4Ej5w6NNyBWuaMwycIOJErx8tvQVFk1G0yIqsTYMFUCovp5jq3J
 1uoFB8Pw8N41srJfEXuQqu56XcRtEN43ipepQagHWVyxaDiTYWfQZe8CVD70d9Y6v53UzWsNK
 y/GARPNTfUF3KlHsuYBXSxkrsnD8Qrw2I0NRD5+fADA7smwkm6CAFjjJrh7s/+1oHRnUrrT5X
 dl/fDW5o8voVmsPnJbvyqlLFDHn6PRzS8n5h+uGpiBJRG2roje0sgXZXd3wuIVLeqXGEzhzy4
 DanOH0ccPFiyGlGfsDsBcCHXHLKuGgwzl03NvEP0vR/vj9L6szsiaaxx1d4f6vHuA+H2N2ezb
 ckzN4THHOHb6Hexpf97fvnKRCkVhBTHKVuCPOp5xOxFc3vegsiX24MbDkXF9TMGLfMiH2b1WY
 xg5ZPd88ZGmSXag/ti5OTjqmOGylWHRFC5y9C7houPkfrsi8qUprJPi4pRLuKA4dYnu8aY4hJ
 822GbBBuXPIEFMhWH+HrWBuRB3aL+b2YckHa58jUa4qUIgomABNMIUxwQqMOKpqQNWejQzQwH
 5veNJ0xVhCk3fHYHYZ8C0Zc5VhVfO5pj/XJDM9sAzwalsFKteyoQuGWU4PAtZbNqgAmio9WfI
 6Pe9XTuxbXaKzzibqzTfgQ7bE+FCYPLrrmiRRXoYKvUqOZ+AcYNSNSTNGrFHTV9Wh4p1m8ayg
 /pKuN39YCdabtDmUEzppZF5zYO4AhrHlw5gPnGltezgksMivta5rIay/MXZYW+dowX6paOC3G
 0NqjSaLUHBS6aQjN3lnY3NZUQBfKF62Xep5BR61HUXvsilO8j9V/3kf6MfWCxE2DH4touUyju
 fHETR07pUHQsPDBJBhKw==
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
Cc: DTML <devicetree@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 12:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 08e950449c62 ("dt-binding: clk: npcm845: Add binding for Nuvoton
> NPCM8XX Clock") obviously adds nuvoton,npcm845-clk.h, but the file entry in
> MAINTAINERS, added with commit 3670d2ec13ee ("arm64: npcm: Add support for
> Nuvoton NPCM8XX BMC SoC") then refers to nuvoton,npcm8xx-clock.h.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in ARM/NUVOTON NPCM ARCHITECTURE.
>
> Fixes: 3670d2ec13ee ("arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Arnd, please pick this patch on top of the commits above.

Done, thanks!

      Arnd
