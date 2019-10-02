Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF3C4B67
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 12:27:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jslX1yktzDqQv
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 20:27:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TKjAATMe"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsgD5MmtzDqXJ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 20:23:52 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id z12so11598902pgp.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+iX66NHPcdLrHfJMIeNMR/m9n4FOx3FxxMdUwMicaWw=;
 b=TKjAATMervQBNNiHDkzBIRZvcpWqKShN1GsJB+xurzoPqLKk4bvB61kcjrhiBqNKD4
 TSK5Cam1e3xo1+hd2DZNe2qWX2BDVdQ5aV/QtRDaAG48mLg1t8paLroitv1HcqJFWZ5R
 ihp481q/LMbN1CzlbOSuJNfWnckLykIgciZ8g/8YAgIRMU4krwit9TOyuOgPC2BVdRtp
 LGGUHZdQ5k8rukvHV0ryZ8fn/Pgagf2swJgoHaPEc4IA+y5WYqvuc6Q9P54RZHHSpx3c
 9JUdnIt1UHl1pVyDl6Z/4b9+wIrkEd2CEmDaBEUZbu0dmJJoYyy/xcRNWGqYTKmbn9pb
 V97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+iX66NHPcdLrHfJMIeNMR/m9n4FOx3FxxMdUwMicaWw=;
 b=rAmHhwWlfN/hXOEcxEqgDqLzZQaoKe4y95BbWNWOCVMpInU3mtcHHOj49yEs4EMgw3
 9GM2ri/avGR6GSP6+oRnnu0lB42j4fzQyTgGPy3C69iPXf7RVsdrolob2ikL0TriLP9V
 YfHc4pLQQIJyGHXtxxfRLfrzDIv9g+1uvMYe1IR+PwjceiwaaeiQEw56XILHS362581F
 vqs1P4TgGgcOAM6hF643/nxWs8Pd0JLzn+KxoZGjWBc0qbQxI4IJstffkCl0LHqZvZb8
 hEgzUMy4X6DGQwQxL8oq99mU5EffcxiWjinWsxTAyiJG5cP3VOOGSmu81zgnkj4p5pBC
 MIwQ==
X-Gm-Message-State: APjAAAUJcTbjg5QKVxYGim9MhNWD6KVJaH4h+TG3onN3o073DFs94NWn
 4CZi4bnN+9snVL27WtcybplLCjnWhdQ=
X-Google-Smtp-Source: APXvYqyEf3nMsn7k8EusoI88jP2lDmbqvZGITOlZKeXrXTl90bioAl3i2ilLlvC1Aad26wlzEvmJWg==
X-Received: by 2002:a62:8749:: with SMTP id i70mr3702496pfe.12.1570011829951; 
 Wed, 02 Oct 2019 03:23:49 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id i74sm24187091pfe.28.2019.10.02.03.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:23:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 3/4] ARM: dts: tacoma: Remove incorrect i2c buses
Date: Wed,  2 Oct 2019 19:53:27 +0930
Message-Id: <20191002102328.5196-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002102328.5196-1-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When adding the Tacoma system a number of I2C buses were enabled that
according to the schematics are either tied to ground (i2c8, i2c6) or
used as GPIOs (i2c14, i2c15).

Fixes: 4fde000c9b28 ("ARM: dts: aspeed: tacoma: Enable I2C busses")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 183a8349e181..02eeea6a9bd2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -298,18 +298,10 @@
 	};
 };
 
-&i2c6 {
-	status = "okay";
-};
-
 &i2c7 {
 	status = "okay";
 };
 
-&i2c8 {
-	status = "okay";
-};
-
 &i2c9 {
 	status = "okay";
 
@@ -448,14 +440,6 @@
 	status = "okay";
 };
 
-&i2c14 {
-	status = "okay";
-};
-
-&i2c15 {
-	status = "okay";
-};
-
 &ibt {
 	status = "okay";
 };
-- 
2.23.0

