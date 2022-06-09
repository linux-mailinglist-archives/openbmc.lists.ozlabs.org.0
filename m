Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF13544130
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 03:52:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJRtk23wsz3bdF
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 11:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m0P34Jkx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m0P34Jkx;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJRtH49HNz2xtt
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 11:52:22 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id o17so19139468pla.6
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 18:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WVAcy0BQkf0tixTBJrI/efh/H6IhNiySwBw+gAxzdg=;
        b=m0P34JkxywUW8RP357iw3TAParbxefepCepmDK+vf4iR0pNjB2l4Liy8ZVEg49gChb
         KdwktIz3sMzYi+8jwprfiQT2sDPZOPUcAjd3zld3UDVC1EBu9qd2h41pG6qCfJhZhm26
         tv7qZl6N325rZP2el70BYHR3tNwRLCQy3dOfIyEtoGSoHchT5/po58vQwJYrxfdBQaIR
         jbjFwTH4H7bb66mcgSzOS0iIKejm6Y4ql+YaSMyuGd1QbBiN1zF3vf8LgAn54MaxKZwL
         G53OBqutRR0v9AUsC4YyomBOZuBDsZ1duu3c3VRtje2HgFlyA7gFpIQc5QfAv2G6pXPF
         TfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0WVAcy0BQkf0tixTBJrI/efh/H6IhNiySwBw+gAxzdg=;
        b=j1dsqBAPxLm1WOppTd1/kellRvi17QFdvPis7uXr3mDM1UZDXnoPTte39cv3ADgafW
         ulAO/2aCbfqFyEV2MfGFu+fj+cQ7v900GAcyG+nGoHy+tmz4fCak8H5JORK/drQvoSaL
         L+HSR/kafYin+IzmKvSUL0mq4fAa/c6TK7UrmqkzEQmPnvQhmG5U35iv4Lys2FStcvgx
         XhUzCeU7N8BAFkeo27dvvpBaYBu0P6+vwtUzAYnnxKqkp3O88KP2j2HFFfQXUVgg/XxG
         TpKmn1v5LQLt38P35L0mbgD/uUPEyuN24LOjCWX5hvjxh1yh6Rmk5nUs54HkJveOa/XH
         dHWQ==
X-Gm-Message-State: AOAM532yPzXYgu8TcT39Z6Z69MH900w2Li+UF4tsbJBEL8hAtxLcsAXz
	hiBc2NxhckyzJVOFKgSDi/2XCKJgVnE=
X-Google-Smtp-Source: ABdhPJwwHQKzK+2trrXq3M11m6+o5gXhXhbS9qcyHipmXVFYbIUh2OEkr2UduKJJaQyC8SmhMky+0Q==
X-Received: by 2002:a17:90b:1c07:b0:1e3:c8c:d4fa with SMTP id oc7-20020a17090b1c0700b001e30c8cd4famr896267pjb.157.1654739538943;
        Wed, 08 Jun 2022 18:52:18 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id d9-20020a656b89000000b003fd7e217686sm7961202pgw.57.2022.06.08.18.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 18:52:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: p10bmc: Remove flash controller
Date: Thu,  9 Jun 2022 11:22:07 +0930
Message-Id: <20220609015207.1914540-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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

P10 BMC systems used SPI NOR only for early revisions, but are now
exclusively using eMMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-p10bmc.dts | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
index 6c1794dd1432..c4f104552747 100755
--- a/arch/arm/dts/ast2600-p10bmc.dts
+++ b/arch/arm/dts/ast2600-p10bmc.dts
@@ -19,8 +19,6 @@
 
 	aliases {
 		mmc0 = &emmc_slot0;
-		spi0 = &fmc;
-		spi1 = &spi1;
 	};
 
 	cpus {
@@ -66,27 +64,6 @@
 	pinctrl-0 = <&pinctrl_rmii4_default &pinctrl_rmii4rclk_default>;
 };
 
-&fmc {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_fmcquad_default>;
-
-	flash@0 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <2>;
-		spi-rx-bus-width = <2>;
-	};
-
-	flash@1 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <2>;
-		spi-rx-bus-width = <2>;
-	};
-};
-
 &emmc {
 	u-boot,dm-pre-reloc;
 	timing-phase = <0x700ff>;
-- 
2.35.1

