Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18844B05EE
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 06:57:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvQy73Cw5z3c9t
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 16:57:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvQxq3BGJz2yN3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 16:57:16 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21A5mecu095548;
 Thu, 10 Feb 2022 13:48:40 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (118.99.190.129) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Feb
 2022 13:56:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <andrew@aj.id.au>, <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v0 1/1] rsa: adds rsa3072
 algorithm
Date: Thu, 10 Feb 2022 13:56:52 +0800
Message-ID: <20220210055652.3991-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [118.99.190.129]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21A5mecu095548
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
Cc: steven_lee@aspeedtech.com, troy_lee@aspeedtech.com,
 jamin_lin@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add to support rsa 3072 bits algorithm in tools
for image sign at host side and adds rsa 3072 bits
verification in the image binary.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Change-Id: I98a8b2fabc2d64e5e3c7e04bc7ba78b9f10cee35
(cherry picked from commit 21426358d482b1ea181abbca4d32426ddf887dda)
---
 common/image-sig.c   | 7 +++++++
 include/u-boot/rsa.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/common/image-sig.c b/common/image-sig.c
index e4bbac55c1..c94854ef8b 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -85,6 +85,13 @@ struct crypto_algo crypto_algos[] = {
 		.add_verify_data = rsa_add_verify_data,
 		.verify = rsa_verify,
 	},
+	{
+		.name = "rsa3072",
+		.key_len = RSA3072_BYTES,
+		.sign = rsa_sign,
+		.add_verify_data = rsa_add_verify_data,
+		.verify = rsa_verify,
+	},
 	{
 		.name = "rsa4096",
 		.key_len = RSA4096_BYTES,
diff --git a/include/u-boot/rsa.h b/include/u-boot/rsa.h
index 2d3024d8b7..d561e5f8ca 100644
--- a/include/u-boot/rsa.h
+++ b/include/u-boot/rsa.h
@@ -135,6 +135,7 @@ static inline int padding_pss_verify(struct image_sign_info *info,
 #define RSA_DEFAULT_PADDING_NAME		"pkcs-1.5"
 
 #define RSA2048_BYTES	(2048 / 8)
+#define RSA3072_BYTES	(3072 / 8)
 #define RSA4096_BYTES	(4096 / 8)
 
 /* This is the minimum/maximum key size we support, in bits */
-- 
2.17.1

