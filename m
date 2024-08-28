Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7D963357
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvGz810sdz30VX
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 07:00:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4601:e00::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724878848;
	cv=none; b=jGhIz6XZNmTzTLt8IKUZVbn2FT4j6lBLCBAUR6OzwXsg7USk9igQ4jXx7uEt4unCqQrungWENfynKIjOAv0mIvDiSaYlqtwU+RX7ub7wVoqWdPJl1DvTFbREr4gq65UyXXehNzzwkT7HmSwewaltnHAgxb04JIzTy4j4bjN54OJ/e30KSYZQXYAC+R6Ajl0IOrbpRH1QvDaU4/K6Nt6Qt+SJuPmYg9H6U49rJ/qqKtVy/l3deN7O5AmTI/cA4SzU5hLst6YTJ2/tDnWIqq0ofkI2UszIr81lUa/gphbkuc3ZmwbFJohou9xn0WIYT7ofcPZ/luO9IFq/iTxX2f9Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724878848; c=relaxed/relaxed;
	bh=l6gpZCE/p/bDY8O0UgFYcBlAkFQOYvy8vLn0Az/31/w=;
	h=X-Greylist:Received:Received:DKIM-Signature:Message-ID:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:In-Reply-To:
	 References:Subject:From:Cc:To:Date:User-Agent; b=Ow7aRZoGBCXTEosCEurqwQnbbQECx+3WksnISnP3TaqM3d5myk6pHpssjRVG8LlYYdyQJTs5Np3AlqwY2y7VmR/TdEdh9b0mhQHa0liGikQ6qHFugrDgzVpOO8HJHcKmXCUhoJhydqbw/vl4tZcy/UDD3G4UUjGq2r8Gz0S1VM/jYyCjPQIVTdsMiLV82AK+kjgCXMz4gdZ7VFuKSJyapTx59PfJmbtJFweBMhtniQ4W6X2bE0ZFJSHY/ODd6L+8MjmJDJES9rDfdE756wNL3g3C/TtzGyZMdN57M5Izb6MFRC66g+c8aEX4/71Io+cVVj4qsrCmTrirDW1Gm1GsHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW85VqHP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW85VqHP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 354 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 07:00:48 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvGz40JBRz2yZZ
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 07:00:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 15CF4AE381D;
	Wed, 28 Aug 2024 20:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6669C4CEC6;
	Wed, 28 Aug 2024 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724878490;
	bh=l6gpZCE/p/bDY8O0UgFYcBlAkFQOYvy8vLn0Az/31/w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mW85VqHP5ybwlJIpUNGEUUkkAiFDhuEMHdjS7XCAsQ5bf25JCuyIEYu1fGKIRttsI
	 lDvJsLAb3QCo2fBk1E1iZGsycVM+l+yB+NGo58MalbSwqSCvWZnHgGrkyPGeJ1fEkD
	 0jR6UV4xhFF99M1NooI2SwnLfVvLdx+BVh9vwwv+flHiMurXpcRoUAOfusXy6ohdHz
	 Y2EkT1i72weJieTtlrMhBJJ7/qf/6vQfTkdGgwcGWllUvhX1WfChYq8IEwj0nrNvuX
	 kFdVomAGmYZbwhC8RhC1Muy31lze9IMUTiHUTbSqmWOhSW3b83Glmru6jvCStZ05Iy
	 z5G9nq6tRaGeQ==
Message-ID: <4be108b47be46753681932e3879982ce.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240815150255.3996258-4-tmaimon77@gmail.com>
References: <20240815150255.3996258-1-tmaimon77@gmail.com> <20240815150255.3996258-4-tmaimon77@gmail.com>
Subject: Re: [PATCH RESEND v27 3/3] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 28 Aug 2024 13:54:48 -0700
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

Quoting Tomer Maimon (2024-08-15 08:02:55)
> Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> integrated clock controller which generates and supplies clocks to all
> modules within the BMC.
>=20
> The NPCM8xx clock controller is created using the auxiliary device
> framework and set up in the npcm reset driver since the NPCM8xx clock is
> using the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
