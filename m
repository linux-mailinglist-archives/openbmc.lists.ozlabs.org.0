Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D033E64897E
	for <lists+openbmc@lfdr.de>; Fri,  9 Dec 2022 21:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTMr35CvGz3bgX
	for <lists+openbmc@lfdr.de>; Sat, 10 Dec 2022 07:21:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch1kovAO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch1kovAO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTMqV1kQxz2xml
	for <openbmc@lists.ozlabs.org>; Sat, 10 Dec 2022 07:21:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75D62B82910;
	Fri,  9 Dec 2022 20:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFACC433D2;
	Fri,  9 Dec 2022 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670617280;
	bh=7KlzrXzZgFv2ULvcVa0LE8h5/L4wz+K9d1oUyIijkCE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ch1kovAO2wYhJrpZnNvsp+FkzzKxV9SKrWWPEHb1MA7LHqlSNP6qLIOyE2eOGHs78
	 CBUSl8Ts7C3bz6SGyaseTIggg6kAuT8HTpZpIHy34hQV8R3KYAJoZeulFAvKZ//SFr
	 MrmFb4gKQzBEfotnca5Wto1X+9eAHBCTNIVMZ14fgHKh1svG7oEdbIUtTd6tHoq/8V
	 H9AoAxMaDryHlCAYlMhic5Qiwy/xMJ+Qg+cQ5/oPoLS+BpZvDZcyDqzDgUgUrm0Kfd
	 SvgDr/SGzpX1erBF3W/83FKOcY6nofNxotfD9fUF6/xtCJSncYyQ7lcmIU7FjR/2JN
	 8rDZFV4caFP/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221104161850.2889894-4-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net> <20221104161850.2889894-4-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v5 3/6] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Fri, 09 Dec 2022 12:21:17 -0800
User-Agent: alot/0.10
Message-Id: <20221209202120.0AFACC433D2@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2022-11-04 09:18:47)
> The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> Add a devicetree binding for it, as well as definitions for the bit
> numbers used by it.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
