Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17579BEE80
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:34:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f8rb38dVzDqnl
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 19:34:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FIWhybSW"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f8qz49DhzDqly
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 19:33:35 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id y35so1281662pgl.1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dIYpyCpzOIrFhg/z7+oHt5vyjZrUDIDucuc1cf2qsxA=;
 b=FIWhybSWzJUOJs5QMOaArNujN++mKnTljmllBZeH8hltRBSz2Ub+1ajORdyitsHB7X
 3MZ/6ZGUWl5JfHiGrzF9vtOdSUtvUlwOr6MFcoz4L0XcX12BkKNDFuvjmRN0WX5nHwhh
 IQSMjWW136C+ScKgeTyDQfvPhFYY+ro0zLeAeAP2/yRNg6zzvLjdvSO3wZ5rICXvRblo
 4Jreqge32SGaCA1l6H2aDXbIyrV36i6n9go8h9LbK4tmuJrRYV8R6Q2zLUEyoPNrGmWq
 65++ANZ1YICqRwOyHJXeO7Na9E/fIrGik1ynEdHf/f9ln9mVGtCMio5bYuSEJF05YTDn
 in4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dIYpyCpzOIrFhg/z7+oHt5vyjZrUDIDucuc1cf2qsxA=;
 b=TpmELlcHqqtfEbl8BRxnJj+8BdGd/lVzrWkBIpUNHUTqylWLqSZM9IJBHNspNfY4OA
 rUhFPbT6J/iBXOOZ+TAxBuEEWd8lEDclVhzebCk3Pa+BMC/xzb5EuOQPOSqBxRR9Gpfh
 j49XX4+GMLaxgWYzVgqtIk9Nf69QbQJnOH9g4Stp5hz5T5GtsLQ4qJKHkOeJJiTr82a8
 vhmNu+Nt54khwMde2XL2zEYXX/y1cdXGtz9OfP2Np7SqxTSPXtU8J8soZTnE9peVLIZs
 JO3Gacg0fBHqeFMb+Xp37vdkSzzSF0hn6CqS/MXwcaxEAFIKp3F6Rz/FyuGdbD3WUg7f
 vfSw==
X-Gm-Message-State: APjAAAWaC1H+C9kBAPzLCQQRtjYMhxlHNnBjlgLdWd+T8eFSA+y57O/a
 EaekalMSEQ7zBgVRPQgi2E4=
X-Google-Smtp-Source: APXvYqxKId8SHCugp4d19xprRk/hwMnVKQlAczYM6FDTT5c+OQAVMcAoW7o+5xyS79ceq01aQFy4ZQ==
X-Received: by 2002:a17:90a:2301:: with SMTP id
 f1mr2530650pje.121.1569490411310; 
 Thu, 26 Sep 2019 02:33:31 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id 129sm1811514pfd.173.2019.09.26.02.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 02:33:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: tacoma: Disable CS1 as it is
 broken
Date: Thu, 26 Sep 2019 19:03:24 +0930
Message-Id: <20190926093324.16892-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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

We currently hang when attempting to probe the second flash chip on the
FMC. Disable it until this issue is resolved.

OpenBMC-Staging-Count: 1
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index a923fffbb5a4..942eb974cca2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -35,7 +35,7 @@
 	};
 
 	flash@1 {
-		status = "okay";
+		status = "disabled";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
-- 
2.23.0

