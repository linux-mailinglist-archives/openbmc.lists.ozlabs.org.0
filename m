Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D5262F25
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 15:26:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmjTF0rzpzDqVJ
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 23:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GU3C3zDL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=f0GY7bBd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjRh6hP3zDq7h
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 23:24:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CE43A5C0081;
 Wed,  9 Sep 2020 09:24:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 09:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=pA47cFB778b3Ymf9wpPAhJB/Ec
 9gzjiU19iV59xcPGY=; b=GU3C3zDL2FhbrBfCnirbeEe6HZGumvsfxJVMXzZ7m6
 qr8I88o30ZtttVwIqAC96+83zdxvC2AlqxV8nB4kmIxP0wwNLUD4aoSbRm9XKFPt
 dJLuxxejjiSU9SexZLHTOS/1wwl1vPcRqwi0mQb0KYKB1jUNVcSInR9RdB3RaVDR
 302u8VhhUTjosqknFsiLAYg0G4W26+8ss023eiYlUjBnAfsMUpDXkUdCi2LRADr/
 7piWAZBxaWayhLfJ8xghJgA1rqAmM+DJPrhK5nTgfTsEton2Hy1D+DFcA8OWDJ0r
 1Bfqp9NPLc/ndIQOkDNNmIcimC83OrsD88TSqotZZrPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pA47cFB778b3Ymf9w
 pPAhJB/Ec9gzjiU19iV59xcPGY=; b=f0GY7bBdhSZu4PeW7rz+WXiu+zhbgJPV4
 YLQniA8PR5jgiJK0SLcLScg/sdwcRqJ5EjYpfdnsfMynLwnYqTqfI2fy+xWghZ0a
 WiShOK0j7YiveO5r4Ccun45Wm/7RzXNnTCIVUZB3F/bI+0oql2b1ZZf9jsIFaaxK
 UZOjDp8iLK3KICus9BQGdSfOjHDcL9dh+1ltmf4h+E1gLiNPMsl3T1eXAARLbfaP
 qrGqx1wU58FyEHnLPNr95arySFK5FHJTUE70viwbuScAKnyt2iEXkEkPgePtZhgo
 8CHikhwR7IXLkN2A3M96IQ6fD/AMG1ZEVwKBp1NbsDUYOdyE49QxQ==
X-ME-Sender: <xms:m9dYX9hk_WNINY2WyXtQ8wfJWY9HK1YyjU6tGEzM7nIj7zSTesQmXA>
 <xme:m9dYXyAclMrofz_6uhIO461AIaJE0_tOqTmjTyYe7gupCMRtWYtMNSOkhVF1prpEG
 JCiByEmduBtABA0vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddruddtledrkeehnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:m9dYX9ERNffaFbfVAkdhnsIhZJ0Je0RT9LH8Xe8sxpj2tYQtu8sPqg>
 <xmx:m9dYXyTIKd9n4zGMEjygZdOlPDcM83flWIUVL95PFyHmraK5Fn-TZA>
 <xmx:m9dYX6xTDoTvfWI-njfTZtDUCF1jynByrx4XSXLnpMvkI3vKEF1YSg>
 <xmx:nNdYX1-qd5R86oz-ZQLkWg7urlriuTVs3SuJHN3y1g6Efq8twZTjvw>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 099193066355;
 Wed,  9 Sep 2020 09:24:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Expose PEC debugfs attribute
Date: Wed,  9 Sep 2020 22:54:11 +0930
Message-Id: <20200909132411.2906159-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: openbmc@lists.ozlabs.org, jdelvare@suse.com, linux-kernel@vger.kernel.org,
 linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable runtime debug control of whether the PEC byte is exchanged with
the PMBus device.

Some manufacturers have asked for the PEC to be disabled as part of
debugging driver communication issues with devices.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 44535add3a4a..51c8502b35e9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2346,6 +2346,42 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
+static int pmbus_debugfs_get_pec(void *data, u64 *val)
+{
+	struct i2c_client *client = data;
+
+	*val = !!(client->flags & I2C_CLIENT_PEC);
+
+	return 0;
+}
+
+static int pmbus_debugfs_set_pec(void *data, u64 val)
+{
+	int rc;
+	struct i2c_client *client = data;
+
+	if (!val) {
+		client->flags &= ~I2C_CLIENT_PEC;
+		return 0;
+	}
+
+	if (val != 1)
+		return -EINVAL;
+
+	rc = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
+	if (rc < 0)
+		return rc;
+
+	if (!(rc & PB_CAPABILITY_ERROR_CHECK))
+		return -ENOTSUPP;
+
+	client->flags |= I2C_CLIENT_PEC;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_pec, pmbus_debugfs_get_pec,
+			 pmbus_debugfs_set_pec, "0x%1llu\n");
+
 static int pmbus_init_debugfs(struct i2c_client *client,
 			      struct pmbus_data *data)
 {
@@ -2374,6 +2410,9 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	if (!entries)
 		return -ENOMEM;
 
+	debugfs_create_file("pec", 0664, data->debugfs, client,
+			    &pmbus_debugfs_ops_pec);
+
 	for (i = 0; i < data->info->pages; ++i) {
 		/* Check accessibility of status register if it's not page 0 */
 		if (!i || pmbus_check_status_register(client, i)) {
-- 
2.25.1

