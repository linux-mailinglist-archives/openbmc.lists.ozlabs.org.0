Return-Path: <openbmc+bounces-402-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C43B112F4
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 23:19:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bp3lp5HHnz30Qk;
	Fri, 25 Jul 2025 07:19:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753391942;
	cv=none; b=CzQYNPsE+kkKkYkj2iQLsmdKZftkq9rbURpkKWaLv2uqu6TBQcgvyrBiyt5rAHFtTPq8S581rLXb0z2t6AM8CFAxVu9+hJP1yLAcyoS6ZQISAol0uJj/kGwPFFpSfPoIcnUWQMcvD6yRfwmBqbX0fnK1LdTgqE9PBidkpAf6nWLcde7EtX1jE6HTilLSJY9RGXFzyTMK2p+nzQoiPgd3oW15MV6dLJ0bbPJkUQFYBhuGZ7CJaTl8qpvt5k+Qijz6klmFAkDNrirAcBpV3LtvlkrRTbCTLwCzngOOvSJ/SCoTEqKeNGI3pKSqI40ER6VVpLW4c4eL4f0kErXUgRqgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753391942; c=relaxed/relaxed;
	bh=sDUTulu8EaMXy0JMLPPQVThRM3cEeroePKOHsh7S+wo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=beYQUl0b3e/ywiw/nJ087ugRz0skv8Z5ABGCeJ44bEpWTS2PXu1Aqs49zM+bqnOJqCgtkunq2SCDcaOFlG+a3vOnmm0WJAj6KB0Mr4oIMrL5b593ZedOPxo0JTBVsG+cyZyCMJn1hTwJ/k3ZOLiFoB0Jui/5Cq5vPTHE/Bq1BJdNKcoMkJXFj6vTMm0KwsIV4fyZBWMXRRGMWZnkvoC0p0ECJYB8efnuqGpoXkwdbjajsIBMdRnrBTlku6Vqg7T78goOUyT3L7K0k0Dr13j9n7HbnVZCW4p9HRITHmPz1PwVHrR3LRUJK7QnkZb37gHgg+QojZvLeUouEa06UMZa1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dM8RfUPP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dM8RfUPP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bp3ln6fklz2xS9
	for <openbmc@lists.ozlabs.org>; Fri, 25 Jul 2025 07:19:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF37343457;
	Thu, 24 Jul 2025 21:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5A3C4CEED;
	Thu, 24 Jul 2025 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391939;
	bh=sDUTulu8EaMXy0JMLPPQVThRM3cEeroePKOHsh7S+wo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dM8RfUPP7mZBJCohjnwCH8zRQR+DUU8jOFkmU/ZGOxK1auHybNNou9NH9HLvOXIun
	 SLWZfhuaKnid2Rk8oDzx1xZ7K9zkKQfrSnCebo9BQ+mtR5kWHXL4BfFZaPYM60zpj2
	 2+m0RZo41BWgkQuj3TbulXf6q1ZOMxvDuYQd1BT4zqT0rh7v9tIxwdZ3sSeTffDJps
	 gyEAPdT5/vPGk4ywsJYb9JqK9pbebbH9CKprzFHux+oIDZggTmTaPqKYqMeZJIas0D
	 pJIrjj+ill4abKJAJBR5rmnlQBfyZEd4TBXEHE2a50h5NMDt45uFPeBnvWjseZHadr
	 VhuAxm9w8xr2A==
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250630232637.3700584-1-robh@kernel.org>
References: <20250630232637.3700584-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert nuvoton,npcm750-clk to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Rob Herring (Arm) <robh@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 24 Jul 2025 14:18:58 -0700
Message-ID: <175339193882.3513.3051672630813216313@lazor>
User-Agent: alot/0.11
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Quoting Rob Herring (Arm) (2025-06-30 16:26:36)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

