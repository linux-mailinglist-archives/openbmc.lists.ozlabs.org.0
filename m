Return-Path: <openbmc+bounces-415-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8BB1BD9C
	for <lists+openbmc@lfdr.de>; Wed,  6 Aug 2025 01:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxVf031crz2xck;
	Wed,  6 Aug 2025 09:54:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754438088;
	cv=none; b=e6D1Ea95aYE4FZtdAg30ONY2uA8zy2aFeCtBmWPH941msrnhPMUYdPokfAkMgDSAhADuboT1w1auEDfIztF64sc/ClQOZ6wSJ8mjtlWZfhXmW56qAZZGTm7CO5dBV+bx2UiagKSxGFaj7DJTNRtdbUrNZjM1hb51Zc7W/cjy0n9A7xGRIhBoNbPlJCJ2OXsH+9RISgrR4zmczvKDhG9loEiEXhiEegBjnn7QpMspbDr4upbI+HICkb7P6z6GBaB3c9kcoufTceENPb2TSi1QN4pI5VaHnl69LBlwbAuzWfE7c8Ffv8eIB/cItvIGek/vcln7cKxejTrrzFY0xuHYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754438088; c=relaxed/relaxed;
	bh=bQZpYRBWBZZ2eBR7/tkk5zAeMAYqUXjK+6hTKI1L6/A=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=kC4DI6uvST9m1X6yYGY5D0md3XA0B2HUaLTuZph/vNZhs+3euLTA7twWlxyw9xmDfFcyFrhl56sI9u6WqghWHMkwPetXB5DYdGp9XRRKMHlQvXew1xCppXIkaUzo+rQOFNcRyrvaWqUwDquuQllxau9siGFtl9dVR6uO3AWjft/9bPCJBMgMeyj5L4yfnmw3q6OOYqFXuPreAc3y4IURmP8c80UpCA1q4ORQsQJd73bod0wShEVM21f+yyRRhJbdA+TWyddGBRjGt2tVRiGx/CTs9b3O3Qoyov5nnRYqC4x8xVx6wlH7Y5BYV9CKbl/ypjwiFvl6p6Z6MTs0nvtHSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IQmLQO1m; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IQmLQO1m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxVdx50hPz2xQ4
	for <openbmc@lists.ozlabs.org>; Wed,  6 Aug 2025 09:54:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754438081;
	bh=bQZpYRBWBZZ2eBR7/tkk5zAeMAYqUXjK+6hTKI1L6/A=;
	h=Subject:From:To:Cc:Date;
	b=IQmLQO1mGzr2OQQMWYGwcesbTEUwHhrSGT4qdJOSrnsjrCl4/rVi/abnt6p9W4/Fg
	 A5RZVvTNoefjzYojVNjNeYj3cWqckcgudPV4VcPo/gCQR/snuWej3BVE2UmRiKDhO3
	 QKlATMOhVAfxWA3ffd9vNmDb/i4cCH9H147WWJN8mwyj7nnSO7PoMgkA4h6LxZbnLQ
	 inagTixbMYVwm/TX2sLV1utP2x1S2mK6rFSN7FxTbX7xv5PREpjKRfqIN0jkRD4FIJ
	 O8UF9ilZAHDOEpz9O6BGMRasvXgF7gRn6h1Sx6OM6J9jA59ThuPmGClbvCmWnbjej6
	 ojYcCJF5FFaOw==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 89FB767B49;
	Wed,  6 Aug 2025 07:54:41 +0800 (AWST)
Message-ID: <eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
Subject: Proposed deprecation of device-tree-gpio-naming.md
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Cc: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 06 Aug 2025 09:24:37 +0930
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

Hello,

In the comment thread at [1] I've proposed deprecating the directions
in device-tree-gpio-naming.md[2] for the purpose of describing GPIOs in
devicetrees. Devicetrees represent the hardware, and from experience
over time I think it's best that they reflect the information from the
schematics without influence from software implementation choices.

However, perhaps it's still a reasonable set of suggestions for
consumption of pins with the translation from net names done by the
applications themselves?

Please provide feedback!

Andrew

[1]: https://gerrit.openbmc.org/c/openbmc/docs/+/82246/comments/08d45bf5_d5=
4036d7
[2]: https://gerrit.openbmc.org/plugins/gitiles/openbmc/docs/+/refs/heads/m=
aster/designs/device-tree-gpio-naming.md

