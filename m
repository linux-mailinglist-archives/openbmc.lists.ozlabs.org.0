Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D24351A78CE
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 12:53:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491j5V0qMJzDqWd
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 20:53:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vN2vA2E6; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491j3Z3T1MzDqWd
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 20:51:54 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id b7so5117135pju.0
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opCghKgW45K6s/aXjwfbAM0eR5FcASZUBfMMaA4u+xU=;
 b=vN2vA2E6rf203GoQRb3xT0Ui4m18w4B1ZPXVTsndQcmHORwxoAj5db7gzv1C3f6lGw
 kbajW+c8R4oow6+jFTlkOud8W5r4/p1nA7cN23pjgjNxZWDs3LidCdrvVjuDRDdcX8Qw
 KRWRMu66sFBiFHFf3qX64VR8/wpH4awdCo7yqDC2pj79C7OcvWinBBLoZM1+w1QjLzjI
 drdm6tt6yR+yqIpmqT1y5tRdVaS4uRzJGyxyDS5x5aCC3SvxKA+HBKzfLezdh67niryv
 dj1Oy4IFrYVIord9/OqA/LG50uCGfJ7BeWi/RNnM8GWgyoGf9QjKMXEuVWKhvCeRx1eV
 8f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=opCghKgW45K6s/aXjwfbAM0eR5FcASZUBfMMaA4u+xU=;
 b=QKAsQI3XkigEvFL6G2laTxqqAuIM3JHrv2YNjr8o6bj7gRcGbgYqVqWI7xjrHm3eRa
 0kKlxehzRWkuMxhsXfDKD86uMj0iFupYu7qcESGE1OtWW9qo13F6Kht8dtNwBKsnf7+c
 +FRhmQzO4pEFOjd8bDqD5AFRkj2dB0buzYokHpCNt9u7phLLqM9tkDzhhSKVAgakf6jV
 QMRAHMbiUjzer3TKaT17y8JvgBfAWRfpy9e58Vox7++qXpsqAbVPvatS0R++YpCbhcLZ
 iQ1NguWx6mi2+/QNCUVEoNQm6vvgM/77Yl1LfqIamPslofoiyzg3m8RAW1XD6xbQTw/3
 lN9g==
X-Gm-Message-State: AGi0PuYBiLpk0cu2PombYeZKxsfRYa0rlRliBS0+9mt+Pxxe/Y1mSjUj
 sXgaxGEvKyKrh2kA/ctQ5Uw9kc+1BG0=
X-Google-Smtp-Source: APiQypI+VvQxtGDv5SzEVN8HRL17XDVz2Flio5OAy8xut8fSEspOzuFp2axHXIU/JTuriJeeP9ax7A==
X-Received: by 2002:a17:902:6b0a:: with SMTP id
 o10mr21434542plk.32.1586861511728; 
 Tue, 14 Apr 2020 03:51:51 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id r28sm4556820pfg.186.2020.04.14.03.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 03:51:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 1/2] fsi: aspeed: Run the bus at maximum speed
Date: Tue, 14 Apr 2020 20:21:39 +0930
Message-Id: <20200414105140.1089095-2-joel@jms.id.au>
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

Testing of Tacoma has shown that the ASPEED master can be run at maximum
speed.

The exception is when wired externally with a cable, in which case we
use a divisor of two to ensure reliable operation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index fe2da6f90590..80bc9132e4f8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -83,7 +83,11 @@ static const u32 fsi_base = 0xa0000000;
 
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
-#define DEFAULT_DIVISOR			14
+/* Run the bus at maximum speed by default */
+#define FSI_DIVISOR_DEFAULT            1
+#define FSI_DIVISOR_CABLED             2
+static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
+
 #define OPB_POLL_TIMEOUT		10000
 
 static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
@@ -389,9 +393,11 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	opb_writel(aspeed, ctrl_base + FSI_MECTRL, reg);
 
 	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
-			| fsi_mmode_crs0(DEFAULT_DIVISOR)
-			| fsi_mmode_crs1(DEFAULT_DIVISOR)
+			| fsi_mmode_crs0(aspeed_fsi_divisor)
+			| fsi_mmode_crs1(aspeed_fsi_divisor)
 			| FSI_MMODE_P8_TO_LSB);
+	dev_info(aspeed->dev, "mmode set to %08x (divisor %d)\n",
+			be32_to_cpu(reg), aspeed_fsi_divisor);
 	opb_writel(aspeed, ctrl_base + FSI_MMODE, reg);
 
 	reg = cpu_to_be32(0xffff0000);
@@ -450,6 +456,11 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
 	/* If the routing GPIO is high we should set the mux to low. */
 	if (gpio) {
+		/*
+		 * Cable signal integrity means we should run the bus
+		 * slightly slower
+		 */
+		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
 		gpiod_direction_output(mux_gpio, 0);
 		dev_info(dev, "FSI configured for external cable\n");
 	} else {
-- 
2.25.1

