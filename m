Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8F4998DC
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 22:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjNfm1t0fz3bPP
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 08:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=pDmSmp2i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=pDmSmp2i; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjNfK6CqZz2xsr
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 08:39:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D963B1E6;
 Mon, 24 Jan 2022 13:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1643060342;
 bh=6xNUxjEcpAPXQtqj2dw1JnrsCyGZcDtUqq17fYGSuBI=;
 h=From:To:Cc:Subject:Date:From;
 b=pDmSmp2iDp20Bo3XfxuH1oDIeCI9ZF3F5yxRmW/4n42hZFQy8/EYtZryCCFfTwpu/
 jcdtrgLDBgM0PDv+h5pfjwB+0IuqWbmE+qZu41AylxmfJ7cCUJt6lkND1ELOODghQO
 cGEIDur1gXxmukKNKkhtEa648nStcWHEpwPzUAT0=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] ic2: mux: pca9541: add delayed-release support
Date: Mon, 24 Jan 2022 13:38:48 -0800
Message-Id: <20220124213850.3766-1-zev@bewilderbeest.net>
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
a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with LM25066
PMICs behind PCA9541-arbitrated busses, a setting of 10000 (10 ms)
reduces the median latency of reading hwmon sysfs files from 2.28 ms
to 0.99 ms (a 57% improvement).


Thanks,
Zev

Zev Weiss (2):
  i2c: mux: pca9541: add delayed-release support
  dt-bindings: i2c: add nxp,pca9541 release-delay-us property

 .../devicetree/bindings/i2c/nxp,pca9541.txt   | 10 ++++
 drivers/i2c/muxes/i2c-mux-pca9541.c           | 56 ++++++++++++++++---
 2 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.34.1

