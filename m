Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FE369DDB
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 02:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRsjS1bXBz2yxN
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 10:39:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=RbrIzVVb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wltu.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a;
 helo=mail-yb1-xb4a.google.com;
 envelope-from=3mgidyaqkb4e1qyzlttlqj.htrtujsgrhqnxyx.t4qfgx.twl@flex--wltu.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RbrIzVVb; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRsjB4Hjqz2y81
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 10:38:52 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 s2-20020a5b07420000b02904eb842efc40so26181736ybq.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=TUFOAGFbHFVFAh/DZwfKDpuwk+02e0nDQXYz3fBHcsA=;
 b=RbrIzVVb/B127r47bQgjpjQOBVOU+0eZz3Tj4megmn6oOx8AOOzbNBD7vPFslPnx0z
 LbCjUDc7L8aRIjoF1P4jsZtzFeiHgVzoqBK7wLXl58fOVXK929y6UQ8uYa7WH8QnPlLj
 fiS/zjm/mEbyP1XrXziYx7G0WS8bTtY1Lhjl/i8V9ZssvAczhq69OINES3I5PFAJppAx
 GjP0rUAXWyrILLfo2W1Nh0pD8fsgglKHyyojO09FQ0ymiJfL2SforPU+kDlUqhg16JmC
 QA87CNrsZQJYtF2Q7EVqZq2D4B+5bOM25DrWEM25Uy2XSeP2Q0cKqCiZmMl8X21VN7Jb
 2YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=TUFOAGFbHFVFAh/DZwfKDpuwk+02e0nDQXYz3fBHcsA=;
 b=SEmSjGIUPImh85TJVhqO0egjFTVdOSy2LFiWOV/ZiSlm8P8cvXecfZDXirSACm6MA2
 R3xCZoI/TQkm+LNANQavkS41yRVHBzbx7mDs4B7bVdETqIaIWxvm8xjJb06vzCgubl7/
 dizQxvCBqamwDmEb/K3rR/YLWuSQC6F6VJv+WdpaIPKMLZn/P9CXS4ue9iFsDImMVAuN
 J1n4Sfun0JnYhAeNTIXqygfq4HXYViRhRJ+Mti7i79Q1y+d/d6TMGiY4ir3buNTb9TuY
 mZHg+SMlpa8HLNoxuQB/oFxxqPzFjhPeCA2y891hjcwt3KgJIk/ipxJdai0xZrpJztXs
 OEYg==
X-Gm-Message-State: AOAM53211ocWgvalZAXbpnmWSawFJReRJGh14OninNn/C9Z3IP03Nsjq
 rmxtLk6jgYC+1Ff7M3clPeEVncUEoRTRh0qrR/pkWnh5HimpoZxUiC+4/IZTcZjd7mATc3K904+
 BKh+GGOr90a4pjKNG6Sx9hFNX0rvjDK/6zYnJuzLmHZ89oQJSNu3tHhZjy2U=
X-Google-Smtp-Source: ABdhPJxR1+5vu5+8OLNRCYFBhsZpzt2SmUTZcn/zWdWGKZhQXXYZ8+97NapGMJke8etHHfdq6ZypFB3T
X-Received: from wltu.svl.corp.google.com
 ([2620:15c:2c5:3:e521:396e:8693:2162])
 (user=wltu job=sendgmr) by 2002:a25:6c0a:: with SMTP id
 h10mr8920238ybc.167.1619224728845; 
 Fri, 23 Apr 2021 17:38:48 -0700 (PDT)
Date: Fri, 23 Apr 2021 17:38:21 -0700
Message-Id: <20210424003821.3697200-1-wltu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
Subject: [PATCH dev-5.10] arm: dts: nuvoton: gsj: Enable Nuvoton fan filter
From: Willy Tu <wltu@google.com>
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Willy Tu <wltu@google.com>, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

gsj platform sometimes also see low fan speed issue that can be partly
prevented with this fan filter.

Signed-off-by: Willy Tu <wltu@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 3ff116aaacb3..86facfc08c6e 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -408,18 +408,21 @@ fan@0 {
 		reg = <0x00>;
 		fan-tach-ch = /bits/ 8 <0x00 0x01>;
 		cooling-levels = <127 255>;
+		fan_filter_en;
 	};

 	fan@1 {
 		reg = <0x01>;
 		fan-tach-ch = /bits/ 8 <0x02 0x03>;
 		cooling-levels = /bits/ 8 <127 255>;
+		fan_filter_en;
 	};

 	fan@2 {
 		reg = <0x02>;
 		fan-tach-ch = /bits/ 8 <0x04 0x05>;
 		cooling-levels = /bits/ 8 <127 255>;
+		fan_filter_en;
 	};
 };

--
2.31.1.498.g6c1eba8ee3d-goog

