Return-Path: <openbmc+bounces-304-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F36AF06F0
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 01:26:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWzg36KcBz30Pg;
	Wed,  2 Jul 2025 09:26:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751369560;
	cv=none; b=UTGs9CX/1vX1OE1blNsHxlbJEI7j8ky+7MYX1lLfcBSSOukeaGs1/p3O0giVOJBldqNmJPdcKo414NHaqzytzISukCG06Rz1jiHuqlj20aeu7bwWsJkIyHVmSyYBfB7Ncr5hKC4eE0IK1+VzvvadyyN3J7S1aTJf2lrLjqmibdaRv9VcJ38E4SqXKjD6J0hH5TsfdA9QYl9sa6DA82ABhPnI7rDFulw8sfHY+a136nOJGop7n4XFaR2CeYRq+CfwIEC9PxdxLeWW1Vu5/0iedE73YzEucwXJO5C78Ye/CipNf2h4pahZ6Ml5VTkbnVe4xRXDiFgA0PsVrd7Fl0zS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751369560; c=relaxed/relaxed;
	bh=FYUiAY/zB/lWD1QpwVDh6Icb7j9XmLcoZMP/NhJ1Gss=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PUKTNP8Dj6PAOJS4K7sPCgQ2wdb3NsV8WZPqNpUYAMlD4RWdYPRvyUZgPWX9r6iGpf21PUNdg7xooj8AQdP3TEUHepmom9Z1FkFluRyt6+Twnp5w1OZGLffNKHqZ5svVhzszyV8Ll0dbQh9mRqM6H4lm0M00nQPMT2hM4fZHIOeQCugK1B6l32vkLnlMDu6T1ydnJ1U5fVLc1oKYV64Ia1Aehio9KLk50rZJWyaS2YOMSCCAtkOqoG+S3amIZ4R0reA5DFecTv9HCCNy5KmHEhbarGZ0DCErksxjlpwubU0aoMIlYke6pMgd+NmNwC0itU3fecz06hYiPtGxCYTXPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcICdvbH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcICdvbH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWgqp5fQQz2xHT
	for <openbmc@lists.ozlabs.org>; Tue,  1 Jul 2025 21:32:38 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7426c44e014so5639744b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 01 Jul 2025 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751369556; x=1751974356; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYUiAY/zB/lWD1QpwVDh6Icb7j9XmLcoZMP/NhJ1Gss=;
        b=jcICdvbHjgroM7NtymzCeJpURgYWh2z4F/XehXB2hw7ZxWGRThLiv+8SvdFyYIRZjO
         exRnzuXDNVPCliE0V75lYGSPROTksNjuaciUz7zh3J5bqpd1XA6MX4XH6Qoi/BJVN4g7
         WTTRlAQkNfy2+OOYECmduPKQDP6skULT86uP93hsSNVtTqV5dRtjvwNePPa6OmURo/kV
         qPUB9DF2QEBB+8EL18CrjdyOeyRXbY24U/QwZNksxJz/iLKlqZGLvrml6ts/BbljTC/o
         3YxULQFA5P15OmlEAN7jWiEdoRk3gXb/WT1qwzFJ3Rg90zsrdVKM9tv97IcIWg8yXMvW
         FOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369556; x=1751974356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYUiAY/zB/lWD1QpwVDh6Icb7j9XmLcoZMP/NhJ1Gss=;
        b=BrQWjhO8aC1aYT/BVSoUh51VZ4Z2Kx/B5mdHpObAwsrlQJCIbkWTFD13q3684Xty1z
         jdg8jmsq0Fs69bX01ccaGVz8BwwY2jVoa2FWdzdy1zMIkAsDMGUDWeg/p0Q7hzC1q071
         hy77aQEu1Ic07Iomtb1lZyILYkvDOr4oSLAbJWRDFfFSKATuac+4xxVKZxcO07nWS07a
         okmfafdZv2EpmWwGZcsZRbw56CgcRX6XIq7eTXFSUYh1snY+msCMoA5Ony/8oWLPRLnI
         H3hakkjWUh1gOc2W4Y4Nv0c4DNY6dkABi5mtNtEpqmbMWQV7bex1GmrKqdTEu1/YbzKY
         Gl+A==
X-Forwarded-Encrypted: i=1; AJvYcCXqg50dEgjJHntCspzD3TtsCXgCf3gqL6msrxlqPbxJSDMQWIIm7qzeMlJxrFhmHs537VWK3LHX@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyg4+IfbE7ovxx1r6d3dYuqeTIWFrKDPq3zQAzuCBTos2Mvo7s1
	7ye0YA+AxJIf+/yKV/vrmzGZpQV1Q2ZAC0HKzfNJRYZovn6cjof5ecj/ReAQEWkmPsw=
