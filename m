Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B27A78547
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 01:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS4CN5RRJz3c8x
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:36:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743550605;
	cv=none; b=a3tETRvHSZ9XrkGkS/YK1vUhRJcjracaIny5bypH8y7lm/QvxvLIbBYXvHh2p5p2hjMbyWaHQieE3YKUVKNYR7lRXPIenpNPKvAyhGDx85tkNuCV4YYkMzAKCKwoqZ34vuYioAh7W3ZuV9r00puD28FJz9iZ/M5+A9+Ee7OZL5kmiGBaX14zNxGv9zh50mYVSTWD5y58KDiUJTpUNGxc5Y2v17V103IyXl7Js78bHHm2eGzmxPZzB1EqwpK/7KcXBdlLUgJIkfM/uNBUM1c84jG3W7O48WTYmBS8o41tnA1mjQ2EUuGeCO70v+frJIIUaBlCnKvDzJSWACgj8J/hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743550605; c=relaxed/relaxed;
	bh=1W2Oez/Sw08kez7PZLuhoXC3i+XpY3chBoG0Mg2u1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cm0JrH++/bK76iH3SgSZIXebV3uR4IF7puLdT0i9DH5pqrZEIK/rEYYi1blkL+8B9SHqkxpfJ2ET92d6JP3otv44mY90G/PWyofhI0oimBd7rMVCfTxiCt10htohBx6uZbn8haju0USZZ0V4yyCIY46Twmf6TbGjPI7pJs/Zh2HyaRI9HJElszViq3mg1jMGNocX7VIaxCmGlI8o0nb1zh5tXV+PD66+KdwU9DLYgqsiYIILPMgERIhMz6ezja8/dsKy4NjwJnEP53IkEfkvIo2mtlNrBJvChpMUKp2QirGLctMtmX54sGB30QnsvdXAAaOBTefQb0md3fSmEOfTPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SxsCCmY3; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SxsCCmY3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS4CJ3ytGz2yhW
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 10:36:43 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso512668a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 16:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743550601; x=1744155401; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1W2Oez/Sw08kez7PZLuhoXC3i+XpY3chBoG0Mg2u1RE=;
        b=SxsCCmY3TLHd01BxPvcjEFqsP0isza775AI1mRCYBPZsBMgAI9hGf+AwEYPsQ/jwLs
         5VkepcwELDssQlVRf7cFKV+rQTVeW449NMp1dRD5oJ0qZCKmHXRavNBkRZCyRFpNmFfS
         84HNmFm3J3sXLz68AdOEQN0LrX2D042gkQRw6oZzbMYUhut1Lq98V5puR+i4ip5Tt5Pd
         73CBrHaDPIZyljXhSTBtoqIB5bQkIPvcY9b7rl6J9ix9S8B+B6IH9s5+X91HWM9lHkxy
         BNNFamWbx2eMjx6XGCxN1pAFpYSQzTs2XDHVSrEBznYvMvzoL7yh2JTgCsOQoN0wy0FM
         IWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743550601; x=1744155401;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W2Oez/Sw08kez7PZLuhoXC3i+XpY3chBoG0Mg2u1RE=;
        b=WiPaNLVn0Wn5UJmaLiyGXnRGzzNrsaVVMhqu++8q/wvesVvjaykipr778h+J/a8K1i
         DIPr6lMAIEbt4GJG++faHHYGHmTX2OcTvBoK9R4nvo2/ZSELLK+jfyNCXvp564oWWzVx
         HCV8mIkWC2vu/rtYYIO3fmmo9bcyZN/b+iJvAuvVypy+Sx/eW2HsRN7r9XA8ReqbhtNA
         Ix0TdK6EJK4exzRa+YiYfK9NSsCYWitkDUFcLcacuxfPfZdgolJaxyT5zcQen7xaqgqL
         tlMsnLyPZGyqXsFJNoWbI8sK9CVS95Ub5SuZ+keWfJCYRG674ygL0sqaX6Xo0kJ1cYqP
         +fJg==
X-Forwarded-Encrypted: i=1; AJvYcCWpIBrzqnxCpz5qDfkUy+RRRT2294ye6cwZZb6pGMivrW1EsjVMgZ9CY2/ulm+gO4jxCYGqdVp7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPLFM/AxkusFT97NasDiB/qPpO8ha7JJZWpnMdECIiyo2iYCAY
	O97ahKPVXGsGf50EUOasx8qJ0FiIfnmamMypuKChAHZx/qoSYhekWCzTXc2RifA=
X-Gm-Gg: ASbGnctMGzMtdkwTujL+OgdZ2wQF3tOTA2bLB4V/sj34thuDfk+opTCLErmemMa6UTG
	DXcqI6amrTy3QtJNjMsA+xgzfeY4YL1y8fiWWr4dT7/Gz9k9Th7jUUL5WpQSR3N2t6TWL3hzCpa
	47sVJ+dOB9qHFSAgfuayc5C8zR/2+03LEw3SHIRVHiS5ysWOxJ5vaoR5TDU8cEgrtCdVBjP4ShS
	AB+UiQWu6V9b3myB439mQ3cVO7xcCboKIuixtJxiB/1Df4s+oP6K1BRIleVP5He6UzYAMQrEI52
	MivpHzEBQ21wPG+CfA+6B+xJNdacAhjLhsZ19/TTi2cG4fkgN+5Qz4nSgQ061DTCqKoZHXxebR/
	1jIAihtyDoyzjLC0XX+Fb27R6v2YEGu6nelSg5NVdkg==
X-Google-Smtp-Source: AGHT+IEVaEftCDieEpS7ZkP41WX9Cr6Tw3+DC3MPmN07cO7H+9fJKbzk/i15pVNXyrYe+e1tH7GluA==
X-Received: by 2002:a17:90a:e18d:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-3056b714b87mr2357429a91.5.1743550601625;
        Tue, 01 Apr 2025 16:36:41 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dee47sm95153755ad.180.2025.04.01.16.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:36:41 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
Date: Tue,  1 Apr 2025 16:34:09 -0700
Message-ID: <20250401233409.3215091-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
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
Reply-To: 20240930214329.192587-1-william@wkennington.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The EHCI peripheral already exists in the devicetree, but the hardware
also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
works fine for this device already and has been tested on real hardware.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fixed nodename from ohci -> usb

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index c7880126cc78..5a466e97955a 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -151,6 +151,13 @@ ehci1: usb@f0806000 {
 			status = "disabled";
 		};
 
+		ohci1: usb@f0807000 {
+			compatible = "generic-ohci";
+			reg = <0xf0807000 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		fiu0: spi@fb000000 {
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
-- 
2.49.0.472.ge94155a9ec-goog

