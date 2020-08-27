Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F083F254619
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 15:40:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BckPB6xnbzDqjN
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 23:39:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=J5zABpw+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=L+cuOAUx; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BckKF0tZGzDqgq
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 23:36:32 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D46165C0077;
 Thu, 27 Aug 2020 09:30:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Aug 2020 09:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6EIf2LGImcTk3
 KN8YEp7FE9CDzy1PxgLn7xD/VwiMqY=; b=J5zABpw+y1iUXC0GfMtmCgmB9N1V2
 ZMyn7+Z5euptMG99D3a9OFtrerzxt5eyw+EAulZPlBYnHKSKwwMc3NssUw1ysmmo
 Kn37t+MbUpupY2kzz2fTJqSHZXrJuwa/L846K9q1ZCVXx0DobMeSngkEkyXuA0km
 EjKfENbvHHBXR0LGGnOvqOQpC7z3cffPzC0bDFiyp/xd7HHOZmWKwn3wcvo2zTWS
 tf31lk+SqPV0wAHImaqurAGuhKXUpk1Osti15h5WGL0BkhW0ix1Ci6CXk4uYo6BR
 i4jJXyhy/e7Iu7JoUYJZU2NiGimRNAI7JTBzJfS2K7F8ry7PFvQujSzog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6EIf2LGImcTk3KN8YEp7FE9CDzy1PxgLn7xD/VwiMqY=; b=L+cuOAUx
 nF2y6/cH3DMGSqcW1oWm5S76JCMmOlbevVRyMYriv1L814R/K5O0msci5L35H5Mb
 n5Ptu4crO6TLETrNr92eVMOtLpjJpuXQkcv5fcRurXlpOh/axVVv7AfZrL7L9H+G
 CslrkakisnDFadSGD+b348cUjEy83dQNMfo1UmfWaKPyELi9k+31Iea8RXFMrXkm
 1w+XGanFRkWQg2QRh+BxHzd6B3HUBST+Q2mNJMVQdauf75ggHYfL6XuqVrdIQVVh
 nH0yfa8tmibRiBT3NVsO0KgfIrXU0MjW8d1oS/OJa0bVzfGjK9W058KS1YJYbx14
 0G56EmBbJLszEA==
X-ME-Sender: <xms:g7VHXxcSa1_0xGNdU9kBUXcarKwqfiEkZ3Wx3bUMNDYQ8QQfd_dcLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrudduiedruddtnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:g7VHX_N5AbraopCqAK6IHd-OKTuAh4Npx94yk8tl6gurkpLYFL5cHw>
 <xmx:g7VHX6iWlaPFGdxCey4EuEJxvugzbYDl5Ix_8bewcJ65lMGlkOgv5A>
 <xmx:g7VHX6-Bz-NXQK8yTpt61FnwYJ5OxTws-FWNRsItJ2dag_saUOJMzQ>
 <xmx:g7VHX74IrT_3Hwkb7kHwVP1ZrdHPVyIR_LCfLSqSAqDikcIrkLkEdA>
Received: from localhost.localdomain
 (ppp14-2-116-10.adl-apt-pir-bras32.tpg.internode.on.net [14.2.116.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A34CC3280059;
 Thu, 27 Aug 2020 09:30:42 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 1/3] pmbus: (max31785) Retry enabling fans after
 writing MFR_FAN_CONFIG
Date: Thu, 27 Aug 2020 23:00:00 +0930
Message-Id: <20200827133002.369439-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200827133002.369439-1-andrew@aj.id.au>
References: <20200827133002.369439-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It has been observed across large fleets of systems that a small subset
of those systems occasionally loose control of some number of fans
across a BMC reboot (their hwmon fan attributes are missing from sysfs).

From extensive testing and tracing it was discovered that writes
enabling a fan in FAN_CONFIG_1_2 failed to stick on the system under
test with a frequency of about 1 in 1000 re-binds of the driver.

The MAX31785 datasheet recommends in the documentation for
MFR_FAN_CONFIG that the asssociated fan(s) be disabled before updating
the register. The sequence in question implements this suggestion, and
the observed loss-of-fans symptom occurs when the write to re-enable the
fan in FAN_CONFIG_1_2 fails to stick.

The trace data suggests a one-shot retry is enough to successfully
update FAN_CONFIG_1_2. With the workaround, no loss of fans was observed
in over 20,000 consecutive rebinds of the driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index cbcd0b2301f4..88b7156d777e 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -376,6 +376,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	u32 page;
 	u32 uval;
 	int ret;
+	int i;
 
 	if (!of_device_is_compatible(child, "pmbus-fan"))
 		return 0;
@@ -552,10 +553,24 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
-						 pb_cfg);
-	if (ret < 0)
-		return ret;
+	for (i = 0; i < 2; i++) {
+		ret = max31785_i2c_smbus_write_byte_data(client,
+							 PMBUS_FAN_CONFIG_12,
+							 pb_cfg);
+		if (ret < 0)
+			continue;
+
+		ret = max31785_i2c_smbus_read_byte_data(client,
+							PMBUS_FAN_CONFIG_12);
+		if (ret < 0)
+			continue;
+
+		if (ret == pb_cfg)
+			break;
+	}
+
+	if (i == 2)
+		return -EIO;
 
 	/*
 	 * Fans are on pages 0 - 5. If the page property of a fan node is
-- 
2.25.1

