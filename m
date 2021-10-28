Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A543E46F
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7x03CYCz2yMy
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:58:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7wj0bqGz2xDr
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:58:28 +1100 (AEDT)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Md6dH-1nEtRi3QPb-00aF1D for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:58:25 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso4841476wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:58:25 -0700 (PDT)
X-Gm-Message-State: AOAM530nS1rLYzS3+mo515D3cgea551ceX+wsu60ki8c0nU7z62nuS2C
 wQNdgaEfOm/rkBhl/sELkKzwrW/RlGextDORJf8=
X-Google-Smtp-Source: ABdhPJyxtaNUvQd3ORnZZLVNyfjqzZs6I7zhKEo88W2DuaBpk6rVRMQ3tnGcCmQgFkwreY3eIJUseYuOL31zp8mKkaA=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr5036190wmg.35.1635433105169; 
 Thu, 28 Oct 2021 07:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-13-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-13-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:58:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0qjnVZqdO7HV+gMGOQN4N9nR1KbsxCYuAwpbDWvK16Vw@mail.gmail.com>
Message-ID: <CAK8P3a0qjnVZqdO7HV+gMGOQN4N9nR1KbsxCYuAwpbDWvK16Vw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm: socfpga: always select PL310_ERRATA_753970
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h5JQk7ms9Zpd4AkrzsPkgoVyHNm+jTFb5e9kqiDc+8ju/zrZUXv
 ayCF+OWp7taPM1URxpPKQxhTCHis7vTOnfVc40T09NMjfLv6JD82hh7L88qq8VYWcua9wn2
 2c/GCKNN1hf0v6h1WdyjLvOk35EHsvc8C4bxyV+uzRwbdUynHR+LYdMHzAW3OUSMUNQoX+U
 BHy44k4i7FxtK733/8qkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:va/JAXK1M5Q=:HX5ODrYnPWMTIDIlSmummq
 Ka5BDXdvixOoX0JFj+tWJ6WxmpCMp7ZGWWXEgT8zro1f04XrAn+DV7IZVdpelw/YUGQEKZfbC
 nMpMBHkJ72vtq3+IaYtxPnGl214I6tJCxVQhXFR3VeVl1alnE4fuUcz7MgxjRqtU6i5ec9e6d
 vnnJ/sJ7uAxQqXbhZV5f6TpQF+NP8ngZ2fOF0OBziNNbbmCebyLp9Vou/WPCDfzY3Pj6cHvWT
 Y5smR077zTG+8bQJynjuzPYuuLyhKeEOXxdq45pNy9jyMGSrzrExU3WsvVugwYefn1iUHkrA8
 /17Rh5Rb/ODtXrOcuU4vmHyVUc7Dyi6peZPftlW10ExUyewNHWX9HcBJWuOemmW+J4wIgjC2g
 euZHW4mhvi1OpJlqAnBfPbjoLsPgY/Xu+zpL40rsaS+fBkywHGZuma72vZgge+Mf8I4/pj7eT
 x3SQ7TC97xX5a8vM0hap61o1WyHOYiyO79+bdVrS2uBFdXxV4hXYNwckK8DYqzhzxNuUmtwzM
 QCzeNvZXLex/BueN4ckk9cPZ0upW/7+9rkTrW9FNB5tiG0jc2RMbe1k5l4DbO5XYh8TItnP2n
 egyAjyBXFNJrIMcO5R3tEBqTHKJ/symmqpPzNCQn8QVrFJMby4eBOW/TZ7w9a+cPGf3pCacxO
 TJt26k0gZ2tSkk66+GchAMtCnoR5F4q0Zvm5f1VansC2lJTld86Et9E1rWfhnaIkQRATcCq70
 /dfe0SHzxswv8DOQXBZEaQ/tyrq8YQl59oV8rrKUvg7gFNB/HFYYtHJXVqkPmEW5WQktMJgLO
 mcZG55T2NYTUV/I0P9CbNbOKVydQsq748pgSI4QyUztQ8N8mMDCT8Ftw4rll5XpqPfOx34hLK
 64+k6x6iTXCzrydy4FIp3AVaIcPXWqzl3iejkOiHoD7rmOf8Dv9fN55F17opko9RwnyZ6us6B
 J5e3yDlCXKw==
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
> Commit fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache") adds
> some selects in ./arch/arm/mach-socfpga/Kconfig, with one select being
> conditionally selected on the non-existing Kconfig symbol PL310.
>
> Hence, ./scripts/checkkconfigsymbols.py warns:
>
> PL310
> Referencing files: arch/arm/mach-socfpga/Kconfig
>
> Assuming that this errata should actually be selected for
> ARCH_INTEL_SOCFPGA, simply select this config unconditionally.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I think it has to be

       select PL310_ERRATA_753970 if CACHE_L2X0

otherwise you get a Kconfig warning when building a kernel without the
L2X0 driver.

         Arnd
