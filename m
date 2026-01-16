Return-Path: <openbmc+bounces-1214-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78519D299BD
	for <lists+openbmc@lfdr.de>; Fri, 16 Jan 2026 02:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsj1W4twQz2xpl;
	Fri, 16 Jan 2026 12:29:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768526943;
	cv=none; b=YkSNTX23KrIIp5fbxDtYDcnV1QSZwlN8VUejgBXmTSqAozOgJo7bv2cgH3VXTdqO8o01dVB4rbCZ6AxHyTgTL27FFA2ZmJXTVrcTTsliGnBKeO8ZCN0QFon70QbTpH5VEEGYah6P6VSsl6hYtPNdVXceBZ/ZLo6npfBgs4bDeNEXD/Aq4newtYYHxqsM+PH/NODqzej6IRE6RJGpmQS6RUuGVCaP+ELf5HfXlmYUfdDJkVyw37PdXX7LPZM76yyVbp0WPmSs6cNIsk0EzUc6Zw7trjgPZY3BLSYwXvGMePlUXS89xOP2VlCL0imCXhl9xPQs4HflY+r+ERYULJeUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768526943; c=relaxed/relaxed;
	bh=HcG6roRHulppOKVp44IUXfVxD1WCgauSHg9jEnufi/4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=G6B38gGsl1kJRqcnA34ly6K/fC5A/zZRag0iJb6wfL2Nr+TJlHa5UnTRUv3tLxLd4EovDeBdIhy/PUxztMSzz06JW8c7qaK3eSEFOLwtfL8rFc04zQBmdWabpBatdYjfVHJLKkOoSm5LL0ess1XavmCwvjlR3w6/K9ox4qBhbXiHSP1KHeb5GkgLwdzIRiaCTUZL6qAsPqBFFt6xcKl954BizZ01ea9CaK9v09hG3lwcleV4ydkjbnzf+ZbijpqKBOjpvZVwtPrw7WzWBsjCXldu/zavEwEDkS63cBFZchyHB2uaW1gnqZr5CBxo3BrGYXPjyNL+If1yjRxzMk9PMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PMjpUz/g; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PMjpUz/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsj1V6Nmwz2xPL
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jan 2026 12:29:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768526942;
	bh=HcG6roRHulppOKVp44IUXfVxD1WCgauSHg9jEnufi/4=;
	h=Subject:From:To:Cc:Date;
	b=PMjpUz/gqXSNvff0F0vcsit7pow+gc1BByvcDNwYXcc5bbBidqX1cOma3HcKa0I61
	 VA8vm44RGmiq+Icq3bRbZQ5GIJb/cFL8FeL9+95xpN2a71Mx9/awQ2u06XG2tswfOJ
	 SOjoPHrXFkz/l+ASls41f5dos/siIUC+WTPgpsKxfldo6Az+NR06VlNqu4DcCFapuE
	 y7Am5oigSLxuz1Zv0pF0PvGQ7PMDHgMOV5brUYmgZu8Z0hMftycJcKxd47KqJPHL8t
	 iS+JSlMHtiLE+TBHYsGmzP3Z/IoISEVRSR+ximJoOewGUC2K/5jPyhvAuCyhqya8JG
	 EC0EUdIAVns/g==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0757164705;
	Fri, 16 Jan 2026 09:29:01 +0800 (AWST)
Message-ID: <0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: arm64 devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 11:59:01 +1030
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

Hello SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-6.20-devicetree-0

for you to fetch changes up to c6a40c867467c23d531446c2b11d310b0a6641e7:

  arm64: dts: nuvoton: Add missing "device_type" property on memory node (2=
026-01-08 17:52:13 +1030)

----------------------------------------------------------------
Nuvoton arm64 devicetree changes for 6.20

Just the one patch from Rob adding the device_type property to the memory n=
ode
of the NPCM845 EVB DTS.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: nuvoton: Add missing "device_type" property on memory nod=
e

 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
 1 file changed, 1 insertion(+)

