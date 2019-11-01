Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A7EBD6E
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 07:06:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474BWp571jzF6WL
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 17:05:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hHl74Sbv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ImbX2e0G"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BVv6pHQzF6W5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:05:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BABF3432;
 Fri,  1 Nov 2019 02:05:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 01 Nov 2019 02:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wi9/jdSHNH8Df
 3UKCkT4WnlkD7LiEYHHkDG1adEcUbg=; b=hHl74Sbv/f7BJV9W6I5CoLUz58/ZF
 px68KJOaCXDIrKl0nh6ZVdnHnH5xl8G5ZCE1GjmvLaaOEtSmiv//ox2Xx4ZhP3O0
 /5jdJZIHaHfjg/COB7AdNCZb3ynEHQ+UC8FMPduXA5/YTHOlS1vAe+YNezwQHP2d
 kAxeoWXj1PTTfFQGcpGiJEPxSsj55KqctoIqmab9It3OavOTheNPjMV5A5Ym8bFZ
 4rNJ7RUlJN6Ij1+H5exXn35IuOZf1eSTchBKHLwOkfjoRH/IJ8H6dj3R9xo1TmGr
 lg8uNMuOV4nkKR+7oAB7UY/8NpiKBaiukDtE2bDQPE+hjAwUl1Z+/7dYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wi9/jdSHNH8Df3UKCkT4WnlkD7LiEYHHkDG1adEcUbg=; b=ImbX2e0G
 /KvAeDJkvu7ZXhbQZMWI0Tl0iQIFeIPyRcOBC/Z+bLJhC2JFm66VymcGYaqkVva3
 +HDBKtQ4dEXeM4yB7qTrbJO2QDeoa9VOVg0egfHuZzWwYrso+fswHfQdRFgRrktA
 yiGbN4znJC9p3E1RF3jSKM9jDH9XXVhjlJT0AsCMGb15zs+uOMbCUmWTXfZwPov+
 XHPqKMBynPMSvEwj7m9f03oTXjceW8MdMGtA11wec4GJrcIligi95M6BDKJqEQbA
 3dMKyCa0BHwMZu/dKAiNkAt76pWwCW/kcLQ5ruipKSYbIdAeruV6bT7aS0qb33dr
 ja4VRbMt49wzvg==
X-ME-Sender: <xms:Fcu7XS66hJOT_st32nCfNVPM70ViwHezYz-R1RJ7sBGXvXgC_wD4qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:Fcu7XaWW82iY49zUPSsk1-xZB6gZ6bUESpOD6hqwBFaypXlv_LjtAg>
 <xmx:Fcu7XUPt4JsgTU6613DFu_jxBbs5nbXSZPXf6ZzQc0qf7IhKNTcKQg>
 <xmx:Fcu7XT_9KZ8PkrCtsFmQD7LRi3gRHcW26fcdBOoVxCHona-0pZ3d7Q>
 <xmx:Fcu7XY5Rm-Dj8rbUzLXQXQWNH6cZw4MX-t10kADv55mw5Hc-01MdHA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C5DC3060067;
 Fri,  1 Nov 2019 02:05:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 3/3] fsi: core: Fix small accesses and
 unaligned offsets via sysfs
Date: Fri,  1 Nov 2019 16:36:01 +1030
Message-Id: <20191101060601.24896-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101060601.24896-1-andrew@aj.id.au>
References: <20191101060601.24896-1-andrew@aj.id.au>
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

Subtracting the offset delta from four-byte alignment lead to wrapping
of the requested length where `count` is less than `off`. Generalise the
length handling to enable and optimise aligned access sizes for all
offset and size combinations. The new formula produces the following
results for given offset and count values:

    offset  count | length
    --------------+-------
    0       1     | 1
    0       2     | 2
    0       3     | 2
    0       4     | 4
    0       5     | 4
    1       1     | 1
    1       2     | 1
    1       3     | 1
    1       4     | 1
    1       5     | 1
    2       1     | 1
    2       2     | 2
    2       3     | 2
    2       4     | 2
    2       5     | 2
    3       1     | 1
    3       2     | 1
    3       3     | 1
    3       4     | 1
    3       5     | 1

We might need something like this for the cfam chardevs as well, for
example we don't currently implement any alignment restrictions /
handling in the hardware master driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-core.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1ea15621e588..f3cca350c28c 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -544,6 +544,31 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	return 0;
 }
 
+static unsigned long aligned_access_size(size_t offset, size_t count)
+{
+	unsigned long offset_unit, count_unit;
+
+	/* Criteria:
+	 *
+	 * 1. Access size must be less than or equal to the maximum access
+	 *    width or the highest power-of-two factor of offset
+	 * 2. Access size must be less than or equal to the amount specified by
+	 *    count
+	 *
+	 * The access width is optimal if we can calculate 1 to be strictly
+	 * equal while still satisfying 2.
+	 */
+
+	/* Find 1 by the bottom bit of offset (with a 4 byte access cap) */
+	offset_unit = BIT(__builtin_ctzl(offset | 4));
+
+	/* Find 2 by the top bit of count */
+	count_unit = BIT(8 * sizeof(unsigned long) - 1 - __builtin_clzl(count));
+
+	/* Constrain the maximum access width to the minimum of both criteria */
+	return BIT(__builtin_ctzl(offset_unit | count_unit));
+}
+
 static ssize_t fsi_slave_sysfs_raw_read(struct file *file,
 		struct kobject *kobj, struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count)
@@ -559,8 +584,7 @@ static ssize_t fsi_slave_sysfs_raw_read(struct file *file,
 		return -EINVAL;
 
 	for (total_len = 0; total_len < count; total_len += read_len) {
-		read_len = min_t(size_t, count, 4);
-		read_len -= off & 0x3;
+		read_len = aligned_access_size(off, count - total_len);
 
 		rc = fsi_slave_read(slave, off, buf + total_len, read_len);
 		if (rc)
@@ -587,8 +611,7 @@ static ssize_t fsi_slave_sysfs_raw_write(struct file *file,
 		return -EINVAL;
 
 	for (total_len = 0; total_len < count; total_len += write_len) {
-		write_len = min_t(size_t, count, 4);
-		write_len -= off & 0x3;
+		write_len = aligned_access_size(off, count - total_len);
 
 		rc = fsi_slave_write(slave, off, buf + total_len, write_len);
 		if (rc)
-- 
2.20.1

