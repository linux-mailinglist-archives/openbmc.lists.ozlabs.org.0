Return-Path: <openbmc+bounces-30-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF86AAD3A7
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 04:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zsg2J1Zzbz305D;
	Wed,  7 May 2025 12:58:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746586728;
	cv=none; b=HONCJO2DaJhmC1yWF/Tq3ZYjX6yczazfJ5vjbH1/yRuliCKFjTFPgLHmaiO1u6eJY9ziEVQfAa19sIXjKjcQ3zVflG912GfNjE1LixXp8bnoAn3mVRcryHH3D5GY6qgvLnkCo4GO1/6rxRrT+DU3/UOAvBTm00L7Z2Iu/W0+iETep2pRt30zPpZJlnxtUSqjDgUT8Pb/ZkxAaQ4fMyWUxsK1mUsafym6Wye2a5dK2J4kTZVu2GH59igw7uODE/B8jecFzLrQRKRaSMZqO4wgvMe3tmRC9tkJCsK4Z4E3aBDA6x23f/ajxS30ezlTMBJj9z6zDb2sq2BIMzMb03tAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746586728; c=relaxed/relaxed;
	bh=nXlSMWZFp/UNpyJGN+JfAGIB2yLICPFXWZ3dy64EAHY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CJxaHHTl7THIlIZgy9MdyPuMpWc6MR6BlT3h6i2pP/Rb+qLP6ZHEe6VQugxs9IGJosfh/lST9AgSZebP6PQcoo8cfXxt1pBZ52b42gAlsp4k7zRmYJduZqaSLi0aW8w++ep7ZiOAfABU36wpcn6n7/R0c1TTeyGSet4OfxfLGwqTz3sFlf3aFAIMlY21G9DVX5G8nysyF9p5NIj2Q9JrhrX1Ag/84lnlsBFTeCCvYAZAroZgtVxUsjMRXd5cncHOsJzGrTfnKG1/zX4APPNAhR2h5RhuPHSJnxWC2v4vwUH8AOqbgJI6tzgcNIkyH1AoLxBAakXEnMdQ+hnSc49QkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tvdw5ZaD; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tvdw5ZaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zsg2H40mVz2yGx
	for <openbmc@lists.ozlabs.org>; Wed,  7 May 2025 12:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746586726;
	bh=nXlSMWZFp/UNpyJGN+JfAGIB2yLICPFXWZ3dy64EAHY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tvdw5ZaDRfSlNK/cGmHOf7usOW3+sTa/3HirQ9VXE1cQefBjeB3YYi9ersBmWyG/H
	 vwFdvoHzh1Lwlitl4rsZbpgE9QHj9F1wG2DeGzkNTECwZSkNCZQ70IT9SIL+dxNAS5
	 7hZJNiZQySufSsP1Z6UDBwvL1BTjePJCwSuKBIFgfnk4+DIFdLkZpTGd9Nk/opLDNv
	 SGEN4MwMagyXK/PmelwtAJ1hZrxgDqEJSzwfnr5Wh07y1s8XlLMEH2vqGJulBsDtwl
	 3mhOSLlr3DIJaMHm6ka1SJZW7wN9t025Yhvwur9R1bww+9pR0zxSiLa2k+m7R0QB5d
	 Ho3XXZMybvWEw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5CD5764473;
	Wed,  7 May 2025 10:58:46 +0800 (AWST)
Message-ID: <59c5351d701e9dd5d8ea7d274c6362aadd22ddae.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Avi Fishman
 <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
 <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 12:28:45 +0930
In-Reply-To: <20250416001818.2067486-1-william@wkennington.com>
References: <20250416001818.2067486-1-william@wkennington.com>
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

On Tue, 2025-04-15 at 17:18 -0700, William A. Kennington III wrote:
> The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
> already existing in the kernel.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Please rebase to address fuzz as noted here:

https://lore.kernel.org/all/2ed50b1463f62a829f863b889ab818f492b73946.camel@=
codeconstruct.com.au/

Andrew

