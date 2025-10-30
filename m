Return-Path: <openbmc+bounces-837-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D79C1E804
	for <lists+openbmc@lfdr.de>; Thu, 30 Oct 2025 07:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxtqG2D3Dz30V1;
	Thu, 30 Oct 2025 17:04:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761804266;
	cv=none; b=fmTQKsk/dSbGf0m4cXRxkkYACZLYoMXrXie4Ulxg3xjHnWsCzUUVjL7ZkfD5AC+NLjQCgv1IKAqn4LoPa1gw+3uRXQld2mAFBN8948CE3zToW4L4zDQWeMgcQIsViuyIJ/loafmHpPI4xd3LFEpbTIoIjtCM1qAoBo32G9pwCxCoTbWamtspcqukwL9NC9xR5HfMB0G4uJ6SAoZ+kPoo9slUTvB/J+8grZz7gk3ShHvV9ruEQc6rNV1z/qt/mfrbaVcGn3jMaq3cWG9ROXdZPZpjMFDst9z47shLJgdpG4mfdcA/esr+JBAcP0U9CYFEcmrdJPCa/WRwDMU50OKORw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761804266; c=relaxed/relaxed;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DMYzLgKDt/lbFADEL9EIl8HeKe69JWEu4VJnHE5fr8DT7VEKje2dGioFq48pkgYyJY5wZBRSMylx4rmrGjJROz6hjnrlJPmNvyDsIWjSpd1VTaVFLL8uwsKnlYoKZqUQxyMb5hFp4BAgKhMnfFF3pHdvzq7WK+ACyIUW/By3BwyoJAqRthDVY1SSRNO9/029FUteIYWgLcltrLgzsuulJket5SnkD4zSIf4t26QM2i/keXCtcpfxyVtTd/xU0VwGPm/vtm+rfERtm3419xXrECS4zfEkEW68zfzB3Grky2jEWpH1g+cVN1srjikjOeyLQzFHiu20VfoKdPhNTYNqkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VNcTJt4c; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VNcTJt4c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxtq91K9yz2xsq;
	Thu, 30 Oct 2025 17:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761804259;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VNcTJt4cIN2/f4WEgxABC6Id7AAblH/HICBg+PaRPVG+ji+iJv43te7VZKyYtZMc0
	 pAo0haH4Uqg1V7ki/IASKd0f6fTmhAjTQPBaRdNvvhiPp4SKWK2/Wtef+/9tCi/bpu
	 SAuz5YgVaLZUs8McGlWx9QY8lGAcCZbEKXtiJgFs9kLQx8d91MOSSTe20kKbNvG8Gz
	 ORlORw1Rl+GSloNCrshWXebTlQd4lb6hWFM8dpxutMHVJivq0uBOvyemIq2DTUI/wy
	 c14EsHCY/aQmvBRPlJ1UqMfYHPCxTPgn3AR9FUKjEKg8TdbuHO+GEtWmqQTIUeidhm
	 IMbhNU3/dSQYQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 59CA379118;
	Thu, 30 Oct 2025 14:04:18 +0800 (AWST)
Message-ID: <0b9abd87b877595c13011a3d8b4e80e05488effc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  bmc-sw@aspeedtech.com,
 benh@kernel.crashing.org, joel@jms.id.au,  andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 14:04:18 +0800
In-Reply-To: <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
	 <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
	 <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
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

Hi Kyzysztof,

> > +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED I2C on the AST26XX SoCs
> > +
> > +maintainers:
> > +=C2=A0 - Ryan Chen <ryan_chen@aspeedtech.com>
> > +
> > +allOf:
> > +=C2=A0 - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i2c-bus
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion
> and
> either implement all requested changes or keep discussing them.
>=20
> Thank you.
> </form letter>
>=20
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus buffer
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
>=20
> Nothing improved

That was mostly the point - this first patch just splits out the 2600
definitions to the new file, with zero change.

That means the *actual* changes to the binding are visible via the diff
in 2/4, and not hidden by the copy.

This was mentioned on v20, and you replied saying it was irrelevant to
the separate discussion around the rationale for the change, but didn't
object to the split-patches approach.

If your preference is to *not* do this via a verbatim copy as an initial
step (and essentially squash with 2/4), that's also fine, but I'm sure
that knowing your preference would help Ryan out here.

Cheers,


Jeremy

