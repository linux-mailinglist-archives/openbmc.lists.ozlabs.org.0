Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D1A5DA41
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 11:13:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCRKS5sgbz3dXM
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 21:13:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741774392;
	cv=none; b=aGoLmnGLc0b0xtgtCZ3qxqBWXUFvh4+HDCa9TrShJz8WKHGK9ja2oHx580/ScKmd9359i9iZCROj6IuKaecJ1D/0Reu5hbB4OScDvFd7rI/+O2B5d+npRHdAzocxyJIR/N9dvD83jk/vUeg+HgnfEe9RFLJYizoS7V13UwC5bWaYbGwnvg1Hy/p8OqTHKp2mFarDfAUCKZ8ptVq9yJtxaKUbTbYMlnDVNL9CTKCgHmJUJhib0QgLU3z/tOjq3+JAF2iojqa5saopFVFPCqyrnaL8nmLwFiR2pn7RFs2ACOE2GMM/Ky2zO5Bodxvx6CEe/LIP+6GuVa4D6PebuR8gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741774392; c=relaxed/relaxed;
	bh=4P/2xgGIDh6Q06fA1IPM5x6/TK/yMEJu+JRT40vrYVA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mS4gLQy5uMDXevUE93AMfxn7IA7zU1Xs44fRP6KvBo9g1M8bW8O8zMWRZr32SHnQKGopMByY4fAU551wUEmg0hFK4D4urxOeU77EfmnRXs0L035iMcKnU2mdjpwX69qv/2Z0ITP06KUcR8006B6Ap9xjSvuiTY0pCCY6ra6KGeVWSYo33FjdXNrKkzuagv+l+Kd0q5yZmauWHsKHaikFL4qPsOjA+S3NmgItoKZKKuZfdEwYagGbpY2fHjgcUE9ogSNUwReED51u9YrDw/JGsXH/4G5lOmIqMQOdxo1jyM3PoAwfo0+F6mMqawP32IJodZYNZOCZhT0KaRPGisVCqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejbeXV/I; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejbeXV/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCRKM15nnz2yQl
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 21:13:11 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22349bb8605so121030165ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774389; x=1742379189; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P/2xgGIDh6Q06fA1IPM5x6/TK/yMEJu+JRT40vrYVA=;
        b=ejbeXV/I+HmdoVJiH/qNb8eC1OujQO+/Ax/0mDQ63WuOt6LcZOHFTXxihxaPna8QqZ
         5+Fl5I4xAoccZv9/wA9i/0NnxsmSazxfzJZYZXPL6JOpAuLUC/JoRrHL22IzK7OZXCX6
         BBOkxLmLoP81ukpdtLv06MHrm6zi3NQvZu4Nh5RAd9V4xJXd0XqTFmj+ibVPp7RQuzBr
         r5HUKxLcDXie5vrPo0H7eQaIA1ny3ksNzPvy/fJG3qAx9lcz52QY3x0JNmU4IjoNigNJ
         889dmmWfYSMCJYujSpprthMOVbbg/XI3rL6ZWRo6YlO0vfi4OLJWoRKPgjOQtrz0F00Q
         Mf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774389; x=1742379189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P/2xgGIDh6Q06fA1IPM5x6/TK/yMEJu+JRT40vrYVA=;
        b=U/KCl7caBc9wDlYtD4jWPZmlOtR+8GfLANjWrH9qL+nrSLr++OzYSR+Nxc4HUsoZCC
         2CikIAhI9Tcmk/aFIgMrM1fGnbnvT0xbUfH1Rdxp+Uu3g4odBMZfIvQKjMWH/00shmxv
         HCTBkiXcEpmomiJd3UJ0Vgz53kDIIvkEu7oYg7NP6McIsIMiKK2JLkTfNKVnwcy4J78A
         eko2F6PjTU7v0Pgldwy644aDjCKvu2QkVFO7t/icXeUUiqmDaiGfJUfhSYVRZopoo2zl
         suR624SiXcXkXFh/sld9R2CJgwOj3HlNRl0bO7loPjY0TNqKuxY5/oe4nJ1SMNUjjlxs
         egIQ==
X-Gm-Message-State: AOJu0YybTu/nuKmyOOFQkY86PdjNrbhsgCnsimykRwlkt4uTyy7LB9eG
	LqKGBTfAQVp77hZ9Tx446tROhH/vup3RBSTQr8HcSJLQWyR7g1/ol2oJAA==
X-Gm-Gg: ASbGncs+3wc1XRHFp9GRBusnUrYQz/81AmXVfE5bG+o+2h9LdLWSo5Kov/G4Oe0XN9b
	QuVuE7jYMTuARjyOr77lADbCpGyuOWrqB0C1+Y6pMC1o+1KoFEjmukmZ83FKx8flb52AhbFsAYB
	7ZtxdMv1picJTwSrdswkUh/BKUMU4XT/SMpT/6W79FqpFEFSdSNV2pHPLG3MEbUlvGXVUL1eRW1
	pt1yYCJ7PysGieQyWA+IjCIqlNOF6/f2vP1kzQr8DUw84TncLkYjIrTRwKpZkGCvDWfWaMzoSwC
	ZNdagtXKzQIRiOo+crRWqJWQHMgfC33EamkZ+X9SLIQFWdzEY2AagV0T6MfW2ymq5SKkXPf+YRb
	SYz/hYxhIHr61jiaC9Vt9zNLzN/5jqfYOPXYVY9/xoIBfKB7DD2wrKe1WZ0C7BtgklFbd+xYZL2
	I=
X-Google-Smtp-Source: AGHT+IHxS6nfkcIYPQddh3Xf0VrGxUgh9zFQaXo/16drLd+5553E1LO/IFUEcrB/261zQHkn+tXp5A==
X-Received: by 2002:a17:902:e80a:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22428897491mr371127755ad.14.1741774389120;
        Wed, 12 Mar 2025 03:13:09 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-4352-93e5-842e-726b-dd46.emome-ip6.hinet.net. [2001:b400:e35c:4352:93e5:842e:726b:dd46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5edsm112595815ad.37.2025.03.12.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:13:08 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [linux,dev-6.6 1/4] ARM: dts: aspeed: Harma: Revise node name
Date: Wed, 12 Mar 2025 18:12:47 +0800
Message-Id: <20250312101250.3238182-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
References: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Revise max31790, tmp75 and delta_brick node name.
link:https://lore.kernel.org/all/20240412091600.2534693-8-peteryin.openbmc@gmail.com/

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d175e37c45c1..4bf29290baab 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -183,7 +183,7 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -223,7 +223,7 @@ temperature-sensor@4b {
 &i2c1 {
 	status = "okay";
 
-	tmp75@4b {
+	temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
@@ -238,7 +238,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -311,12 +311,12 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	delta_brick@69 {
+	power-monitor@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
 
-	tmp75@49 {
+	temperature-sensor@49 {
 		compatible = "ti,tmp75";
 		reg = <0x49>;
 	};
-- 
2.25.1

