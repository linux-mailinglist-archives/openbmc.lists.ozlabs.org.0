Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CE3A8AC43
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 01:34:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcgTz5k09z3cPl
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 09:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744760052;
	cv=none; b=VX0qE3AlaLQuAg3UWK4uazuj+DNtSaLbFNaV2kHyz3OPSnWlA7Fct3ilDJ99VuqPPiKU/mOBqDTG4N+yIm2iJFUKLHq6I/cr6Ovu+z0EPLoWNgjKLcBoj1ZLNLm7XNlLjtNdLmmf7nID5kMsCP/zk1Ydv4gpATX+XGLxLGCG54ZkSC5ol36xdROTud1IEKmUvntJ7xaMpATvBKxda0gUY0XZEnJYElUzSZ5FDoZ8O/VdsUkRUReIz+Yiso/uO14CE7g+TFeLGbGJGxNvfcsA3rXnj3RUeo9ZXXb+tXys5wxutpx188O8kPpaSuJ5E8Yyt04Z1vtKEMIWFe1DcicmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744760052; c=relaxed/relaxed;
	bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMpbDLaHrRMEw4pZ4b/umOMEPqmzWQ8NSb4pBaL21JZ0uLP/i2HjOmHG3OMk0wdbt8c/gAtnUQVHYi9xKxsQHCaWNxkLtvU+7mb4CnVmz9RhYIYseDj7n4NPw6Eg27gJRZKw/ESjZl9IW2iIYbGdfr2aSr+wKNMMUOQOMIpkNhjQd9Y19/tEcSzlou35K0DZ5K/tSjYsYJSPSPpjrZ/Lyg/9PyVcrU3DAArvhQw4B7LE4aO0jZL1qFZZqsxOuddzC06+r4gCzPN1JXrEfRdxIX+FsETJATtg4ALC4/ZDiFIwVVdQzt5/uDqeaBddYKayUIFOSb9LinhA1eF+rkq53A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=e7IGnrJr; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=e7IGnrJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcgTv1GRsz2yqg
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 09:34:10 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3035858c687so4724600a91.2
        for <openbmc@lists.ozlabs.org>; Tue, 15 Apr 2025 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744760048; x=1745364848; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=e7IGnrJrvDk6bS0SxjYjfQzA/ZzFWSaBMDPgAqG0dNFo8YTXO88xqT9OSV2zE77UWU
         OqzATgRqx0ejnHXg7AXj6n5yK9YTqlqSPocP3hh/1rgIiQhdi2uuqMzE6pRUri0AR+Wq
         wsttV7Qq+UXOpc9tzdzg3os7doqHZQhvcR1GR8y7gjVkxi69pUnE/MKXjoqnw3qhaVxa
         WHWaB7v2EZBvCg0q/hDcCzMaO4ZTQQy/Fhk9OW3DUK6DiPciBjHqwIqcRQUZNdsYbrMN
         dzBSw85/iMrNUuwsbXBcqQt9pFSwtocQtTberulNXlTeg+TpVq/qy54g/VTaPTj7LQPa
         GJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744760048; x=1745364848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=d0F0fzxz+iF5zNdBc5HVLp/umVOnNpWO02Jn+j0Gu7r3q8WrUigf+oKlwO7B6GpbyX
         eT2XBKAbS+PJOD9L0MGcEoz6BPt89ChLdQz6qSjpZ2SBQzwR1M3vhmjCZjKHBcMpUDOl
         p0RokVw/VQIPW2Fw6aXWn2DUoXH/FJWwDiGizSGIY0I6hbdmqU8Dy5qrzwRwCejAYATA
         hv+tgXUR3ClnfYzAvUqDQLmrGCx2LXV29OWwC+R+d04CU2bCdA1lv7GTSRMCo8B+bmq4
         6l4EdxB9tYRaGuRWJt75/U7+Mmp0Dj6XfSiggDXPfIu2mo/D7XhfMvAfvFZidFLMns0I
         z5+Q==
X-Gm-Message-State: AOJu0YyLlyGodJt0nyN3H0MWTNvOvqjfLC4hlOSdlJaFoIAs8ZLN1aCX
	+j7k83p2eYUS1xOC1ptUdCKhEHN2Ul0RzKrA2UikWxjqF6qoD3CMLMAt+ArL8pQ=
X-Gm-Gg: ASbGncuBzYosxkVdpOkWPV0dZ1PWrBB5UpIPEx3rw2I6xbNwhGybcjC/3ORCgER6dwM
	1WFpohFuHnvYrnGts2gCD+AzSWNm/gltnjX+jLUZ591XrUwtBXvhj3nqdLmItH9vfdW1i7QkjsR
	1X/exgtMgLtxlWNgoBIEDY7iVfc88tyEDiwQEQU/2Ok7VpfuqPxllJ29yavXkkdGxlskbCg7VAw
	e0R3z1Nkd5V+DUCZ18U95U+DytS/gppoMM4Dgb2VjCxp7IQrux1mNDvxuv7Wt8zyiqASZGgV6B3
	wvxKsYeWdLLtK2lPfTfOXSAdIFTNeJXiWTQ4Bu7ND0rBfQlyo9iSOT7P6z7j19gZwcw3t2buLbt
	3UdrvDMEo5PSnmoufJtzDuhejRWU=
X-Google-Smtp-Source: AGHT+IEfEDwFMRmNLgi4NTTzWD2Cmv8qP+8plZfNcu4lPBsBXAVvMOeIdGNyZlsubwfe4N/9/Y6P4Q==
X-Received: by 2002:a17:90a:e7c7:b0:305:2d27:7ba0 with SMTP id 98e67ed59e1d1-3085eedb4d9mr1387639a91.6.1744760048494;
        Tue, 15 Apr 2025 16:34:08 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cbff8sm171782a91.49.2025.04.15.16.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:34:08 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: nuvoton: Add EDAC controller
Date: Tue, 15 Apr 2025 16:34:03 -0700
Message-ID: <20250415233403.2052913-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have the driver support but need a common node for all the 8xx
platforms that contain this device.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 4da62308b274..ccebcb11c05e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x2000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

