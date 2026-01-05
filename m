Return-Path: <openbmc+bounces-1088-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD0CF5633
	for <lists+openbmc@lfdr.de>; Mon, 05 Jan 2026 20:32:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlPb11mHXz2xqG;
	Tue, 06 Jan 2026 06:32:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767641565;
	cv=none; b=kIwa9b/fCjxgKAO8IyULKMcYWp/W6oKs2rzXlxKYnMNpuJxvw8gZ5HBCNoUPpBtKL24QaIbDJSqQdTVs+APn0+edwAdOSrWmTKDGCNy2MRRiM0+RoyiOpyHO/WuHEpqpRvGZzsSIXmfOQYnle8YrmUpRDwTqjFsfBk+YAdHhOttGoGJgBl5RHqWR/aiwZp828jty9skJjBuGeaQSuMdK3T6XgXlaDaLqSdTL9LF5bOWSOrxK+J9cX32TJD+t8jtmaAi3BKuZv3+iHjJMeD4ssLe9ix+xJdT9/PD7sK3+1yGa8TCrnfGCZsk0tkAriqWRHW17yiIV0KbURQ4LcqVuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767641565; c=relaxed/relaxed;
	bh=bTRsffjgTQlTCnNQvybcl/bByU61mbt4tS+ZVVpZ7Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UAO9eHOIvdo5CepWO04X2o/y6+7scTq3Fjcp6zwvoXv/Rd+UPTXPLrrZS4PoVB9n5iDIL3cCdaCE5y/FJtu3acs6d/kdly9IatfBL3bmowu2w/HBBynTAVO/kVxKoCEAO0Ry+Y0/ZkYQ3F219TV0YFqWRRQpQ56s+OtB5wimKhe/m9huQCkJJzXIAj9ZTnO5ppkSWQvAYbLXkISjeYjbSbvxeMRZWG9FnubnC9TTT66//FzgbyDzn5psepLzJZnyeesC2FE9g0u+o/wzzAgh9SYTCEpRkQedb2/f2zNUY5/BlqXbe/GbSYO2vraC3BTA1wlnadUs767czSeLQroHsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ys3AGcdx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ys3AGcdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlPb01sC5z2xpk
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 06:32:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE21443FAC;
	Mon,  5 Jan 2026 19:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932CEC116D0;
	Mon,  5 Jan 2026 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767641561;
	bh=sRtr1e9Jf97ZH16WgkB5lDqI9kVF06XBN9Bt46UFCHo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ys3AGcdxpTbzEZvrLgRX3f87by04HRXpBhE7Em2avmCKPqg/7sNHGLnAM9RZElQnL
	 PxXTRv9VYcEZ9hTH8R40XtVeuxRhzyQuw+kTwGnVfbnOXu96JNWHEcqVH54yOegn+P
	 sWvG7V0sh0OaGrgoxdCa3/U1XDo0eg9OauI7u6REtArmRVsY5x6zyH1ohUksBnsiRG
	 16a6FVfPOn66XN5ZURL46pR9QrS9D3TgU1VONa4US76/mJubwUBYAVasCN0KqHX7NZ
	 gdYndLDGU5mYSAF4oSy7TpYLhc720AU+cNcEVtSHgplGx11VfOyupcbVigb6cavLE3
	 jxHqSpz+rFmog==
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
Subject: [PATCH] arm64: dts: nuvoton: Add missing "device_type" property on memory node
Date: Mon,  5 Jan 2026 13:32:31 -0600
Message-ID: <20260105193232.3167128-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

"device_type" is required for memory nodes, but is missing on Nuvoton
npcm845-evb.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2638ee1c3846..5edf5d13342d 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -17,6 +17,7 @@ chosen {
 	};
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-- 
2.51.0


