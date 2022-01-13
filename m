Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDD48DF7C
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:18:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZck46PVlz2yP9
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JH3d15RU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JH3d15RU; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZcjb2qfXz2xKJ;
 Fri, 14 Jan 2022 08:18:27 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id t9so9553676oie.12;
 Thu, 13 Jan 2022 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U7xOer6sVly35j98UB0sJ9y2HM48yZDB/QDh60PHbU=;
 b=JH3d15RUin0nTH8Ayj5BEWgODrPOPrwVEkCsrskOBAC/QKzwqaQuFcT1pW58RiAnb4
 YJ6Ppu9RVisSHpFYPHyJePiRczvMd2SxJJy0z2Shaa40tbb+VVzu0HuK6C8cZ6tnKJdb
 xpF/OrgLjm1kIS5FItD8q/x++1jaJTFzqUn36znrghK3hIDGc/6HPlThESC4pUs9Bq21
 PbDaFbUTmQ0HurqF4vwNltxzOBpJjdApT7vX1IT4s3naZ0DvV9Jw410H5swUQO+WCxRs
 1uutuhK9pwVmlQRN7vkG2URo5gMHWYuTvdDbLer7ScWwxo3R9vnZXRTQfMq9DWPKy7Z1
 GVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U7xOer6sVly35j98UB0sJ9y2HM48yZDB/QDh60PHbU=;
 b=OgVyPkXzmBh4nZhaofyGHXINKrsS1FAcW9K0bBJbsIsAhceG3jF372b/2GrBahKvnP
 61OVAZfFIxNmoo15ZromlJiJucFfSbYsdsw7lpB3yuS1RbaAVmTarrs7P5FcSHghJ3xw
 Z3C7l6mWnLJ6iW0QQnOjtlRCx/oEZypYBV6DOTGv49X7gzLYFB37hB4ElUpopQyIhmLk
 dqVqipC39CpHoUc5FTWwYyxMHyI4SwoyC4TAj7xokWtxeKyzPbYr1C1xwgrxBKo4dDCd
 SdssV1cvUIdv3LY08SwUaDxdb2kTwFkg+wFswowZx2Em0FfnSuw1WEOCjr7Q+cA90AjG
 Lj3Q==
X-Gm-Message-State: AOAM532V07WSQRTgaT/cD8VW9vhwbOaNqcbr7UmcnNhVcG5bPUw84tLA
 YcTFa6yZymSLcE2tISaWN8grGTbqH8qfwzx7
X-Google-Smtp-Source: ABdhPJzXE/1It7WKP+/LtUmegsDmnTpvyMx15/3Iav2IhHGUrEnkgWndiF4moTtfVpUJnGCy8umDlQ==
X-Received: by 2002:a05:6808:190f:: with SMTP id
 bf15mr4742157oib.23.1642108704077; 
 Thu, 13 Jan 2022 13:18:24 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com
 ([2600:1700:19e0:3310:f8ba:b1e:54e1:cdfc])
 by smtp.gmail.com with ESMTPSA id z188sm932015ooa.8.2022.01.13.13.18.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 13:18:23 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: aspeed: rainier: add reset-cause-pinhole
Date: Thu, 13 Jan 2022 15:17:34 -0600
Message-Id: <20220113211735.37861-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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

This GPIO is used on the rainier system to indicate the BMC was reset
due to a physical pinhole reset.

See the following doc for more information:
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index cfaa606666e2..7ea70c7d698f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -247,7 +247,8 @@ &gpio0 {
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"","","battery-voltage-read-enable","","","","factory-reset-toggle","",
+	/*F0-F7*/	"","","battery-voltage-read-enable","reset-cause-pinhole","","",
+				"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
-- 
2.25.1

