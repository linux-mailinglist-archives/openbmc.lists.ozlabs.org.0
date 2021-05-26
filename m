Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4D391661
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 13:42:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqpvW1kV4z303g
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:41:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IZ6CEfJd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IZ6CEfJd; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqpt04nLPz2yXK
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:40:40 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id m190so726351pga.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pq10xqypkTJ44Qgbn/LLrVIaagAT/Kd2IgZtpKYa2iM=;
 b=IZ6CEfJdf7xa9aQy4uLwLJ5QwFrkp2fgHV8HbQ5KIlIbTd5Jb3AD0fqOriCf8lrC1o
 VvMBpW7FlCeawX7YHuUV1OzLyaB5qbvw6aD2qVus7XKuMu4WD6dsFRkqW+7VosLJc3UO
 X7ULqSzLOnB+vXarJp7nE1PBFMF0mzV7QIOOx5Yk3j7qjajRrUPnQL6MAXNqxycc2Vuv
 JQLUA/gztIh1E+zxxcThLA4p1l0YjYuev0I7CUp5NPqshWUu+wevb48NRleh0CKKrcm2
 C0PlS0tmxKewCtHjVfr7gOIOsCkY1nmZEntrpKDaYPJW0WdgquTS4TY7x8OTNvD4iNmY
 PhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pq10xqypkTJ44Qgbn/LLrVIaagAT/Kd2IgZtpKYa2iM=;
 b=B9ED1tUVOgo+LCb19ZWqgYG0qDdGJ88xbB+SY6e1Ejaclu56N/Lrxyftx5DvjwL+LY
 K1x/8XSMY7qIh8KGRsUTWBH/ShyYahlqXv59QUr4Gy9V02OBAs1H6EWKEFDFIvc2Kd0L
 PAfgFSnpjM5WWJpVRqTSGqqdXQCg9Erox14mnHUsKO248i1A0JMf+vC1WphFc2T6hmGu
 kfRQG6jVthfi6rSQ1PJk/BPLsfser9qMQhd8Dmo7ArxI3D3dZTfiWn46EEZRlPGLDOJ/
 cWPkbNw99jvRg09KIJT+uAYibc3vy6krqjTbY/GNI8LqIkTB6ysTqdZskNudgiwBPk6C
 PDtQ==
X-Gm-Message-State: AOAM530sdrb0RbyO5t7ezTndZkjb9SSTljPDArTB/pOcsIUK2hMIwQq7
 NlWJ5wEKTclbVS3O6I0oU03+yKTb3y8=
X-Google-Smtp-Source: ABdhPJysY7IFOUcSy7wRL44owLKE33RqZ9SkqZmggoM9PpxZX4kq2HaDAV5RNo6Ycf8uI1aqkUP/cw==
X-Received: by 2002:a62:fb17:0:b029:2df:b6dc:c68c with SMTP id
 x23-20020a62fb170000b02902dfb6dcc68cmr35553936pfm.31.1622029238460; 
 Wed, 26 May 2021 04:40:38 -0700 (PDT)
Received: from george-Quanta.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s14sm17124805pfs.108.2021.05.26.04.40.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 04:40:38 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1 3/3] ARM: dts: nuvoton: gbs: add page size to all
 eeprom configs
Date: Wed, 26 May 2021 19:31:01 +0800
Message-Id: <20210526113101.7457-4-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210526113101.7457-1-george.hung@quantatw.com>
References: <20210526113101.7457-1-george.hung@quantatw.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, Fran.Hsu@quantatw.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add page size 32 bytes for atmel 24c64 device

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 3d53fbe54055..2102761e8890 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -728,6 +728,7 @@
 	mb_fru@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
+		pagesize = <32>;
 	};
 
 	i2c-switch@71 {
@@ -771,6 +772,7 @@
 			fan_fru@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
+				pagesize = <32>;
 			};
 		};
 
@@ -781,6 +783,7 @@
 			hsbp_fru@52 {
 				compatible = "atmel,24c64";
 				reg = <0x52>;
+				pagesize = <32>;
 				status = "okay";
 			};
 		};
-- 
2.21.0

