Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E941D642A
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 15:35:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKMG0gDZzDqsR
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 00:35:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TBnHiC8x"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sK3860qfzDqng
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 00:21:56 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q12so10404475pff.9
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkLCYK9MvJ0x9hUjYwIPxoaan7U5XUsj8RQT7Ftt9vo=;
 b=TBnHiC8x595Eggzq+fDw9kfmxgzVoyssqXzwcfTX1TTFTG+w3sZ5KH6AWLmka9beP1
 hAjuJxgfLj9XxrdEkrUMUry14zpd4EZkkoQU/sCugyvYSOXzXbkE/Y1reVtvKS7bFmev
 uXlRLpWyasak49UsccVBFYYi6ZEotTjB/3eYKTf4XmpXkjmQyHfK5Z0Fh8RbNjvudbrd
 YEzZlmSDkj4hn9lZ7RE457IoaiTKYX3eIJvS+BJH1M/p4Ow8mSwgwUCCSuophBAboLnt
 5I3HKCTN7GqRg9mHVftruld19xfQHUgBe3mDTi/u6NqvIpOtSG1gZ9qmcUP5I2aIVxsp
 cqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AkLCYK9MvJ0x9hUjYwIPxoaan7U5XUsj8RQT7Ftt9vo=;
 b=GfALOcBEOEjQZCrVvVbCUK/Ln/np8g1f8BD5X+mpatNcdB/6kxj2z3pgONnhI4pb2E
 Yfv3LElv56JalHSSVKTohgQNTs0iyebPC1fok7anQU1d9HnikAFAIQgzP4sWPZQJN+bQ
 T59JRckHGz43PaygVfOaA2/M7wSVipxvDJ0oT5YZJKUtt+KeXJ9DwJj0HWGdzGzLjh+I
 mZJkVoCACALkecfSMWpbEmqc5gMzxACJ6OMQx8vq1HCLWI2FElVoGQfHzo3H3x/00EDy
 M8eBCdU6D+/ngzgPu5lHAlD0HV0s4aUSPZgClD+pMMMlpbzmSskifnW6Py2xnXtOKnq6
 nyJA==
X-Gm-Message-State: APjAAAVF/dBGEKBbJVdr26zdppxN3Jryua8UkN5Ncbj/P2vsjJ+RgcGg
 p+WEWS5Bo+XbMZGn4b4A3E4DBxHnNZI=
X-Google-Smtp-Source: APXvYqz9i2stWH7QKTGqWemFF0/kg2PxmoYRZ0JIae8gyT4G3v59P8/RJGRlGMEhafh3Lk0mC0Eh6g==
X-Received: by 2002:a63:2348:: with SMTP id u8mr33311729pgm.422.1571059313609; 
 Mon, 14 Oct 2019 06:21:53 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id i187sm9322548pfc.177.2019.10.14.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:21:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] fsi: aspeed: Remove base from trace
Date: Mon, 14 Oct 2019 23:51:39 +1030
Message-Id: <20191014132140.7618-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014132140.7618-1-joel@jms.id.au>
References: <20191014132140.7618-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The base was showing the virtual address of the FSI master, which was
not useful for most users of the tracepoint.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c          |  5 ++---
 include/trace/events/fsi_master_aspeed.h | 20 ++++++++------------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 2048e38e7200..d796c4012875 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -194,8 +194,7 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 
 	status = readl(base + OPB0_STATUS);
 
-	trace_fsi_master_aspeed_opb_write(base, addr, val, size,
-			status, reg);
+	trace_fsi_master_aspeed_opb_write(addr, val, size, status, reg);
 
 	/* Return error when poll timed out */
 	if (ret)
@@ -231,7 +230,7 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 
 	result = readl(base + OPB0_FSI_DATA_R);
 
-	trace_fsi_master_aspeed_opb_read(base, addr, size, result,
+	trace_fsi_master_aspeed_opb_read(addr, size, result,
 			readl(base + OPB0_STATUS),
 			reg);
 
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 06ff6a14bf11..63b9ce7f0de6 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -9,10 +9,9 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(fsi_master_aspeed_opb_read,
-	TP_PROTO(void __iomem *base, uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
-	TP_ARGS(base, addr, size, result, status, irq_status),
+	TP_PROTO(uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
+	TP_ARGS(addr, size, result, status, irq_status),
 	TP_STRUCT__entry(
-		__field(void *,    base)
 		__field(uint32_t,  addr)
 		__field(size_t,    size)
 		__field(uint32_t,  result)
@@ -20,24 +19,22 @@ TRACE_EVENT(fsi_master_aspeed_opb_read,
 		__field(uint32_t,  irq_status)
 		),
 	TP_fast_assign(
-		__entry->base = base;
 		__entry->addr = addr;
 		__entry->size = size;
 		__entry->result = result;
 		__entry->status = status;
 		__entry->irq_status = irq_status;
 		),
-	TP_printk("fsi: opb read: base %p addr %08x size %zu: result %08x status: %08x irq_status: %08x",
-		__entry->base, __entry->addr, __entry->size, __entry->result,
+	TP_printk("fsi: opb read: addr %08x size %zu: result %08x status: %08x irq_status: %08x",
+		__entry->addr, __entry->size, __entry->result,
 		__entry->status, __entry->irq_status
 	   )
 );
 
 TRACE_EVENT(fsi_master_aspeed_opb_write,
-	TP_PROTO(void __iomem *base, uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
-	TP_ARGS(base, addr, val, size, status, irq_status),
+	TP_PROTO(uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
+	TP_ARGS(addr, val, size, status, irq_status),
 	TP_STRUCT__entry(
-		__field(void *,    base)
 		__field(uint32_t,    addr)
 		__field(uint32_t,    val)
 		__field(size_t,    size)
@@ -45,15 +42,14 @@ TRACE_EVENT(fsi_master_aspeed_opb_write,
 		__field(uint32_t,  irq_status)
 		),
 	TP_fast_assign(
-		__entry->base = base;
 		__entry->addr = addr;
 		__entry->val = val;
 		__entry->size = size;
 		__entry->status = status;
 		__entry->irq_status = irq_status;
 		),
-	TP_printk("fsi: opb write: base %p addr %08x val %08x size %zu status: %08x irq_status: %08x",
-		__entry->base, __entry->addr, __entry->val, __entry->size,
+	TP_printk("fsi: opb write: addr %08x val %08x size %zu status: %08x irq_status: %08x",
+		__entry->addr, __entry->val, __entry->size,
 		__entry->status, __entry->irq_status
 		)
 	);
-- 
2.23.0

