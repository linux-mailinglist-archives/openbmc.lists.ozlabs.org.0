Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C33B3DBA
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 09:41:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB87p1N6rz3c79
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 17:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sOmZYSIj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sOmZYSIj; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB87X5CfWz308C;
 Fri, 25 Jun 2021 17:40:56 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso6842681pjx.1; 
 Fri, 25 Jun 2021 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak4It9MsAaf8gTmUjfk7OqroHrSMpNp6aLewzuoe870=;
 b=sOmZYSIjpQlknoMSJkaw5PkOMVn1PdkStlQALfl22r7uD5yYITQze8FqovvDJ23Nxi
 Cdlj7qH0jy3dVrmotZ1HHX1M8h7D7Vj01NhRqZfJ422QDc5LjO/t19ks4xQO+Uk9kBwk
 5UlQl/RSWpOTiHaBz3RkkAifYPN3xwxNK8sg4YFFz9DlNrptvKui8k8XD7cLiHJo5M4+
 fsQRnqrL5xem26YnKWVmLcOQV4451ieEoeF8gzZqKPipg1cGsjApOGyyHi0739fjgWcY
 fyfY5KRznnALDGyy9Re9/5DAs476IOF3BmZf5SsSM4BBsyIklNMPAAbfkRI/89M7z0JL
 ZE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak4It9MsAaf8gTmUjfk7OqroHrSMpNp6aLewzuoe870=;
 b=svbkwUXQ3gM4SMQdncX/w3P7E6gElh3I+5xT+PEL+bUiLY8onNH7YXS7iRdAdaEJdT
 3tPhmMkpPVpc/0FLSmy8ewldtkl+HcaCOU5aMAMJLb+Xvu1Hq4tOkP4PjeSL6cFFRogZ
 zRFq2wLjhZOlejJaPeVfkymUVlPwlhzNUYA4O4/kyx7acJbNMhZPx9Vrb3JlQWE86uc6
 8R7jw0vDgUY6eDfzGThztl4f6+eIccNy9bG3c3NUGlaLWSbmxbQDg9l2r/W2QTLdXOo6
 n3TetFteeU7obkx4VL2xWA5BmnQmOJr8GbEAmm7dz/FuE5olqGf/twV1pm5nS8l1ULn9
 3MTA==
X-Gm-Message-State: AOAM531/cmTfj2qe/n6QIU9c2wJt+gQnxp32AkS4ocgwGh29mt74DToa
 L04fetV+5UWNb20AuEjrscP39e4GFmCAjw==
X-Google-Smtp-Source: ABdhPJzrpfKopSv073SsVvH6mdLIBivdk+tfVAvdFG0tEDC3YKj7V33SFsdfZwVAiQxCQHCqvlx4Uw==
X-Received: by 2002:a17:90a:a790:: with SMTP id
 f16mr20048620pjq.176.1624606852228; 
 Fri, 25 Jun 2021 00:40:52 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id q66sm4683605pja.34.2021.06.25.00.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 00:40:51 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v1] ARM: dts: fp5280g2: Add KCS node for LPC MCTP
Date: Fri, 25 Jun 2021 15:40:31 +0800
Message-Id: <20210625074031.32576-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 George Liu <liuxiwei@inspur.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 1752f3250e44..66c0542b2694 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -300,6 +300,11 @@ &lpc_ctrl {
 	flash = <&spi1>;
 };
 
+&kcs4 {
+	compatible = "openbmc,mctp-lpc";
+	status = "okay";
+};
+
 &mac0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.30.2

