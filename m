Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866181514C7
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 04:59:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BWDS6c5yzDqPk
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 14:59:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B6Vn2XKkzDqM9
 for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2020 23:25:51 +1100 (AEDT)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1McpaE-1jYTqV3ivS-00a0SJ for <openbmc@lists.ozlabs.org>; Mon, 03 Feb 2020
 13:25:46 +0100
Received: by mail-qk1-f170.google.com with SMTP id q15so13988670qki.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Feb 2020 04:25:44 -0800 (PST)
X-Gm-Message-State: APjAAAUp4qHmSh2spJvjQgZUJO8Xq2ckGcJcg2llzrpSb/rI+/qKMu/o
 LtkU+0tye5revKnlGHDbCl0JiILI5wUaM6g/GN0=
X-Google-Smtp-Source: APXvYqx0ocLgdidrznoQ8Enyx2eLL3hOdlL2MjBSkguYuLYfdkmdQylLrutBTZG2BNKne5lK1uCb3UnyrUHgc1yB+DQ=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr10712027qkv.138.1580732743857; 
 Mon, 03 Feb 2020 04:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
 <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 Feb 2020 13:25:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Xp6OX0W0Y42AjZlPFGE5V+LJhzztckyaHtgCqUI64SsE2kleshM
 tzMx55eBtagff9RkCJF7VL6QXgtgrkDEPxjO8AjEMC3jL5yEMO5B0z+F+uEkMpWkUwsDIJV
 YtP/i+Zgp5WwvYzGgMtczap9tl7Rr6oHZbq4oN4fU155AaXhw812WnPbqyb/pPkz7X/Am17
 5a2o1I5gXfO+xo7O2+byg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ljY7/41Alk0=:cS89VXaAS0cyxEzyuxF2Xr
 Eq6J4h5Fm9PRwOjP5qYOfUa9HMrOyV8jKnWKf9m/jLPwHSeqXZSHBvRqWyhphCqkU9OLkU7qt
 3XDfjlAPNDB79fU5be1OGovYVssKxzfW229EtPz8W41/SfmLTJhwmEQmhwiusXxzsdSe55yJo
 ujEirliinTCOSHSjlDFIqL07L6Ll6KMiLlDAeyZswd8pY2qMMQOG/VcgNTPvhpXUlEisQjtcx
 QKswMjS1fwpecot9SEYS4nU1+M02FuQRJbjtY93pa1CDoudLycJN56tr/OMYiaOIhVFcaDwOw
 g729KgNGZyWkgqU8vGKm+3pp7zfe9Vl9cSNY/K14kKGtClJNGIC8C0l7MOl5Zwv0yxy5h5VOC
 h2Njgnb6y6T3HhH2oA5bVfpGH2Eeza7gS6F2LWPX/UTPrXHdmeOyEEpDBumuzKzbp5DBaLsmw
 SXNWACN6WWAO9OFewlm3Kf3rXSQQniJbuceZMQPYRdo6us6pWngoFVoLE0pfAnGVM+vF1qBPG
 W0D2CQp6cLXMIYIDYFO/JQDcUpIE3e4BHKi9zeSmpKiam/r7aTuZlosf7vB9IKDW9/qDG5exO
 Fn9DtHfI+xwndpALSVS9yFfa1lxdDVZXOQkYjQkGpLr/R+c8LWIxhBxhAKveMrptD67sVFTEx
 pZnDy4i75Vtfsyr6jBoinl6aRc1Lv2zWt1oDcNslYSf2m2qrNHMmzSTQnszuVDikpmrPUCg+Q
 ajQw94kV2mPixqGJneq7a/bBXwIzR1TK/tQsQAWjKaeu47Grt6OhMbLOEiK3CvUeqYOfjUx1I
 hPuAHw6ZtJUxLwM5TplwEbuBKEX+Y6+CNCgUPqCUe8WW3wxyC4=
X-Mailman-Approved-At: Tue, 04 Feb 2020 14:59:23 +1100
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, arm-soc <arm@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 3, 2020 at 12:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
> >
> > On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > > Delete bounce buffer Kconfig option").
> > >
> > > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > > CONFIG_LBDAF").
> > >
> > > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> > >
> > > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > > now enabled by default (along with MQ_IOSCHED_KYBER).
> > >
> > > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > > previously choosing the latter.
> > >
> > > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > > CONFIG_CROSS_COMPILE support").

Acked-by: Arnd Bergmann <arnd@arndb.de>

> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)

Feel free to pick any of these symbols and send patches for those.
No need to do it one symbol at a time, but please group them like
Krzysztof has done.

> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),
> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

I don't see a good way to do it automatically. It would be good to check
that we don't remove Kconfig symbols that are still used in defconfig
files without changing those files as well. Cleaning up afterwards also
works, but this always requires manual inspection for each symbol.

     Arnd
