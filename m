Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86328DB95
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 10:32:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB5Hf6ZS1zDqY2
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 19:31:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=E1xlz4bY; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB5Gf3JZGzDqXW
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 19:31:03 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id a1so1220598pjd.1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YMRKkzctsYK3yrAqrvPucNzaNndhrzARVuTrtoTDwo=;
 b=E1xlz4bY4LaHLsuycpqaPE/HQtqrBkRPZknnRd9DUhGhGvngzBrcF9kDvIjp95hcw/
 vYuMHbUuoAuH1A3e3qXmsJJCTtmAYQKjPm8vt7gsz7X+f7tC8xYTCN3SwWXxnd8LgXWF
 t+x/p8ARpuIA/I7YbD8NAh6BmLbOQAyyyEU6OwF2tT8jEevlSWwuNuVLmKtCU12MpwGs
 ibj0v5clH4/nT62jEqiTkF9yJfEpU5vCdAdecvsQDPG3f7MqidcDIxxmPf+fNqcaaoBl
 EWRZW17kC5c8siEXPImYbhokYDlMgcGbxv9zig8hMJFiKnpYPXHPPkjhjDqv1435mf/7
 IbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YMRKkzctsYK3yrAqrvPucNzaNndhrzARVuTrtoTDwo=;
 b=K3uuNjWzTAzIirn2dEF8J4htsOLMmFE1fhqy4f18lBZ+cIIaVH0SvRO1P1mH7q+Kfx
 a6kU8MTXz955/bzUuGEAWR9GvZFlWHsyswpJWB+7Jf5k5bpumdrDpOkoyY39QTGYvM17
 SjqCfwwTn8HcRmfEpvKhsf/sbngwRj0a53ZQH9w1Z84vakFl0CRDHi6qvFJ71b5yU1qa
 0I1iTRwab85Syx+RTuWmG4bW2SIN/WLi3WIWhlnvg3XDKWqw1k8P3UNbSoMPXBDnLqBE
 lsIdr1QTAwiKNrOBlztmu4DDHIPfmGMyjqXESIbTcR6ihhKKh3mgCKAJmBhFdz/lDou2
 wVLQ==
X-Gm-Message-State: AOAM531UfmDdAxux31GinJJN519MNjKkrqGusOMz85KTVPoMyEQfHa4T
 MoSbl1N4hj+tGffVyRpSCN4M2kLg65t6th9D
X-Google-Smtp-Source: ABdhPJwTVCdrkvIuymoh4ln3FNpLYFsJ+dRQa+pto+cebvWmfhT2RBGoeZrqgmYvIvzQpVOy7uP4cQ==
X-Received: by 2002:a17:90a:1702:: with SMTP id
 z2mr2471843pjd.88.1602664260950; 
 Wed, 14 Oct 2020 01:31:00 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id w5sm2486486pgf.61.2020.10.14.01.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 01:31:00 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, yulei.sh@bytedance.com,
 xuxiaohan@bytedance.com
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: g220a: Add some gpios
Date: Wed, 14 Oct 2020 16:30:57 +0800
Message-Id: <20201014083057.1026-1-wangzhiqiang.bj@bytedance.com>
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

Add GPIO STRAP_BMC_BATTERY_GPIOS5, which is used for battery
adc sensor.

Change the INTRUDER_N to CHASSIS_INTRUSION, to make it
more meaningful

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 7eaf3a4e20db..89916a2eec18 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -316,11 +316,11 @@ &gpio {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","","FM_PCH_THERMTRIP_N","INTRUDER_N",
+	/*Q0-Q7*/	"","","","","","","FM_PCH_THERMTRIP_N","CHASSIS_INTRUSION",
 	/*R0-R7*/	"","PVCCIN_CPU1_SMBALERT_N","BMC_PREQ_R_N","FAULT_P12V_PCIE_RISER_N",
 			"ALT_P12V_PCIE_RISER_N","BURN_BOARD_N","PVCCIN_CPU0_SMBALERT_N","",
 	/*S0-S7*/	"BMC_PRDY_N","SIO_POWER_GOOD","FM_BMC_PWR_DEBUG_R_N",
-			"FM_BMC_XDP_DEBUG_EN","","","","",
+			"FM_BMC_XDP_DEBUG_EN","","STRAP_BMC_BATTERY_GPIOS5","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","","","","",
-- 
2.25.1

