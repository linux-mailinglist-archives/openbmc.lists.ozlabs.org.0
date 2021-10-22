Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69954436FB7
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 04:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb6zG5z38z3c9c
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 13:01:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DU7tY17F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DU7tY17F; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb6y92NXtz2yHl
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 13:00:48 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 522BE98D;
 Thu, 21 Oct 2021 19:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634868046;
 bh=a/XGFUg4+nH0ms1nAfRWPYozspJBU8EaTQ2O/BYzSYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DU7tY17FDr71jzgG2hHBqWK+HF30qVROqxkfhxnQd4PDWnwinchH8Eh1DnqGi11YN
 /VClEF+jolOai9moi6TK4ZrEIYJXVXlUP5HASzggFly1c8liUuj/4HOyA5ioxADpyJ
 cxLsXUTLz1Pyma9BF3JnMuTEhXLXcfmeksgLzRl4=
From: Zev Weiss <zev@bewilderbeest.net>
To: Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/5] of: property: add support for fwnode_device_is_reserved()
Date: Thu, 21 Oct 2021 19:00:30 -0700
Message-Id: <20211022020032.26980-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022020032.26980-1-zev@bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
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
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is just a simple pass-through to of_device_is_reserved().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a3483484a5a2..67a8cb7ac462 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -872,6 +872,11 @@ static bool of_fwnode_device_is_available(const struct fwnode_handle *fwnode)
 	return of_device_is_available(to_of_node(fwnode));
 }
 
+static bool of_fwnode_device_is_reserved(const struct fwnode_handle *fwnode)
+{
+	return of_device_is_reserved(to_of_node(fwnode));
+}
+
 static bool of_fwnode_property_present(const struct fwnode_handle *fwnode,
 				       const char *propname)
 {
@@ -1458,6 +1463,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get = of_fwnode_get,
 	.put = of_fwnode_put,
 	.device_is_available = of_fwnode_device_is_available,
+	.device_is_reserved = of_fwnode_device_is_reserved,
 	.device_get_match_data = of_fwnode_device_get_match_data,
 	.property_present = of_fwnode_property_present,
 	.property_read_int_array = of_fwnode_property_read_int_array,
-- 
2.33.1

