Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB1156D91
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 03:18:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G8h55sbLzDqQy
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 13:17:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NptrmHtY; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FnT432WHzDqRB
 for <openbmc@lists.ozlabs.org>; Sun,  9 Feb 2020 22:52:02 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id q8so3926651ljj.11
 for <openbmc@lists.ozlabs.org>; Sun, 09 Feb 2020 03:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
 b=NptrmHtYTiL5YgJrYH1ti+K078fPaTfnbfGukV1wYirmvtVfyLHmk1Y4G+sPJKzhtO
 VgRFHCDnWWN+XuVsDUc/DNV0NsDAuA2QOU06s5e1+fW6D8mS1IQM1mZXo/5tOruAXnEz
 4MjqiZlt4kB0G3I7w9ipN+dGcniokuXyuNBVVhpbVKp4hPGH1jz37zk8Iba/rzzbc43S
 IUejSY2mrWWstTFatbHDPiv2stxA0cAwteuFIXbqAZFLIlyD+iRgkFrkzU9rs6XzYD42
 8VCyfkaKdOZCtqpix7QOOcXbC0dgvoPIxPEVz8rICA+iBFfrWxPSl/cJVJaN4lxXkrIm
 sAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
 b=ZHNx6IEwOMkI+DaIm68F78694P3t8f3TRP1c22G1vpLZ6n6KA+epLL7pk0lEhBk+nq
 Ts2C4i/lud6U9v9Z2AtOvvBSHSz6w6NgeqsouCLx1a1AmOfRuMI0a7i3m8B5JUSKMxQv
 taiy/OUI1/6S/kxOavd8ZumIWutbvIVCwc+n6kjVlMCJ9jNZ4lzTPBI4T4/YVNdRTDR5
 hCAjsKXB1UdSFTuZNXqTZ1/hZHPgw/qUs0PifwsrhE4TnA7aUDrV15KfE8Uto1xZPfjS
 YmVaEQMhIdwqP4W8lUkS7XIeq2HvMnUBEFYply1OQa4501U54k0kbk4/PBXOV+qc0Yyt
 z0kg==
X-Gm-Message-State: APjAAAUmdDw3xw+NlNa2Z3RFLZnSSWPDHA1sx6ce/y5iA/ifXOGGL9au
 IgDnv4HffZyRUWE4AoaQVdPLzA==
X-Google-Smtp-Source: APXvYqyBJcdgJJntrsixcqZPfIHwYwrfiSxVX8Hkh88iVLuNcb42dKupf9X+gL/jDnv0ncXLtXIzSg==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr4960192ljc.279.1581249116367; 
 Sun, 09 Feb 2020 03:51:56 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id 14sm3752313lfz.47.2020.02.09.03.51.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 09 Feb 2020 03:51:55 -0800 (PST)
Date: Sun, 9 Feb 2020 03:44:22 -0800
From: Olof Johansson <olof@lixom.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
Message-ID: <20200209114422.as5xpytakhaa3vur@localhost>
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
 <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 10 Feb 2020 13:17:28 +1100
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
 Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 03, 2020 at 12:52:45PM +0100, Krzysztof Kozlowski wrote:
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
> >
> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)
> >
> > ARM defconfigs:
> 
> Hi Joe,
> 
> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),

Note that while they disappear from the defconfig, they were already not part
of the build. So kernels have been built without them for a while. It's a good
way to surface the problem, but it's pretty clear that trees fall in the forest
here all the time and nobody is noticing.

> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

Churning defconfigs is just noise, and a source of annoying needless
conflicts when people do it at the same time. If an option is no longer
in-tree, it doesn't do any harm. But it makes sense to clean up every
now and then like the original patch here.


-Olof
