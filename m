Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD436DFFF9
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 22:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxZFt5VPhz3f7t
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 06:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4VfUNhG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4VfUNhG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxZFF5RpMz3bhx
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 06:34:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C4AB63028;
	Wed, 12 Apr 2023 20:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A303C433D2;
	Wed, 12 Apr 2023 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681331662;
	bh=Q76Of0pAllESEGyCSS4s6jcXwtDMwOcUfZRJ4hvZ/Do=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i4VfUNhGY6jKbPCIDleGIDNQdHk0VxtsssFv94x2/xevrGWuAq3VmWrXZMlPAp5Vu
	 ODpeAQwJBGVR8vNszEf40IqhFrgCJtxFF+drVFUZj3J4P9n5d/LKI2grKbRaVNF6/I
	 D/dFEyL9u/DUcapT6OYhuaDH4EHiPLcwmIEMsmXQYCNTLjoj95w1c7ifLG1JNCrE91
	 4cMI5CTwVZIq1bDjxqktyQYqMZcDumnnv9319Nq7CXE9YELcPcg+2Rs6UWH9ZcadyA
	 uBKS91uwX9K4Yq4vIc7mBSuFYIB2S15jFllJmT8UB7UD3DnvN+Tv8847jlyFT6vZA2
	 uYF1B9+t1ENwA==
Message-ID: <ed34eacdb1d35be8b9b2c44944f828e7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZDcC9JBidzfu94NW@probook>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net> <20221104161850.2889894-4-j.neuschaefer@gmx.net> <20221209202120.0AFACC433D2@smtp.kernel.org> <ZDcC9JBidzfu94NW@probook>
Subject: Re: [PATCH v5 3/6] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Wed, 12 Apr 2023 13:34:20 -0700
User-Agent: alot/0.10
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2023-04-12 12:13:56)
> Hi,
>=20
> On Fri, Dec 09, 2022 at 12:21:17PM -0800, Stephen Boyd wrote:
> > Quoting Jonathan Neusch=C3=A4fer (2022-11-04 09:18:47)
> > > The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> > > Add a devicetree binding for it, as well as definitions for the bit
> > > numbers used by it.
> > >=20
> > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> >=20
> > Applied to clk-next
>=20
> I don't see this patch in clk/linux.git's clk-next branch. Did it get
> lost somehow?
>=20

Must have gotten lost. I don't see it in my branch history locally.
Resend?
