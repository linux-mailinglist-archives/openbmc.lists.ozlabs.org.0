Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C784865E5FD
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 08:22:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NndGX4sgPz2ynx
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 18:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Na/CfB7b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Na/CfB7b;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRmL1JlXz2ynx
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 16:53:37 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id u7so9948521plq.11
        for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 21:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wEGGRHRkx/TYRoHQuQncfk8iOkoqIh2z64vF46qnf0=;
        b=Na/CfB7bF0mtwRe589mB/JyMsaPacOs9XImdIaNM9QGRi49fbuE/AkyoYBkxw7sp1Q
         1f1AXauFlOPGyvb4Y/YLmk1Ek0fYzpAkqZy/xb2sS0lnpRhqN/VwJMnVyish/poPavWj
         KnroF2G/MMRYO/VNn5Ij9oyvBaQysZZ3270+kHNrn/a+2vif+8ECDbLWx/4uBVub93f+
         YDRROxTWG7eqDbFMQ5bPbCDpbhwlU80XbPb07mr2ZPU8AQhU4gLjEQ40xHnLPbt32u99
         z7Fej6x6EQoGAjWPVYMLviLhvtm5GX8MVdHYbZ5SwP1z+UpOIZOvB7fRrOj5wU6IthWA
         3uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wEGGRHRkx/TYRoHQuQncfk8iOkoqIh2z64vF46qnf0=;
        b=LfqedsRFo/8936ZSnXoe2Udb+fs87v9JJTZPtk7XaBEWHUa1/ywemuLyGgQQ6qAUs5
         noS/z7oRuUTtsQlgODyTInf8/Y7l952hZlgBvwh78C/JLmOv/BLzLkS6OxaunlTJ6tCH
         iYA6xGvHVppFyBkYfe4X7Alz/CEfvLRggm47JY9N0kjbnYmHMV+1n4ODoevtAC3UgmsN
         riZSBqp4DCBdrA2drYh9odHBmlXvdPwS5JrPHLSMaXYfDFydXbhgvUPghd7PORX3etVR
         EQdVBn844v4mZrcjVTRa0b69agZ/ErNCKVxwf6RbbM6PCyAa26L9VEsVMH+6LXJZzt7Y
         SJlQ==
X-Gm-Message-State: AFqh2kq9FAsvDOMuw+sviQZlws1BmRRgPW3EetnwHgxZIxApeOck6k99
	Bp6VuVgeLA96C/Fb+Nj9KSUj4UtyXPI=
X-Google-Smtp-Source: AMrXdXtSbPQOl0UB/NsFEMIOINUq2WHFY9///xRzu9pov7zFe7nZGj7GdcwY+DwAHrHDf7PXlwyPsA==
X-Received: by 2002:a17:90a:1d3:b0:218:a9dc:4936 with SMTP id 19-20020a17090a01d300b00218a9dc4936mr34115089pjd.26.1672034015833;
        Sun, 25 Dec 2022 21:53:35 -0800 (PST)
Received: from localhost.localdomain.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id mm2-20020a17090b358200b0021937b2118bsm8202726pjb.54.2022.12.25.21.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:53:35 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 2/2] ARM: dts: aspeed: bletchley: enable wdtrst1
Date: Mon, 26 Dec 2022 13:51:18 +0800
Message-Id: <20221226055118.2836493-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221226055118.2836493-1-potin.lai.pt@gmail.com>
References: <20221226055118.2836493-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jan 2023 18:19:27 +1100
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable WDTRST1 external signal to send a reset pluse to peripherals while
BMC reset.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 791f83aaac50..050ed7e810fa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -1064,3 +1064,14 @@ pinctrl_gpiov2_unbiased_default: gpiov2 {
 		bias-disable;
 	};
 };
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
-- 
2.31.1

