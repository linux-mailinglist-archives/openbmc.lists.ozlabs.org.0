Return-Path: <openbmc+bounces-134-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D58AD27AC
	for <lists+openbmc@lfdr.de>; Mon,  9 Jun 2025 22:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGNyh3rbcz2xHv;
	Tue, 10 Jun 2025 06:37:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749501452;
	cv=none; b=Ys6Oee/wJCUFZm7fgpKLmmgmx177HlIfPNW9zQdzi9yThGpVhoan5DjPJ1Lgi8XZc5Sz7IwQCjldw/jR68AUFJrt9bvwUbHcim9D2gqLQLIC+otJlxKjzbLDhlDyyxuGVw3TSxBtNVP+iFyInnLqU/8DOV2djRz3JdHtME9tPHPnyANzr2U0whMZMk2Qpiawse/mPcs6GhS65lpjDZJ5ACUkoSsmCfl2rJiDC4LA1n2ftUBgFP4WOTahq3Kc2F1ddd6w7g57EDEqjtfMOsxZpzbO37lbY5cUfApFKWwmSy2HiFrt86bESzejIZsg+y8cUFez0jEQLFK8frO3Nlu2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749501452; c=relaxed/relaxed;
	bh=6iIkQWccj9AY8f68njIo1FEHDMkQuoyF4wKi3UqF6K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUskSgaPIQIc/HzNTHOk8cd+2eTdRNvbPTJVNdn1r7LQBplLAtP4nQt/gzbq7acVwJYlRhQGlw5OUsx3tzIiu9ENUy89xjNGASnptSj4MIRF44ye3YUzYGK601Zta7TAD8ZXtk8rkZSs9GWmqhfyJaHfzAMbmkBd6qwVRmkMhsWg+apvvvxQEJ8VAXfY3w80Wd3D86U79AGiokgQ14F7JJyQlVKYollNyIibJnuKtb1UrXIu5k75/mOuFCAbyxgPu4w0WCXyn+3JuMGtrEGln3pIf69/3ZIGZvbDU0phyoR4tJngyob89Fl570dD+GlG8x5pRgIEJlaYjW2RDYr1cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jw23jC3n; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jw23jC3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGNyg65ZRz2xHX
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:37:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFA5D5C4CFF;
	Mon,  9 Jun 2025 20:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC63C4CEEB;
	Mon,  9 Jun 2025 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749501449;
	bh=sMl+KyYXZN1gPkv5OuQg53B/7jDSHwN6BgQLgKD+IxA=;
	h=From:To:Cc:Subject:Date:From;
	b=jw23jC3nhoKN0TYG+a57rDYpE/1cm/4nfOjPtoByAwZJBCNKcK+DQfbXC411IX0EI
	 EIeV2q0pCjzJgN2D4387yn4EUFepGm0SgXBt7DA2rpg2BjN6VZpTSBf9oc2FaJhcFz
	 vyW65ouc3e2yMA/tP1pqRPHGiIHJsaJsfnkqrvGIMJygXR5RQU8XFb6IAjFLZAaZY3
	 Gl3nLXqFg9qCWj3X74nrQY4hwQaqV7dHF6lYS7ZtBDvAJRq8Zxy3QYqM99xyVmZotL
	 SrEh/TMt3kOTnLGFtSjdc9M0aywBO3JfOTugkSbXTGQtMVjmA4GfdyoE6mzXu+M/aq
	 77G0Hbi/3PQ/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions" node
Date: Mon,  9 Jun 2025 15:37:20 -0500
Message-ID: <20250609203721.2852879-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
no CPU affinity.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index fead4dde590d..acd3137d2464 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -32,11 +32,6 @@ gic: interrupt-controller@dfff9000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			#address-cells = <0>;
-			ppi-partitions {
-				ppi_cluster0: interrupt-partition-0 {
-					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
-				};
-			};
 		};
 	};
 
-- 
2.47.2


