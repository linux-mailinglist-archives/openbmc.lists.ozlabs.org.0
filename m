Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF5543E47A
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7xg165gz3bWb
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:59:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7xP3szDz2xDr
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:59:04 +1100 (AEDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MxUfn-1mrI3o4AaP-00xpWc for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:59:02 +0200
Received: by mail-wr1-f50.google.com with SMTP id m22so10817123wrb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:59:01 -0700 (PDT)
X-Gm-Message-State: AOAM531YpTMNKfwnOKArk2Ev87bQfRN9wWDSMuRiuVgMGBi5NttM01B8
 u8YjSS603VOrtM4IMFcst96n7Cx5ffuuiKQPRPU=
X-Google-Smtp-Source: ABdhPJw1mral72Qddmd3GHMk122V+V5lr3a2+Rc1twCjQmgIEQujpYyDHdDkNkrUj9xJwnLyI7GiYnIxws+p/FRx9Gw=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr6244203wrq.411.1635433141663; 
 Thu, 28 Oct 2021 07:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-14-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-14-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:58:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33cMrabWU7i=cT7qVJui2--VkNr2rx2BmKX5qSyfpGpg@mail.gmail.com>
Message-ID: <CAK8P3a33cMrabWU7i=cT7qVJui2--VkNr2rx2BmKX5qSyfpGpg@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm: pgtable: refer to intended CONFIG_ARM_LPAE in
 comment
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nOBSFF3duElTPGoVy0G+2HwQ6byia5zSxNNWM+/y8RzRHlL33dg
 VVphG+XwQvha/8z55HC2n+pznvSdX90r4Rb8gcI1q0wi4OfaaWxNnAeaL6v0PJYqjcYOBQR
 oIFo2yzM/O/611aCwbeiHzNMkxyVWlrSvPnHBwQ2L5rBMTTcmniwhQ9LNKLhOHbtxxywgcC
 LIHih5Pkc38fqaLEFTTfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PQMezIM4XZM=:mP0tfSOl/Zj6RyzKj/AMuN
 vxKlGWCedEGdmSnCxT6B5v+dyiO1jenw6PGFJdu7WViUTBR3uQT+cWCi26FZ/m2+ETVcAH0O4
 DrYcsTtdRcJvOk7WYZ81cuh2GPZqq0RrqrDFGcFizhXuSlgddX67DXaSGSd/t8Mjswb3Isuq0
 wY3o0aCK7dNyxcGIleIyNiPlQbvsa37pETOdfSGc8U5mz9UI0mz/dP+Z/nHWqaUaDHGmWQUXo
 lkCl60W9Pc2jIdA0j+IMKorvNW3mIxHk+ItyB5As9K87wQg1UMSESHA7/2Mp3VIzF7qUafbw/
 gOFhW9sgrdGCM/yPk6/dtOunABE5Y6Ra4UmtuPswBzs9COCSui0s/O5vuXOJUU5Ijk89gPMc5
 yYAbnNiPflpy6LvyHFXBIbfY61qlNjL6snJGsSyzijRXhbMfwmIoQ94MMgEM74WmahqAbRXp2
 yEJd0YeVgp5+RzqwL/J3kiYbX37APwFePUd8z+5nAkTs/mrUoGmgt/GenF/HQhdXlyhO9Mjs8
 gwvGQNDIKovcFwh5s2TUTJq6KGfgsWRORiG2FpIPs7mhgznagh5lxsPyaILxkgmNp4SQFtH3I
 T7IVOKCYUHN7OR1/ZNYHwUgaWp+3TfCe2zUKAbYOWDrmWrH5KH+6zPUnk7mDiOItCZfNRfzKp
 oDXtHrGctOqK7CAV6sGYdw6R+WuGA2FWJHzj1Or1l9N2S8MTMkSqy1M45IQx11UCnXYE+ehCM
 nS8PkjQo2hL7s/vKWcIAwi0QTfmNAgkFiOWgo8pY27RX9TcP+6ozkFpuShnt8EiDiuzr3MMsP
 GBhTbZF2dAZKdTVcU3w4ElVMAg4BojPGVmCbnyKiqqYIDtM+oHImKlnbQkegVXlpPWctak95Q
 P5eP2+DLbg3/Uxs7HDNO3k96O+c4iByYIkd5DHis5/LHOCMtenlprhxkXDK7yvzwRAgpnVumm
 3CYIJ1udgyA==
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
> Commit 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow
> memory") adds some nested ifdef's in ./arch/arm/mm/pgd.c, and follows the
> good practice to annotate the endif's with a comment to indicate the
> corresponding ifdef condition.
>
> One comment annotation refers to CONFIG_LPAE, whereas the config is
> actually called CONFIG_ARM_LPAE. That imprecision in a comment is probably
> tolerable for all human readers.
>
> However, the script ./scripts/checkkconfigsymbols.py, which checks the
> kernel tree for references to non-existing Kconfig symbols, identifies and
> reports that the reference to CONFIG_LPAE is invalid.
>
> The script ./scripts/checkkconfigsymbols.py has been quite useful to
> identify a number of bugs with Kconfig symbols and deserves to be executed
> and checked regularly.
>
> So, repair the comment to reduce the reports from this script and simplify
> to use this script, as new issues are easier to spot when the list of
> reports is shorter.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
