Return-Path: <openbmc+bounces-1053-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96519CC9A72
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 23:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWnmr0yDtz30Vy;
	Thu, 18 Dec 2025 09:01:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766008860;
	cv=none; b=g79wPkERUJJKeUyxcJNB6msmefIgnd8cDLvtt1VGwup1ZXGKDrc6mroP7vomVWPj56oiVxhOqdgD0x4PhPuAPI1JGoTDaI6RBI3v31VTwDRVhM4YjO1Vnh0ekVpgEsQl66EZicd5YC0ezX7q77b0bCKro0MgoKQi+yYa415sGnEH/mvEvBxaFtI8TCZO9THK5Oy31Zf8n8fC1rlMWrJnRAiGvM2IlMgBGJgxKphUC+6soZOKPiEGDMesOm3I3Fl8umv0ckISzAYogu7R4O+aVlPgVIGc3xXS3aWlyrPnaZZIVT3GSFWKhYoEI97/vgzmdHI3cm5Al8xj0lFEpyRZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766008860; c=relaxed/relaxed;
	bh=fzcRsvXylZN9aaLtqwzTReh1wZfElthhV45WDpSLtLM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f5f090CeSX4i830cefDn5tA2Pz8mTIjA/rdsmQOps764ctiQqjMmPkeKgvEHGHReJDVgGNKGfQHYyxxD3s4ULOuusV5jS6t/YceTwin1sZPbq+zKMG36Inb9+bEM/gQlNCZFsUcsleDM1WkpHeae4YqNL+FYqkfbXcA4gIInDrfc1/nB7dTLsh9Uzxh3ZgehnteFTMIfEVa8McF579chBt/DpdjM4r7ZuP/k4T4Z6u+vdCqru/0gHtvFwrtEKTak49CRrDVxfaoWZK9opLl5d/noRRCBCF/2RbgG7vAhcE/fqjmIP8JZOHBz3X9A3vUiZHJRdkUeMotTl2PPgpWZ1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fApoOOfA; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fApoOOfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWnmp6T0Kz2xl0;
	Thu, 18 Dec 2025 09:00:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766008855;
	bh=fzcRsvXylZN9aaLtqwzTReh1wZfElthhV45WDpSLtLM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fApoOOfAOl/WLHh2U99ktvCT0tJMUee5y+YJOw2D6yPmlO3QXfrC4pXyDavNvNOFQ
	 0ZrLl2bX3drG8K46ydoTHG/YL8MJMBt3Pe/eVVR1eqZnijWe1OvGNMSVrM8q7bfXJs
	 brC4+s/JlkwpbSiFhenmsEWkVTI5ibT6QqI+0gUr7p0qDPwDtBCBsWoXwo43xF/+vi
	 lMW7yiKE8BHSKDNwW7TiyML1D20eSbBYZFMhNZ2ZHfluXXf1HbQdQv358qvwkwywKt
	 VaVXXCJC+ozudhxI89GAzXLN1F4yrkcFrCPjXWe8s43Y7u44/mfwV4Ignyu/jXDdJn
	 fUSaF6GA/zSUg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5400D7C1B2;
	Thu, 18 Dec 2025 06:00:54 +0800 (AWST)
Message-ID: <d6046a94820cda6bfcc3953d6c737152a9f0cf37.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Linus Walleij <linusw@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Thu, 18 Dec 2025 08:30:51 +1030
In-Reply-To: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
References: 
	<20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
	 <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Wed, 2025-12-17 at 09:37 -0600, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > From: "Rob Herring (Arm)" <robh@kernel.org>
> >=20
> > Convert the ASpeed fan controller binding to DT schema format.
> >=20
> > The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> > rather 1.
>=20
> Okay, I can't figure out why I thought '#cooling-cells' needed to be 1
> here. I don't see that anywhere in the tree. The driver for sure only
> supports 2, so anything that's not is an error in any case.

Yeah, I'd started doing some digging to understand your statement about
it needing to be 1 but hadn't got to the bottom of it.

If it can be 2 then great, I can fix up the #size-cells and resend.

Andrew

