Return-Path: <openbmc+bounces-291-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F48AE7338
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 01:31:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRh6p2YrKz2xRv;
	Wed, 25 Jun 2025 09:31:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750807906;
	cv=none; b=iHqikKVI7RycICz2mOxDddEU7duormU79rchjnaWjDPQ1GuARhReOwnyNN9OlSLbN2vrTB9oXuOqWl4cv20nECC4FpBCLluCGzgedFAvO6yXCtLkA/s49163b6GJ+abv8M69RvS18g8O1P7aXvQgNIJYQUJX4302SroJHBfFHeLK16ecPK7+zJFUzags4c65CPwqYaCghhsORmXJSVczbakFoRtuhFTta9uBKUmiUipmc2W4ObtZmgtWqjd9nSIggD/ZGpboc6LM/hcz1P9zylGTvDREqEvdTTVWTe4b+TyIDDKkd7S4mkzBOXN9Aaidc8hTwdon9GTdtlmzXE3DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750807906; c=relaxed/relaxed;
	bh=wAMDHm88X5DnFfTxjTMlZawEVZqAwKU/UMzX5RRrhEw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jIlys85iN+iWWOQq1NGR9R1MzZYdI+oEmvw1/d7axEIDX52LJjJeFGscgPv5qqxxrt0/AGD3vDQl/iAawkAgMVDK/C2Xash9XRqQY282+GF7Drghwnql5dkOjtCec2ikuAOiV1YEWfPVTDa/RTqv2yL27BTCc2wPKKQLom/RCxljFV4RwfgfLjDNHXv4cLiTAhd7xgW/dc3Bww5Unh78bGw0QaqHlamdDTkaAZnhAOUr7suwd7UK8XM4HehHjb4lD5LGFkdf9QFKTbdzFr57xPaI2yle2SAaxc9bFXRzOX8ruRka4P8ZYqsG2dQkflPBNKm+anImOdXWArc3AzjW1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y6jvrWrI; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y6jvrWrI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRh6n5gVqz2xHv;
	Wed, 25 Jun 2025 09:31:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750807905;
	bh=wAMDHm88X5DnFfTxjTMlZawEVZqAwKU/UMzX5RRrhEw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Y6jvrWrI5GNZ8lXWo//Q5UUJUo0iIL68eNHWVPCv70YpSP9TgqLYIqrhLciejhrJ4
	 sr7IxwJDOYd14/Uvs+JF68Am0yAqaZfy2MqMB36oE1tNHNGmRA/3XoCLPqnM9Mif3O
	 g8GYNQ1O7JgeKupftTkehLa/o0vmjTAUa30cVSD827oJ3ezXewbD59Go4c7BycZDW2
	 PENUZQ9mEIVg1qqezl7FA93VIgUQ3gB2899NYCNjre75vK6P1yByCpAtVcCnrYYxJ3
	 8FsitDufw47hob7JSjlkvJUg23ARqKE8K3Qw44qXdJM7JAk283yaT8sihzjwLfCXyn
	 54yrE/oJjuR8A==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B1F7640CD;
	Wed, 25 Jun 2025 07:31:43 +0800 (AWST)
Message-ID: <c41c3dfc38c1adc5d544e365de355579d42f90b5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "ulf.hansson@linaro.org"
 <ulf.hansson@linaro.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 25 Jun 2025 09:01:42 +0930
In-Reply-To: <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
	 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
	 <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-06-20 at 10:23 +0000, Cool Lee wrote:
>=20
> > > The timing phase is no more needed since the auto tuning is
> > > applied.
> > >=20
> >=20
> > I feel this is unwise: we're now ignoring constraints set in the
> > devicetree.
> > Auto-tuning is fine, but I think that should be a feature that new
> > platforms can
> > exploit by default. Older platforms that do specify the phase
> > values via the
> > devicetree can be converted at the leisure of their maintainers (by
> > removing
> > the phase properties).
> >=20
> > Support needs to remain in the driver until there are no (aspeed-
> > based)
> > devicetrees specifying the phases.
> The timing phase only works on AST2600 or newer platform which has
> added a delay cell in the RTL.
> The older platform AST2500, AST2400 doesn't support the timing phase.
> It supposed no effect on older platform.=20
> The old manner that a static timing value customized from devicetree
> is inconvenient because customer needs to check waveform associated
> with each delay taps. Once the emmc parts changed, a fixed timing
> value may not work. That's why auto tune here instead of a static
> value.

Sure, I understand that auto-tuning is more convenient, but in my view,
there's no reason to remove support for static phase values for now. On
the contrary, switching entirely to auto-tuning risks regressions for
existing platforms that do specify static values.

Can you please drop the patch for now? We can revisit removing static
value support in the future.

Andrew

