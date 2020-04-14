Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03591A78D3
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 12:54:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491j6p4BM2zDqWZ
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 20:54:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tq+2g7rJ; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491j3d0mbyzDqWx
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 20:51:56 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w3so4519993plz.5
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BD9VCIf3cMrvSwWG3V3B4b6SB7q/8BYZoSmCCUcj1ys=;
 b=Tq+2g7rJxONqXoah2CO2LlkUZrohZNzKKLRoZPP/FMEEmFi4VK4qhRCQSWVVXdYBiP
 CzcTGk4pR2jxf+HaKgI6ibmImG/SBCGkNiYyRAOpf/3AWFHOx0j1rkiFRXq+Qd3gaSIu
 uPxek1ucTaYJQn1bjViy4qs0zY5OIcgMFBUhhths/GqA+LlWf1xAv1/qpCS/HfhlGQRN
 pBQULtwPPmpLkz05EAoSgPOVXX1GMn7CW+HCd3JbARCuzn5psdl7iP7xcK9cTRh6GQ9Y
 j56pjxYht7zEHoRHZVgzhV6HCYa6Z8ErvZastY4jllty5PpnyvMxPmZH/dV/hcKc00VL
 rjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BD9VCIf3cMrvSwWG3V3B4b6SB7q/8BYZoSmCCUcj1ys=;
 b=tSYb3K2AhmhMzqUcXQ6+tAXEoFA50F88ZaQRwiFB3XaQ39L9M7ZMZcnVr5vPri/qNN
 X7V1RZ2mvuunY+cfSQSFDVYM5MPPESJgzffAQuH55j85QDSjV0c6E3M3ebbRHeXVv3vC
 RYWsgNkYgZo6VuUf9dqET7a0rWXjhXoiiK7DdMwDBh3MRxB/GRXw8E9DyiAidMPyEN2g
 15N7dOUJ3WT7uwZdFaJ60USiOHeGzqY8KFSOXquJ6bdThIDA+FX5U5ixyCEYzGCKF6WO
 /IwE/GkV2IA1+8pNgYz+bAXdO8QCghmEWIc86kuUg/ANmLYN5HeXjvvQs7XL0h1swfvH
 VvUA==
X-Gm-Message-State: AGi0PuaRtgKEYeGzEpEwoVtQkaB5lhCr4T3fztY+4o6p5Wrntc5v+Wo3
 AVEUr1eyeXzBKrH7UAbjlszsrEQwC1c=
X-Google-Smtp-Source: APiQypLOJjjlcMm1/6fGajO05MNmbNfY533k2rTgIKTWSTbxXtf2fRco37JLdNMrq+0f9Tg2hMhlDA==
X-Received: by 2002:a17:90a:e7c5:: with SMTP id
 kb5mr26194170pjb.187.1586861514259; 
 Tue, 14 Apr 2020 03:51:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id r28sm4556820pfg.186.2020.04.14.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 03:51:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 2/2] fsi: aspeed: Add module param for bus
 divisor
Date: Tue, 14 Apr 2020 20:21:40 +0930
Message-Id: <20200414105140.1089095-3-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414105140.1089095-1-joel@jms.id.au>
References: <20200414105140.1089095-1-joel@jms.id.au>
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

For testing and hardware debugging a user may wish to override the
divisor at runtime. By setting fsi_master_aspeed.bus_div=N, the divisor
will be set to N, if 0 < N <= 0x3ff.

This is a module parameter and not a device tree option as it will only
need to be set when testing or debugging.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 80bc9132e4f8..b44f71f1f0a8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -87,6 +87,7 @@ static const u32 fsi_base = 0xa0000000;
 #define FSI_DIVISOR_DEFAULT            1
 #define FSI_DIVISOR_CABLED             2
 static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
+module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
 
 #define OPB_POLL_TIMEOUT		10000
 
@@ -458,9 +459,12 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 	if (gpio) {
 		/*
 		 * Cable signal integrity means we should run the bus
-		 * slightly slower
+		 * slightly slower. Do not override if a kernel param
+		 * has already overridden.
 		 */
-		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
+		if (aspeed_fsi_divisor == FSI_DIVISOR_DEFAULT)
+			aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
+
 		gpiod_direction_output(mux_gpio, 0);
 		dev_info(dev, "FSI configured for external cable\n");
 	} else {
-- 
2.25.1

