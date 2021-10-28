Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6AD43E461
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:57:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7vW47Cjz3bnP
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:57:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7vC11vFz2xDm
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:57:10 +1100 (AEDT)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MrPVJ-1n2kQF0vaR-00oUD2 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:57:08 +0200
Received: by mail-wr1-f42.google.com with SMTP id z14so10717831wrg.6
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:57:07 -0700 (PDT)
X-Gm-Message-State: AOAM530orbQehTAp5ANexFApLxlGEpN8r6UkwIhGNAlhhdHrAvxZWp5a
 7nRNvNKp/PUcqUXIPxJLKXH7WW71Se6pyp2ol/4=
X-Google-Smtp-Source: ABdhPJxP1grjJwE+eREFwm/g0od2WsyCmYOCzERrnEnwT7SMwPO/+TGcXtuVQVGPKCHOmgziQBHKU/CZ/dq+VUSxnJ4=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr6397722wrc.71.1635433027582;
 Thu, 28 Oct 2021 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-12-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:56:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
Message-ID: <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rkmUoP/Ws1avDSK7Lvrc8I2lI/GXgm67S8O/VfYpwqy229RuEzh
 bIi9ovA/rIlOrnR2VNcQx4jyOgIA3vFbBa+H2ULpqHwaMYXfRutwQ/o45B62ACVNNeE+nlm
 70qcn5rlKk4OKU6P2ML2INWk03yojb6HolY3SuvMld6k+IcqUlAnldO2Rg1VKWNBN9WOEtO
 V8P3RFu1vFINQlzZsTULg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GL9PJrPFo8M=:YEECC3PZfO+mCKYIDGQrLe
 fYNts6hlrwznR/9OVT+aCSTjwztLflGUlU9GrJTerokVNLgmgZ/s+uOx1j+f3ycdMM3zMMZ/q
 J4CfpLBknAHk2yrDybkYR7GkjSSMF2GsZPTO/JElV0ngYu/aus6p6MbOHt5eU1Q/hEmUfa9Y2
 rB4Fy79pv4A902QDN9Tw7MFDjk8A4iYsAOwvjWpjEdJFNRVMjbJYEwa57eimd9wivClfkTaj3
 D3OBCDM+J4RdEsVIQkpM513I9yIGJRMYNyOgm6Usz+O7faY7ASwBYrqvB1V20MFdSwRxvcVXO
 4g6tI6I5u0h69U/n95Yi0CObsyW9sAGomDyNQBcPlWxvEuZQf14Obxu1WyQXXJ1tZwNBmtfIf
 GyIAQHwCP3hPGXSsx4PZg851V/BRPE6C5tWQiQ4PQ39N7i4JTGWsEArBkvHpXTR2bqqbUsZsC
 H+Hwd5FbkLZXGP9Gz1I5kB4kzKuPc1VYyhY2mI4C5uUG7mbOU9tAtLbcU20QQAvzCgrx3yfGK
 mMajljNPi+nBpll/b6FZZiJpGnloa4vX0/6ttXk5paFFSZoOM7Gv6ntMuEszmqUOTNJNErU7p
 VPkQm858sZ+2RJc6fcBtOfpRsAFBY920loZxeWgCMmGZ70+rOVR4Wu6xD6lyougg7r2ZU+4Ha
 pKnXrUgKhAFpHBD6wg+K1SMWf95hlFPWAaxK9TRQv8oODseU/s6Gjxs7busbwLV20PSMZ8DUr
 2zjIKaHGDXMceZNoHF06stHDK2MVUPAP6nuNgqiA884YNuyeZEJuarpFO4M1MbU3KLVVZsDP+
 FCqzEm/nPG5EjGZDo+4lxVWpnRglZGSO7wjqRH4UsWpG0OC3hAk1uhVKtOfkfkO1isNQmHc
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
> There is no and never was a Kconfig for ARM_ERRATA_794072 in the kernel
> tree. So, there is no need to select ARM_ERRATA_794072 in
> ./arch/arm/mach-npcm/Kconfig.
>
> Simply drop selecting the non-existing ARM_ERRATA_794072.
>
> This issue was discovered with ./scripts/checkkconfigsymbols.py.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Could this be a typo? Maybe we need to enable a different errata workaround
here, or maybe that code is actually needed and has to get sent.

        Arnd
