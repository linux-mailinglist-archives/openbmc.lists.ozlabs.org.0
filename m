Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA6A78521
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 01:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS3cp2rnvz3c8Y
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:10:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743549014;
	cv=none; b=MVpHGqghvNJsSxRFbapaXRWLZaPnRN2whVW/fc5qthTVa8ijKm25a4ZzNYHqKVD1a8XVv31mEKrShRD8sroRjxmb6parucW+FTcvbx5dAgjmJpCwSBLq28dFayF4GTYE8maXaj5OpN04GtLOcuKKLK6lQaBoZm44ICjWXucAsJ9K5Mq+rwNIMzSOOXT07mIMarxq/eoBFYA3qaPZPOmx70Nxi5YNmIZo7c2cRnrqZEW2U61QPHjzCqi9O63iDsSUudJEh4DKCPjwUd95l3QRPUP2uYZOoZEMe+avhOTUXoPJCQ7szpwlECiSozlJ64W3XvmMawYAvDxeJqBDFAV+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743549014; c=relaxed/relaxed;
	bh=HJoGY0zt2NxjVkfzNkoD0uw5cIldUNLmTUrnr2dqKdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCMmtb44WMmEb0mLTuMRAYsPa91U3Yl+Zg4Qrl5mbWv8FVMAM584QbmV3IKMZq4JECAc+MOdaG5k2d8xmxQ3f/aqwFme8ifJ3G8VeW/H0kwj7KWz+sFw0+YH8FGl5xJV8lPeXbaU0VX2RPCbE55FXjYAiuFQdjd1W4TYlj5HnJhTZBYx3kMeB+0w6sSjqmb3i905SDz36i/99Wloxg5NDnOYlrA2A2oW+BT/Cx/QlEfGcmJrRaEwe6s5GiQaDwCBH7eLluc4+eOUYkZnOCI5ToilAG1WmQgEywB7uz22+XvKtVm016mQbk6YqX2ZKmSTu7yLlaO+56N+dINyGoZ08w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PrmsGiw7; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PrmsGiw7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS3cj1DLvz2ygH
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 10:10:12 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2243803b776so51731375ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 16:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743549010; x=1744153810; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJoGY0zt2NxjVkfzNkoD0uw5cIldUNLmTUrnr2dqKdI=;
        b=PrmsGiw7fzQb61wTjsJnzuLRnRwtqRFhAem5mNSvscZJOKkDCjkICGOqtMQFXnsyTN
         m68td2jadI2PhCJDb2xWd/7M/6NFiVPLmiqSztoxQ7BBz39yErrX+z8P5RzfeP0Ltqx2
         wW2Vb4zCMU+HyHQPp7otuLrCn6RGvIPCsH/8Z4VkD7wgcfV6xO5dsDlb8Ue9mK/Fq306
         K3cjMYRdVrhwPLBk0EZqPTbJNqqqZIz+yLWHLud7AEkJGauWykA8xXFjHhsN/5NDCek6
         rAr2p5E9bP3JCLJuxJkniklZ0jKGio5exH6KeSnKrgJF9L1K2Aw3WuWhOJtxZaVOKFgq
         K6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743549010; x=1744153810;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJoGY0zt2NxjVkfzNkoD0uw5cIldUNLmTUrnr2dqKdI=;
        b=qVTcvcYkvNulAxu9ZLZvoaR7qeu0ouInZ5sC/15BLiRulad9zPo7dJ+nPKb6thjN1Y
         dFDfdh/2kG3qIfI2v6KQjuxl70EK7dZbpQ+Uuiogrpgo2livqXoDkTwwTHc5DmLLjm+R
         feWaxGCyhpqRl+Xgn6fWhLDP5cwdlC+hvLYPzXJ/EaXrytu6yI8AuRSck9t3f5/5OYSy
         AHSAtzBzHVEuLZuVuHVX3ZwyJdVhwd87nr1p6B4bWSnps7evFafCv07b2WIxfw/3up2J
         xIK1EthbSSodYUyX8eib1vPxq0dD8FxX0EJqfo1PQIB/sCKHe3lHfMxnOKdWaSHFMQRk
         0gnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKvIJlUkgUjZsOvwQpvGDxOQLyJen2VMmrstTStRa6nNJKfpo7IDV5l46rDphwdPuMu5Esa5qQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7hmn/h+6Hy5LAuTqxD6ObX/H1tQDmr6ZL/tTG6Mn3Pjt+ix8J
	W/MBgEEyAwV3AvzYrc5PkXiD+T59xX8alneyDyT74owv0oBgaY4SiGjL8tg4oUQ=
X-Gm-Gg: ASbGncskn7kZS1p6v0K6mLKSgux4AcIkaGPemcdUMOY95kKp7//Pux4d63I5747FktA
	wcu8gYzl0iMMeS5py2JK/EiXgdeAs+5y5rHsgX9GABITW4hIqlIr/SMk3feEBF/kfk0k6wsHUqx
	wnMb9OOZnzSHUpPNFV4eUmGo6rfIJbPKuCVJEEhkGzCW2DQp1IlTFBg7r4Ze06j4mSFDsgo34Uk
	PcDNU6dXpQAoX5nsn14NlrQ/1WznbsR94H1vSk7ZPPWNSwtdTvlNa47pfeLJW3jO9gA2UbjlQkt
	/Y3ghgFFnw3UWvgzNQZBclL/V8kXvXYXdQ42MopM9LPfrhxIzH9W22bukkhKcfytn9r8eKw9yBV
	C+glW3kiqTrC92OQ7NmQVgqjS55cvQBc=
X-Google-Smtp-Source: AGHT+IG/6yrvEy0DucEk+7yGDoGxvKtVhd6CgHHuqZC1H0LHR/81r26V6cKIRQYMnCllxZ56ye797g==
X-Received: by 2002:a17:902:db0d:b0:224:b60:3ce0 with SMTP id d9443c01a7336-2296c603927mr2757295ad.5.1743549010472;
        Tue, 01 Apr 2025 16:10:10 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf170sm95176925ad.148.2025.04.01.16.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:10:10 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2] ARM: dts nuvoton: Add EDAC node
Date: Tue,  1 Apr 2025 16:10:01 -0700
Message-ID: <20250401231001.3202669-1-william@wkennington.com>
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
Reply-To: 20240930214659.193376-1-william@wkennington.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have the driver support code, now we just need to expose the device
node which can export the EDAC properties for the system memory
controller. Tested on real hardware to verify that error counters show
up.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fixed compatible string that got truncated

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..c7880126cc78 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -122,6 +122,13 @@ clk: clock-controller@f0801000 {
 			clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		gmac0: eth@f0802000 {
 			device_type = "network";
 			compatible = "snps,dwmac";
-- 
2.49.0.472.ge94155a9ec-goog

