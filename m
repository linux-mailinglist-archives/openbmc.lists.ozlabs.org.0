Return-Path: <openbmc+bounces-1056-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF29CC9CB7
	for <lists+openbmc@lfdr.de>; Thu, 18 Dec 2025 00:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWqZg5BVjz2yFY;
	Thu, 18 Dec 2025 10:22:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766013739;
	cv=none; b=lT+J/fBkV5FM4jPJc/h12wA+srXqp3sSlHM4a1ZofALsZPTdIze0xQkQZuLP2lrRfYv1hPO80sZDsx79fQmGWynE2hc9wNHUktTF887FYMMEoFFAMgCnwKRZIbvuggY3XXFmanTBR2W20c0E1trHgHRGalKl5XM5ylj2tStOkMfczuMCBl+6vQcnD1ZazuSlZSWUqslbwe+xAq1ZmyGLvV3TqD6ql10H6xxyeLt018AKONP6PD1LZgMtdqiGbRRB5ZzPisgECiSb0e9yrqtin/2HgECCk1Xd762m2AFRwyjRj0DTzSa8oWQRkKaPddqSn7mUoBp6qv/yepMsYJxDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766013739; c=relaxed/relaxed;
	bh=An/dh+69Qe8AwBl8yL4PiDoDvRHbBVKuX7FThD3xgjQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBCgQvnL6agjiO4pvxpqXLWaoWYbzOgRYo0PD8bKBxJKyKhN35UOS75pWrg6qxo8txNT7lCbB8mIZV83xS+gmJ4cZPgrwZxpX4QxoqFPNZ97m3lQbWOa8sVC1VE2T5+mPdVivdCP0gosZvWhTvTK+cz6CEh8jRbXz9qqwjBgABiXxUTl0IBZLJK+ix+QCJrXhGkrCGe5U82dtq3rwDM68w/8eajcNnoiJVF30Ak6fd3H3y12bSLY/EhZ2UUQd6XjniqFjxctuit5omb/zOeEYzDNKDPEnrwKeJ/H+ey+l+LxLhayM4joxDsv3MGvGzkaegbRnriyU0TSc+gOA5qTtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=K7Y/10aj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=K7Y/10aj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWqZg0BWvz2yF1;
	Thu, 18 Dec 2025 10:22:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766013738;
	bh=An/dh+69Qe8AwBl8yL4PiDoDvRHbBVKuX7FThD3xgjQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K7Y/10ajRzQlraz7ZqT1w/H9LjiCA+lN7D2OeigeMyRx/h9qWxYJ+t7Ga7sF6s6lE
	 JuoqWMvhAtKETdchtH0uoqjp/xeYsIf8+wZd0Opf8yWW9L4x9T8FX2fnk/VOimrk2v
	 P0nh3zB7Fqj2gWIpOo2T6krP8J/GeMDA4gMHceEQziJEreepd1Sd6SRPDxxwe2hliK
	 wKaND46MneavZvLex98rDYA0vvTpTUhzHMkTIJlI53KI9V5J9sMukvsid/YNJmxqw7
	 KVZ5Nnb/2vRR9lfvoK8zCSAZOFeeddl/4Y4UfoY6ojSRFqA9/wewBQ2YbSxzNY96hd
	 0ZU6R2vEzO1qg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 080947C1B2;
	Thu, 18 Dec 2025 07:22:16 +0800 (AWST)
Message-ID: <bc0904e4742cd04fb49b2d39ee2c0f72f28c1c4a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 18 Dec 2025 09:52:16 +1030
In-Reply-To: <aUM5HcEs0OVrDO1w@molberding.nvidia.com>
References: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
	 <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
	 <aUM5HcEs0OVrDO1w@molberding.nvidia.com>
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

On Wed, 2025-12-17 at 15:13 -0800, Marc Olberding wrote:
> On Thu, Dec 18, 2025 at 09:29:44AM +1030, Andrew Jeffery wrote:
> > On Thu, 2025-12-11 at 13:35 -0800, Marc Olberding wrote:
> > > Add a 128M layout for the BMC flash chip we didn't boot from.
> > > Including
> > > this allows the user to write to each partition on the alternate spi
> > > chip. This dtsi follows the existing standard of using the same
> > > layout
> > > as non alt version and prepending `alt` to each partition's name.
> > >=20
> ...=20
> > This may be fine, but please add it in a series that also introduces a
> > board that consumes it.
> >=20
> > Andrew
>=20
> Ack, I wasn't sure how to handle this, since the MSX4 hasn't merged to
> master for upstream yet, its just been merged into the openbmc tree.

I've applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/arm/dt&id=3Df28674fab34f07fff9612c3f390d3699bfe8ed90

It will be part of v6.20 (via pull-request to the SoC tree).

> I can either just hold off on this patch or update the msx4 series.
> I'm assuming that including this in a patch targetted to the openbmc tree
> is a nonstarter. Any thoughts here?

Send patches based on the bmc tree's aspeed/arm/dt branch (i.e. the
branch containing the commit linked above). Your work is going to land
there anyway, so no need to strictly base your work on Linus' master
branch (though this is generally reasonable when there are no other
dependencies).

Andrew

