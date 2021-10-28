Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681843E43D
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7kY3Pl5z3cDr
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:49:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7kG3lT2z3btR
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:49:25 +1100 (AEDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MZT2u-1mBsm73fOQ-00WTfL for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:49:21 +0200
Received: by mail-wr1-f41.google.com with SMTP id s13so3502042wrb.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:49:21 -0700 (PDT)
X-Gm-Message-State: AOAM5320gNMIs/zEkXHnG/xeiRBNVlpe4QjV1f3tRPLO0/E3gudP0HaO
 9pxL0aQh/xet4A7zY0hh+o1ASrfNTgJFX1dC3Ls=
X-Google-Smtp-Source: ABdhPJyZaPDPCoaDGyatBTS5bhSohWogOcSmV50vy7mFoGeznOuDlcMqq0iyn1grr0cj7qSdSBNBCx/C2MgWvgadgZU=
X-Received: by 2002:adf:e292:: with SMTP id v18mr6094633wri.369.1635432561472; 
 Thu, 28 Oct 2021 07:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-9-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-9-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:49:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ZBwDdgZfwLMPqfV=MrinyiZ0vYppt_2PLviAbHNKZhA@mail.gmail.com>
Message-ID: <CAK8P3a3ZBwDdgZfwLMPqfV=MrinyiZ0vYppt_2PLviAbHNKZhA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm: imx: rename DEBUG_IMX21_IMX27_UART to
 DEBUG_IMX27_UART
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4FRATgiJCDlVi0y/TAzP+NafE68PAq+/OuG2/juyXIWISPFRGNg
 VTgSnmRbUhvdxy08A0tr7yUad/qSSRE5f+j8zUDbeU/gFwoEChWhnhqb8jmHA8p1FOpxxjE
 UKigjTHjYsV/mHngPtnwy0gd8RU47PKZDL1ATaJ1pvi10T9hJg9cqjTu63PIua0WsIfBkW+
 /F7EevfQhIwt9bXaTa6hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UKm1MHdGzQM=:AJACMJJyUInaPkrMp0hfIZ
 VOTKJXgYVHIfmOy75Lfne47ZNTXDLhS1D4zx7KBMDyD8xfLajzDadHDZC3/uhG4xzXgHWKfz3
 moZ6YBK/BEYqFW6U2Ba+oYlsSc5reeMw2Mnod1ZFCJFu5KbnLWDtEfRQs8W9ewgd7PHIyMbz9
 4Wo/PMr/L0+ya/2RPoR9KoV/gn9eKqMozU+Hi+x7oXdzMYlzN52kIaGoQl1Z1xF2yZ4cjD3Nm
 m7EM/n96j2TTBLPNjYVF9Ndme+lPvylnWgdcH7rQGkt4ToFw+djP9Oy4OLJPAmj5nDNJx1nP9
 addAOEVaS5+6CoL1sgu9E4vfFsK2iV7m7JBHj8wBgsv203U5F3fPw9NVp9TZxAK+9y5SVu9Ct
 KQ5bfdvu4a9jdmB4rmITOi4HtqQ9XfIDdiwlIukUNeGx+XGFPn8A3w+snASm1DzDWbq/tol2y
 8r2EXsZWa/1VJhR5eDFhQoZ7WCNfyVk0gxQYPaXK+8Gsa+7bNfyD7SeL0e7fLf6dnNAuXje/J
 wouN0NwOIu/PpVuVWKhvFMhDM9BKNnzO2VXm3ptFrdLD7lA/Au/1f7rYHfQE6f1TyRzk2HC8B
 j1Q2Mw36vVAjC3WeOEU7suL58evXRAN6MpiFRgLAoRGYeJ/e0Xc+Ijoaw1OS7Dgi4Bd8zbUyI
 MZ4G4cpddgtBgAwahoospEKdnrW0C1bbR0i9fL0APsToem5M4gr92tLXrK0T9cfr9kEjcBqbx
 o8MfIQPDAaYXUN8qmndxRUIgLAUf6kQkN3lkWX8x1wr+Uc5r1A8QQfW8GRic39n5ZcYOi9SDx
 NU4ziry/+0ikUlRD6ep17XVqb6HKggQKwIlR/VNKpASvS7rSpTLCKThgwWQFc5sJVMcGm2IWA
 G6CNK9KwDaU4ZlYdh3sEhZ+vyt2gKT6meuGfyNqLQm4hq8u9egp2e06B5fAemLYxns1iTgmxz
 /CzgzJSnxNw==
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
> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support"), the config
> DEBUG_IMX21_IMX27_UART is really only debug support for IMX27.
>
> So, rename this option to DEBUG_IMX27_UART and adjust dependencies in
> Kconfig and rename the definitions to IMX27 as further clean-up.
>
> This issue was discovered with ./scripts/checkkconfigsymbols.py, which
> reported that DEBUG_IMX21_IMX27_UART depends on the non-existing config
> SOC_IMX21.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Reviewed-by: Arnd Bergmann <arnd@arndb.de>
