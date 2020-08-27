Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD91D254636
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 15:45:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BckW439MkzDqLw
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 23:45:04 +1000 (AEST)
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
 header.s=fm3 header.b=Cf4BwQ2T; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VM8C4fHm; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BckKF0QgCzDqM3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 23:36:32 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B63A5C0316;
 Thu, 27 Aug 2020 09:30:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Aug 2020 09:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=sw3c6eWGVj7V0
 vWAk3un+/GnrJLprKEwMeWYTD+JiqY=; b=Cf4BwQ2Tp3mX+0YPVVMk98aItHsNu
 5zBfgi0m+c+aKXf5W1cckDHUpyqmQzn0JHQk9RxJKLKmgKPHOMsfndWsM73OSma8
 Jj5cjDxBvwJwUz1d2YHa7iWQkirLC/pY2X6tq7u3YicPCPiqlyEv1mSao+G8F0Jx
 WXtXoDp1nERFgCPWR1dV6DNr11ZDksBMx45Q9hrK5omlrho89hjtunS8TnOdvADb
 auvZtmJYCYwz5M4OirYmEcVg8HJbyc9Z7S7xqTypcA8DinqSA+UoEynpPOWo7XHP
 78z9jhh02xHbF+ARNwg7WW4VDkoXZLCl4DJVXAmwmkJ2Ligz1ZSmuW30A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sw3c6eWGVj7V0vWAk3un+/GnrJLprKEwMeWYTD+JiqY=; b=VM8C4fHm
 ZtAN3dOjSnAjN2Z8dcE/KMWOBA2XnvxXA8RihDZ14lTuCDIF/28PCVQJ0bp0oYGK
 PvB1tdZuXZA7H5ZOm/RZwbyC2IB1wQhhksSt8kze2ukYXs5Jc2KiZ08G1oR1iDyz
 O56Zt5W/Khbzel8RwzibmyAXCt3OWNAxfXNf7ADxRh+S6yjMnDxuQJTR6TfVFKIo
 Cgl2PlPM9sjnhsSCU2xHmJ00g98l+8PyErHVlEqUlr/OjsaDjDwzq+WgHvoeh4/w
 kRsaXW3b2g/6pjoSjPgeBcTMOmXgjMf/fG20+TKYJQ1IiDwQs5VLdsLGHj20798D
 tqp4g1P81iGX2w==
X-ME-Sender: <xms:hbVHX5Zv9n0jJssMOL4A9sLjkbzxjxcmjhUQ2dxx_Rn25381lQIpsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrudduiedruddtnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:hbVHXwZjbEQz7EDbQI8XjyPi80nDOkiRZ0rrDgznBAAE8pXlV2k4AQ>
 <xmx:hbVHX7_lBfhc4wZxyh1veBUdrCVjX55O8BScg1dOtyhRZC5SSZOfvg>
 <xmx:hbVHX3rY45nTSIowMuDvVXEixRUk3CTVvUt2KysTKOHsoe-PWoLUMA>
 <xmx:hbVHXx33ECM9uzIy09k_ipH5dclIYZHplbUuKXScixasi7fVKuj-zg>
Received: from localhost.localdomain
 (ppp14-2-116-10.adl-apt-pir-bras32.tpg.internode.on.net [14.2.116.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CAFC3280059;
 Thu, 27 Aug 2020 09:30:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 2/3] pmbus: (max31785) Add a local
 pmbus_set_page() implementation
Date: Thu, 27 Aug 2020 23:00:01 +0930
Message-Id: <20200827133002.369439-3-andrew@aj.id.au>
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

Extensive testing and tracing has shown that the MAX31785 is unreliable
in the face of PAGE write commands, ACK'ing the PAGE request but
reporting a value of 0 on some subsequent PAGE reads. The trace data
suggests that a one-shot retry of the PAGE write is enough to get the
requested value to stick.

As we configure the device before registering with the PMBus core,
centralise PAGE handling inside the driver and implement the one-shot
retry semantics there.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 88b7156d777e..a392c0efe0a6 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -361,6 +361,27 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 	return -ENXIO;
 }
 
+static int max31785_pmbus_set_page(struct i2c_client *client, int page)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		if (ret < 0)
+			return ret;
+
+		ret = max31785_i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		if (ret < 0)
+			return ret;
+
+		if (ret == page)
+			return 0;
+	}
+
+	return -EIO;
+}
+
 /*
  * Returns negative error codes if an unrecoverable problem is detected, 0 if a
  * recoverable problem is detected, or a positive value on success.
@@ -392,7 +413,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_pmbus_set_page(client, page);
 	if (ret < 0)
 		return ret;
 
@@ -613,7 +634,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_pmbus_set_page(client, page);
 	if (ret < 0)
 		return ret;
 
@@ -714,7 +735,7 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
 	int i;
 
 	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
-		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_pmbus_set_page(client, i);
 		if (ret < 0)
 			return ret;
 
@@ -756,7 +777,7 @@ static int max31785_probe(struct i2c_client *client,
 
 	*info = max31785_info;
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_pmbus_set_page(client, 255);
 	if (ret < 0)
 		return ret;
 
@@ -798,8 +819,7 @@ static int max31785_probe(struct i2c_client *client,
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
-							 i);
+		ret = max31785_pmbus_set_page(client, i);
 		if (ret < 0)
 			return ret;
 
-- 
2.25.1

