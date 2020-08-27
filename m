Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECF25462B
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 15:43:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BckSp2RrjzDqdm
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 23:43:06 +1000 (AEST)
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
 header.s=fm3 header.b=Bt3k5Xtb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MOk+P2BH; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BckKF0gC9zDqSh
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 23:36:32 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E676F5C031A;
 Thu, 27 Aug 2020 09:30:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Aug 2020 09:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Kkcc9vN9QXP25
 +selb3Q6qwT+96BRSbB1PImG5HrLwU=; b=Bt3k5XtblL3weuNT55h+XW1wK0kkl
 khJ8VtPutL/m/b37CLq2xX5qt2rt7Cz97jgrNZdXqVikvH/H58IUWylue0pbMtH8
 BgdLKrOL0fsiO+MzaIzkzCtrNoumJaYPUBB2EKxhh5RTBP/iOr2tNO4lqCeXeHHY
 KFrW2JCfbiEejLnDq/a/7e5dg50FS5krd3geGPZTKP83BXD/hDNNywvHwnFpNqIk
 djNd8pXOWF2j8YeJIE+1ASa4oVlNGOc/GmaKaiEgY194kpfnVzfR/8kFFvPTMrK/
 uikwIyGEtk17i7ho2wRL4/F1cb2Zi8Dw9kFmmEAVkMYZtMDhpjsg2yDsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Kkcc9vN9QXP25+selb3Q6qwT+96BRSbB1PImG5HrLwU=; b=MOk+P2BH
 PuHwxkpvWBYx7jrUr0j4CPK3kDKXnI383+QOH08jZ7Pyf9s8DqEeglzWb7iuoWaY
 IPHeUlolREc9LqYZfh5HKiG1UCBQ1fbFrqNOvcuOwSd3PbP8/VnxxY5GHVx2lmBH
 gAKB8oGwuBJ2dk5NJmrKLX5mj9br73T6MU5gycQCqT1IIm9eetZW4NN8FbXY9UuX
 lEj33//xBhZay/QflTquF+09ivYq9NESMflmrbyjx3//dENPfZey7mYWl/YkhVLx
 TgxZnmdYSY+dkGxnMF2TAodxm47Rxsepoiu7Lt/yx72OXEdJSAwSLYJ6A+/5t3Oa
 fqP/OG2TI1Ewwg==
X-ME-Sender: <xms:hrVHX1A3P5Aps0rWjM0vQwUbG4hH9_LUCXbWUw2KaZaWruhNWW3jJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrudduiedruddtnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:hrVHXziJUtx8yIC9tFFmzl3hzIB3HppnHGSER15a-vzIjD373OqvAA>
 <xmx:hrVHXwkVbf2sL_IIRmqwJ6da5EtHuS1NJ3Yw5DUCSEhMvq7TTBeAAQ>
 <xmx:hrVHX_x2h1-biaMUMXvWJgf71Z3XZQNh_Ks6xWZVCz4HpURIwS8_yA>
 <xmx:hrVHXxc8YRYDDuHbt9lidu-C9h4QbclDBqYhqdniGs377ueyL59aUg>
Received: from localhost.localdomain
 (ppp14-2-116-10.adl-apt-pir-bras32.tpg.internode.on.net [14.2.116.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5B243280059;
 Thu, 27 Aug 2020 09:30:45 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 3/3] pmbus: (core) Add a one-shot retry in
 pmbus_set_page()
Date: Thu, 27 Aug 2020 23:00:02 +0930
Message-Id: <20200827133002.369439-4-andrew@aj.id.au>
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

From extensive testing and tracing it was discovered that the MAX31785
occasionally fails to switch pages despite ACK'ing the PAGE PMBus data
write. I suspect this behaviour had been seen on other devices as well,
as pmbus_set_page() already read-back the freshly set value and errored
out if it wasn't what we requested.

In the case of the MAX31785 it was shown that a one-shot retry was
enough to get the PAGE write to stick if the inital command failed. To
improve robustness, only error out if the one-shot retry also fails to
stick.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 33 ++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 702c25010369..7d0aac59af31 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -158,25 +158,34 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		int i;
+
 		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
 			data->currpage);
 
-		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		if (rv < 0) {
+		for (i = 0; i < 2; i++) {
 			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
 						       page);
-			dev_dbg(&client->dev,
-				"Failed to set page %u, performed one-shot retry %s: %d\n",
-				page, rv ? "and failed" : "with success", rv);
+
+			if (rv)
+				continue;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 			if (rv < 0)
-				return rv;
+				continue;
+
+			/* Success, exit loop */
+			if (rv == page)
+				break;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_STATUS_CML);
+			if (rv < 0)
+				continue;
+
+			if (rv & PB_CML_FAULT_INVALID_DATA)
+				return -EIO;
 		}
-
-		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		if (rv < 0)
-			return rv;
-
-		if (rv != page)
+		if (i == 2)
 			return -EIO;
 	}
 	data->currpage = page;
-- 
2.25.1

