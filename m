Return-Path: <openbmc+bounces-28-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E0AAD361
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 04:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zsfbn2V62z2y8W;
	Wed,  7 May 2025 12:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746585557;
	cv=none; b=fYgXvDgS2TE34Z3C3rfdv5Vha9N+owwAfPx5TlejYIZqgzCFfeC9voxIqsvSL0nEfuUlr6bd+/A3nzPTyRAEPe+LdYQIRKPuWwiWWaqZOxozukysrqeoRJRj16SH7MX3rZpuMC06SKrtddjRTKAJwWYE6q1RbWFX/dvVUim4bh+kV34mB9OYxwW5ODcNNwzrfimGZS7I38+XhUBkYIRP9dxrRODiP8WGS6NAjZQMnO41+mgIjW/SBSaYg4HGa5K6ENMNgPnuwON3hTvJBIsTl/epz8UCYKYBFqvOUoznKFR1JhgCLpHyG3cwoJTv/cYTwONFpnp22t8wR+4/7yzheg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746585557; c=relaxed/relaxed;
	bh=BW9Mbotb7DptqVa6zP9NiVBowm1eZRCpQ6q2nbVAePY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UnCwxYdUkH4lq3Hc1WCLYAvV7CNuPxBndMnKE44sJdCbd0rxYs/SfJwzZ/YLlnkkW4cG+RNui9kEPthM9cG2FsrVLuSiHIayGCVHHOnrCJfkej96ulL9/UXjgZTi7zuvOkljgOQYSuaGc2q2d8olyeRYaGbu+sT3zi0XpspUTJ1FhBlTONbc7PeqxH4QjCPxay+p2P1yk5rS4OKNqprNfYlfQiBn+SJAWLCZ49HGbWM6agCH8HwewcfbWQPlkOVxcNTyf6Vh59OfXKr6azS2lzXBGbMyYJ2nyO1pWmtCeJHe/dfkz6tqN12RaFFw3ZptxY7Du8HPJz4YC58d1dNX9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MbtsnBpi; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MbtsnBpi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zsfbm1Hddz2xYl
	for <openbmc@lists.ozlabs.org>; Wed,  7 May 2025 12:39:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746585553;
	bh=BW9Mbotb7DptqVa6zP9NiVBowm1eZRCpQ6q2nbVAePY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MbtsnBpiO3vYwGBeF6POnqBj+HSq90yXnHnMY2WUNK2+Gqbi9YpI1kKLtMG9A6kik
	 qT7t0rnJpkVt/3QE8JvXP34geWKX5fU9gKxe4KfbIfV0aca03l9Aw0oyOX7N++k9WM
	 mV9sDstUxraScv5Ve28OVRcCAcE9nRgEm9SNBFyKWSQJgb6OmIqT1FRt4Q3lxTpDfu
	 OaIjWyibxDqtyxu9B0IbxYLoJPLW1OA9FaxevolKR95oVd5VYkJibuZ6yVaIiE/G4e
	 Dt7XWx+/vP6mTmugUl7pB20aMviKBR6lyE8J1vdgbo2NxEc2ITNwX+YWzoqsfc5dj2
	 3FbnylinI35xA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2DC6A64473;
	Wed,  7 May 2025 10:39:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250416015902.2091251-1-william@wkennington.com>
References: <20250416015902.2091251-1-william@wkennington.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add pinctrl
Message-Id: <174658555212.2363912.15584445504922514625.b4-ty@codeconstruct.com.au>
Date: Wed, 07 May 2025 12:09:12 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 15 Apr 2025 18:59:02 -0700, William A. Kennington III wrote:
> This is critical to support multifunction pins shared between devices as
> well as generic GPIOs.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


