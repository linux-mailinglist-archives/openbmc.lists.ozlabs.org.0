Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72D48DF7E
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZckr5tQGz30D7
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kfCYDOIw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kfCYDOIw; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZcjb3s2Wz2xYG;
 Fri, 14 Jan 2022 08:18:27 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso7849634otj.8; 
 Thu, 13 Jan 2022 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhIUZEyLkSCGKc1UkQdjKABPVPiYlDrmgBY5iTyEfnQ=;
 b=kfCYDOIwjO5zYFAj467OnoWk6vFNfpF21UB/Y8CjghGbDlgAY6KtHfnoEzZn12RZic
 vaqrkd4JZ4D6FflEP6nKSOSaHrMBFHo6v8uqIA/FkKKceoCidKboHcqNs7/psr5UgM3o
 NNrzoHd+ymJzr7dTFAZ6r+B7NH0XuEEl+pHDo5CK8h8myM5yw7pUqzoh7UBUfEjU+IQ5
 y2SCDx5CDUEOKtUS0gac4h/83qhREAr+lc8IZkFuhk6P4s6nNy1y2LMbPzsZRVyQGN2p
 /qOODnFGXx+wsD9laL3pBpEHPCNwpRrMKGI76OYpOshuYLws10bcwiqcJyU3VjVHJVfu
 r+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhIUZEyLkSCGKc1UkQdjKABPVPiYlDrmgBY5iTyEfnQ=;
 b=pJ+cg/kta52Ui0eL6Zr8toHuE16Si1Zr6emrjDJM5YtpnTZe/r8TGXEIKKsQ3Zo/G+
 8Ocyb/yZMtQcLerfkeCV/nWtu659NYUhcxu1Rz3IyHQ3YYxxLsMx9+Xk43fTv7PXrPJg
 rnD/Z78l15+XJc5/Rqx5el7FZkjRV+PNNumJTeS2uBWPzyGEKQlwOVuVQaj8vzvpNAyq
 rSNfyOMLVzHiuiWSq5/35ATwsJdu6QfoH7B9vL5BSSyb/HnP0idX2pMm7WrC6qxQM7V2
 L2pq5ge8G9GprK1V0RUj0H/2BLTR9i0jk8sUxmMIXfQLUGPTnofBQYgW0/bJYBje91yu
 nJUg==
X-Gm-Message-State: AOAM533fRI71G8dUCmyZV7gJa4Vs1NiBbMniTiH+lr9lcSEsbS+ShY7Q
 k9KAHpypUIj2RiXWT//xR/Y=
X-Google-Smtp-Source: ABdhPJwlPvNEuK39AHfpxsyj9XIKIhhFFrRo9lAnrK7Q+YbNmpsGjP53cLUDAwb+N+udui/QQg8Ylw==
X-Received: by 2002:a9d:4e4:: with SMTP id 91mr4516525otm.45.1642108704859;
 Thu, 13 Jan 2022 13:18:24 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com
 ([2600:1700:19e0:3310:f8ba:b1e:54e1:cdfc])
 by smtp.gmail.com with ESMTPSA id z188sm932015ooa.8.2022.01.13.13.18.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 13:18:24 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: everest: add reset-cause-pinhole
Date: Thu, 13 Jan 2022 15:17:35 -0600
Message-Id: <20220113211735.37861-2-geissonator@yahoo.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220113211735.37861-1-geissonator@yahoo.com>
References: <20220113211735.37861-1-geissonator@yahoo.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This GPIO is used on the everest system to indicate the BMC was reset
due to a physical pinhole reset.

It has been verified that the previous name for this pin has not been
utilized by userspace so the name change is ok.

See the following doc for more information:
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index f48b33b0c606..6b5d5c56951f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -271,7 +271,7 @@ &gpio0 {
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"PIN_HOLE_RESET_IN_N","","battery-voltage-read-enable",
-				"PIN_HOLE_RESET_OUT_N","","",
+				"reset-cause-pinhole","","",
 				"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
-- 
2.25.1

