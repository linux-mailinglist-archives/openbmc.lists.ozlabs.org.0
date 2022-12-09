Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D4648983
	for <lists+openbmc@lfdr.de>; Fri,  9 Dec 2022 21:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTMsb6b3rz3bXL
	for <lists+openbmc@lfdr.de>; Sat, 10 Dec 2022 07:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jPJE4xAU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jPJE4xAU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTMqs2dlrz3bfv
	for <openbmc@lists.ozlabs.org>; Sat, 10 Dec 2022 07:21:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9AF1BB828E5;
	Fri,  9 Dec 2022 20:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECA8C433EF;
	Fri,  9 Dec 2022 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670617300;
	bh=xcuiBQzabq84yS4fNajYYh9WazbQ6zYnMdbrlj+GMJE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jPJE4xAUNg93r8z0OrtxZbcpBErVeT95EI0uNsjlmUQvzTAFj7Lnskrk2D56QlaQE
	 cu6a6iA8V3h295QgtKEudTxJtK3FET8pesev17VRzQ2DoSfNt39R9MNkBUa8zC3vmN
	 w1nRE1h8ISmP53J4vsPPKvqkekq0EaUQR1rKwuPtY8TGb9tAmOku4XK9xG3VJhI6xR
	 /RN0f4SapBsX66PN39vPsvzbAfxAtNekR4gAvmpEFJomNRrxp70XUcnGEWsKOzrS0s
	 9V3Pv08PPmVRNJfdQJtWa3c7FNjV2tw9HJEYqtgcQlj/54SnqR9HCX+YvacLHSCGWS
	 XT876BoAuVfWw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221104161850.2889894-6-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net> <20221104161850.2889894-6-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v5 5/6] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Fri, 09 Dec 2022 12:21:38 -0800
User-Agent: alot/0.10
Message-Id: <20221209202140.4ECA8C433EF@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2022-11-04 09:18:49)
> This driver implements the following features w.r.t. the clock and reset
> controller in the WPCM450 SoC:
>=20
> - It calculates the rates for all clocks managed by the clock controller
> - It leaves the clock tree mostly unchanged, except that it enables/
>   disables clock gates based on usage.
> - It exposes the reset lines managed by the controller using the
>   Generic Reset Controller subsystem
>=20
> NOTE: If the driver and the corresponding devicetree node are present,
>       the driver will disable "unused" clocks. This is problem until
>       the clock relations are properly declared in the devicetree (in a
>       later patch). Until then, the clk_ignore_unused kernel parameter
>       can be used as a workaround.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---

Applied to clk-next
