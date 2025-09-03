Return-Path: <openbmc+bounces-576-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7903B416B7
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 09:34:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGvWy2Ffsz2xnw;
	Wed,  3 Sep 2025 17:34:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756884894;
	cv=none; b=jkYOhr3TQa6u39wX1VNBCkHaYqv0nUYUSAMQUZwtm8a4LQKrigYQWBbELBAqUg/Bg5k/LYRLHaEc0f775v5Kyv8Qq3B3rhqbf5dvSymNVO7j/pLlVFxxIMhenpsFL8yvHB9gGxF0fFkjWMuZLG6eNBfLtDKa8ws9uArhpHDZi6e2K9Jmsj1lsvkT47w7GYQnsbX/usCE6J+2pqvBh/OtUV/ZW0iUf64u303CI46Sb7If2LCRWUB/BNg+yTqePnVejSrK9KKGFx4FB/Au9BptGdgKAf8OPU2b9yyiOQrnYqTEVgVo8k3a0/PMk3CB1lI8JsknV2aTIsvES+oeQYLwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756884894; c=relaxed/relaxed;
	bh=hlOdXw+ISIywpkvToyJYiZzHeIdj7F5rcjWuwqDVRio=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=af/5Y/SQB9+AiPFIPq9gNj+msTJSRdxE5/8+Yvjn1XrcxHSc/9rAUefd7lL7ntQ0bN36UpRlTT5vVBka8xQZZBug7KVhwhFUPGFpEmbO/e0U28ZuoMtrwzMZZeqySUsInoz7Z/EjfUhsozWtGKo3UqlkXcXWXpqko2/iFDzH23DyaiiJsMZ2CfI9LoHNR6L5Kd/As23DVpaVQkrlpyFbVlvLM4+cNtKsARtNWSL2jSbtNIHJQWWCh7jU5tMvw/klymJWQEx47Al2lO8i/oy0uh91SsroPZ4lBmLpQELuplrGZiHUVJgTE/QJ7EzYHIAPamr5C033RCXQogSHze/XBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dmzzi2Kp; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dmzzi2Kp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGvWx5X7Lz2xgp
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 17:34:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756884893;
	bh=hlOdXw+ISIywpkvToyJYiZzHeIdj7F5rcjWuwqDVRio=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dmzzi2Kp6RTs8aKKrSBqzCoN6AN9vADV8PaTGya2qoXKuD78s3Bo+Fd/rL8amHJ/z
	 1pHoRKGTX9vBvc2HxD6qRwBa/GZB9emEuNReOzTO03d5gjuOuwDuNa4REPEi0Vd//F
	 AQqXpXrY6jguDJqwxKQ1RhDZ5ciMn/szQHeH9T3tfT0QnRYMJbkkt09KuwfFITpvYf
	 oUsZch4g5cr19pCaL+714RL43oqs7ff+yNCSa5GNyhRepG6jmVnR9/D49n3cALr5OZ
	 SYE34xFUpHKvNWtJKbt5KFlUOUQnRjbsgWN8N6nrhlS9hq0H+6/RlgN0+SgoLILFUM
	 s6JnUkppUhXMQ==
Received: from [10.209.99.88] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C62656445D;
	Wed,  3 Sep 2025 15:34:51 +0800 (AWST)
Message-ID: <9e7c8819159b3d2782ea63f9431ed208c31bf328.camel@codeconstruct.com.au>
Subject: Re: [PATCH RESEND v2 0/2] NPCM845 reset and clock device tree
 updates
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com,  tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com,  benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 17:04:50 +0930
In-Reply-To: <20250901132426.3081648-1-tmaimon77@gmail.com>
References: <20250901132426.3081648-1-tmaimon77@gmail.com>
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

Hi Tomer,

On Mon, 2025-09-01 at 16:24 +0300, Tomer Maimon wrote:
> This series updates the NPCM845 device tree for the integrated reset and
> clock controller using the auxiliary device framework.
> Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
> Patch 2 adds a 25 MHz refclk and updates peripherals to use it.
>=20
> Tested on NPCM845 evaluation board.
>=20
> Changes since version 1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Tested in version 6.17.=
rc1.
>=20
> Tomer Maimon (2):
> =C2=A0 arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
> =C2=A0 arm64: dts: nuvoton: add refclk and update peripheral clocks for
> =C2=A0=C2=A0=C2=A0 NPCM845
>=20
> =C2=A0.../dts/nuvoton/nuvoton-common-npcm8xx.dtsi=C2=A0=C2=A0 | 20 ++++++=
++-----------
> =C2=A0.../boot/dts/nuvoton/nuvoton-npcm845-evb.dts=C2=A0 |=C2=A0 6 ++++++
> =C2=A02 files changed, 14 insertions(+), 12 deletions(-)
>=20

The changes are already applied and on their way into mainline:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=3Dsoc=
/dt&id=3D1b8086f1729b8f22e60ba93676602174a3b0a4fc

Thanks,

Andrew

