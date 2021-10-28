Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17D43E433
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7jG0DQ0z3bnP
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:48:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7hk3R2Fz3c70
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:48:06 +1100 (AEDT)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9MYu-1mlUWs2sbs-015M8i for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:48:02 +0200
Received: by mail-wr1-f48.google.com with SMTP id d10so10731871wrb.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:48:02 -0700 (PDT)
X-Gm-Message-State: AOAM5313g5Sktb8KtK5P9OUvpGHxcyeCRz6uOwvga3cZa0WRF9EE83dq
 4xJ4+Y9B6fNlqgdznVSKWjHfps7/O0NIOsVpmI8=
X-Google-Smtp-Source: ABdhPJz7TRI3T5WUNkBtx1I3opK6zK4wMD5un05K06gP0B+1Z0NV/fjKsDEnFxUnUXMMXOynp8+ZrPiu5cPB4r2Ft0g=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr6176696wrq.411.1635432482378; 
 Thu, 28 Oct 2021 07:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-7-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-7-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:47:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2JMQvh7RcNaVB9nu0B+1dCHjhJj+aVR0YsfcFrSfFH-A@mail.gmail.com>
Message-ID: <CAK8P3a2JMQvh7RcNaVB9nu0B+1dCHjhJj+aVR0YsfcFrSfFH-A@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm: ixp4xx: remove dead configs CPU_IXP43X and
 CPU_IXP46X
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fU7OYKEBipsSpMT+ZzS0hGWbz3vLAo3c5pX/cgva2C9yatXqt/l
 M45tpBhEQvwH6djpmk3m/VnIks6xhVdcl4ykz+LqtE6/kGFf50ntCQ8TZvLexzVG6e23gAO
 Od9zbAdNT1WEoQ0ctJOZqgSpG4+2X9QlC3S7YxSgicpJp6W2bRW7kwVW0svkGOsZmm/Jd1q
 b9zQ5tns9vphQVAI0RiVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AgqZZU/8V0g=:WDYNX5vO6SD1GhAg7MkW6b
 8U4O1Vxqm4C3iQf85yQ/UJC3a96pCid1Q4LdjvTaGY/6OQsWmyFCvTyKrFabDqVchvN8gWocA
 iUyYyhXJPfw/jgTChUx9DmIMBev4lEMSOzNrmt5HgEmyZ9Fj7x0MkgVXl1kuyGmGO3jzupoB3
 4mWAUTJ+Oj3HDmM+nn18vyT2Dua3E4cEbMTPkfyi3kioUInLMI3yyUVAggctEi10rvDpGx3rU
 WShrn+eZgjMki3EWsSD7NSyCvynJRNL8zJEE+Sl5J47dYArB4I09TuWcF8ATxIWd/ApB8E0xh
 PdSz/DtQfbVCYFs0JFX0rQj2WcB8R7kdNF5T03NoFVImf4R7BixaI4EHApQbOJyh1XxE+sDvT
 bGfKQD/aKQDSpbiX3B0MkKzO/PDh/ZYfH/wlaFaGfgMzNslu2u7qZaF1k5dX4OTXZtvtJUa3x
 3xZrmJOo2FUA68ocYPtITmVOmyir0oDkJ2yvUIsXPMigLYSjQeJvzLH+MuMP5bEC3n/q3NrzN
 HzAy4lFUAZgTsDqZNWr1HoV8vKd7qngD4bj8Nm39EeaQ/BkcZOmOGeqVOaeyU/p/ns3u9yC5u
 fFoS0X3AeUqABEduotikfhZXW6rvYKTdglMPwZ/fQJtiM5IaeOkjnHfhBjHHfe0EjWWtz2Ixl
 mYtaY/WIVqIu3ama7cMwsy2q984EoKUNLs3t92h4PqptZJtzdJivxYxQmWrQ1EnD8jfw1VAHx
 dHU81wV3FjczRHmGD4lPRLWvhuHH51ZjNfCvmoKQTRnSnLIQnpaGUm+hNfN51tyXZG/BXYWMT
 tAC7JTAiIX3pQyhKhU5ONISlnHIdl021QklhC/dJye5ggJHVm/2CZzdVjAv0a6IhIfRfYQJ8m
 MzbN+mnck32JQ6b4h4pmXgCRda//S4/KStqODdgIvfmaAIEJSq7v3Yr20EXphJaKtItO7BinN
 TNRJt3m5PLQ==
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
> Commit 73d04ca5f4ac ("ARM: ixp4xx: Delete Intel reference design
> boardfiles") removes the definition of the configs MACH_IXDP465 and
> MACH_KIXRP435, but misses to remove the configs CPU_IXP43X and CPU_IXP46X
> that depend on those removed configs, and hence are dead now.
>
> Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> MACH_IXDP465
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> MACH_KIXRP435
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> Remove the dead configs CPU_IXP43X and CPU_IXP46X.
>
> A further quick grep for the name of those two symbols did not show any
> use of the two config symbols; so, there are no further clean-up activities
> beyond this config removal needed.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
