Return-Path: <openbmc+bounces-571-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D20B412BA
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 05:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGnVd4KCDz2xlM;
	Wed,  3 Sep 2025 13:03:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756868601;
	cv=none; b=Y6WHbuW6ukFrMnfnRYKGBOb263kJHT9QT87Izb8GwOQIgKkEI8Hfkqbw5H6Z+dWiFXJ71twibjKBc5GUqH2LgVNcpd4ZyqYwjwiuHGvaVbDUY6a3MwwK6F1hLyWCaQn78YH4VF1EuqT5/o0bjhciRvQzbF4YAe3LrgTHySO4Zqh531zz66yHmYFUkbdJlF5gs9qa1O9wLAS1TjOGc2aAncqtnRP0lS3qCvNr4IhiZahe7TlDhyStwue1bsjX1dc1ThcaNxMieI5jeiK6IgOLLy6BIzZucKAa+XypAIUaZ3+2SA5S7zW3hL4VwdksWYjAYuj9ht1zJfu1jrQbrlrPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756868601; c=relaxed/relaxed;
	bh=dC3BlKDsQo4SasvikH5N/81BL3aGjY4iT1OuBeHL9r0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mO6C8RSklRow8DGQ3I1c+FjOoBXVr6DtG2BSb4VUtsbbzItPT1GvB5hSFRq/z1R5tFhEiMsnNN3avZ45ZRyUah4JsQpAyTQJsA2EdPB/2ZYcHkPbphBevcF2dMaL/a/dD9oHPi5zHH3sJ3lQqPBy65oDfbDq69WcGLqzgCpI/G2lZgSpY01iqaCwKGcnWrWVcAqk7IXELRQiTrQKseuUHEAW5fmwRiZbKFpoLCwyG1f554vd/sJ7PG9TAq/4Bt1xyA4Grhp4iPHrcqxphG5G2x28oFZV9uPF94EtjHyT7QSnGoBah7EcWRsaDSosKuG39sJgbVC67+BQydycAfbRLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VqWwo1qa; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VqWwo1qa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGnVc0PPFz2xgX
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 13:03:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756868599;
	bh=dC3BlKDsQo4SasvikH5N/81BL3aGjY4iT1OuBeHL9r0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VqWwo1qaa6SoQv20C4KQrc6+9YvQYUw7vo/HNCSgES6AiuO+Y5pxgVsMfQrBDnT6j
	 RoEqf15k3ntMRZ4WcUUTLTQzsz1hnpkonkOdD14nILBPTJZn9BBNErCwJw9QPPTl8W
	 tL/H3Y/ag09j6dmtaFZFh1WMPXAzWX1+Ninb24DJ40MWqlXWzCSBAlN6/BJi53xp5E
	 6Nalfe/6Kxg+2zqXPoUG8yT5Zi5sAmz+0/Ryz2IqOxalVACuWT/SrClYMRu0gv2GHj
	 kkibptySH24nrt89L6TAOWSf8q+I2WcLFoLGg2R9j9PAwmr1+I4rtfi8ssvt6sbg/w
	 3nvhlQBYMmJUw==
Received: from [10.209.99.88] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2AB2D69374;
	Wed,  3 Sep 2025 11:03:19 +0800 (AWST)
Message-ID: <d7a0a152b19dd7b73a2a34a34bc163372d39f20b.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 1/2] hwmon: (pmbus/adm1275) add adm1281
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Allen.Wang" <allen.wang.quanta@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Wed, 03 Sep 2025 12:33:18 +0930
In-Reply-To: <20250815011921.716573-1-Allen_Wang@quantatw.com>
References: <20250815011921.716573-1-Allen_Wang@quantatw.com>
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

Hi Allan,

I've applied both patches in your series to dev-6.6.

Andrew

On Fri, 2025-08-15 at 09:19 +0800, Allen.Wang wrote:
> From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
>=20
> Add support for adm1281 which is similar to adm1275 and other chips
> of the series.
>=20
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.c=
om>
> Link: https://lore.kernel.org/r/20240425070948.25788-3-jose.sanbuenaventu=
ra@analog.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> (cherry picked from commit 916300902725b362d5008ee10825a39056f0b095)
> ---
> =C2=A0Documentation/hwmon/adm1275.rst | 14 +++++++++++---
> =C2=A0drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/hwmon/pmbus/adm1275.c=C2=A0=C2=A0 |=C2=A0 7 +++++--
> =C2=A03 files changed, 18 insertions(+), 7 deletions(-)

