Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F3542168
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:15:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHxm80mXvz3bsF
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:15:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHxlw2SDKz30F8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:15:08 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LHxlr1clBz4xR1;
	Wed,  8 Jun 2022 16:15:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHxll3k9sz4xD9;
	Wed,  8 Jun 2022 16:14:59 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] spi: aspeed: Use "jedec,spi-nor" compatible to count devices
Date: Wed,  8 Jun 2022 08:14:54 +0200
Message-Id: <20220608061455.365123-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The SoC device trees use the "jedec,spi-nor" compatible property to
describe the flash devices and the board device trees override this
property with "spi-flash", "sst,w25q256". This comes from the initial
driver which was first written when spi-nor support had not been
merged in U-boot yet.

"jedec,spi-nor" should be preferred since it is used by Linux and the
latest U-boot. Use it to count devices. We will clean up the board
device trees later.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/aspeed_spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
index 65d69105e8e8..45f6a8dd6850 100644
--- a/drivers/spi/aspeed_spi.c
+++ b/drivers/spi/aspeed_spi.c
@@ -1241,7 +1241,8 @@ static int aspeed_spi_count_flash_devices(struct udevice *bus)
 
 	dev_for_each_subnode(node, bus) {
 		if (ofnode_is_available(node) &&
-		    ofnode_device_is_compatible(node, "spi-flash"))
+		    (ofnode_device_is_compatible(node, "spi-flash") ||
+		     ofnode_device_is_compatible(node, "jedec,spi-nor")))
 			count++;
 	}
 
-- 
2.35.3

