Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75BC87FE
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:10:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jw2P4bDYzDqXq
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:10:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jmCx2d1hzDqVd;
 Wed,  2 Oct 2019 16:18:21 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x925vDQw005821;
 Wed, 2 Oct 2019 13:57:13 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x925uHxR005679;
 Wed, 2 Oct 2019 13:56:17 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 2 Oct
 2019 14:12:13 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/2] dt-bindings: peci: aspeed: Add AST2600 compatible
Date: Wed, 2 Oct 2019 14:12:00 +0800
Message-ID: <20191002061200.29888-3-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX01.aspeed.com (192.168.0.23) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x925uHxR005679
X-Mailman-Approved-At: Wed, 02 Oct 2019 22:06:34 +1000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jason.m.bills@linux.intel.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the AST2600 PECI controller compatible string.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 Documentation/devicetree/bindings/peci/peci-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
index cdca73a3b7d8..cddd2d2aa58f 100644
--- a/Documentation/devicetree/bindings/peci/peci-aspeed.txt
+++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible        : Should be one of:
 			"aspeed,ast2400-peci"
 			"aspeed,ast2500-peci"
+			"aspeed,ast2600-peci"
 - reg               : Should contain PECI controller registers location and
 		      length.
 - #address-cells    : Should be <1> required to define a client address.
-- 
2.17.1

