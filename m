Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AD43F703
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 08:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgXBF5GLWz3bjN
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 17:11:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgX9z5qbyz2xrl
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 17:11:18 +1100 (AEDT)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3lkT-1mfW9x3Zy7-000qCT for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021
 08:11:14 +0200
Received: by mail-wr1-f52.google.com with SMTP id p14so14394370wrd.10
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 23:11:14 -0700 (PDT)
X-Gm-Message-State: AOAM533SgyNJP8GQaujIVZizthu43NrRzEg241Nf1FnXx71xxJnyFxEk
 icSDBRy43+HdNFg8gRzloxczcrRjig0aAxGy9bQ=
X-Google-Smtp-Source: ABdhPJwENl0lAWE/EeW7xF7c3aEbO+0aPjV25KNsBdVmMWadlEx46buYfEUwTdiI7NuHBxxiio4Gv7IDn9QC8meFjt0=
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr241910wrx.71.1635487874204; 
 Thu, 28 Oct 2021 23:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-2-lukas.bulwahn@gmail.com>
 <CAK8P3a2UmTj2imJWdeLHX0TTV36Hk-Xx5c3j8cPe+Gk33-3Tyw@mail.gmail.com>
 <CAKXUXMzsEyqKs-OT6j3shTLY1pbS1z7O1GSn36+LxKRLQQPb+g@mail.gmail.com>
In-Reply-To: <CAKXUXMzsEyqKs-OT6j3shTLY1pbS1z7O1GSn36+LxKRLQQPb+g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 29 Oct 2021 08:10:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Wd3Zq2-ufe9zfXrzSGOPe4mXNH+rTAnuL6sSTQF+EDA@mail.gmail.com>
Message-ID: <CAK8P3a3Wd3Zq2-ufe9zfXrzSGOPe4mXNH+rTAnuL6sSTQF+EDA@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm: debug: remove obsolete debug code for
 DEBUG_ZTE_ZX
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PsYU0Y/Ns62YyjexKMUupqdsOHYVmiKpKf5wWHGaJWAXHEnXhBx
 uCLNWse8szamqMrDXQoD1Pvj3OzOKlFHZFZ2XcXeLCAJ4EWNAs/JBauDpxWU61mXaSy2/3i
 00uQ0nGaIfTZYDxK0qGqisTIZb9IMxgqo4lSt4SVOMfYc4qdFkWn9WyZQHO8bnXResWhM+A
 ZW+sr3koM/k/3v2Goc5qA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SykC7T1Xs0M=:vjmi/olqjoY/ixzs9aJcfV
 uRW4mHaWN/ygp4yI85QGIk0o3+WiignCq1kulFCNPuPkbFyMWSN1DDQRqHPSNgZSbjdI//b5G
 VGXpAL6kIaYAqZs/ZxqmcGENSw3y1Mlt8rxfpfXADP7lt9XbPCw4HiMraAB9ODyN+2WuH8c9F
 J4RaQs0W/BbWALqCW/O0+O31OoeHDvd8OQj+PF2a40LGW3NdgDShwkPaHEOSGQkttWHDZ2aXU
 FGqkKH5lq1ZXajoCaRVtKhTI2zuKxFIx+kRCON4pVOX6O42w1K3h7YPd5MmH9BqfMkjMlkITF
 foXRQgcvzq5xyhROVdVwVbDAEk9IkuIag2InP1YS+YGZJfBJMruvbAyUiT7wA1oiBPguxAFpV
 cuh1ot5JB/f+b3SFd30egmE3ptGQVfKjdKQAcl1BN2eVXE++NJmzYgZSqZgitAACyaEML0OT2
 z7InT0ZTY7GI5VR3ROeSuJp3nfz8/F7tC6QGOZMU1BuKogKI0gXcDDhawkOTHDsaUaQxPYJ80
 uopENEAM+f5BaDpAzjtPa7APr8FzHxxFhsqOej1i0fMmCErF6UD8vT+rDyo/Qg64XkByiHqR2
 KjTDNE4gTtKH8XeUjn4Dx6EEUEViof8fRgqQAV+puGA4YtsWsWSiqbcexEuoSI2rfY1NnKohV
 ybl3TpaJPcTCBpbrbHqeEwM0IZk0Q8bF9ZLmC3ExB1UZ7g6Nst9Zk9v1bxZJMLzBiBgpKvggC
 9ngFsfmzDN5ziN3hJyWk1qYcR/cU2WnUtCscj2kEDd3tGyeM3FI3EkLRbW4d6EOKCQhwVZa1u
 dyQcocE98gpTg1dkhhEMmTUC3FvqkwraFKWhZxWb6TeYqbf6yc=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
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

On Fri, Oct 29, 2021 at 7:34 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> On Thu, Oct 28, 2021 at 4:38 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
>
> Arnd, did you have something like this---see below---for serial
> amba-pl011 in mind?
>
> Then, I would adjust the patch to remove all the zte_zx serial
> left-over in one commit.
>

Yes, looks good to me.

       Arnd
