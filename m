Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69116EAA1E
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:15:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473YSH3j5HzF5WB
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:15:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="axCbhokK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uIL89lV4"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YQ66PXXzF5W3
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:13:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 56C24223DD;
 Thu, 31 Oct 2019 01:13:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 01:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/fZ744fUw0giI
 Dl/tK+mKy+7tzhrk+nyrO9m1DIKxJo=; b=axCbhokKArAKvhi11AVFHvqhgoDTB
 NLJxhGmqBYKy+M9/Q8ZxACVobOxZJEzx2Y6oOQ6vmqYWsZ78PHH9Fq5zQAt3IcqQ
 6ia1fydrnHyMgidpLCg8uBFbXLYPPCI6YReIZKYssGAy5uGcxUApPiKAQ515PK1C
 fRmsoCA4VAHT7qsI+pdv/1rtNrZWdh8mgqv6nYS3XvskxT7BR+1Ds2cwKMwbFz2R
 cCoDF5dHGdh7f32TgN4CLj5R0VVaibdn8rCwy4KFZTouPdwbTwyqx1EPJwUXxHYn
 TApIYwDaXRbUM4ZfTSphygIpfRLimBVkpOFIQSHjF16n0Q+307R4nT0Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/fZ744fUw0giIDl/tK+mKy+7tzhrk+nyrO9m1DIKxJo=; b=uIL89lV4
 r9eye3vRbq98kISCISJI6sms/cIXXRrpj1XTPYMBJKuPONqOxvtpSQBMsUGQfcNE
 3caZxdvzuAZ7NSR1KmuSqaw8WWGQhurBwgV68jg7YJ3MPBwy1aBsMk7KRfeE4sbL
 dy+MPH1DQHuO6jwOPAEOCcZnR1cUwSyRp4uBWyB8r+Gmut5gOz0fDYZivIEaVk9H
 jWleLgSOVJkOqs2ILH+wM6JVOsfqjeKMdVeWFR6B8+iqS1KlwX//kZ+co27tqeek
 GwkZlLGsdQAyc5Hr6DwSRRz2/GCJjH04yuAA7PF7DoTFEco+06vSkNUaX1l/+0E0
 1BSy2F/GmAPG0w==
X-ME-Sender: <xms:jG26XRIP4TT9OwbY8tMmxIPGYBoPr8cxxg68S1A8oJuOh6bazMGdRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtvd
 drkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:jG26XZDWsoBSQ2J5oYxwHQHzJArs-zHzqk2wcDcS_JQYPTKQPEMu4g>
 <xmx:jG26XSjMhpf90EgRYJGFV37ln7dybUG22AY5GDU9PSlU3CYhAUEKCQ>
 <xmx:jG26XbMveVMFKqP3_pd-CKB_V8S4rZ-moPyIeg1hOUB9SDy80FmoGg>
 <xmx:jG26XdVMua6D_FtoXEAWW4U9gOvYsrAX0dleNuYSRYP_QU0bv4qIDA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7955306005C;
 Thu, 31 Oct 2019 01:13:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 2/2] fsi: core: Fix small accesses and unaligned
 offsets via sysfs
Date: Thu, 31 Oct 2019 15:44:38 +1030
Message-Id: <20191031051438.28589-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031051438.28589-1-andrew@aj.id.au>
References: <20191031051438.28589-1-andrew@aj.id.au>
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
length handling to enable all valid offset and size combinations.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1ea15621e588..889349beb284 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -559,8 +559,8 @@ static ssize_t fsi_slave_sysfs_raw_read(struct file *file,
 		return -EINVAL;
 
 	for (total_len = 0; total_len < count; total_len += read_len) {
-		read_len = min_t(size_t, count, 4);
-		read_len -= off & 0x3;
+		read_len = ((count | off) & 1) ?
+				1 : min_t(size_t, count, 4 - (off & 3));
 
 		rc = fsi_slave_read(slave, off, buf + total_len, read_len);
 		if (rc)
@@ -587,8 +587,8 @@ static ssize_t fsi_slave_sysfs_raw_write(struct file *file,
 		return -EINVAL;
 
 	for (total_len = 0; total_len < count; total_len += write_len) {
-		write_len = min_t(size_t, count, 4);
-		write_len -= off & 0x3;
+		write_len = ((count | off) & 1) ?
+				1 : min_t(size_t, count, 4 - (off & 3));
 
 		rc = fsi_slave_write(slave, off, buf + total_len, write_len);
 		if (rc)
-- 
2.20.1

