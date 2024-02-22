Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99585F135
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 06:59:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxdS2BWF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgMsl2QmFz3dLl
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 16:59:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxdS2BWF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgMsF2r0mz3cZQ
	for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 16:58:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48C25CE2104;
	Thu, 22 Feb 2024 05:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FC3C433C7;
	Thu, 22 Feb 2024 05:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708581535;
	bh=sQC55hFRaSZSeaw3Mtrz9vBAtSzqenfjycnVwCMWniU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hxdS2BWFXR46jTswAzQfohvMvfXftCmJQSpSw/AH4jSlFw/m01U+1T95VGrBKIcjx
	 etGvS+q6URb+G4qdE76hOtIU+I+sLyQnq2wB8J5wMBrp6+vHlnjdpLEhYQ9tgvGc8s
	 n9xS2DDWUHSHPYliIi78ntAQ0yNoWDv+8qkKQp4Sj1N8gqNF8Xm4Lezyd0Duy9KW9I
	 asteSCPEIewwpYzk/vPSDCZR7YYlnUug+h43GarxkTP64n5mZQ2Fpceo0TiWjIXZw5
	 TSAja/LedQT5NwJQtRhyeyBm73f+k1Yj+JHNApuYUS2fsM37Mcrot3UP2oKJ3As7g+
	 WJsJaiP28lrqw==
Message-ID: <bea8b72f61caaeac0ce112b57c28297b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240131182653.2673554-2-tmaimon77@gmail.com>
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v23 1/3] dt-bindings: clock: npcm845: Add reference 25m clock property
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 21 Feb 2024 21:58:53 -0800
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

Quoting Tomer Maimon (2024-01-31 10:26:51)
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.=
yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> index b901ca13cd25..7060891d0c32 100644
> --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -44,6 +54,8 @@ examples:
>              compatible =3D "nuvoton,npcm845-clk";
>              reg =3D <0x0 0xf0801000 0x0 0x1000>;
>              #clock-cells =3D <1>;
> +            clocks =3D <&refclk>;
> +            clock-names =3D "refclk";

The driver seems to want this to be a child of the mfd syscon. Is that
right?
