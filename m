Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070043E45B
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7tP1Qxlz3c59
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:56:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7t72nq0z2xrC
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:56:14 +1100 (AEDT)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTAJr-1mEMhn0Hk7-00UYvj for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:56:12 +0200
Received: by mail-wr1-f48.google.com with SMTP id v17so10680192wrv.9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:56:12 -0700 (PDT)
X-Gm-Message-State: AOAM5314Og8FJy1de6s74IJlg94IGYMcEXOHr5KnTqcSpOoTCWOpRz4m
 tb4xRco2vPzPaRAmFe23joPePfdsb85GuvFN4kU=
X-Google-Smtp-Source: ABdhPJwx9NcCmHJMSLM29R/SVHRZzG6w605oc3D2wfqxIx3V41SSM8/BC8wbtl7pPHOGIthLY2prb87n5I3vpE71OMU=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr6338651wrb.336.1635432971649;
 Thu, 28 Oct 2021 07:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-11-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-11-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:55:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3O0ZGmvaZkRnBCjqUG70+CpmitP2RebW44y=JCEd92Kw@mail.gmail.com>
Message-ID: <CAK8P3a3O0ZGmvaZkRnBCjqUG70+CpmitP2RebW44y=JCEd92Kw@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm: nomadik: drop selecting obsolete
 CLKSRC_NOMADIK_MTU_SCHED_CLOCK
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DJ4cb0Zi42cAo1Mj9nVJFCcNsDPK4F8oVM7vzHNHKU0aAtgIlwz
 RXrircpZ5He+/V0fvaFf3J/nrq5MMq+Wh08h9gFlCf36wBu/BzG1c9As+/zMXV+Vxt2pV6Q
 yv6dsZ3GZKXWeb62eOoTtEw1yDtR8F84zR3iL2Cl5weMzFXFyeYlwzLOJ6/hK2mTgHCIKbf
 wlLU+/9YKL8lHETPDJoig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bkrCeInW77c=:0x9FLs2RfMtOiInfuBCBa2
 rZNWrjtLvZJDKMYcuUKe6SXjmkX2Ju0SFFsT8sKAC+7aedW02GuYBOt4K5NfAg/VODGooNmDx
 X+800B3WdbSB+wtgpl7CXEASn1MlBU6HwmEHIwhGBuQe0qUfDmjVTFlCPITlWAhUezj0wg68L
 MvNSWQ/rT6lsibWQgHPvsNF4bWGFi8E64odw8Tbp8rFZ1q694qdLiRfT9pgPzLzTO2tixFajL
 zLKZYhvFndSGDpWXadL7r9IfmwDjtHCwd6hnfySWi7V7mWYsm2mm54V6I2qf5lCVRGHwQq8oa
 9u4D7x7LMvR/sSjXi697Rh/xWF+7YlFtyl/A6q4b8XN6utnOs9oSIFNXwEmY01ZzNVk2Q/dFQ
 lPrf+SEOCqvT9HkCOZOFUXu5/xOMAhC8lc+IF9q2F9otAQInz2l3zxlL+c4no1ZaZnzAofxnF
 Nfb7VelSQfp/fgtM6XFeecXwCfbimdtCUPBYQ4CJV1xhko0tKzMKZkPLkwBUy+bOrDmteGksz
 e8x/l9pi4MSTw/hNEKY7vgSq+xyNeDrn/woedM2158GDIw4bY0mjovRQ/BMlmM2OnV+8Z2gt+
 48nMHAki4USzXBU+2KqBvzKO5jzP8awdDWYpnRZ+6765KxKUve4W0dBABlFOfNSsS9nL7C2xG
 HzWdckbOJQfJkkwqE20LlF6x1YvLMNe7lBXNaWVzrvqnwfeU2HCHutq4stHDU9e18GUgi8smm
 29Rn/ytuXBpEOdTQqFlI6lZhxFVPrPWlLUkHKSPBFkVCQkVdYK3dBWFG4GVcAKw3Ef4D47qKP
 +Ua/iPuFmStLyXdHXoUPLPnvkKB8C8FFeR3+d68NPJQYk7JbaNSaune5mRb1zBj4rvhzuH4sE
 JtnlW+dkIsnSLJKbbarrVKvXJtrFpIDgoNcKpZlthgmMRfrqOWfDes2Tm8mZvsHuqwXSNKyCq
 s8bxnpkiABQ==
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
> Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
> SCHED_CLOCK") removes a sched_clock workaround and its corresponding
> config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
> effect and ./scripts/checkkconfigsymbols.py warns:
>
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK
> Referencing files: arch/arm/mach-nomadik/Kconfig
>
> Simply drop selecting the obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
