Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40E1514CC
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 05:01:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BWFs3D3pzDqQP
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 15:01:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZwVsVUHO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B5mt2ChyzDqDc
 for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2020 22:53:01 +1100 (AEDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FB1D21D7D
 for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2020 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580730779;
 bh=7xf6l0x9f3yqiOhlxlprQWM2OQY9DYvJlDJWXMnII54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZwVsVUHORi7AEaxQxLj+Nu8jbcVykEXvdfGL7vkRLhB0mTQiMThf7Ta5VFtb6XrYx
 LPGAsl/3oQd1MhfnblwPdlunyVn0WwjNlRReE3L/H07XxgtqJldOTdNAek7kl5ArP0
 hwuQWOheegxknp2fpCWWvgtUl8pzQM8yNraeDgzY=
Received: by mail-lj1-f180.google.com with SMTP id y6so14320997lji.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Feb 2020 03:52:58 -0800 (PST)
X-Gm-Message-State: APjAAAVBWuHsDLXKwoA2EmvGSY84jhNcx1EENJ6EfpttVDKDjMSMAdSL
 mNx6qegAeM/aojHiboQWFy8+mUeel2Czmjrejk4=
X-Google-Smtp-Source: APXvYqzr5wd/VbPIliYCYFMvvcM1qcze60h66l8h6hCiB4vZZDzfTGLOeSa9EfTbYebXVLxdN/na3R/Ef6tYAfxaBEQ=
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr13176749lji.256.1580730776602; 
 Mon, 03 Feb 2020 03:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
In-Reply-To: <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 3 Feb 2020 12:52:45 +0100
X-Gmail-Original-Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
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
 Aaro Koskinen <aaro.koskinen@iki.fi>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, arm@kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > Delete bounce buffer Kconfig option").
> >
> > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > CONFIG_LBDAF").
> >
> > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> >
> > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > now enabled by default (along with MQ_IOSCHED_KYBER).
> >
> > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > previously choosing the latter.
> >
> > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > CONFIG_CROSS_COMPILE support").
>
> Hi Krzysztof.
>
> There seems there are a lot more of these unused CONFIG_<foo>
> symbols in various defconfigs. (just for arm and treewide below)
>
> ARM defconfigs:

Hi Joe,

Nice finding! The trickier point is to nicely remove them because:
1. The easiest is 'savedefconfig' but then some valuable options might
disappear (like recently happened with DEBUG_FS),
2. They could be removed in automated way with a script. However in
such case what about replacements? If some symbol was replaced with
other (or just renamed), maybe we should enable the other one to
restore the desired functionality?
3. Or maybe let's don't care about keeping defconfigs stable and just
clean them up automatically.

Best regards,
Krzysztof

> --------------------------------------------------------------------
>
> # find all defined config symbols in Kconfig files
>
> $ git grep -P -oh '^\s*(?:menu)?config\s+\w+' -- '*/Kconfig*' | \
>   sed -r -e 's/\s*config\s+//' -e 's/\s*menuconfig\s+//' | \
>   sort | uniq > config_symbols
>
> # find CONFIG_ symbols in arm defconfigs
>
> $ git grep -w -oh -P 'CONFIG_\w+' 'arch/arm*/*defconfig*' | \
>   sort | uniq > used_in_arm_defconfigs
>
> # find all the unused symbols
>
> $ cat used_in_arm_defconfigs | \
>   while read line ; do \
>     echo -n "$line " ; grep -w -c ${line/CONFIG_/} config_symbols ; \
>   done | \
>   grep " 0" | \
>   sed 's/ 0//'

(...)
