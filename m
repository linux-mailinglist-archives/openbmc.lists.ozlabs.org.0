Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D6436FBA
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 04:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb71G1B8hz3c9c
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 13:03:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=dTLcZyfB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=dTLcZyfB; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb6yB2yCsz2y7X
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 13:00:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AE5E572B;
 Thu, 21 Oct 2021 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634868046;
 bh=2efYL9rwju5SdZ2gZO9Y+iw53j+3OthU+D9Ued9171A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dTLcZyfB+o23zCieIixIk1iW6+CXajFlgYvk05xm6r1pcsOB3pmRsMCV71ZWfrEgS
 TfjbvVP5tlYDrYgv1hZIuIYw5QFffzYmZp35cfj/s+QelYfZ2PBZt6wxNGrkPv2WS1
 qCOJbwjPa+skQ+phlmsd1hqHnkxdl1TXK1JgKTxg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/5] device property: add fwnode_device_is_reserved()
Date: Thu, 21 Oct 2021 19:00:29 -0700
Message-Id: <20211022020032.26980-3-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>, Zev Weiss <zev@bewilderbeest.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is the fwnode API corresponding to of_device_is_reserved(), which
indicates that a device exists but may not be immediately accessible.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/base/property.c  | 16 ++++++++++++++++
 include/linux/fwnode.h   |  2 ++
 include/linux/property.h |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 453918eb7390..7b70cb04531c 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -845,6 +845,22 @@ bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_device_is_available);
 
+/**
+ * fwnode_device_is_reserved - check if a device is reserved for use
+ * @fwnode: Pointer to the fwnode of the device.
+ *
+ * For fwnode node types that don't implement the .device_is_reserved()
+ * operation, this function returns false.
+ */
+bool fwnode_device_is_reserved(const struct fwnode_handle *fwnode)
+{
+	if (!fwnode_has_op(fwnode, device_is_reserved))
+		return false;
+
+	return fwnode_call_bool_op(fwnode, device_is_reserved);
+}
+EXPORT_SYMBOL_GPL(fwnode_device_is_reserved);
+
 /**
  * device_get_child_node_count - return the number of child nodes for device
  * @dev: Device to cound the child nodes for
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 9f4ad719bfe3..1a9aefbe12f1 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -86,6 +86,7 @@ struct fwnode_reference_args {
  * @get: Get a reference to an fwnode.
  * @put: Put a reference to an fwnode.
  * @device_is_available: Return true if the device is available.
+ * @device_is_reserved: Return true if the device is reserved.
  * @device_get_match_data: Return the device driver match data.
  * @property_present: Return true if a property is present.
  * @property_read_int_array: Read an array of integer properties. Return zero on
@@ -110,6 +111,7 @@ struct fwnode_operations {
 	struct fwnode_handle *(*get)(struct fwnode_handle *fwnode);
 	void (*put)(struct fwnode_handle *fwnode);
 	bool (*device_is_available)(const struct fwnode_handle *fwnode);
+	bool (*device_is_reserved)(const struct fwnode_handle *fwnode);
 	const void *(*device_get_match_data)(const struct fwnode_handle *fwnode,
 					     const struct device *dev);
 	bool (*property_present)(const struct fwnode_handle *fwnode,
diff --git a/include/linux/property.h b/include/linux/property.h
index 357513a977e5..455b022fa612 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -50,6 +50,7 @@ int device_property_match_string(struct device *dev,
 				 const char *propname, const char *string);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
+bool fwnode_device_is_reserved(const struct fwnode_handle *fwnode);
 bool fwnode_property_present(const struct fwnode_handle *fwnode,
 			     const char *propname);
 int fwnode_property_read_u8_array(const struct fwnode_handle *fwnode,
-- 
2.33.1

