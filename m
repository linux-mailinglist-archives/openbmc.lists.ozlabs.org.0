Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B343E413
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:45:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7d9500cz2ybB
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:45:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7cv37q1z2xDw
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:44:47 +1100 (AEDT)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4Q8u-1mpLTi2psM-011Nyw for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:39:36 +0200
Received: by mail-wr1-f46.google.com with SMTP id k7so10565034wrd.13
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:39:35 -0700 (PDT)
X-Gm-Message-State: AOAM532AXsSiVyAdGsU2nx0472sbOalTWM1+qoh+OMZKw8f0geKWCKoj
 mNF4aO9CY8v+aG4WV3KaqbOT7Rhq8qbQ4chgszg=
X-Google-Smtp-Source: ABdhPJywcxOpdNSzG6Dz7Wo0Mfr5ZcmBRbk8+ke27ZX22Ol8jLoYbLDirLsu+KPslnCjLkVgZLhdwSyWSSptfkSO3xA=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6354304wrq.428.1635431975426; 
 Thu, 28 Oct 2021 07:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-3-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-3-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:39:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2raR70Xw3AT=BSojvqvua4WGeYrzasp+i7bnwTLVcxhg@mail.gmail.com>
Message-ID: <CAK8P3a2raR70Xw3AT=BSojvqvua4WGeYrzasp+i7bnwTLVcxhg@mail.gmail.com>
Subject: Re: [PATCH 02/13] arm: debug: reuse the config DEBUG_OMAP2UART{1,2}
 for OMAP{3,4,5}
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Nx0kGkCDZWHklcQkjnOYTatjfb8SCLWNu8vJViQwYFOrQKa069X
 NQb6unffWgY9DPJiZ5aKgSP+MutghCaWrnT6KoUVgSsqdKGjtlLqG4hKhpY8RyzVxLi9lh0
 Y0H5VyzWwFcmjaSql08rR5xoTlEff7tjVgn01H4xjN8iHBfUaD+dK6geqGkBQe/8Z9Rj4ma
 aj8jA8cROJZX2wd+5UA+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SBXyxnn48ns=:tZ7lt3bH5caAu4yfv7+cQO
 hs01f2dG47/FTl61cOZytZnudhrqRRTrugl32ui06NW09JC0dGJQCeUEnat8pKM4rHn0pUNAq
 Aj3mLoNBr3XIiLtEnFrluXH+tdx5YqYFOekUH7+C+Hykax9z/5XPp7Ucmv3+Vim+8uPKA1JA4
 vDWEcxuqbEBDfCIWmlIvUT1+mderX1Y8S6X6OgxpU8CCJCj7q0winM2JdN1Yn3KWZxHMTNug4
 4IAyrzgZ/k8uChCkuQ5DdNtDRm6OazPYhVjB29Olre8vJe9Cf5EblqQOyHmwEuCfgCDWBuABf
 VIX38Si5tRwZaDWYFYxWi/ZzMydpx3VJEfx//di64cTLJFzSe77jtgW66/tGS88ksyKmn62sL
 AB5x6WxOaXHeLRWkwkAiqVRtX4eH9mAG+VrSHheYZNt70f7LW1mHacjYPtAad42/8iQDEWDxb
 MrCp5oKN+RpshYqX4CMC4m9YBTo6JiLuf+Y2sfTE3Jy+ABFiHAPFqRta9Abziq1Jq9sf+USle
 AM7OJjMb7xeavwk7ikurt9B71MGneU2cGBmW78cBVagyrYqGj96sDny8xJ69AEZCuVbp+lXi6
 dy0WPDl43bYtqMgmEY/GYMkLUokgvjPojq3OaZnotvf07keP/T5BprjI7iINGyjW2WIx2T1cL
 Y5pd4REzMbTdvdC07txUUCuYqXLbpGbYE2UWCvYy0gRVMaGXoB9URzu5OwpQVp8nFl15kKjap
 6aPKcen38/46eEi9zExzq6vPKaIiU4SbbDTUgxWOxPvgNjW0qUVOzu13EVnhWyeeWywh/hloT
 XyVWgfFE6TBHwhZzsjiKVQBPUDrz8DFrmjjLpLGmywJKFu/kQY=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, kernel-janitors@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit d2b310b0234c ("ARM: debug: Use generic 8250 debug_ll for omap2 and
> omap3/4/5 common uarts") adds address definitions of DEBUG_UART_PHYS for
> OMAP2, OMAP3, OMAP4 and OMAP5 in ./arch/arm/Kconfig.debug.
>
> These definitions depend on DEBUG_OMAP{2,3,4,5}UART{1,2}; however, only
> DEBUG_OMAP2UART{1,2} are defined in ./arch/arm/Kconfig.debug, and
> DEBUG_OMAP{3,4,5}UART{1,2} are not defined. Hence, the script
> ./scripts/checkkconfigsymbols.py warns here on non-existing symbols.
> Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> separate config symbols for OMAP{3,4,5}. So, just delete the dead
> references to DEBUG_OMAP{3,4,5}UART{1,2}.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
