Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B928D8613
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:53:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tH0c3pKpzDq63
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:53:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rB62prn6"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tGys3T7nzDqjH
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:51:33 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id e10so9353194pgd.11
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOiXujYPO3zVQjzz7lesqRMOBJsl5bWd19xRq5Y1huw=;
 b=rB62prn6A9qNtNTa4O8Qmij79kAFO0vLTEfzWpf8N3k2H5xVm45DOFK2oNgZXBx0J5
 eZXrHxaMu7YUSkBnMYrk5Vravcn4pIN1eMbrWGzYq+CFNixBVnuG46bYFIyro/1hV2Jo
 FWvJVLdiBnmavfgw/ju9KL/ON/CRhJR4p4U57dBiA7b8OoscSInzSrTCGHnzf+KvLIob
 /ZlZ+iSbb/Fsew0P+Z8XR9w+1TC7qt5DX+15rA2zJsllIFwLhjq7vs2ZZkb5DSSyG3sR
 rKGqSPpmZfKWH1G1ueem/HLM0u2LbiTTmiIaGKQbvTbxEOcmarzu3tZkA9i3h4d2rIls
 aecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IOiXujYPO3zVQjzz7lesqRMOBJsl5bWd19xRq5Y1huw=;
 b=bJFr/AfWwCaY7eriPweqWQEXrO6CCze84OlsGgxkVWqVjEqzeeg8mR0MhpKpZJ4P2K
 +giWKLF6ivyRNA2NFz4MD4sOymxfT5wo+afrqF+nDiz75R+AvNO9ynFXfJMdnNMjDNXS
 QdNsRI58UbnQUKVhKPP09EQnCvEfKYIRH+9SttFne3FZfQeLLgHlU5kaRBu8p/lbWAAF
 7Qw+m22sniIKhRj0qVx1p28XY/Y/HRvlxsaze6SSkBLRyXZGSQ9PdK1W8YpYky2N0DLw
 fwU6B4AOv0dwrOO2w4OfNewEamDZcfuczEFgAMXvAWuaPjRlZa443Rf2dKX6c/48KkiE
 yJjA==
X-Gm-Message-State: APjAAAXEPmErgw/TFdicMaOSukDDxdpEWmQIPxA97tBXPMG1z/Z86X/t
 C5uewk+w3Dsm02V5Sd38bjkeTLpfVfE=
X-Google-Smtp-Source: APXvYqx0FpowxC73LyWhnmSAjU1zf7EOBZ1Fvpsvqc4bJmVb2wY0o91IftokV+KYOCfx1sYKt5rIxQ==
X-Received: by 2002:a63:7c03:: with SMTP id x3mr42904391pgc.382.1571194290266; 
 Tue, 15 Oct 2019 19:51:30 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id f185sm30269191pfb.183.2019.10.15.19.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 19:51:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 1/2] fsi: aspeed: Remove base from trace
Date: Wed, 16 Oct 2019 13:21:20 +1030
Message-Id: <20191016025121.16564-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016025121.16564-1-joel@jms.id.au>
References: <20191016025121.16564-1-joel@jms.id.au>
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

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Tested-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
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

