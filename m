Return-Path: <openbmc+bounces-150-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5BAD398C
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgG4vt5z3bqP;
	Tue, 10 Jun 2025 23:40:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562842;
	cv=none; b=AGOAiFyQMt26TBA1HDKK9Jt+s+AJjyFxTk44iFi+ns5+naIfwplJR4QhwLpBWHQCx51lb9eiqulF0ehivVNXGAerbitW9u1+g3iPdXaSvsGEUmpn0s7z1QP2h7xYUKO64CKlWM2+DP3sWyK6QYKuAcjyR4OEy5/EM8Ew0sL9T8jbCLeQXn/fQJE24VfCBEVhKdeRoQJO272vyYFp4KFfX5LRMPuNRGQZwy0HY0UdXJk1atNRAVnkj6rxVsYy/MtLdeyywu6PC+hjTb7W+S/uyhyJ77K+AopknLLo0cFN1daTCC8/4LxksxnHirQhr0sqyNutNZABRQZP9xsQJS1H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562842; c=relaxed/relaxed;
	bh=ma5jQZWn4qT2V1PLzSDixmB/AoCOPugX4mmmbbunvqg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g2miusyyrF6Bs5nbf3akYlktUvAWChubXvuWgnOm61LSOA2hjb7dqbrP67spsOXBzLFzOBHuRaopZmzw2zp7I8O6+xPNH58z8pNwyLwjgoVuGZCbSbFDh4SzFFqkSqodMMUsAHJ0Lm5tREl1499iIQLhNAwN8Bkl7aIZkdvCqpAvlttv5PBcuhyO5Q5gpGJSeSZP7rACNydRUZWQNmMY3VT/pRRJtosksZ/j3SeX55hkD0EPJ0319LnqXpkK3iH1xqDapCfmL87rcri7dHjvni0Umaqo6CPGKvsZoCTn5tp68V/PfB0QICVMcCNQDEp+3v18Vr5tO0RvZnPJiykYpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MEcx9ESY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MEcx9ESY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgF3zbPz3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:41 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-73972a54919so4653330b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562839; x=1750167639; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma5jQZWn4qT2V1PLzSDixmB/AoCOPugX4mmmbbunvqg=;
        b=MEcx9ESYnTKgpCWDmpfJutOLoVpvtygfdpSGhfwp4s51wKJzLFL53LMetDrn3pcYYA
         K96drAuCZFNPv6K/hiPnR6cp+FAYiN5e/Sgb+gbLnuzTBfIxAI+0B7Q8ZqIt/IKigdt2
         ETNtivhNRuc++yaYaaBrR1huIKoQrOqCdUju3TpEWLC+Bq4iKTKNolEt+uh3rfulu289
         tzfHd2yf/+734zHV2seyx/6izeJLNVmbQ96gFkMRR3Byww/Bc1fRvW4IIvrYc6+sGeU6
         2vcqprWjnSWDbqysL1iR+k/5NAp1abubezwLCgtqDZT7knlviHEGF9BKFeyul9PMtJ37
         gK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562839; x=1750167639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5jQZWn4qT2V1PLzSDixmB/AoCOPugX4mmmbbunvqg=;
        b=a/SIcOb34lFiXgfr1/xXV8mXZObQkdrcKXTSCKQXh7fVNZ94lmnboDg0sn8BXIAl9k
         KYxQjAEBbpqsgox4aHOgEOjWSp9qs0BJo9B/5oSq91B92CEjs3hwpmbleSNBOe8348rF
         GXb3L3Jev7iBwFwTRysNC23PofN8plizEig1R1K2bUsx8aC2zKXr44Iyjy09Gz5cooNS
         DsPr2o5mCKwdvrn4349cNxestEvriSKqdMRuGHbo4i9R4Dayi0ZOVwb4rTPEO0ccOFBu
         KmJ+i2vXwZ81q4gO3x+AIKIu1RN38/fEwCdvZgyoEP5q3+YYrSEBevh/I+ufya4MqLv0
         TXkg==
X-Forwarded-Encrypted: i=1; AJvYcCVlIAvs7Fo9BeyC8p7UVQQnCAXZ5Kzp9zDbHaWoVjIrQDpnV+7PB5xFC/268uw6yplZXPJYJzML@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfZeO9jmkcZWwU/+B9sgfHYnshMDxpU7xEz2ah/WmENLUX+Gjl
	oTde45jvpbeGwRiZitEr2/FD/SrcGnR2tAB/rSDRQ3sLJRCGW2Qb6Ym7
X-Gm-Gg: ASbGncvbzQ0tM1oIbCPIjK2c4hdhf9d9KV66bIgDE2PkTldA213Q3c2AlurMfk6OHeM
	ODSNNOaH7FcBhUd45FtTcCtrllI4yrA9KyYBDXj9IEexSVdR0LooQr0w0AbCx6KIi5eZH3NudSv
	0zK7xni6JrZq8LShHv7uLN9OaD9xWd01pNWG7g/Zlfow16rNMQ5I5fC/QKYr+HKYsF4rgZnt9O/
	uSHB7pMLoVwqgD4Tat4kp/LnLFzgdvtH6EOmpj1+VovZw0gVx/7jxxXzQ5bZzEAS8BUJ0hszB4H
	zagN/k+CffHyzSa4YNC2boko9067P+PLy+mnCHP8gp5jLgy6zZtz12mTHnN65XZ9ovG4fDhVDR0
	mQs1TGDpnRwmN8w+7KIYWKIlSXlNEAq/szbjf34MZvQBC
X-Google-Smtp-Source: AGHT+IFDx6TUOUV6EMd/e5U3GXezqwzXRdSz4X0FKRCAEnBgbqNT1RbIPeyh/JmMf83JaUP2DvlysQ==
X-Received: by 2002:a05:6a21:2d4b:b0:215:eafc:abd9 with SMTP id adf61e73a8af0-21ee24fe8d9mr25351532637.14.1749562839318;
        Tue, 10 Jun 2025 06:40:39 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:38 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 2/5] ARM: dts: aspeed: Harma: Revise node name
Date: Tue, 10 Jun 2025 21:38:27 +0800
Message-Id: <20250610133830.2704829-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
References: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Revise max31790 and delta_brick node name.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Link: https://lore.kernel.org/r/20240412091600.2534693-11-peteryin.openbmc@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit 4187ccb5a45f9207aeadfe9bdecdc581a5c7eab8)
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8da6a3e14877..4bf29290baab 100644
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
@@ -238,7 +238,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -311,7 +311,7 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	delta_brick@69 {
+	power-monitor@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
-- 
2.43.0


