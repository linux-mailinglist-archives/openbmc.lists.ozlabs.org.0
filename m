Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C74189655FA
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4041yt9z3c5m
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989757;
	cv=none; b=nPlruWPp5d8OT0fu/k29nN0jj+xh2W4E+qZbute1AIJJDtCbVe50qfmn2DZnHHXk3xsF78XJ3sjPaWvptD3Fgy4PyRcw+8+KQ0lzi4/bwIc+jpdy/piz7F6nGzG+wLwcqwOAUH4aBnd79e3ROYGriyK1oS+pJ98TKBFtKj/DfDP/7VZT/UYxpiGsJ1rwuzdctIew6Orb8F4VW6XQm716euuhG45RbVKPL6JaGWqmcwVWRtQFUO8OiMDI8uxNyiIDfyyHzQs7CSWR70ItKsESmKXqUBIowxXkpJhjo6uhTY1O6USdvyYVyJ21sS8eCJRmLj/OMqn3CjSw3DywKohDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989757; c=relaxed/relaxed;
	bh=R1w8U38LxbqsHMWFXxaIYW4AXwoQS5Rj9y5ARnmh8Yw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=A3OYueR20m1JRC4ceH7dt9Dvr23BHIA3ZbXAq4qu1JS2fTgNIvID5AnK1u0Oa4flTu9MN2q8KzZqkvbFcv/zw7VdMEaMnqBnluK67WjIP8T272EnCCgwdnF4FU21Fr4BBYELfFqiuv4NN3T8FisabkpansVM5sr0NKZTYkFjgDCgz+0VADS6I6EevCH6jTurET0Di0+M7giFb07FX1L5y1q+Z4+20UPp4/C/tSyhM0k6Zwj8DJJtaNPsmgSf2rszYB+dzhOoS4dPrZgUwdEpEGgdHvWfXHXiCeKVtL8LfOYa3FaKF/Ak0JOE3XeX6oVwYBgjoMaDXGByDZJ7ZAfdpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0QCjWOE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0QCjWOE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zx2MB3z304l
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:16 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20230059241so12529415ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989754; x=1725594554; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1w8U38LxbqsHMWFXxaIYW4AXwoQS5Rj9y5ARnmh8Yw=;
        b=Q0QCjWOEI4P8WHmlQuXzCyRZILd7TPkkCMn9iOTQB/mR5DORaXrFE4NmSRD115HQBg
         EpZQ98bPRBFY7w7OdabHf5KUWwaYhPWf/IWfPNQ3BTXxn59jTvMmGbw6YvCrsaJ4JUCd
         F6GupWhNW9JnIdUvTZgfj4XV87rkNOuiGUj8xjIBzknQqFtVXDYfIx1jZBgPXxMPwbGW
         B3ZIq+dfni7iUUhCLhnciTPZ8B/t5B9lad/PIoqH724VrLsv6M0QwSNU3KvRt6KCmMHv
         XjWgcJHUstyWJEgENc3bFOmRvun75WpF93jMhCSwPEbf1wU/leFHkM23Vh8oz80kSd4a
         n8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989754; x=1725594554;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1w8U38LxbqsHMWFXxaIYW4AXwoQS5Rj9y5ARnmh8Yw=;
        b=gxQ24yn+m4+CHM9mLdMqYjf+Q2T/F7W6WPjEDn+DSqtfkEpeMIvz/Iw5uij+PL3gQi
         3KFqW6obJKhuA+a1VAZnnHNEy5XOTFsGKTZo8+xelg4V00dFN5Y829W1eCBUW6XB9Dgy
         wC8lSlSlr1yrXYyHlgbVbJUGZuM6E+sd1tbS6+Omf4DwTwOmDWEyVB97QtRToqEiRZWj
         tZIy78S1eO+xoZsO+HbnbPM/WXjXNfTgc/P654OsciLE6fwvrEry5Pk6WO9w0Z8020v0
         N9xWbJpw0c3hg7zc+Ce+TfuKi5VNHw10TE8/j1mjcJOtYK8CW89VV1AzjbH+a0Wurivl
         jpkw==
X-Gm-Message-State: AOJu0YzDXtTu75rJw+5HXoogXy6KzjH4dnuTYoc9tvu+CktF8hopxqmr
	KLgDx/S0hduDgtv9KOpO95T7J6hGzhu2gSZw4W37oqV07t8t1CM=
X-Google-Smtp-Source: AGHT+IGrJD1LOrRYZRsGSK8KrWyqBhIIUuxqyDXZM8UZXfrS+XZ4T7TqZJ1nRpyYmsA8M78lXul8eg==
X-Received: by 2002:a17:903:234c:b0:1fb:8419:8384 with SMTP id d9443c01a7336-2050c37255emr62935835ad.13.1724989754013;
        Thu, 29 Aug 2024 20:49:14 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155452ecsm18259455ad.219.2024.08.29.20.49.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:13 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v2 7/7] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 30 Aug 2024 11:46:40 +0800
Message-Id: <20240830034640.7049-8-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index cac4ea0b69b8..5bdc1b5895ac 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

