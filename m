Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE933426429
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 07:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQcVw4ljtz304w
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 16:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qX0OVWJA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qX0OVWJA; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcVY0tPmz2yNZ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Oct 2021 16:40:52 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 66so2043073pgc.9
 for <openbmc@lists.ozlabs.org>; Thu, 07 Oct 2021 22:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rk8S64ojbU1+BiunC0b2zqtYpxLGWhB9CWU+Ca8Z/JQ=;
 b=qX0OVWJAZOxo5b0B+H4D/2m6yT0Itg6EbL60myALrqhBct/0w9Ud6z5nlmzGEC2xnB
 fWqDTKipuHCFT2Rvv0T4WYH/Mi7c5EC6YD/pZKqYNiUofMa08NeIsl6xjDYz0ZOQ7Tu8
 h4A7LKVOqqDB+kBf+FnJNHL3UFf33pzTCPy9b1gUqE/yP5jyIA5v2NdVccdQCRV/q+bH
 Av8N+/w8hMA2LZG+dCmu7fdOUFd+RYtWzD0mLMjxBZc0cHFlHoqjTL9wk6EyfI6v8Axr
 md2ogBOhwnNLSlX5H/BK8KihzEqEYWjlSUiJadArJ3jFC+rItCB0TBEaZ7nnARoEXgb6
 EP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rk8S64ojbU1+BiunC0b2zqtYpxLGWhB9CWU+Ca8Z/JQ=;
 b=UvCA4t6NioSdv1csZjjTrnpF4P5hUOQdpGoIt4ZEMl8lKk1fZV7qEZMS1V0NWhvrqF
 mLDPcVVKiB0mD4eRPVP3jLtEo8CyLphb9RDzhZbCuS7aJhI76yK4l+IqxHmMNvG1LWiD
 AAn+qI4hlI0PSnDV0VF90RFob1ueIm7edNIx13QctP5jGXYbUr2IFZ6cpyO70fXFaORQ
 BDjUMVsp+xkvvgzBPPPf7T7sX/2WJ06YsC3M/5o99zkp35f439oHF70x+Du0uymgi98q
 YoiD903cQDLgYf3j6JsCvBI8FWdm7oWA382yvmWDSb9ziELtM7H6Ofp0g00g3YUmVrQk
 FqEw==
X-Gm-Message-State: AOAM53278SvPQnKI4IdmSi+KmScAYCJiDLwBXx9whUaVyeNf5H4sLRC9
 kZS0fmC4OlUNICDoKELYGbQ=
X-Google-Smtp-Source: ABdhPJwd44Zz+3whStp4xWiN0QJ9WniPpBO6g1A3K3SdV7cD5+6yZTXDXlx6Wm1jXKq9nvmxgChptA==
X-Received: by 2002:a05:6a00:1703:b0:44c:caeb:482b with SMTP id
 h3-20020a056a00170300b0044ccaeb482bmr5764202pfc.60.1633671648760; 
 Thu, 07 Oct 2021 22:40:48 -0700 (PDT)
Received: from george-Quanta.com.com (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
 by smtp.gmail.com with ESMTPSA id on13sm1075626pjb.23.2021.10.07.22.40.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Oct 2021 22:40:48 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.14 v1] ARM: dts: nuvoton: gbs: split SPI flash partition
Date: Fri,  8 Oct 2021 13:30:06 +0800
Message-Id: <20211008053006.31961-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kwliu@nuvoton.com, Fran.Hsu@quantatw.com, benjaminfair@google.com,
 wltu@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Split the primary and secondary BIOS SPI EEPROMs in 2 partitions

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index eb6eb21cb2a4..f20c2ae4f576 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -415,6 +415,19 @@ spi-nor@0 {
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
 		label = "pnor";
+		partitions@a0000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pnor-primary@0 {
+				label = "pnor-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			pnor-scratch@2000000 {
+				label = "pnor-scratch";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 	spi-nor@1 {
 		compatible = "jedec,spi-nor";
@@ -424,6 +437,20 @@ spi-nor@1 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
+		label = "pnor-2";
+		partitions@a0000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pnor-primary@0 {
+				label = "pnor-2-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			pnor-scratch@2000000 {
+				label = "pnor-2-scratch";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 };
 
-- 
2.32.0

