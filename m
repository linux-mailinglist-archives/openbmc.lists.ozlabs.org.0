Return-Path: <openbmc+bounces-307-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5017AF0832
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 03:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bX32S0cYcz305n;
	Wed,  2 Jul 2025 11:58:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751421487;
	cv=none; b=h9WWD/ugAnXbyFx982iGtAgvmVfFiwELsD7fj8XUNte6BVjGRqFvJoFn/2OM70StAD851oBzAYVXlqVdXf9qj4Aty5uVoG3cim2/ItZ5nhi3QXCHLlIBOo2wuIAbBXBH6PAPrCX505h25Gajt8TBNK1q7EqrtdiuyKR39TxB8nXl9LKJAN325mc0xBMu6+DYpAcJYFFTa7+jsN/VtflVhw1mEqwJqQyscIklieLgwWRjPGsTdSzPMyIRWUaI7z7/oyYKxv5D0/x0I5x88iumoFXayEC5ENZxNOkeCBLjZQX+kD16hgEPEYfa8IarsrAIFI7OrNbQf087remR2iuB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751421487; c=relaxed/relaxed;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JM3wUULPQ91vY/yRgwQbK01Q9mcjAwDfCvlX36ceZxQbQsxCxoWj8N722kg5YqeDpWAncurBlxMaS0qPwFkMqKKHBRKqti5+n4UQvj1r8k60l8i1jNu/1r9bSjr2BkY1mIC3qTgxHNmNuDd0zaWZoqWtome/Uw5khMmuMKafYoepC/ep38cOSn5C6KP2W5Pj6NAvXhfMexvGMdVVOEVFWjdqZh6AI6GZD3hb5+YJNl+8wm7MKKID8w+5SpVb+4KY0RYhTNx/aZXrUIdZsaZi6urgcS2QNcc+4x9oK/G7rYevom+P0hL+vhOVZxKVEIIXOXg/TKserqgtZZJR5lLK1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RpUJV7H0; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RpUJV7H0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bX32R46p7z2xCd;
	Wed,  2 Jul 2025 11:58:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751421487;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RpUJV7H0lb+POZjhJ1kNG1d86TBEbT0WT3hS1RHABYv6qvUJcNimMrg6UT36VPNCp
	 SOp+JGCpScyM624y4BTceBkyJdAUax+0wlMICosNn6JLx/rKpHwWS3MWJXZSE0l11P
	 1nma8oCwyQeDEUA1Pk1gbpiafqiGjxNpI7RIwg//x7YanAPfxtLSerYits2FrnVgBr
	 y2CJI7bsEGTcufux5WVfAon5DO2FPLtH/pEiK4CaCYXLDJZgGik35RzWZDLd5rhYan
	 POscMV+LONrOd5z6wPCHU84aQjkSQXbplUf96UJLHKJakOE/KvRD+yg0oZY5R1M18F
	 maj175ErQGpWA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93B8D6443C;
	Wed,  2 Jul 2025 09:58:06 +0800 (AWST)
Message-ID: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
Subject: Re: Add bmc/linux for-next to linux-next
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Date: Wed, 02 Jul 2025 11:28:06 +0930
In-Reply-To: <20250702114941.5bfe1e5a@canb.auug.org.au>
References: 
	<2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	 <20250702114941.5bfe1e5a@canb.auug.org.au>
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

Hi Stephen,

On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.c=
om.au> wrote:
> >=20
> > Could you add the following to linux-next?
> >=20
> > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/=
linux.git
> > =C2=A0=C2=A0 Branch: for-next
> >=20
> > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> >=20
> > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@=
codeconstruct.com.au/
>=20
> So, does this replace the aspeed tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> for-next)?=C2=A0 Or sit along side it?

It can replace joel/bmc.git, however, it should be fine to sit along-
side until Joel confirms removal of his tree with you. I've been doing
the BMC SoC patch wrangling recently, and he hasn't been updating his
tree with the branches I put together until I poke him about it. In
this case I'll just hassling him to update his tree, which should
remove any opportunity for conflicts or the like.

>=20
> Either way, who should be the contact(s) for this tree?
>=20

Both myself and Joel.

Cheers,

Andrew

