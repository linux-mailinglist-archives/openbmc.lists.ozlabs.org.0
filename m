Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD1A50F2F
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:54:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWv0TBmz3fnB
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741171374;
	cv=none; b=nSXMCCsvPWyPaWIMVir7nGyaz7mj1QGKLTBatArudeAPQhnASnvLbYAg7fJ27DvqCt6/uBRhJskIgIes96Dcv9MNOgtqHaObPjtcd8ycSP8jhDa0ws6u6NTq3UXi+ghmnxlJKe0gAKKTNKAfGdWhHTT/7trU7RSlCRbnFgZozOVM6Ml+c2X6oURHoUYO9Ofo5pQcc6le8cNfgIdsdy1UqNdyCgm9+ANQnD+ruAbtxtmYfKsQ1bmwi4KuMaOHo/MnhBcKPEEM5B/Z4TRGY6lETC+GMiqhRujPcrTBLbmfFZCZ3q2JYuVVheZMnuBPkcyFea5o/dkKl3TjDVExuIdSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741171374; c=relaxed/relaxed;
	bh=WT6ieFhN3zQWbuV/hXGfdLrRZ8QauOz6+gPkTZ+qxhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asyhRBPH5dHWq9Ykg4M5FhHbvMK2uZ0fFESKzv0G1wZpMdLcll5nv60TwM0w6vl1K+w4RHTasPgKASReGfgMsRPx/2Cg0ZnXj0XTXF3d0v+KTq7tqSG0hcCW+YfWk8ndTFkKfSiC1CG4wJHJNGN58i2mpgFRBtrj1Sn5W8ZVVieSYAR4ziDdGSOGnpYTJFU542SCEtkJLaTcaZMy0KfFWJWHcxTpx7wAUHk+G3wrhH5GOopqdWPnfG8dClpxfQuaapv3Ii09oHj69VhZW1IWqXCgj0GukbE15A9B9f/YKp11C/OJnXiXQ2WVCurx2NUnLjDZoErHV4HMLBko7gqCEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z78Js2CK6z3bqM
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 21:42:51 +1100 (AEDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpmCM-00054k-Ob; Wed, 05 Mar 2025 11:41:58 +0100
Message-ID: <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
Date: Wed, 5 Mar 2025 11:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
To: George Cherian <george.cherian@marvell.com>, linux@roeck-us.net,
 wim@linux-watchdog.org, jwerner@chromium.org, evanbenn@chromium.org,
 kabel@kernel.org, krzk@kernel.org, mazziesaccount@gmail.com,
 thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org,
 support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org,
 paul@crapouillou.net, alexander.usyskin@intel.com, andreas.werner@men.de,
 daniel@thingy.jp, romain.perier@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, mwalle@kernel.org, xingyu.wu@starfivetech.com,
 ziv.xu@starfivetech.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org
References: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org, imx@lists.linux.dev, patches@opensource.cirrus.com, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On 05.03.25 11:10, George Cherian wrote:
> This series adds a new kernel command line option to watchdog core to
> stop the watchdog on panic. This is useul in certain systems which prevents
> successful loading of kdump kernel due to watchdog reset.
> 
> Some of the watchdog drivers stop function could sleep. For such
> drivers the stop_on_panic is not valid as the notifier callback happens
> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
> options to indicate whether the stop function would sleep.

Did you consider having a reset_on_panic instead, which sets a user-specified
timeout on panic? This would make the mechanism useful also for watchdogs
that can't be disabled and would protect against system lock up:
Consider a memory-corruption bug (perhaps externally via DMA), which partially
overwrites both main and kdump kernel. With a disabled watchdog, the system
may not be able to recover on its own.

If you did consider it, what made you decide against it?

Thanks,
Ahmad

> 
> 
> Changelog:
> v1 -> v2
> - Remove the per driver flag setting option
> - Take the parameter via kernel command-line parameter to watchdog_core.
> 
> v2 -> v3
> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
> - There are no users for this. 
> 
> v3 -> v4
> - Since the panic notifier is in atomic context, watchdog functions
>   which sleep can't be called. 
> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>   function sleeps.
> - Simplify the stop_on_panic kernel command line parsing.
> - Enable the panic notiffier only if the watchdog stop function doesn't
>   sleep
> 
> George Cherian (2):
>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>   drivers: watchdog: Add support for panic notifier callback
> 
>  drivers/watchdog/advantech_ec_wdt.c |  3 ++-
>  drivers/watchdog/arm_smc_wdt.c      |  3 ++-
>  drivers/watchdog/armada_37xx_wdt.c  |  2 +-
>  drivers/watchdog/asm9260_wdt.c      |  2 +-
>  drivers/watchdog/bcm47xx_wdt.c      |  3 ++-
>  drivers/watchdog/bd9576_wdt.c       |  2 +-
>  drivers/watchdog/bd96801_wdt.c      |  2 +-
>  drivers/watchdog/cgbc_wdt.c         |  2 +-
>  drivers/watchdog/cros_ec_wdt.c      |  5 ++++-
>  drivers/watchdog/da9052_wdt.c       |  3 ++-
>  drivers/watchdog/da9055_wdt.c       |  4 +++-
>  drivers/watchdog/da9062_wdt.c       |  4 +++-
>  drivers/watchdog/da9063_wdt.c       |  4 +++-
>  drivers/watchdog/db8500_wdt.c       |  5 ++++-
>  drivers/watchdog/dw_wdt.c           |  5 +++--
>  drivers/watchdog/f71808e_wdt.c      |  3 ++-
>  drivers/watchdog/gpio_wdt.c         |  2 +-
>  drivers/watchdog/i6300esb.c         |  5 ++++-
>  drivers/watchdog/imx_sc_wdt.c       |  2 +-
>  drivers/watchdog/intel-mid_wdt.c    |  5 ++++-
>  drivers/watchdog/it87_wdt.c         |  5 ++++-
>  drivers/watchdog/jz4740_wdt.c       |  5 ++++-
>  drivers/watchdog/kempld_wdt.c       |  3 ++-
>  drivers/watchdog/lenovo_se10_wdt.c  |  5 ++++-
>  drivers/watchdog/max77620_wdt.c     |  5 ++++-
>  drivers/watchdog/mei_wdt.c          |  3 ++-
>  drivers/watchdog/menf21bmc_wdt.c    |  4 +++-
>  drivers/watchdog/mlx_wdt.c          |  2 +-
>  drivers/watchdog/msc313e_wdt.c      |  5 ++++-
>  drivers/watchdog/npcm_wdt.c         |  3 ++-
>  drivers/watchdog/omap_wdt.c         |  5 ++++-
>  drivers/watchdog/pm8916_wdt.c       |  5 +++--
>  drivers/watchdog/pseries-wdt.c      |  2 +-
>  drivers/watchdog/rave-sp-wdt.c      |  5 ++++-
>  drivers/watchdog/renesas_wdt.c      |  7 ++++--
>  drivers/watchdog/retu_wdt.c         |  5 ++++-
>  drivers/watchdog/rn5t618_wdt.c      |  6 +++--
>  drivers/watchdog/rzg2l_wdt.c        |  5 ++++-
>  drivers/watchdog/rzv2h_wdt.c        |  5 ++++-
>  drivers/watchdog/shwdt.c            |  6 +++--
>  drivers/watchdog/sl28cpld_wdt.c     |  5 ++++-
>  drivers/watchdog/softdog.c          |  5 ++++-
>  drivers/watchdog/sp805_wdt.c        |  5 ++++-
>  drivers/watchdog/starfive-wdt.c     |  3 ++-
>  drivers/watchdog/stpmic1_wdt.c      |  5 ++++-
>  drivers/watchdog/ts4800_wdt.c       |  5 ++++-
>  drivers/watchdog/twl4030_wdt.c      |  5 ++++-
>  drivers/watchdog/uniphier_wdt.c     |  3 ++-
>  drivers/watchdog/w83627hf_wdt.c     |  5 ++++-
>  drivers/watchdog/watchdog_core.c    | 35 +++++++++++++++++++++++++++++
>  drivers/watchdog/wm831x_wdt.c       |  5 ++++-
>  drivers/watchdog/wm8350_wdt.c       |  5 ++++-
>  drivers/watchdog/xen_wdt.c          |  5 ++++-
>  drivers/watchdog/ziirave_wdt.c      |  5 ++++-
>  include/linux/watchdog.h            |  2 ++
>  include/uapi/linux/watchdog.h       |  1 +
>  56 files changed, 198 insertions(+), 58 deletions(-)
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
