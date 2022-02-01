Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6BA4A53F7
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnltR1lf7z3bTS
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 11:19:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=giilTykb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=giilTykb; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnlsP2xRqz2yR8
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 11:18:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 68340407;
 Mon, 31 Jan 2022 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1643674726;
 bh=vzPsNjZvndAyHxwYzpRfPbOzW25qWDh7MkzyvlonJCI=;
 h=From:To:Cc:Subject:Date:From;
 b=giilTykb2ELfTcPfC8n/+sJ0g9/UFXKa/W5nrtxv0TvhP63lm8znl5kNWAcGdvfNb
 qoxAzlFBuLgBsjc4UUzLMUH1V+QNdjxN9gvZ7MaHbF+fA7p1a6u/OD11gxEsUweeqe
 rdrvQvXDTuiT8d/pc9TynkRPqKeFXTQtrois/LQU=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Date: Mon, 31 Jan 2022 16:18:08 -0800
Message-Id: <20220201001810.19516-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series adds support for a new pca9541 device-tree property
("release-delay-us"), which delays releasing ownership of the bus
after a transaction for a configurable duration, anticipating that
another transaction may follow shortly.  By avoiding a
release/reacquisition between transactions, this can provide a
substantial performance improvement for back-to-back operations -- on
a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
ms) reduces the median latency the psusensor daemon's hwmon sysfs file
reads from 2.28 ms to 0.99 ms (a 57% improvement).


Thanks,
Zev

Changes since v1 [0]:
 - removed spurious #include line from dt-bindings example

[0] https://lore.kernel.org/linux-i2c/20220124213850.3766-1-zev@bewilderbeest.net/

Zev Weiss (2):
  i2c: mux: pca9541: add delayed-release support
  dt-bindings: i2c: add nxp,pca9541 release-delay-us property

 .../devicetree/bindings/i2c/nxp,pca9541.txt   |  9 +++
 drivers/i2c/muxes/i2c-mux-pca9541.c           | 56 ++++++++++++++++---
 2 files changed, 56 insertions(+), 9 deletions(-)

-- 
2.34.1

