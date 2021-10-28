Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFB43E457
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:56:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7sx2Dxqz3c5Q
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:56:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7sd38dDz2xDm
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:55:48 +1100 (AEDT)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mzhzd-1mtUlU0tnN-00vdUB for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:55:45 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1589673wmf.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:55:45 -0700 (PDT)
X-Gm-Message-State: AOAM5325NsLc19n/1y4LmZuyF8pfMhVgIEq3IBCjgiyUDUnk7HD8AY2h
 TH31E1OA8bMQFzJdATyU8CEqBrqxE/+crchctoQ=
X-Google-Smtp-Source: ABdhPJyG4uqa4KI4PxkZID5NK7baIbLWZaHnCQ9DvZVpGK/tLF/blE/NbR3DQZF6k+qtTHAHzW4lFAsVA+2j3CeEgVo=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr5021740wmg.35.1635432944804; 
 Thu, 28 Oct 2021 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-10-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-10-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:55:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2J3Eufd_LL7qX=0bui_PwkN1WATqrrigia3f6Z8b1tpg@mail.gmail.com>
Message-ID: <CAK8P3a2J3Eufd_LL7qX=0bui_PwkN1WATqrrigia3f6Z8b1tpg@mail.gmail.com>
Subject: Re: [PATCH 09/13] arm: milbeaut: remove select of non-existing
 PINCTRL_MILBEAUT
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YNtQTiz/96CWm9xZdNJqgCMniKMUCjgUi1DWNLjQEX2dYoGy98/
 GnODelw22XhPzS5s59iXxVZV8kMqebbzp+IVMhEk7Dl9Cw0Zqbt92DXsm1hapvg01RLinNC
 Qs/ULwX09e0kk4GIykxl3hxaw616tBQqnGT498A0DyAJDxtp1nHHrGNhbt6fXQJNiQSAo+D
 +L4F6Xq3Sx3YRfYxc/KOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HgEpOK3WFnk=:oEvt05XjMskGWQ6mMlj0Ue
 5yB/gUXsywqSvkMBVHt1kH229GBnmKhKKdhTQzifCaxvp6SYU3kAEh3qMjkq9dce0cmkDZgmQ
 y3rl86CMlcwN90FWBUkat+AkR2/77yPSOpwBcKtOvXi9etXQ1pDfr2MZGq2C+8WzbMf9aTMw3
 bzqXHwm0EkPcPLWd9O9+uHvdXgWqwNk06B4UkLjmz38VlMyyN0d0h9OzNnH1En5peTSSRDV8o
 qKZdKI/42JG25bEYdLzuqgXwSR2sE6yH9LL4AmjYqhZStABzxaayKOr6KMWcl8IlxgYyxbckY
 Rco5TmEa0BDYKv9ARBUHj//vtBAUnyQxpklC3eLEnWIOz9BT93KlAqGp0UO5qX9SEo4lg5dQ/
 ha2nDRKivwkjy0l8W+VS+SMlg7j9xK39HiS01LKqUV78aENWHh5GcqKdFmN4P94fPp153cAFb
 XsZiCwR1EpERhnijbnFxLfzVs4kOsX3VUD9Ody6r+GqA2ZdWxRd6qQIiU3EhKt+bCBGdIlVGO
 WIchyNjcbYXce/aLt3CbI6r0DNtI+oX30cWo/hFIcGB1D+eLUEVCzIfk9tdcGxl50Hl1BQoT7
 vTMklt5eXlZR831gQZk09aoHubqHxZhSyEafFxZkGSJQZGMLKvAW+l5o+4A6JzKFUCuvS8cj+
 O7nbf39mPI2SfimsuuZ1NvJCZI384ton4Fs/jZgsW+adZYu88I9G2xoRAjAqpoAb7uphgDi3n
 vrETdsa542feRH5WhMnhhKiEmTNUWSFeNtSiUB6w1Fy1e7fUmqpY4QkbCaMuxniDfOgZJ7fdE
 orqYN3kRahJe7XG1scjxcCMElMD/CbmD7njMq2VUaU9BiF6ZqExLsBfInrCh/KZoV7oN5ms
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
 Jassi Brar <jaswinder.singh@linaro.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Sugaya Taichi <sugaya.taichi@socionext.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> The patch series "Add basic support for Socionext Milbeaut M10V SoC" (see
> Link) introduced the config ARCH_MILBEAUT_M10V "Milbeaut SC2000/M10V
> platform" in ./arch/arm/mach-milbeaut/ and intended to introduce timer,
> clock, pinctrl and serial controller drivers.
>
> However, during patch submission in March 2019, the introduction of the
> milbeaut pinctrl driver was dropped from v2 to v3 of the patch series.
> Since then, there was no further patch series to add this pinctrl driver
> later on.
>
> Hence, selecting PINCTRL_MILBEAUT in config is simply dangling and
> referring to a non-existing config symbols.
> Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> PINCTRL_MILBEAUT
> Referencing files: arch/arm/mach-milbeaut/Kconfig
>
> Remove this select of the non-existing PINCTRL_MILBEAUT for now.
>
> Link: https://lore.kernel.org/linux-arm-kernel/1551243056-10521-1-git-send-email-sugaya.taichi@socionext.com/
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I would take that as an indication that there is no interest in supporting this
platform upstream any more, the version we merged probably never worked
without the rest of the drivers.

I've added the original authors of the other drivers to Cc. Should we remove
all of this?

        Arnd
