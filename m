Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAE424AFE
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:15:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsKV0DQ7z2ymS
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:15:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kY2SIwim;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=kY2SIwim; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCV0QN6z30GD
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:14 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 41682C9C;
 Wed,  6 Oct 2021 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565412;
 bh=8PxEBgL6W+cioy40DEeituztueb3LeZkbsP0wIoL/Sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kY2SIwimC82+8OVRRx8RawwF6vON2/1tDFBmvkufF7BIAcyB+uL6Ai+6ZuY+GFjod
 zbBfRwJ8PooTFUPhODE8SDsA9JxMdfv4Rpj9GonN5n+q66yGceoBcXEaBE60Vr1B7k
 X3BebMxwRHlKJqdGuEgPuvumw2A4rQM285HvdyyU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 7/9] of: make OF_DYNAMIC selectable independently of
 OF_UNITTEST
Date: Wed,  6 Oct 2021 17:09:52 -0700
Message-Id: <20211007000954.30621-8-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007000954.30621-1-zev@bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The writable status sysfs file enabled by the 'dynamic' DT property
requires CONFIG_OF_DYNAMIC to be useful, but that shouldn't require
dragging in CONFIG_OF_UNITTEST as well.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 3dfeae8912df..8e0ba87db030 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -55,12 +55,14 @@ config OF_KOBJ
 # Hardly any platforms need this.  It is safe to select, but only do so if you
 # need it.
 config OF_DYNAMIC
-	bool "Support for dynamic device trees" if OF_UNITTEST
+	bool "Support for dynamic device trees"
 	select OF_KOBJ
 	help
 	  On some platforms, the device tree can be manipulated at runtime.
-	  While this option is selected automatically on such platforms, you
-	  can enable it manually to improve device tree unit test coverage.
+	  With this option enabled, device tree nodes that are marked with
+	  the "dynamic" property can have their status toggled between
+	  "okay" and "reserved" via sysfs.  This can also be enabled to
+	  increase test coverage with CONFIG_OF_UNITTEST if desired.
 
 config OF_ADDRESS
 	def_bool y
-- 
2.33.0

