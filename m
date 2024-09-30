Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D298AF62
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2024 23:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHZRL5mTJz3cND
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 07:47:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727732827;
	cv=none; b=mec1liBhVpGBTcmz6zenV9uY44mA9HTBY3INBSCbhmKHr8VGJa6rbnjLhAYsEtt4G4pxHJk4mrT/x0BA1f/AKRWnZA9T7+5fbLU4ndcBhDzSwrzQ2Twb8HKyiFhuRiYzYJ/ZMpqmC4AVWE2XIjGXekMXpNPn+iAb7vynSfQc0KznUmGwI+vHx1KMxsFkEGRMX8x+33/pa7roUjAYhOOHITYTaSv/eFNjW53FCMoVb14O2TDY/62L8qPaOhxi9DxNutLYz4UnWiiwCjNi8BDkRc3lIqBd9DBDrmbpaXAoWus5kx1J2TmlBk9G6jg1jl6cj2eeP14M5S51lQfWLCkk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727732827; c=relaxed/relaxed;
	bh=yMqHdeTj7ucU9GaPyPzazSvBub7TbuDBX6paCdDs648=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAXQYvJjPm6GzWZx5eNfV3eCbS+pjPEXlfWbPj+5DHDRFp3DD+woo68R6FWcQon2j3E1ghwE6XRKqy4/JlXvnQ2A4bgF4iJnrdyd+3UMEPcliHUfuhoaAjrqPzAWMOjALWvc80kNmn68kEOgws70EXPmihyVLAljUqKuIytv8k6RSyPomMmyJHlSeLRNOu5qBrkROj3/sSeP06lrIkqJfsEynTyz2MLQESNI1nA0p0ym8RKC7Zg86ie7V3TjjmgC0Qnfb+wFPUTpAxVS7Vej/BpvExdMy6GemTbiYA4UX4RmuhQYJ24nWrkR3mDCCgrfjaI4+76MhOhNuxZ6wWVcMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TWmXXN/T; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TWmXXN/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHZRG6ZN9z304s
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 07:47:06 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71970655611so4495511b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1727732824; x=1728337624; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMqHdeTj7ucU9GaPyPzazSvBub7TbuDBX6paCdDs648=;
        b=TWmXXN/Tb7358mUQHDb/zTryPauH6HYIfTc7no+GyIVeP1p6Uo+wvuI9vdKMwAvnkg
         /NJgahVYS7RyuD8YLatzvAQGbsyguD00b4yOi8D3xsNhoaCzyLyhAqJ8/mmdch5/RlF/
         TfvShAmijtAolAsLj3PasNEbvnzGIAbJR5xEResZnR7i5rzpNeNNye3Rb2ueB1KtjSiP
         /G6q+S96xw7imBc9wMriMhb+DkXAL85VA8MQK21j8l07JkEkeWm60Xy0mf14+v7cjYKd
         3WE/G489G8mgACsa3Zfcj4DydiDIZwpVEECAoaQF570s6fhQnRs0BEbyJAxFJgmtQ2NI
         L+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727732824; x=1728337624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMqHdeTj7ucU9GaPyPzazSvBub7TbuDBX6paCdDs648=;
        b=HBOyQYtKWs0aByjJKMGVnwcoWlvLCbsPDrqmrHhSeXPoVoHlJYMLqHybFNQ4hG0XfM
         zv4oS8it1bEqKLeRNSfz8QeILoYJ4kpqfBZ+3c9TXI//n3krLek25djT5Svx5pJe4cn/
         laZnyT7h/9rKebNVM2D+KyTRrQZjMq6a7Po5tatHbtm/sl3OT6zTmWRBz7AY5/+1PUMT
         721Sd23bVPK1BQjJfvZ2JnUNo6WY2QNtilXf72akmMGMjRMfkeM1nFMuvLhgv/w8r/qo
         x6leBqA/XJsAWD5UYVOrXbS+r/3L20oTPFbcS1xdVpC53sdXP2mRdMz7vTZh+4/vUtM+
         uDxg==
X-Forwarded-Encrypted: i=1; AJvYcCUs/hXaPh7nPqH4H2QzMZ3Kqq5nCudCBeNM8BMMCMBQlKTFi6/w1EIs1gvqYTQtRUACJBFRedrs@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydCdvw7Xfe6SjuzrZQKsAiklJmtD/P9Su9yaE6rJ/9Wdgd/Yym
	S+oEb5p0qBQSkdv3pga7bfeI3AqCKuIJu7RBR23w0LUy0EfI0vqcp1KvKDue0pUgBNAoup7LjL+
	6ruE=
X-Google-Smtp-Source: AGHT+IGeWoerl1azL8qki/9a37LglG5WrGNd9x7T+yJy4k0261Nq+LgWrsllmElNr2v1P/aDOf8PhQ==
X-Received: by 2002:a05:6a00:1989:b0:70d:22b5:5420 with SMTP id d2e1a72fcca58-71b25f6eee1mr17646128b3a.15.1727732824378;
        Mon, 30 Sep 2024 14:47:04 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:8aa3:d4c6:5fe7:c47c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bc88bsm6734573b3a.71.2024.09.30.14.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 14:47:03 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts nuvoton: Add EDAC node
Date: Mon, 30 Sep 2024 14:46:59 -0700
Message-ID: <20240930214659.193376-1-william@wkennington.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "William A. Kennington III" <wak@google.com>

We have the driver support code, now we just need to expose the device
node which can export the EDAC properties for the system memory
controller. Tested on real hardware to verify that error counters show
up.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 5aeb5009a5d7..019abceb16a0 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -127,6 +127,13 @@ clk: clock-controller@f0801000 {
 			clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		gmac0: eth@f0802000 {
 			device_type = "network";
 			compatible = "snps,dwmac";
-- 
2.46.1.824.gd892dcdcdd-goog

