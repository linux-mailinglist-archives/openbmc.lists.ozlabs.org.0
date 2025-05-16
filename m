Return-Path: <openbmc+bounces-47-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FEAB93B9
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 03:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zz8tJ18BDz2yN1;
	Fri, 16 May 2025 11:40:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747359656;
	cv=none; b=VcLqcJKseV+V9RIKAKwIKXxoVhnjZAzuK/aaMBxsg0kdSlVL1Ar6JkDbyi+cGphOFvag8d4AJ1grPBYxUu/UoE/tgPoMetnE6a78dKQ3uojruxDapctvWyf2i6pnopYf5muTpo7JxvL5u8kJk3kGndO2xY0kd4BRFR3qtb6QeIgF2at3lN8bhXqVnJX+WF9ybHk3ukxF0qgR31+guOa5GmiApgjbD+s3R2lACdr51tW94eVcnoIX4TGwY9KGjEjPyuDqOphz93bQFhzEh6HWVJ137J8r2DKyp2o6mYCj3u3juyeysXfeuEUzi1ROHBDrgSBzNs/Go5CtAAFVE0NW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747359656; c=relaxed/relaxed;
	bh=xYwYkoPvFnksxYm2WIby6ikd0mh1/9yZSrmKAMkbS1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E4HP/BnmYDRNeLrG4ZWgvQUotFrWi66lwzhO3JIcvUvFjDRK5ifxMm9mBr0RQ/3cqgYc2qxu1IEwYbfwLDN22HE9xG+8tk7z4n0EjmW3ienaOes2s0qzMjYmK7aB0ZX1KRThr8P+j/UZAnjJcWvU6X/WiHr7VCQfVm1q7x0vYtLfXzKecN8JdSdkqEgWyE9sCzH36h2C24Cc11EQ4DDxndNE7Tn+ND/csfttBeuNMPiJK9BXWlLIhe5/77788n+axwrtD4+dfC7TWmjQNstcIhlWyPeSfQfWD5gG1IWh0O4O6cr4S1/zhJJZ+sq5CuZegyRpY3D7E+EnrKV0ZWiHGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hRkgbrih; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hRkgbrih;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zz8tH0P0Gz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 16 May 2025 11:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747359654;
	bh=xYwYkoPvFnksxYm2WIby6ikd0mh1/9yZSrmKAMkbS1E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hRkgbrih4Z4j9NIv7u5aklzhPss9pivQk0mFtYBw3icJOhWk1rChoKlMrOQgxmW20
	 2ojCsogikuOa4hrLm8HSZj9XIZBpoWn7Y9T4DLACPkn5Fcr1u9zoC5uDl44A3LyGCl
	 NFfoW5Ja41gInWbPB6CIYm0s3wIVF1MHL41hTFndp2/rdclhGTNltTqMcVKAuUAuE/
	 q5bZv2TchpQkELt7HL0m/h8SbAxMMv5IhyPrxzoT29ErjNgRCaSRxEqLcHrryCXtC3
	 2hK3jd3bu78VBvKVwGsaZhCpf1ZM0fR+wH3kzs4UXyFvr0xDTAmyWISjBt0xEnmNo8
	 aM3pNg4e05lpw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E3DC81CFF;
	Fri, 16 May 2025 09:40:53 +0800 (AWST)
Message-ID: <8496d9af19aa5a1184efb3f8ab362f87801b4054.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v1] ARM: dts: aspeed: Adjust Device Nodes For
 Nvidia's GB200NVL BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>, joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com, Ed Tanous
	 <etanous@nvidia.com>
Date: Fri, 16 May 2025 11:10:53 +0930
In-Reply-To: <20250515065625.685064-1-wthai@nvidia.com>
References: <20250515065625.685064-1-wthai@nvidia.com>
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

Hi Willie

On Thu, 2025-05-15 at 06:56 +0000, Willie Thai wrote:
> Remove unnecessary mdio0 and mac0 for the latest version of hardware.
> Enable HACE and ACRY engine.

Generally I'd ask that you separate these concerns into separate
patches. Given I have another comment below, can you please do so when
you re-spin the series?

>=20
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> =C2=A0arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 34 ++++++-----------=
---
> =C2=A01 file changed, 10 insertions(+), 24 deletions(-)
>=20
> diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/=
ast2600-gb200nvl-bmc-nvidia.dts
> index beac18cfcb..1bed579c1e 100644
> --- a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
> +++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
> @@ -46,8 +46,6 @@
> =C2=A0
> =C2=A0&sdrammc {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clock-frequency =3D <4000=
00000>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed,ecc-enabled;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed,ecc-size-mb =3D <0>;

This change isn't mentioned in the commit message. I expect it should
be a third patch with its own justification?

Andrew

