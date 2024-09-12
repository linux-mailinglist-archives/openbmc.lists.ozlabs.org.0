Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC532975FB6
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 05:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X42wy0DgSz3c7M
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 13:29:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726111758;
	cv=none; b=l/axB5SkbsR5USbqYD2Isup04Xh5XYnJWb14HowmCasFpBqmmMo/5QgnsZjIfZEm10JgvPy4c+534H5SwdvTOW/cWjo8TJj6PebWjqIbtdupVIr818Mh0VcYtEmi4NSmPfqNkToudScXefjhGToD/X+nckLN1MLbe9uDjcAJ0PUojhoJVxAc5fgMArhbty2bl013p3t2YqRJY3MATKnHi3yvlvCQQ1k7hetVc/Hj9LaDLqDX2OaVYKXZ0jjCXDdqll2dN5ckLG3bQIMMllARywBKRHDhGfIQ/DogUfuiCLf5br7yflfTf7ffOF9Y+GIJ2PhEE73HLz2PcdEhkqUUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726111758; c=relaxed/relaxed;
	bh=NBhclpfolmEvdibEWmoAueUq7R97jIS+/zeD/gJ91Oo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O8P6w62hwxmz+iDgte07vkZ3eHql8CzfDkA6R0ciOegW7Z/2TKGQZIlT5G5/ogsVGQg2pEj4pSfjLDvbZXR9Dw1rBRwFI441v+QOWSJXwan8inZhK0QvanM4S0xXv+8+Mdz/KEdyqoTpEPatfAZsLYXmoQl/cqO85BshBgUPjPFVb0snTmNeCF8ygteHLGjJRD4lTN3krHhF0Me62FVNZZ18mMyDiwil42MbNcgCybbo8ZQvNOsQCoU2ej8T8iAG8NqHmTL2CUHIkItr7fgwD3vIC6YUTUBc5X+PfPYbVVTKOk5J9r6JZaXg8k2DQWmSLitOd5hV2OXjA2KyfmX9PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ywpo1uts; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ywpo1uts;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X42wt689xz2yF4
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 13:29:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726111758;
	bh=NBhclpfolmEvdibEWmoAueUq7R97jIS+/zeD/gJ91Oo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ywpo1utsfscBW4fbkpbe5izHFIpvFN/GSnmL7oLgr94KBLjb+rAbwZSoybKgt5q9O
	 o5ev7Zug+xFmX/a0z7zyja4Zd4M6uAJnazOeGu73LVyby6+ivnasf9ZHf2T2IQFrrA
	 B1J3jChtlNzSZEnii1hMqvarDYkbsPqNj+5Op4busfQUJ7BwILUpiVkbVhrLG55yZj
	 bqidUXBstwunm/A4+Pll68DAI4+gagPwuc2mMPC1H7bMveD8Fe+Tl7BSR64xAcpUAh
	 5x46pWCdkQl/NoHHPvb8oiAMvhLT8yrDqQGWPoNEOGK4ISnYqouPNcOhdi6mEdzIy2
	 gHY5gsybIpTNw==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1D48650D6;
	Thu, 12 Sep 2024 11:29:17 +0800 (AWST)
Message-ID: <061cc1de0837018e39082a421f40352e7868b171.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] hwmon: (pt5161l) Fix invalid temperature
 reading
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 12 Sep 2024 12:59:17 +0930
In-Reply-To: <20240829084120.656973-1-chou.cosmo@gmail.com>
References: <20240829084120.656973-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-29 at 16:41 +0800, Cosmo Chou wrote:
> The temperature reading function was using a signed long for the ADC
> code, which could lead to mishandling of invalid codes on 32-bit
> platforms. This allowed out-of-range ADC codes to be incorrectly
> interpreted as valid values and used in temperature calculations.
>=20
> Change adc_code to u32 to ensure that invalid ADC codes are correctly
> identified on all platforms.
>=20
> Fixes: 1b2ca93cd059 ("hwmon: Add driver for Astera Labs PT5161L retimer")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
> Link: https://lore.kernel.org/all/c16f3254-36c1-4ec3-ac09-ca15ed547413@ro=
eck-us.net/

Thanks, I've backported the change from upstream directly.

Andrew
