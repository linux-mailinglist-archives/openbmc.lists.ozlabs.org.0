Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3633190C41
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 12:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mpdd44TRzDqss
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 22:18:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eUNgFsWm; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mpcf36NjzDqlP
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 22:17:22 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id jz1so1123393pjb.0
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EnitTwf5MSynde2zyjMadMA406YKy1B5gZsbI2LoHiE=;
 b=eUNgFsWmZSD75WnFi2tncIT7sZ8yP1jHTnriXFEJiwb1UMyo1mXazk30M1xpeDA2Gr
 hlVLIFYdO2kaF+YVZ75RLnrBSxpqWZBHt1zNFLgEhZetZMBMsBqHWv0Z5YdJT5+PAxTe
 2i3JEY1/4u2x2z59CtczxgUaqBaK/frl1MT6EIl4N+l6ce2lnypnBy0/NtJERlT9EoQK
 KUQ0bFQoPzDz4cOVVIoR0wEwb96Rg9o+fqaxyeNYn92pZ/WHu0K/RFBxcczBvM8+87lL
 1bvrNZ0MiQvJrDmlczI6IzVIzcKiYeTzb+rRDhjaLSHYQqlkKfXZ5S2DUrjy2l3XA2Iv
 jnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EnitTwf5MSynde2zyjMadMA406YKy1B5gZsbI2LoHiE=;
 b=AX933sy1PqSFtwczHpS3gfGJ9OJ0hXCSjHqKlmZOFvbanNusVazQ3qwgbOpX4vO1Bu
 WFUJU3mCaaIwZusv9D1ssw3QuwpM2EmNhM3qQQha2gnNLDTXfC51M/6ouqwiOZgii1XU
 BUnT4pGiTFFGdUuC9bZk7nSRZnNGLVn0Z5LmBLrdoWtoX8ZJ4Kwahcuol3FMSQjouzt0
 ZRNn/7oB3IlpDyAzOeASUoK3auC/ckgz+jpPKI5RSVPLKxGFyClHiOBAHclIsEkxF9UQ
 3kDWgnBuau3NJQxllstEI3okRusJEe52Z35YqjEwxTomkWp8+ry9U/4jXfpVEEP9riSp
 YZCg==
X-Gm-Message-State: ANhLgQ1HvHJHf8h6V58Qu5jiNjjyvjahbaosGNp34t38hN+tOzgywS8I
 4SNiZ/i4tqMMLfi5lguXH1yCFmb8fTQ=
X-Google-Smtp-Source: ADFU+vuthCXc52WCmkbzlWlv1BlPkagFbgIY6LXtf5wxJNmOvESIPddPcOEoU0ehrFIjBehJppUkAQ==
X-Received: by 2002:a17:90b:4c8f:: with SMTP id
 my15mr4797472pjb.63.1585048638810; 
 Tue, 24 Mar 2020 04:17:18 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id mm18sm2087500pjb.39.2020.03.24.04.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:17:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Geissler <geissonator@gmail.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] ARM: dts: aspeed: tacoma: Add line names
Date: Tue, 24 Mar 2020 21:47:11 +1030
Message-Id: <20200324111711.292912-1-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add names for some of the GPIOs that are used in Tacoma.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 4e8d4748cf65..88ef4af7b234 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -91,6 +91,39 @@
 	};
 };
 
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"fsi-mux","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"power-button","","","checkstop","","presence-ps1","","led-rear-fault",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","presence-ps0","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"led-rear-power","led-rear-id","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"cfam-reset","","","","","","","fsi-routing",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
-- 
2.25.1

