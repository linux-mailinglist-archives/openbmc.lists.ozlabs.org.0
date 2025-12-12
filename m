Return-Path: <openbmc+bounces-1014-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F4CB7F96
	for <lists+openbmc@lfdr.de>; Fri, 12 Dec 2025 06:53:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSJYH0MFTz2y8c;
	Fri, 12 Dec 2025 16:53:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765518834;
	cv=none; b=lqzpB/v+RGeiRy8a512SPXOOZSrOALtUbO3PGFAdXaOujKNrv5K5zvFuyC8swe8seuSzo2PkZ+2YrXOboAJ4kmP+zeylkrT3T4Erd6bFOkmNBocetdAzbsHXJfWFNwkuzfBA0dSXuGrHgHO/RidmLAg9lyoZjkv2laQmHhzjBIwtGRDHOULX91unJYjkW13e9QL55o8mE2kGy6qe8KNa2ACuo837UrEggVSDtYdyyKCKBv3EVISwHKSdsUjNr2qxSrfq6JXL5tZkRHY1HcW6vLtp81sDS/oFxaymYld+O3JaWkd2rgEa2hclvHK9SSAHPuiq6VYiU2J6+CwKnrDBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765518834; c=relaxed/relaxed;
	bh=nymakgngEqa2xYkDvgOemL5CEXBpo6nJY1AxWDMssYE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g40zmbEEkyYsAZoIgZott50CxJwb3xZEYpPwNA6+9uq+nFJM3YZZNRIHtHfS07IhmcXCmz9zYpP3rpQzDrur2R5fm6EFyt/6/qLavYDlzeG9u/wgU5P0MFLVrTYhOesstuXo79/jStl9yZOHCYyMgEvopBPCEJ4skGwHRlC5x0P/q1iBihDopUrMZ6rnm8b41x8znz9GvipevYoVuoXL9qqnQVQhaPd3nUI2BB0oE9IqgVE0hX417DAIZqt9Qv/LoooT/SyjZML+KBNJ/yMYu0wh0MWWLROGNgXrzy1ZdGwTxqu6KrNxBhs9ke61ztCLgU7FjXBXGWLj79zjGTT8Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Uw8M944d; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Uw8M944d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSJYG0tRxz2xNk;
	Fri, 12 Dec 2025 16:53:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765518832;
	bh=nymakgngEqa2xYkDvgOemL5CEXBpo6nJY1AxWDMssYE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Uw8M944ddkCuo7TKw8vEj0pe9OVwdCUR8ds3VFZPFMoGmmwDDDDAS5gllwdBymtwM
	 rlDGAzgGt52r4DknCy8cSmpnb+STxVnuP+58X3njR8XEUE3LPK8wc55CYRB6ncShPt
	 Q9HW3vTE4rmKy34NEZULugrDyDarw5QL4j5BlqZUJU+1EpGr018H44Wss2dG4RtA5z
	 G0nU4S+rVQ/srzIa5VHUITWlgoDw8+w6nQpRxd33duGKJDOJ6rJApS+PrqshimNe6q
	 hPGK3ovU2t66VXQENfH5OUA8po09EOFJqrDF52BnIjDrfd1EqSGAojvi8IYet+JMx4
	 ThFy1QSuMkcOQ==
Received: from [10.200.3.67] (fs96f9c361.tkyc007.ap.nuro.jp [150.249.195.97])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 16C2664DF1;
	Fri, 12 Dec 2025 13:53:46 +0800 (AWST)
Message-ID: <97f2eee63e1ed908866c10721b9f0a57036723dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	 <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org, 	linux-crypto@vger.kernel.org,
 linux-iio@vger.kernel.org
Date: Fri, 12 Dec 2025 14:53:42 +0900
In-Reply-To: <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
References: 
	<20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
	 <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
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

On Thu, 2025-12-11 at 12:27 -0800, Guenter Roeck wrote:
> On 12/11/25 00:45, Andrew Jeffery wrote:
> > From: "Rob Herring (Arm)" <robh@kernel.org>
> >=20
> > Convert the ASpeed fan controller binding to DT schema format.
> >=20
> > The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> > rather 1.
> >=20
> > Some users define more that 8 fan nodes where 2 fans share a PWM. The
> > driver seems to let the 2nd fan just overwrite the 1st one. That also
> > creates some addressing errors in the DT (duplicate addresses and wrong
> > unit-addresses).
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> I am not sure I understand what the plan is here. I am assuming it will b=
e
> applied through a non-hwmon branch.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter.

Apologies for confusion there. The series is currently a collection of
miscellaneous binding stuff that I felt needed DT maintainer input, so
I avoided adding driver subsystem maintainers in To/Cc to minimise
noise. Rob's feedback at [1] needs to be addressed - I'll make sure
you're in To: once that's sorted.

Andrew

[1]:
https://lore.kernel.org/all/20251211170333.GA1557987-robh@kernel.org/

