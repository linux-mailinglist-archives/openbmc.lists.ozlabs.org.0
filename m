Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C617963308
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 22:54:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvGql24Rmz30TT
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 06:54:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724878463;
	cv=none; b=bw85kk2fas/Xyp2n1Jduk2KWU6/ON5+/0x4l516MoL0L41FUMkkh5VgpxTeH+mZLo6SfDiZSAWI6iUclB2YTPRSzERTfPcdQJFSCGaVwSAYJCKqRiOYu1H2tWckz2eK8Gezv3dpVPOtL6v4lgwK92Kh7U2w5F2ysKkz9mxYzCl8V1t8yOCKTH/aDUhaecPDkLqj/E6b6SgNjkd0DDJpZyQffaPctWZEslJ3Ogap3tmaYF8aH+itl6Z9Q+4XN1ls58UdUoHp7RbrPUO1Maz/+Gzr4RB96Qxh8Ql2SmrnS1ECALyDitL01qCpvtGW4R6OIx+Zkhd44YsqoMo5NpMXbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724878463; c=relaxed/relaxed;
	bh=jjWwY3ciCOHAxUorLjKt2OVq3TE7O7c5UcD25ZB+8Kc=;
	h=Received:Received:DKIM-Signature:Message-ID:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:
	 Subject:From:Cc:To:Date:User-Agent; b=cAKvNpus2mFPXrsnLEvKC4cix8sdhRmCynO7/6FNY4qBlG0X1nWgaVOslYkYrlsZZxblfxRMhJsvNrpOMNS8iWFt9VW0ePNx1n366NUWkje4HQbj6zDFPN1rLHiLqzBgdgC3kPvgZaVBRXea1GmRl9dWgNCms9Jq22ehtzeuUnOVcYdTgII89qFmTZrtLFAKRq6kQlLh7v9Gc+Le7npaLKyjoh62b+p5Bd3hrzhweSfP6STqpV/0cf+qfukNgMtd31EkJ/dIIkJ11lsR+BnAasmaCQh+i+1UCIip+Rkd/VgqF6IuBBtbhDGG3Yrhkk+Gjiv+wGZd/c0ivsb/YmM4aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j0CC4mln; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j0CC4mln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvGqg5w6bz2xBb
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 06:54:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 221F5CE190E;
	Wed, 28 Aug 2024 20:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC8BC4CEC1;
	Wed, 28 Aug 2024 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724878459;
	bh=jjWwY3ciCOHAxUorLjKt2OVq3TE7O7c5UcD25ZB+8Kc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j0CC4mlnUhyh0CeF/GmUCTrq347itA0WvySX0UKDklYSQNdepvZJX7frFNCVp3grX
	 Xm8lY6/YiDuJ10UFx38YmzAyuBaw3HE4j2Wpl1QdsNw0hr3UNKGNbSFQoV/iuJs+KO
	 dq+vYOD1GBAFfrUKzu9NsXRlwWkQf4l1pt0Yi/rwqCYXuyKcunohCLwQdNbkHaOEdY
	 yevyBYhXTkeTss80FXST3J43/dtHlv8e+V2q6n8jhfeK0o+NMwqYKGexeePc0EJt4l
	 lTaOMi/Yi30OL52cYP3HY+CLor61ocPminvqA5NUVSV41bpDxf367TpXp+9x+B/VqY
	 WesZWOy5eGHfA==
Message-ID: <2f21322a2412684c6aa7bb7d817e861c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240815150255.3996258-1-tmaimon77@gmail.com>
References: <20240815150255.3996258-1-tmaimon77@gmail.com>
Subject: Re: [PATCH RESEND v27 0/3] Introduce Nuvoton Arbel NPCM8XX BMC SoC
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 28 Aug 2024 13:54:17 -0700
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-08-15 08:02:52)
> This patchset adds clock support for the Nuvoton=20
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>=20
> The NPCM8xx clock controller is created using the auxiliary device framew=
ork
> and set up in the npcm reset driver since the NPCM8xx clock is using the
> same register region.
>=20
> This patchset cover letter is based from the initial support for NPCM8xx =
BMC to
> keep tracking the version history.
>=20
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>=20
> No changes since version 26, only tested in kernel 6.11.rc1

Thanks for working on this! I'm waiting for Philipp to review/ack the
reset driver part. Until then I don't think I can apply this series to
the clk tree. I'll add a review tag to the clk driver patch in case that
helps.
