Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 024EC458288
	for <lists+openbmc@lfdr.de>; Sun, 21 Nov 2021 09:44:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxkV75Khsz303Z
	for <lists+openbmc@lfdr.de>; Sun, 21 Nov 2021 19:44:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D5Er70na;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D5Er70na; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxkTj53f0z2xrl
 for <openbmc@lists.ozlabs.org>; Sun, 21 Nov 2021 19:44:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E834C60249;
 Sun, 21 Nov 2021 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637484243;
 bh=tu69UPs2oFYdHGpPkYWSO++YLwvfUcLbBzuvXbiASYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D5Er70nazIbKppLsd5F5Xp/QgKOjqOlEYkmYtQAD0y5OpCROq1qwnPjiUGqIeKcZ8
 QOO4vJmuckEkXlZuydebEuZRyTvuMW/b5mhCpIOGZhRcOOs5SqdyCDrsC6/r6zVqDo
 HmA0WVOq8M9ANGfm1YLgLfunPKpkDwXmEpFjzP4mPa2cifyRIpKUjJHgRxp0qqN8ge
 aAFZ/vP97Nfvl6V0Z1FDaRZ8/KstBjxPa4GYQSGNJoqsypN3TnKS0dMrrmiuh+agVj
 xVbs4DbIeG00oLvkMJiS3xFGdKExpFCqrfLyKaelKtxsdi4wbGSomDVWFP544XHxmf
 k7pa5d51aJc7Q==
Date: Sun, 21 Nov 2021 16:43:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 07/13] arm: imx: remove dead left-over from
 i.MX{27,31,35} removal
Message-ID: <20211121083934.GK31998@dragon>
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-8-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028141938.3530-8-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Linus Walleij <linusw@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, openbmc@lists.ozlabs.org,
 Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>,
 Tali Perry <tali.perry1@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 04:19:32PM +0200, Lukas Bulwahn wrote:
> The commits:
> 
>   commit 879c0e5e0ac7 ("ARM: imx: Remove i.MX27 board files")
>   commit c93197b0041d ("ARM: imx: Remove i.MX31 board files")
>   commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files")
> 
> remove the config MACH_MX27_3DS, MACH_MX31_3DS and MACH_MX35_3DS.
> Commit a542fc18168c ("ARM: imx31: Remove remaining i.MX31 board code")
> further removes arch/arm/mach-imx/3ds_debugboard.{c,h}. So, only some
> dead left-over in Kconfig and Makefile remains.
> 
> Remove this remaining left-over.
> 
> This issue was identified with ./scripts/checkkconfigsymbols.py,
> which warns on references to the non-existing configs
> MACH_MX{27,31,35}_3DS in ./arch/arm/mach-imx/Kconfig.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thanks!
