Return-Path: <openbmc+bounces-1018-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D629CBA023
	for <lists+openbmc@lfdr.de>; Sat, 13 Dec 2025 00:06:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSlS80hMCz2xqm;
	Sat, 13 Dec 2025 10:06:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765580760;
	cv=none; b=NxWCITvpl+uGoZBhYiHmZY0wj6lh4hx+TjZckvLqxTHH5v05fl0YI65sRj8fit5AkDHzw0alr9Dl4GrEO9QqBVWkmOLf4taLVta77eaSV2iDwuigoV+YCjYFmPdHEzjqtu19iaa0g4DJr0mfCtp3uVk2fNGrq2y2TXXeikCqQuoEfUvIyuBxp9F4qjIKVmfGxsAL+OtJ3nZoFndrpyYhaNhCO2zuplNXiw9iyhgRMkTAsKmQvyd/UBqkutKOYpsyFoCfLh9JGn9TMW/+XjkzN7pL5DjYYGGld+G1TfyP4982wTpYgVfIJZfHedmJo4ikEQ8zv4/6Yqufio0RuUCAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765580760; c=relaxed/relaxed;
	bh=x5l4phBTQ5s3tak8rbu73PqDDxyijhO9BxipaFMLBH4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fJzw2sxfyf3Qi/EftwKxfJkuC+oNVIljQxrI45Dd2Vb31JsMYd8EvVCAY0Dv64eee77jb1lSM27DhzKCZ7+B+opySVJLGen+Jliobn31/zGTT7escrDeP9fbqj1779qXKay79SlJrqWhTcBBE+x2kkuCn2ma1a7vJA2SUYHPZuZaXJBQtKY56TakQspdQt2fDIPIt0CiRZWpRswhuy2EaIxZopSTmSCTlvcRR5aeFbHXgotb34fNn59jLQ8/PRgkwpaNAySIAUbsvZEX33UKVDtHLN8XqRy30kedAipi8kh6yVa+JI8HLBsQO6f+LgEYLCxeLsDMOm82t+irFtZ1Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jiFkvtOO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jiFkvtOO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSlS65fxRz2x9M;
	Sat, 13 Dec 2025 10:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765580756;
	bh=x5l4phBTQ5s3tak8rbu73PqDDxyijhO9BxipaFMLBH4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jiFkvtOOi1rI+ninI9Q/X+ONt7F0b8K8Rtwkl/uaSOPD7NAZAPpRNpd7GPDC5TIed
	 ITcpORYrpcHFtU2o2l+Zy1N+h6ZB2JsFmCrExwlHN4bxLny2EC+BBe262gzuKEILVs
	 LF2Mv+hq9Y0LnLOLiBRBlK+6VIX27ZX+ch2SPWSBORcBR4lc0a/w6pmqZSFVq2TRoW
	 2gjww3rFueIk87oOb+83aKxIDBVxL3I/IcpyOx5au3kcJTaXPvpYReuuNqW42GMeVg
	 kRmwx2MntlwLb9dcRj9Ad6S7kznj+oalmwbE/kszNE91aXFQdGvYYBXt49KwsoKpX7
	 j0V4K1M6Te7Cg==
Received: from [172.16.11.106] (fpcf41bac9.tkyc510.ap.nuro.jp [207.65.186.201])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A6D3C64DF5;
	Sat, 13 Dec 2025 07:05:50 +0800 (AWST)
Message-ID: <35ec28a70d360b2139742e9f04ff77e4a907cd2b.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600
 EVB devicetrees
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Linus Walleij <linusw@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Sat, 13 Dec 2025 08:05:43 +0900
In-Reply-To: <20251212150631.GA3997751-robh@kernel.org>
References: 
	<20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251212150631.GA3997751-robh@kernel.org>
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

Hi Rob,

On Fri, 2025-12-12 at 09:06 -0600, Rob Herring wrote:
>=20
> Don't you see warnings for at25:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'size' is a required property
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'pagesize' is a required proper=
ty
> =C2=A0=C2=A0=C2=A0=C2=A0 89 (atmel,at25): 'address-width' is a required p=
roperty
>=20
> These are due to using the deprecated (since 2012) at25,byte-len,=20
> at25,addr-mode, and at25,page-size properties. I think it has been long=
=20
> enough you can just replace them with the new ones.

I don't see them, no. The series targets only the aspeed/aspeed-
ast2{5,6}00-evb.dts files, and neither of them contain at25 nodes. grep
suggests its only IBM platforms:

   > git grep -l at2 ../arch/arm/boot/dts/aspeed/*.dts*
   ../arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
   ../arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
   ../arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi
   ../arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
   >

Once I've got the pieces of this series merged I'll encourage platform
owners to start cleaning up their own devicetrees on the basis that
there are no longer warnings that aren't their problem.

Thanks for your feedback so far!

Andrew

