Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAADA43E434
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7jj5Mtsz3c7S
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:48:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 533 seconds by postgrey-1.36 at boromir;
 Fri, 29 Oct 2021 01:48:34 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7jG4C0Jz3bNB
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:48:33 +1100 (AEDT)
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfpKZ-1n8ooJ2ZCr-00gENd for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:48:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so5292822wmz.2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:48:30 -0700 (PDT)
X-Gm-Message-State: AOAM530jH4sxEUBHczwf25vDn/6XO8yxuSviWPIq7lYXryqKG9or443h
 XWJVXoOrgtNBVnmQPLqogfOSGCFAvWYQ03GhWEk=
X-Google-Smtp-Source: ABdhPJzL3MD7Ov/YpXP8VB2S/9zdo9mXJlPWHWLikatiPP2chN2QqBJfFmmZsDznohWi1xDRgcrL/A+XHkQgb3o6kX0=
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr12838474wmq.173.1635432509957; 
 Thu, 28 Oct 2021 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-8-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-8-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:48:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1T1Q5YJEhd5sM03H7vmEWzBmJ_PR3cPsdn6y=nDpyd2w@mail.gmail.com>
Message-ID: <CAK8P3a1T1Q5YJEhd5sM03H7vmEWzBmJ_PR3cPsdn6y=nDpyd2w@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm: imx: remove dead left-over from i.MX{27, 31,
 35} removal
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zomkY+AN/fpykBAJK6pao16mwnTvudZ4oHWjs6tK8uoOB35OEGw
 9HUQtIx1k3wd8NtnFiCcV9khmv69KnrYZFUM3YRBU2yiY8IIsXDu1ES34BgyNHqmU/7WnYr
 wzJZKtSjOiQKyDWbpV34OQVIMvylG2WqMy6u19WCtUOXcpVP56SknD5G4gpnV5plqILny9b
 2gs95ct//o3xMsUwcBsfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HNtuFRFmWZA=:ZRCdNO5H1Xc1CIcQKQI5a3
 sGHjw0RdBu8no6ncTGLTDFFAkDcKacSQKBdRXSjAuif2M1r5KkiPCEteMy2awa36isE3ZWHxy
 5hI7qplHUs7MxM59KgqOLNKG8xDZS8HQ6e5XNaifcnYRxhObigeAQ6ZPA87OVqu9q09qBGKNn
 tSF3T5p5/7qwmnSHMz1zkFgnaR9nPl+bmMqwxn7WSIiU1TuCBDcLIzE4WLHe/bBwCogGq0cJI
 SNgCEkqmc9ud4LD84+pEvxB95RwshuJKLj0uHaQGy+/n+lBLns9jtop2H+v7gjTJ0Z9X9I1Qo
 sXfgbH9VS0jW3qZNy6GozZchRDmlAgxMxvYMzJ76fiaIdIE92sO+hoOrRbUORlqRD2kD/abSQ
 VvYdH5d1J9N5WUhKW8U1xbO+rhJv79YCty80PYfNtdPiM9kBJOBZfUJsoMB5rjAKQqswn/h+J
 4E3Ic9IWH6yJl1Yoo2MF8lkI/aP5mr0unXnbLn9YGE8sv8/50xC/sSQ6CDDMHpAe4V0RPmytY
 F9hu6cgNjmTBMqvTk9ax5aGbDd0QB2QHgeOGRyVPtpOV4Hb67jNi9UE8OYZZoDIAghkKb5YQN
 m6fJZSVvP+HqCt2iGfm9BXCp7VpRpDVFMWetdbn8cHRk7HdfdeYSs6sc3V8P1s7WPpXw/xD18
 ZZmWdfvgQFIe+cQBt3+m0YMLnMS7tgvWv4LJq2No4Li1djMQF2oLPgobffTiQtZS1Rlmm+Vnj
 jQ/M5z4JOxezf3LBh6hNg/9qft37RPQHxkD5iRSyuA5ZRhOPCfBij+unK1xeav7UvMlqNXOl6
 IUySgbQ0NZRQGSBWxbGnCl0ByELJuzX50DOPBcUx/E98fJx9Hc=
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
> The commits:
>
>   commit 879c0e5e0ac7 ("ARM: imx: Remove i.MX27 board files")
>   commit c93197b0041d ("ARM: imx: Remove i.MX31 board files")
>   commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files")
>
> remove the config MACH_MX27_3DS, MACH_MX31_3DS and MACH_MX35_3DS.
> Commit a542fc18168c ("ARM: imx31: Remove remaining i.MX31 board code")
> further removes arch/arm/mach-imx/3ds_debugboard.{c,h}. So, only some
> dead left-over in Kconfig and Makefile remains.
>
> Remove this remaining left-over.
>
> This issue was identified with ./scripts/checkkconfigsymbols.py,
> which warns on references to the non-existing configs
> MACH_MX{27,31,35}_3DS in ./arch/arm/mach-imx/Kconfig.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
