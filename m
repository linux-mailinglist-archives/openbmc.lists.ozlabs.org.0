Return-Path: <openbmc+bounces-1418-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPq7HRTYpGnWtwUAu9opvQ
	(envelope-from <openbmc+bounces-1418-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:21:40 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808901D2109
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:21:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKNw1t8Sz2xRq;
	Mon, 02 Mar 2026 11:21:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772337652;
	cv=none; b=S0UxeS9ac6y8lUmWgXZOIK6jpYCS6TD5GjAkrmZx0dw87+Cjk1GqJ3DqpXLFDVvRjjNNCaFzjfcWC8iNEnun/aA1vD0eDIOoFIoRKyl4tpTA4zi3TYnIau/9xCJRbjQswvPavjxGMHSlG5yF2NByc+q1Cqzp+LgF0jYz7t01LjyRT6QXMEhLrHyfxB2clFxBQPX+1GZb7NKXUBop1GWNL+Y5wRKqYl0LcR+6In2K2ccMi/0X3+Dj3WKjwUASkjVc2G5QP3jgluG0gpYPvAlApnzLXEu4CnLMDV87uNAeqfXGYxRbzBuPmlQXvhHzwd1vD/J9RyUBcTSBYckTMS0FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772337652; c=relaxed/relaxed;
	bh=irAfDFV+joRs8Au0875laP1eN81+1VM7gVmIdtY5mWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mAAUkND3FfRh7ONUOz2xwPjqlw24C8p6oeESCcMJiDWpkph5ppRH08atBpIpSVGW8MCpbx289kCQ/Q+WFMrbkA9JehqCxKK9cuxFUuN+EVwFpIm5eqEcFxctd0oXKMP8QMZtSzXqRnzloqNgYNqU031Zf80VzTSK1txt5Uwb27F2Hazub9OKJDgahIweD4LiYH1P/dwOA11/buQWagPEsO9ogMpkyV3V7T3zPOprIM2uSY/gRZh5+Rf+FCCO4HMtd/4Wf/wpG/dSlqVg+uDAGnotlxVDweqe3J4vdsWN5zOLXFdScPoamaXoCWKnxfVyBVSwryNw0pSD5hj9HOZ63A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEqGEIqA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEqGEIqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNpJM4B0Hz2yF1
	for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2026 15:00:50 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d4bc9e48bbso1557499a34.2
        for <openbmc@lists.ozlabs.org>; Sat, 28 Feb 2026 20:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772337647; x=1772942447; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irAfDFV+joRs8Au0875laP1eN81+1VM7gVmIdtY5mWo=;
        b=mEqGEIqAZlxJVmgI53Poh3m+iK9RC3euJCBEbmpA7AgnO2sUuz+58U90r5QkL0k3vP
         Cp/yK/FUFpvCAi0K09DNc1D2vSSAEo4z2W+hFtZNfGBzf3rdxutD8L82qW5T3J+7aPF9
         z1U/hqwRyzOme4fk+HL8i57hDEcvu7gRVaDIyGdzkzRTDhC/F9pmooVhpmcyA103Nmcc
         WGvnL61bBody667g3Q7h0DdBaSigQxbm/afGSVBLlvnapH6zvzS6O7kEwddOTRHXifVt
         ez1CLxDZAjZZ/yPPqg1EctzES/6POSbt/1pfxJiQ/DS0QS+3tlooocz41f4m4nqUOlPq
         V78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772337647; x=1772942447;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irAfDFV+joRs8Au0875laP1eN81+1VM7gVmIdtY5mWo=;
        b=Cm8wflIE4tYWRl1piNKx/unwtvpmcMh9tT4sKsTxH/FdEoZ3XQ83/BoArGaQyKOnZi
         1dnGZHwdkEockTwMay3waeBURwK0owHWCrye8s2tBOxZ/tmKqJ4885VTcrrxov5/QRMA
         64SFwetK9i9GK4M+mmz3+XqzAxu5JJQffox+n4nLjUjzKyfmAgzNAc/UGC73m2Zr1uVA
         DQDknzwsqQA3+UcdHeULoXkA7G4fzIwsPsN18LO7knD7teiGDFGKRH1UaxVyCOq/mwZr
         7FeLJaLLmcP+yYDjVDbugUVqNeC9b213YBcNfKHiq5f0iYxbttF0ciWbn2zZPgDFWyTB
         tQjA==
X-Gm-Message-State: AOJu0Yxj8HFMtxZTSX2S/ADHSUslqeSw6ibYNic3+1Kl4ZMpB2baiLGH
	vEMdLsK/vv1rFwwrYjnr34P2b67yppSfTj88BjoEaSp3BmON5UP7YoYH
X-Gm-Gg: ATEYQzwlYvBwU9j6IWAKZHa0POk7nTrfxJnysS/NcvqkwkxUaJT77Y2YoBTTT3CAYqM
	a0Yfco8eQqbHnDD+0O9D8RGABvB15cb4vifVDwI7G67cE9FBBJ4YVej3/SMLJw4miAJRwnt8ccV
	gNiNMxEP+OzRt/lC1XaXOmvyuzrPdVOQPfXKSUagHpnuR9IQXCjVtUUsi7vsNUO+e3Q5eyfvYV2
	8lVYYOiEHAHLjprbEPYN5HsCjQyRGN5Yh4BCLlGu5Kc5mFMZ3Zpv17FgQ9J2oICu7EFIRLJWZlc
	ZOyiIvmyi4UUINI4c658dRa27keWXJOWtpwUAKnzZtrNbJTRiGILDa3QcQFMtngJvpuW/+hsJ6b
	YIh+aD50L1HVUcuReSkWtdPoUYcXGZzTVVmxc6jZvFhlXWT/LjCOxOpTaXtFqHb2lkSSzh02/HE
	dXMWPxXudL17LTVoqj
X-Received: by 2002:a05:6820:205:b0:679:e633:6f52 with SMTP id 006d021491bc7-679fadb6dacmr5269297eaf.1.1772337647246;
        Sat, 28 Feb 2026 20:00:47 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-679f2bcbf22sm6676921eaf.2.2026.02.28.20.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 20:00:46 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Feb 2026 22:00:35 -0600
Subject: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
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
Message-Id: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyML3cTi0mLd7Pzc3MS8lHxdy5RUkxSzJHNzy0QLJaCegqLUtMwKsHn
 RsbW1AEc9iV1fAAAA
X-Change-ID: 20260228-asus-kommando-9de4d6b779a8
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1418-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:openbmc@lists.ozlabs.org,m:anirudhsriniv@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: 808901D2109
X-Rspamd-Action: no action

Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 arch/arm/dts/Makefile                            |  1 +
 arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 98 ++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70..fa6837be747da4fbe102ac27e60ee3d81e230cb7 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -682,6 +682,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2500-genesis3.dtb \
 	ast2500-romulus.dtb \
 	ast2600-ampere.dtb \
+	ast2600-asus-kommando-ipmi-card.dtb \
 	ast2600-bletchley.dtb \
 	ast2600-dcscm.dtb \
 	ast2600-evb-ecc.dtb \
diff --git a/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
new file mode 100644
index 0000000000000000000000000000000000000000..11fee8d5403541f2453f6b8c6f123c5d1108137d
--- /dev/null
+++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "ASUS Kommando IPMI Card";
+	compatible = "asus,kommando-ipmi-card", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac2;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&hace {
+	status = "okay";
+	u-boot,dm-pre-reloc;
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio3_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy2: ethernet-phy@2 {
+		reg = <0>;
+	};
+};
+
+&scu {
+	mac2-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&uart5 {
+	status = "okay";
+	u-boot,dm-pre-reloc;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};

---
base-commit: d40130c7056b84dc5213f3ff6764d0e45bb84035
change-id: 20260228-asus-kommando-9de4d6b779a8

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


