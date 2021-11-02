Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C88442920
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 09:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk2fn6jKJz2yHl
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 19:11:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk2fV0Wmzz2xXG
 for <openbmc@lists.ozlabs.org>; Tue,  2 Nov 2021 19:11:12 +1100 (AEDT)
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3K9E-1mZKMD2XtS-010MtZ for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021
 09:11:07 +0100
Received: by mail-wr1-f45.google.com with SMTP id d3so31860292wrh.8
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 01:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM531yZfjIflhjKeHeTX+T4U5B95G0K97h14HMJHOhM2OWRRnHD0rf
 tvCe+PMUqPXbDBvzaHhvezM3ayXxan3E54U7QkY=
X-Google-Smtp-Source: ABdhPJyFtamfSUetI1AbUBIOvCYQczN1Nlzp9gFqyOAdgQNhP9d2hcmJSPJ8rKmPIqsxt4VD5S+rUEmHQuxxkKHrxEU=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr21099177wrp.428.1635840666461; 
 Tue, 02 Nov 2021 01:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
 <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
 <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
 <CAKXUXMyrhrM2o-OEW_qTTKjfKgxt-Z6Nt69geU80AoFnM1OuMA@mail.gmail.com>
In-Reply-To: <CAKXUXMyrhrM2o-OEW_qTTKjfKgxt-Z6Nt69geU80AoFnM1OuMA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 Nov 2021 09:10:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2N3zNkGzXQD8Pbs-8pDL7mv6rneJop-C_p_+d7-_sNqA@mail.gmail.com>
Message-ID: <CAK8P3a2N3zNkGzXQD8Pbs-8pDL7mv6rneJop-C_p_+d7-_sNqA@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kxCYqvbhAhBwgq7ylaJ4lv+0E5Y47nYEEa1sTVllmV6cSJ2MO4n
 EfQ5NGp+3FDTK8DCyUUAF7kAesKXixMIYb0RROV52z7VdWH6z1ro4fNXqcYjyKDui+0Lc5/
 ivlqa5qghQmJY+v5orSiiwAWgS1U6uICn5oFpTsFlB1jnRSHaUH1yHRs1N6QPB81TbIik8Z
 PJPLjcR9xl1vaZDsPlWIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CSGxfiH91zA=:v/N4rcT7DiMc9RdDGE84/K
 RJZnsK2WMVgv/VVMXocfyq9fyT/PjEMuyLEuxZZYxQkC3kCIbr5WJdXok/TK0rTWmBTi+VahO
 mIq4Gj9eZn5gARXr5l9PZp2pzXuuULu2pjivGxSDxPTcI+0FEUhgxQUOw+zcUjVBmC+F7lydc
 i7mvmLuLllsY4jTgYf4vGy9XPcL0YQAI0IbwlrGGbpqZqH7KS1kcf1RjgjqDYBSaJJuOv2T/w
 A89Ra6QHDU2YOSsEh3nhdNHVL96Im5h3xUtZ82BBNf2+Mi1p7Bbz/uw/Q+eZwGVmxHsCEpCbs
 P6gzI3lO5HXSyXo65zScDgMrPtbuhKNRJ+KogingBpsa6pH/HbvJCmp1cvqy7efLaHHlI/bwR
 2hVvaToXp1IEmr9X3ixvJkEO7YLwCR9lOe9iVZj+J94PEli5fwc49VSkn29Bf3mKZkNsF6nZX
 1PpUiWqwMm2L0SOyrOhs9apsUW+PIjD407VhWRV3R3W37Aop4tXDk+UxBKFHpPNc/yfiGGaI6
 muY13eX1MXJMXXmVA+fzVaSDXc6jg1dKfQ9c4lRrLSNfc+62BaVPOw6WO/vVQ/R1Yz1yIEiXQ
 YCxXcjkvUwREUZqgJwhXyknZF4iuo77ilWDHNEz5Tu0RxYhTvMT4XEhoteFBdVa5/MLUTb3Uu
 Juh/OqiRtc38y1uNRjhpSgYkxGQrrxoi2js9H67xU8hherbR4mKBGVmFYdRF1rzDg/RfBr0ik
 SVPdr+gJodHkubHDztjtse0N027Y9NQC/4nqgT2m1FmlW8F+nhOY+DcsM36aPfr3AlH1wOJlz
 McxKHY84VBrtHPiiBG3/cfijAjxM6ATkrwm91zeNi5TrtBLCWc=
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

On Tue, Nov 2, 2021 at 8:31 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> On Fri, Oct 29, 2021 at 8:36 AM Joel Stanley <joel@jms.id.au> wrote:
> > On Thu, 28 Oct 2021 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > https://lore.kernel.org/all/6be32e0b5b454ed7b609317266a8e798@BLUPR03MB358.namprd03.prod.outlook.com/
> >
> > It looks like it's the same workaround as ARM_ERRATA_742230, which the
> > kernel does implement.
> >
> > It would be good to hear from the Nuvoton people, or an Arm person.
>
> I will happily update the patch to select ARM_ERRATA_742230 instead of
> the dead non-existing ARM_ERRATA_794072.
>
> In contrast to the current patch that basically only cleans up "dead
> config" and has no effective functional change, the new patch would
> change the behaviour. I cannot test this patch (beyond some basic
> compile test) on the hardware; so, we certainly need someone to have
> that hardware, knows how to test it or confirm otherwise that we
> should select the ARM_ERRATA_742230 fix for this hardware.
>
> The current patch should be subsumed by the new patch; the submission
> of the new patch is deferred until that person shows up. Let's see.

I'd prefer to leave the broken Kconfig symbol in place as a reminder until it
gets fixed properly then.

       Arnd
