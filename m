Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8EC17C3A1
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 18:06:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YvCT6Tr5zDr80
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 04:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yv8h1LhPzDr5n;
 Sat,  7 Mar 2020 04:03:46 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id v22so3057132otq.11;
 Fri, 06 Mar 2020 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0huqSOOM6TQWT/uaipc+FS4s16ouSaOa4nymxBl//rs=;
 b=E578MAb7Yr42MvvPNFo3yDbFhNAT2AbVP9J18ov7OwRiwaeS0UWnAdlPX7xu42IjK/
 55M6bqYkOS6SbkVuoPSZX5YpTLKcRGUDvUw/7zZN3UVyrhTUpMmrUyj8i94atSmzhhpJ
 LZS7Je07zTvXE46VUBdwzDh1ojHEGF/bC5WDBDx2bvne42OuXymWdMKOLknROBzFnuEs
 kVmS+VH+7OSgqPcA7L/mffmoSTi6QxV1nOpuD8qsY9QbuFRe3WBsYJFHQyWP0Gxm9Lyw
 QWN6bf2APE3id1PWNFTsri3m4NlprvDfX2HxBVF12A+vF6mp3FT1oY7bPkk3byvq6Lf4
 CD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0huqSOOM6TQWT/uaipc+FS4s16ouSaOa4nymxBl//rs=;
 b=AJC+bM49opXpC8Kj9wDX3XVUnY2+bA1EiaLFNJiXcKEm7uewXKG/GJjsSW6kUyZZxe
 YbsSQQeyv2MpI21pp03K/7M/9a6yOT6WeP1y0xxAriBH0pjeqWozSzA38cib+SvZunqX
 5kkzRqDiZTqaKNO9jVRBOInJgUtYISmcqD8r1IV9BBkNb2g2zdZhAxdehIu/uViEK+hd
 6ofz7F/HqxzO70SucIhleSYZuf8cp71fzX/jJbJJwYXRWyay06d22U+Frbvm6QL9ZD4X
 tuSYcrblaIYqEVKUerapNfdTxOl0om/c1dUbw5bN/cFg82bO7h3v8glR1eIgooSe/txu
 4kNw==
X-Gm-Message-State: ANhLgQ3VEaG4Crc4+T3mZ6eZwee1nmVTrHVGH/fwXEn/oDkORwENgGUY
 mOrMb818tFPa7LclRiTzY2Y=
X-Google-Smtp-Source: ADFU+vsoao5aucvzlM9qEqT53U96NcowhLRZAwGIJeWQMdIOpwMlemrRqJtLU3zoSd8q9SxSQrbZdQ==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr3429727otr.285.1583514160968; 
 Fri, 06 Mar 2020 09:02:40 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id t9sm11550743otm.76.2020.03.06.09.02.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 09:02:40 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To: joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: aspeed: romulus: Add gpio line names
Date: Fri,  6 Mar 2020 11:02:17 -0600
Message-Id: <20200306170218.79698-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
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

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 35 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index edfa44fe1f75..fd2e014dae75 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -231,23 +231,52 @@
 };
 
 &gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","nic_func_mode0","nic_func_mode1","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","power-button","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","led-fault","",
+				"led-identify","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","id-button",
+	/*R0-R7*/	"","","fsi-trans","","","led-power","","",
+	/*S0-S7*/	"","","","","","","","seq_cont",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"fsi-clock","","fsi-data","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
 	nic_func_mode0 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "nic_func_mode0";
 	};
 	nic_func_mode1 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "nic_func_mode1";
 	};
 	seq_cont {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "seq_cont";
 	};
 };
 
-- 
2.21.0 (Apple Git-122)

