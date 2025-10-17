Return-Path: <openbmc+bounces-757-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FEEBE6ED8
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 09:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnxHd1kL5z2yMh;
	Fri, 17 Oct 2025 18:27:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760686077;
	cv=none; b=bM4RW4hkEcsn8NdqzBi0dFzrL8TjI5QWjsvl9U7UR7+XAjPHJZjCsOp9QyO9k1K1c2yju7zC1SIniF80aBQuqkqr/LM/aonV92aZrs2i2c4Utn3LGy/hXzc8jlhJKVuXTm3N0IRC2PU5d4vxBfYE6KVkYkDyppOECk55hw6RjSGETn+oEaCAp+x1DRUc7NUDt9k7WnexcDBu/l8sm2XxXAaUF9wwOXUqBLWeQmeiZgC/nO0Kl1X7RIf23fjfLF+Rf/CesP+10XEdk1bIZTYrUTu5g2g+nJQdrySvuOdO38Hlkuc3c/6Z9JWO/cnzPlpqC5xXt6pUgq6cA9uqb69Gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760686077; c=relaxed/relaxed;
	bh=CeYmHe2krBmRJ6wb9noy1AZ7ZcEqcmhOzbisZa/Zn0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTOAdw9y70YWjTFG5t982STJUNKfbpOhhSae3Cr/hV8INJb902ZdYIfU/QXG0zb9pmivhtc/ocOOc5eRValYSvTXXatIWHEcGFWT7C4guyuLGg9Vfvh6V8infdyHdMLORVILwtleeilMHvf1SFjiN6ufMNMW4nxcpRRIe43CaescdUhktHreZostXE7fUb+LyHxr62rglSCY5M9D/Ih6gArM3WW69PjY8wB4pA4YZp8WdJkA0xKvP52YR2zBdVv799ccl06jCz9iFNOyOdR30WqGeNaaxrrYgs7wK+rGWdQpOJxaTOFFhLCPJfMKYP2HqvjJjZE6RZ2Gsbt+ie/v6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VIz76RX4; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VIz76RX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnxHc45h4z2xQ5;
	Fri, 17 Oct 2025 18:27:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760686074;
	bh=CeYmHe2krBmRJ6wb9noy1AZ7ZcEqcmhOzbisZa/Zn0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VIz76RX4NyL2/lwkpiHUBHlniXsm88NzdohT42OCC6jZRkVCnmCAm4q1QezGJxiQF
	 nqGCL0odsbY+KGW4RrQLUsHZucGbEgWn81mOIQ/51ojlQU5SXVg+kQiD4MYH9tfuBw
	 V4VNH3h6CNDZ7QAhpn8X1sYr2VmvG6QJZ/YbGgj4tBgNwhz/PEqHcPFJ/QHfFNE5T2
	 tUTed0LwGCB5RDYXq6Rukc9vgK+nLeSoCbzkVvzlDQKXStokEeve3blocwxA6qE7Fk
	 wUscGyg7liKXOBf/W1insVDfobbK/YdlbH13XkV5IuebXQoQONRTSrDd+mkDQfdWsc
	 x18V1qULiQjWw==
Received: from [IPv6:2405:6e00:242d:9743:e1f6:2067:ab3d:5861] (unknown [120.20.206.235])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 651866477A;
	Fri, 17 Oct 2025 15:27:51 +0800 (AWST)
Message-ID: <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 17 Oct 2025 17:57:44 +1030
In-Reply-To: <2025101759-runner-landing-374b@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
	 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
	 <2025101759-runner-landing-374b@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > Hi Greg,
> >=20
> > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > Hi Andrew and Iwona,
> > >=20
> > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > > Hi Brian,
> > > >=20
> > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > Hi Iwona, Joel, and Andrew,
> > > > >=20
> > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > driver from
> > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > semantic patch
> > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > >=20
> > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > >=20
> > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > like to remove
> > > > > this API from drivers/clk in v6.19.
> > > >=20
> > > > My (strong) preference is that Iwona applies it, but I'll keep
> > > > an eye
> > > > out for any unusual delays.
> > >=20
> > > This patch wasn't picked up for v6.18. Any chance this can get
> > > picked up
> > > now for v6.19?
> > >=20
> > > I'm hoping to get this merged so that we can remove the
> > > round_rate() clk
> > > op from the clk core. The clk maintainer (Stephen) mentioned this
> > > work
> > > in his last pull to Linus.
> > >=20
> > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel=
.org/
> >=20
> > Are you happy to pick this up directly in Iwona's absence?
>=20
> Why me?

I figured that would be sensible since Iwona historically sent you PRs
for the PECI subsystem.

I'm open to other approaches though.

Andrew

