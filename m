Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B343E40C
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:44:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7by5btFz3bmk
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:43:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Fri, 29 Oct 2021 01:43:41 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7bd0zxqz2xDg
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:43:40 +1100 (AEDT)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4i3d-1mpcbm1Lq3-011hc5 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:38:25 +0200
Received: by mail-wr1-f53.google.com with SMTP id e4so10590830wrc.7
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:38:24 -0700 (PDT)
X-Gm-Message-State: AOAM532PTQjgOcRrAG4T2+xjt11JAIZ+moQ1vb6AQ4gjxcSr/tfSaldN
 tnhJj5j/QjaIvEDs9zi3U8RGbOvzMO1i7y6SCBk=
X-Google-Smtp-Source: ABdhPJwEbUzPqw6Qes7yfw3ZhWk6B9QYudD6+r+R+eUXO5VRnI6SKME4aCzk7a7O2pmBiO0ccl6r5d8I2rAIgWwZUKE=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6346128wrq.428.1635431904641; 
 Thu, 28 Oct 2021 07:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-2-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-2-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:38:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2UmTj2imJWdeLHX0TTV36Hk-Xx5c3j8cPe+Gk33-3Tyw@mail.gmail.com>
Message-ID: <CAK8P3a2UmTj2imJWdeLHX0TTV36Hk-Xx5c3j8cPe+Gk33-3Tyw@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm: debug: remove obsolete debug code for
 DEBUG_ZTE_ZX
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4rccDk/vxfEnDqMzUVO1eD0JH2Ow3vaX3cr6y+MJiN4+dGVnpZ8
 7BOuGZCfEKUOPJ9i1VP+BFo8QunO7kEajK7CZP0I1ducn7Yjqu54+HwsbYLnPJCsixBlfSF
 g8d1g9K9UTVNRW8AyuvjODRgmyVC7LNuPRY5NlOQXaiZlgayC2ooYTDIGDxtcn0lqr3xPSn
 y/glUF1a+mC5cWSQt0prQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VOzj8FnfwVg=:xvtynY5JJ9fLjQiFdabIqj
 /VwMQCGsRykD5SDzL5WoHkBRg8X+wVHSXnV+j8n/VokzNqbLfZ9+jPCjgN9HpIpt4DoJozgrs
 qUBGDlinSaJs68jYZMF8KsTqI4thYIeU8teuo9EEGHplSGVX2ZTzdqJqgcPiSC5zNTBSB2VT/
 VI0QGGAzDJ6kzkPaQmO7ljYJBqjo2Jow82np3PLfJprmBCa8nLLgTYc9zVMjTNXtcGIV/46fy
 /AIyHB6TlqTPAJ8YGcu2I2LbRu7Iw6gQNZ3hFD2rLKpDcWm4YxPN6H0aS9G99fkPp12XxocSU
 tYz3yyDP4XC9Elobnl44fnxB1XWiYl2Ulc1tcc7KvRu1gU8k+N88Dv9Va0jB/NFUo3EtKZieh
 w56n9H4XyGEAX4QR+fbTwWG+GHBkMAvQ5eJp1JjSDZxtVKHbk87EzTFaWJommSKF5veLS+mTN
 WbINpmcKUZrSHfTvggzNi1f8vGr7JLcw+B0D+Mn/JWLunv1cA84RXUNYt3HMhLK10jAC3/ryl
 APZPWvirjYtdDQrVFDl3SspSGVO7r+0Ndu/sPDcOl/c7yQyq9EXxqiiy7Y/n8xJyTfbCSwMx1
 NgZJ+fe+nA6o1O6Z1zz9eWsthqrFC+IKLKwUA2dVaowxR4S3Fe87jqEq7XmZeCRBdfNtUm0ZM
 77QRc7inCUhHBVrgCOPAMlNDEy2Ri8+hqSgruVWVZeU+M17i18hsIm3Ww4sK6cI26u80=
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
> Commit 89d4f98ae90d ("ARM: remove zte zx platform") removes the config
> DEBUG_ZTE_ZX. Hence, since then, the "ifdef CONFIG_DEBUG_ZTE_ZX" in
> ./arch/arm/include/debug/pl01x.S is dead code.
>
> Fortunately, ./scripts/checkkconfigsymbols.py detects this and warns:
>
> DEBUG_ZTE_ZX
> Referencing files: arch/arm/include/debug/pl01x.S
>
> So, remove the obsolete ifdef CONFIG_DEBUG_ZTE_ZX.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I see another copy of these constants in drivers/tty/serial/amba-pl011.c,
which we should probably clean up as well.

          Arnd
