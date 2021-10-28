Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5643E42B
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7hK1s6rz2xZg
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:47:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7h00ldjz2xKY
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:47:27 +1100 (AEDT)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N79hs-1mjHxm00rc-017U5z for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:42:18 +0200
Received: by mail-wm1-f50.google.com with SMTP id 192so4485236wme.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:42:17 -0700 (PDT)
X-Gm-Message-State: AOAM532Gdb8EM4RXeQh2PyLDXw2M5a0jRjMwvc//5BJyfP/lbYUqLiCd
 0NwnBmvXC994rH4V1Q2BYAXNOVBcLF5uEH/UEa4=
X-Google-Smtp-Source: ABdhPJx9cbVaNwx+3GHbcHnQXOpN9heQ4JmpWp0Hw9nZ+0Vz+KISvn385FCbSquLcG8jLThOtn8bEBSn4MBwQAn7pDA=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr1292581wmb.1.1635432137333;
 Thu, 28 Oct 2021 07:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-4-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-4-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:42:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+-J6XbUmzWs7ATN7z53GomZSj6vq3n5R709=iL45RrA@mail.gmail.com>
Message-ID: <CAK8P3a3+-J6XbUmzWs7ATN7z53GomZSj6vq3n5R709=iL45RrA@mail.gmail.com>
Subject: Re: [PATCH 03/13] arm: Kconfig.debug: drop reference to removed
 ARCH_MSM
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7JHGi/yIGSh2Iq0PKOO0eLsAwGsWaVwbv5k9esY/mtfRklYiDXO
 UbncXOx16VeAUzkOwzB7dRYFDOoPLKTiJWVsihl6g5CoAafJH1TkQv1r9RRnd5eohAuyT0d
 E5+krt7zpx3KiJYOFMXp7AOq0RuJyf5hR1F6H9g0iRH1F3KlxKeIrcWI4GbZVu2PlfHC+S7
 F/WbXxXRDhBYO0/sBiBHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ml0OYKL1zss=:MHg1YyEIACSKW88IeEn8wT
 W2PArWk4ORbGYuDHIpqpM5EC75d7dkJ6kXeaTOmz/EXozTUPKDKBCE8T2kX4Kqphg+XQMMAXo
 JEw4KRlc+YEkGVg41LIRb2WFojlbo9toD24SuelPZUIdvduniYnZu6X2N26vTHIyYDfpdIL2k
 4VrOPdJTYyipozgVyZ4kzinautk4QZTc07+C7GIL+blIx8b1nBasRjjbPleqwIMijJjxwoGSy
 +q1WgfXvnX2Ao/jxlEGnnDJJljLrGAPeLIA8q/NXGJ0Um8jU19MCjh99cQmWrWJcO+3KTi8B6
 07RTiMLTrGIwjfxf0zHDDUOyeesRH4+S0uPRW+jawJ+Mh5IJYSdtdivr2JvObRpBOYlRDOMYq
 nIa4moyYillegv6f8iSms4XMryA0v0RHgV15IcYof1g8A/mbgvauq0GPg1XwY9A8QnTa7Ip1D
 H8KvTUEG1gFECMTWdrw2vABQs4WbwKC4aR+y12UxQkZHVS8hBDqG6ZbgRuy0xfxtR3/FG1uE2
 JrFOxTTovMlY7YPGQY/QxlfYdpiscuWEOppqdzb8zmAbNt6Os8/LCA0BYdqA6TGyeRo3f8MWE
 VXx4vcpDHmnL/9+OdVvqqmO0iBw3gCQApjaWOj2Z7FBmx7lzpBgwgiwRwDQ7uhanCZwEvudM4
 zMAvJmMW4dYYApY8Ln+dWBnaxo/DF9JxiFmgenFNKxSlUMOrk/OEXURPYsdlzuhIX0YnCFecl
 JPGIk2q4lwYYISISaAIW9pX8znfm27hR/x8yLFhj37/HT3P/xoHrkU1ys5udaTB16UAiomiW+
 1fuWcmj7X3lOrepOdo9MKBbpIRoJhjYdtDDJakIcL2P8fABeXQ=
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
> Commit c0c89fafa289 ("ARM: Remove mach-msm and associated ARM architecture
> code") removes the definition of the config ARCH_MSM. Since then, the
> reference to ARCH_MSM in the dependencies of UNCOMPRESS_INCLUDE in
> Kconfig.debug is dead.
>
> Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> ARCH_MSM
> Referencing files: arch/arm/Kconfig.debug
>
> Drop the dependency on this removed config.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/arm/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 83484564b1d9..87aa6e92ee6e 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1886,7 +1886,7 @@ config DEBUG_UNCOMPRESS
>
>  config UNCOMPRESS_INCLUDE
>         string
> -       default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
> +       default "debug/uncompress.h" if ARCH_MULTIPLATFORM || \
>                                         PLAT_SAMSUNG || ARM_SINGLE_ARMV7M

The PLAT_SAMSUNG reference is also misplaced here, I think you just want
ARCH_S3C24XX instead, since the other samsung ones already require
ARCH_MULTIPLATFORM.

        Arnd