X-Gm-Gg: ASbGncuRm8/rn0OVoMTm2IoFSo5wpafAR4p12l5xYrJzYNoIwabXyyamtCTmyceXjP5
	wT9nuBhnjFisCFs/ofFCytCEC/+i8IRKb/Em7HyH8mVyXsCCDRg7aKyQLqb10IbZA2mmvbHI/FR
	1c9VftfmTW/f44h31P3vH0ggq8//XFvjxtudL+0lJDKPOe/aODBpouqJ+NNXFh7RQzV83qkRHbE
	0caqji0bXibCTZVf56JggzfR/IVfQhr5+wf9iHLv+JdMi73vzY0++4P16G3OvRGw0YR1qrF7AR2
	uvZ3EnbDmW3dnbBsBIXuGY3YjTS5Bb0hAvD/zVvAF5DcEuj+0PAfA2uMxm2dEdGe+X+5lt0yPf2
	v/DxRjexRmQ0PA2eV/3WlnerGYBtRkTTzThndF6dUmh1zg5dZhzh1/vcvdq2ivnpJjeDukHEvXN
	jBt48pA+lBB/l3bw==
X-Google-Smtp-Source: AGHT+IFlTdEvCYvznnDhT3Zm3RuVriQIDyvit2L6TJm98L4IUPFDj4ACIoeeiOOzhwt2rRxBOzcTzQ==
X-Received: by 2002:a05:6a21:101a:b0:218:bcd3:6d2e with SMTP id adf61e73a8af0-220a16eae19mr31122193637.36.1751369556127;
        Tue, 01 Jul 2025 04:32:36 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-52d0-167f-4c41-9344.emome-ip6.hinet.net. [2001:b400:e389:b6b2:52d0:167f:4c41:9344])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56c0c8bsm11617099b3a.113.2025.07.01.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:32:35 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6] i3c: master: handle IBIs in order they came
Date: Tue,  1 Jul 2025 19:32:32 +0800
Message-ID: <20250701113232.1462888-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>

IBI shall be handled in order they appear on the bus. Otherwise could hit
case when order of handling them in device driver will be different. It may
lead to invalid assembling fragmented packets or events order broken.

Added separate workqueue with option WQ_MEM_RECLAIM for each device driver.
This ensures IBI handling order and improves IBI handling performance: IBI
handlers for device B are not blocked by IBI handlers for device A.

Original solution (single workqueue in main driver) was able to handle also
general IBI (not related to specific device) like HJ or MR. So leaving this
for such purposes.

Signed-off-by: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Link: https://lore.kernel.org/r/20231015222334.1652401-2-zbigniew.lukwinski@linux.intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9fd00df05e81a2e1080ce6e9abc35533dca99d74)
---
 drivers/i3c/master.c       | 14 +++++++++++++-
 include/linux/i3c/master.h |  4 +++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 16b87c666125..cbe8fbe0fc0b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2547,7 +2547,7 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 		return;
 
 	atomic_inc(&dev->ibi->pending_ibis);
-	queue_work(dev->common.master->wq, &slot->work);
+	queue_work(dev->ibi->wq, &slot->work);
 }
 EXPORT_SYMBOL_GPL(i3c_master_queue_ibi);
 
@@ -2992,6 +2992,12 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 	if (!ibi)
 		return -ENOMEM;
 
+	ibi->wq = alloc_ordered_workqueue(dev_name(i3cdev_to_dev(dev->dev)), WQ_MEM_RECLAIM);
+	if (!ibi->wq) {
+		kfree(ibi);
+		return -ENOMEM;
+	}
+
 	atomic_set(&ibi->pending_ibis, 0);
 	init_completion(&ibi->all_ibis_handled);
 	ibi->handler = req->handler;
@@ -3019,6 +3025,12 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 		WARN_ON(i3c_dev_disable_ibi_locked(dev));
 
 	master->ops->free_ibi(dev);
+
+	if (dev->ibi->wq) {
+		destroy_workqueue(dev->ibi->wq);
+		dev->ibi->wq = NULL;
+	}
+
 	kfree(dev->ibi);
 	dev->ibi = NULL;
 }
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index b82bebec2db7..81d681c3007a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -135,6 +135,7 @@ struct i3c_ibi_slot {
  *		     rejected by the master
  * @num_slots: number of IBI slots reserved for this device
  * @enabled: reflect the IBI status
+ * @wq: workqueue used to execute IBI handlers.
  * @handler: IBI handler specified at i3c_device_request_ibi() call time. This
  *	     handler will be called from the controller workqueue, and as such
  *	     is allowed to sleep (though it is recommended to process the IBI
@@ -157,6 +158,7 @@ struct i3c_device_ibi_info {
 	unsigned int max_payload_len;
 	unsigned int num_slots;
 	unsigned int enabled;
+	struct workqueue_struct *wq;
 	void (*handler)(struct i3c_device *dev,
 			const struct i3c_ibi_payload *payload);
 };
@@ -501,7 +503,7 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
- * @wq: workqueue used to execute IBI handlers. Can also be used by master
+ * @wq: workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
-- 
2.49.0


