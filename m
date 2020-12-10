Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8A2D57A1
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 10:57:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs8V91lTDzDqDM
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 20:57:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ktJdc72n; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs7vd4xNJzDr0K
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 20:31:08 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n7so3696978pgg.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 01:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lTbkG6qYnle+XI3+FSoMjubtfTJEmSz5CKlrBtvf6E=;
 b=ktJdc72nQon+D8o3CN6amrYc+2R2Xe9NgVdEQLiUb+N9xnep1qCYhVISyvZMOpLcTd
 gVKcOMINlUiv1HeoB7QpbtjW465deQhf0MyfTUbovVHcmnDKAeimXhqiOo+VjifX2GaQ
 c7WyVGNhVp7mp8HHDLe1GzyXIfQeTOTul9CloydL2z1umdM+lCj6VJAx7YNamnea1t1K
 sE3EaHIZzeEDYLy7zUPftlI9SbcNrB6bg40LBRK/muMZmDxlc27+ma7bPNXvK4fjQB1N
 nYYHCSM+14iyW6EGFu/lhjpW7XD+wLBvgUuF0dAvELw9jqbp4ZauOGNHytfUb0wvpHFc
 0ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lTbkG6qYnle+XI3+FSoMjubtfTJEmSz5CKlrBtvf6E=;
 b=n5h5tIs6ldoWuSt8bLWRKkwjqJhjUsacJm4VQTzeMUmEIXjTWahNienYAojYMZXU7r
 nwgzowuMINi7WMVS+DpB5yf1YZ9fQULoWsulGw+FGfZPQdCfCs4nGvEKNVzwyJ8rVct2
 Pu9dEJ3QR9nNJBXNgC/6udhYyKiGgOa5id3sjrugoQy1V6fOW360W4HWoQ5YkWv/sFLc
 AgksNdj9xLDw+ynAWNfm2EsKLlZCl+A1NVAr44FHy6FA/oY0Uce65phgNjSScGcwf6mc
 OGd3epNVpzOj2xWeWVpV+Qwg/ANnK9pmDIU9Tk8Smi5vbxYK9VcUureRzpl2HFi8qi1+
 g/pw==
X-Gm-Message-State: AOAM533QY/eDakpfAX1N0bTRE0ZDTd8rPzgjeGMtncHWsDFzfckHml/y
 mVaWIq7hf0/lUago9HKzLuxaYWDj9o3GW2NZ
X-Google-Smtp-Source: ABdhPJxvSV2G/C+0G+bkx6xFvzSF4bUj0cMreoupZzb+ckqOtPlyhaJ3KcVb6ZDrOtuDHEhxT/vL3Q==
X-Received: by 2002:aa7:8ac1:0:b029:19d:beff:4e0f with SMTP id
 b1-20020aa78ac10000b029019dbeff4e0fmr5893394pfd.0.1607592664959; 
 Thu, 10 Dec 2020 01:31:04 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id l1sm5043385pju.48.2020.12.10.01.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 01:31:04 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, xuxiaohan@bytedance.com, yulei.sh@bytedance.com
Subject: [PATCH 3/3] ARM: dts: aspeed: Enable g220a uart route
Date: Thu, 10 Dec 2020 17:31:01 +0800
Message-Id: <20201210093101.413-1-wangzhiqiang.bj@bytedance.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 89916a2eec18..e3a82679ed9c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -929,3 +929,7 @@ &video {
 &vhub {
 	status = "okay";
 };
+
+&uart_routing {
+	status = "okay";
+};
-- 
2.25.1

