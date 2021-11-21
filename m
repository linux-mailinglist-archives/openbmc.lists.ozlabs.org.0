Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3007458293
	for <lists+openbmc@lfdr.de>; Sun, 21 Nov 2021 09:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxkZY6L06z2ynK
	for <lists+openbmc@lfdr.de>; Sun, 21 Nov 2021 19:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cqkMtTwz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cqkMtTwz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxkZB4knCz2xsp
 for <openbmc@lists.ozlabs.org>; Sun, 21 Nov 2021 19:48:02 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEF77604E9;
 Sun, 21 Nov 2021 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637484475;
 bh=20XWGXDXt0xLnm20lfPVNEqqgyIOtI9+pXelANfkry8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cqkMtTwzSJSUSdW++3F9TFCRxJqtUNmtF4rMCJYgZ6NJdY+Bos7IeEGXmehFl5gRa
 T8CIIhrykRUx5XeYRgrXjsqtKGNlqJpnrOupWWoNkaUTEfhZ+kHKIRxcK32pmhMDBi
 Slh10npqFDvxesCZlLk6Hb4y44g12EMHJGM9cxBYc5kJ5H6nxCt/97nxSJGbX9OYAX
 sznGFzhXkucARtetkTFNpN9tbF0+5Bgpo4uXbesHmdNokmwHD0HPpnL5xUQu+o2/yu
 L25IbCIoSPL/fvgBJHJnbZjzID/9WflRyZ60oHVXaFiZi7bLMBMxItnMDJrNappD4K
 AKGd+VcL4QhuA==
Date: Sun, 21 Nov 2021 16:47:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 08/13] arm: imx: rename DEBUG_IMX21_IMX27_UART to
 DEBUG_IMX27_UART
Message-ID: <20211121084541.GL31998@dragon>
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-9-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028141938.3530-9-lukas.bulwahn@gmail.com>
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

On Thu, Oct 28, 2021 at 04:19:33PM +0200, Lukas Bulwahn wrote:
> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support"), the config
> DEBUG_IMX21_IMX27_UART is really only debug support for IMX27.
> 
> So, rename this option to DEBUG_IMX27_UART and adjust dependencies in
> Kconfig and rename the definitions to IMX27 as further clean-up.
> 
> This issue was discovered with ./scripts/checkkconfigsymbols.py, which
> reported that DEBUG_IMX21_IMX27_UART depends on the non-existing config
> SOC_IMX21.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thanks!
