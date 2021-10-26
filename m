Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D743ABF5
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 08:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdh4r4zdlz2yMq
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 17:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eWUW9+Be;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eWUW9+Be; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdh4T5T76z2xXx
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 17:00:08 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id v20so9554741plo.7
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 23:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdglrZpO8fEMDjaUyP5YE66R8VKF/TcqN/iZf8ep3K8=;
 b=eWUW9+BeWs4V4oxBHh00L3gTo6KpDJDzt4WlGDDkck2TqYU/R043sGuOLIP+l2ieqM
 5KkP0tLexj2bH5wQh7Ie8J3aBFBYjmUQG4EWFJfczFGEVskpy70O8jOA4CxZsFf0hJN1
 WcTsn5T9yMekcJCKNLGhvkWuUey/wzGDAX1PwU7jeSzAZCQO7ZyO7Kk9xmZkCT8iZ2vb
 NURKCzvU0L7poCsqYyY9MgpAghMA9TSiFu4nDHBe8Uz1vWPQ/DVMYpqqXfiJtHTfmed/
 ZZRN0mehyDbPJf2Fk1eufJWnx2q9jnuoiXskfnciYTAfRautLK5I+e7BfiKhrd89N9NH
 iDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdglrZpO8fEMDjaUyP5YE66R8VKF/TcqN/iZf8ep3K8=;
 b=RfGLRb+PQdZbrCtypXhW4CKDDMd56+E6lJoREL5RMRv7L6dpLryN9gvtucq3GCo62+
 JZyf7MSdrw190+HWzuXai38JWE0me65wJN3UQ54zklH8uuQsByRvPaL65PpfbP3cOK7i
 gmZ3G244XNeFobDiqxBSh8f8qfD1BhCOzi9tCmVPhIqwlEpwsNOZr+lBBHvnturldcH2
 QHdKKG5UzEEOiv+G13e6SE1G/uuAfJUkOoyty3vgmQIKlfq2lxuZD3ntleZn8JQjGeOf
 Fkok0WziqqUPsqWiNe/QdhCXGV8vftaxFP8jfxKZ5If3gkNr2x2id0Y+v6WWwiJwf7xT
 u6Yg==
X-Gm-Message-State: AOAM533Bcy+3fKGr5VSIJrbtwCB758U7HkypJgDFThpf+N+wYqSj9E9j
 RfvLzScjoUYOHs0Rk4jrnBE=
X-Google-Smtp-Source: ABdhPJwSb2c2SPbvStFvmKYMRi49/QWlbBb/s/dbc327vlHep1rHkx1OP3PIIn1kSKjWiYIX6oMrSA==
X-Received: by 2002:a17:90a:5992:: with SMTP id
 l18mr22369309pji.127.1635228006708; 
 Mon, 25 Oct 2021 23:00:06 -0700 (PDT)
Received: from george-Quanta.com.com (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
 by smtp.gmail.com with ESMTPSA id h4sm23449010pjm.14.2021.10.25.23.00.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 23:00:06 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.14 v1] ARM: dts: nuvoton: gbs: Change the name of the
 partitions
Date: Tue, 26 Oct 2021 13:49:04 +0800
Message-Id: <20211026054904.8888-1-george.hung@quantatw.com>
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

Change the name of the partitions for BIOS primary and
secondary SPI EEPROMs

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index f20c2ae4f576..6894b162b050 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -414,17 +414,17 @@ spi-nor@0 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
-		label = "pnor";
+		label = "bios";
 		partitions@a0000000 {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			pnor-primary@0 {
-				label = "pnor-primary";
+			bios-primary@0 {
+				label = "bios-primary";
 				reg = <0x0000000 0x2000000>;
 			};
-			pnor-scratch@2000000 {
-				label = "pnor-scratch";
+			bios-secondary@2000000 {
+				label = "bios-secondary";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
@@ -437,17 +437,17 @@ spi-nor@1 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
-		label = "pnor-2";
+		label = "bios-2";
 		partitions@a0000000 {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			pnor-primary@0 {
-				label = "pnor-2-primary";
+			bios-2-primary@0 {
+				label = "bios-2-primary";
 				reg = <0x0000000 0x2000000>;
 			};
-			pnor-scratch@2000000 {
-				label = "pnor-2-scratch";
+			bios-2-secondary@2000000 {
+				label = "bios-2-secondary";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
-- 
2.32.0

