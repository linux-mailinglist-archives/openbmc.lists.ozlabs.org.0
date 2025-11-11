Return-Path: <openbmc+bounces-867-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D7C4E9F1
	for <lists+openbmc@lfdr.de>; Tue, 11 Nov 2025 15:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5V3c423Gz2yvK;
	Wed, 12 Nov 2025 01:56:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762872988;
	cv=none; b=cBmGgDB7kV31zg7QwB4e5i+0ZN+oZUxuUxwgFr7JMrq7lc5vH9E+ctbhoEzdE6dUzh3ncSsypQR+z2swNYGZDkO87/tGGneHC4l5XXGZRyWAO7n9qB3mmd7dPmqfGHN1ggK44pg1RF5qO7QG8UOZHYBhN7cJ3ow+wKnchXRDEWqIK8Zu/Vmu2guVyojJoIZr+LC8Jq17i+oQgS8VKVN+PiKclRqo3jZPm68MXoM+xJYeOVdmFRftNbuyCQ6jTfl/A6WJy0RBvzODlCW2kBKZM+gRl0gdwoZqlGKeYDsE6icNIQD3Y2HYK45hDUc/Qj3fPQgHoNm9OHW7Z3f4Qstxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762872988; c=relaxed/relaxed;
	bh=tSrPXujcyIIc5zBIA1IqBgfqR0DS/PDQZ/DNXNkBnlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j6yB5OidS/Zt+4AGdJj9bW/vwG98AYMMfhFB9B+kWDgnPTE2Jq5LRzeDFPONXqBxju5lMXCOaKHbvyp0ikA/twQbOb7egXqo/RS7b9/pCL55Vu0Ztnt9YZIZr/MxWXeTOOobA43yIKfdKqWkKmviRE+eSfSeG/9rDkaO/CSeVoDQTjYSevjMJQiterZGM+o2H0XGRvJs2iqPCgz8PL3Amh2ODOmpUBn8Oxld0seks5z1EVZA2NxfN3pkSSO1vjhyoUdzmeegfksWlEeOgqAPs5ESrJ9GIv5+qZ0SCpefGVtSPOnLT5jig7dvjvLbmbETgwDfuI3bFz0mGVx8SoVeZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ktGLQds4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ktGLQds4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5V3Z32NSz2ypw
	for <openbmc@lists.ozlabs.org>; Wed, 12 Nov 2025 01:56:24 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-297e982506fso35871165ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 11 Nov 2025 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762872982; x=1763477782; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSrPXujcyIIc5zBIA1IqBgfqR0DS/PDQZ/DNXNkBnlA=;
        b=ktGLQds4e4UbXyFKVXSkUjhy8C23sZh99N0vMHoyUTBAYOSFig0lm/2SXEGS+E4huv
         U7EXFGt1/Uxb85bF25ludqgUWYMazrTEgB+xpKQcQtLjBlAcokTJ6tcNcsina3q29jdS
         nOBPesXxTVFz9BnchkXusX916Du2Tw/alQdku4g+MnDwXst1CPV8FaRdPLYn19yElnVu
         GSPQAfvkuJdCjPsdv7ru3DhztNmX2osgYSxT0KRH6FrXF0Ekbc53DgyU9R0cqxcowHsl
         DCeIb8uxWUztY0MTYmfUPKVXqQQggLtaJJXRRrsM8OkZTTOTc+7VUwdYZcQGovnlqJk8
         6l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872982; x=1763477782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSrPXujcyIIc5zBIA1IqBgfqR0DS/PDQZ/DNXNkBnlA=;
        b=kuaqvKinh9f0+bsn9OaJMLJOIA4MGXlaiUI4v6HbytJ906kVU7ulWXfqkFAnH4tzjS
         EkMAqKt44GBvaYJgebi5Rl8426RHoQd69WhGcMgNssonOenp394pGvZeS2bSBVCL1cuK
         iWATBnclqnghXVbarjBLk5rkNui4WhHR0Yk+4LsyWz4j5eDaXuMJyKp86GaXbW3ATJYj
         HVlkFoBolMQ+YAYJ3GsVoEfs2kuaWeKUgBKw+YqHGoJLFEWeVZwEBGdoCJA8SRRgsy45
         1h7jUt5K6NcfQa4GI1TaQiDG4eibrlqDb5iUODBfW5KJCUdsUhpNSyUMeJJNM6S2EeR/
         Bx9w==
X-Forwarded-Encrypted: i=1; AJvYcCWN4qU9b6fFVoP6AE2Zj+ZlwXPgo/TVZeZIbEm1UqwPkIW9CF7ubsuaxbvev602Fgv1Sap4cgCW@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxnlt4Y8+BHeBnZX2GxdrrWTN5LilYiYKFLarMIkswMKqqN8+RK
	Tb1yIT9YsyhGx8GsXDrbfzx99yrSzIDgwzYhHOyIMO7281kHTMhx0eVAhzNg50iY0Rw=
X-Gm-Gg: ASbGnctj6GXtyDYLBUKTODjQwKEMtk70B8cM4Jz1lbI/P/3chmC8GMO/H/ayuUCJm1w
	LfzH0T1o3EVT3tBUMvKomXiFfPLywARqu/o77NrBQ59/qKOds9mLpoYx9mQz/WNvWSwu1Cl7NT0
	VHefuDpSM0JAN2IiwWhDCgBTmbw0GTjnHagTciBF4vYOyOa87C5fhLoKt8p0G1lhQ/5jX9vjej1
	uc0LVUKct803X6L1sAh/BhaomAcv+nJ8uHDEw/JSUDLUJ9wR1ySv3QtJ97ji0OBaXmhNKscvC3I
	oef/kQZbqGA1FMUvRmjPq13YO5ap7n4fN/8wKrWEJt4Gp5sZWz8VPPHTv3ykDNciTF1fGO8pYm4
	JwfQ6TyfzuN1116Qp3rx/rQHxV6SDLsxM55cfLHgzvKpbLE6K4fJKDSMg9kDdQL1HUPVhglNIh0
	zEmhMJPHbA
X-Google-Smtp-Source: AGHT+IHzw7KGS5V49PmS3dPImgttpK5QuWelyEH8VVaWzQ8/JjHlzL/5enOIxdcpy8EEGYBBT6pxmw==
X-Received: by 2002:a17:902:e891:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-297e56dd7bcmr160323645ad.51.1762872981997;
        Tue, 11 Nov 2025 06:56:21 -0800 (PST)
Received: from localhost ([106.38.226.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c6b3sm182427605ad.24.2025.11.11.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:56:21 -0800 (PST)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: dwmw2@infradead.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	openbmc@lists.ozlabs.org
Cc: Jian Zhang <zhangjian.3032@bytedance.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	linux-kernel@vger.kernel.org
Subject: [[RFC PATCH]] jffs2: attempt to fix "Error garbage collecting node"
Date: Tue, 11 Nov 2025 22:56:08 +0800
Message-ID: <20251111145609.1917969-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch shares analysis and a potential fix for the "Error garbage collecting node"
issue observed in long-run tests with SPI NOR flash under repeated AC cycles.

TL;DR:
An unstable block may pass CRC checks multiple times but fail during GC.
The practical mitigation is to locate such blocks and perform a read-erase-write
cycle to make them stable; the actual data content is irrelevant.

Background:

In long-run tests, JFFS2 sometimes fails to perform garbage collection, producing logs like:

[    3.470788] jffs2: notice: check_node_data: wrong data CRC in data node at 0x008cc2e8: read 0xb554ca36, calculated 0xc7ac50f7
...
[   46.815192] jffs2: Error garbage collecting node at 008cb694, mark node obsolete!
[   46.840646] jffs2: read_cache_page() returned error: -5

Root cause:

1. During GC, a power loss occurring while an `erase` operation is in progress
   can leave a block in an unstable state. Reads from this block may yield
   inconsistent results.

2. A node may pass multiple CRC checks, but during GC — particularly when moving
   a PRISTINE node — a CRC failure may occur, triggering the garbage collection error.

Detailed analysis:

- In `jffs2_garbage_collect_pristine`, moving a PRISTINE node does not increment
  the version number. At some point, two nodes with identical version numbers may
  exist simultaneously.

- With JFFS2 SUMMARY enabled, `jffs2_mark_node_obsolete` only marks the node
  obsolete in RAM, skipping flash updates. On the next boot, the node may be
  re-scanned and remain unstable.

- During file/node construction in `jffs2_add_tn_to_tree`, two nodes with the
  same version number are handled as follows:
  * Current node valid → discard the new node
  * Current node CRC error → replace with the new node

  This allows an unstable node to be selected even if it passes CRC on this pass.

Relevant call flow:

jffs2_find_gc_block
    jffs2_do_crccheck_inode
        jffs2_do_read_inode_internal
            jffs2_get_inode_nodes
                read_dnode
                    jffs2_add_tn_to_tree

Proposed mitigation:

Locate blocks that may be unstable and perform a read-erase-write cycle to
stabilize them. The actual data content is not important, only block stability.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 fs/jffs2/scan.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 62879c218d4b..1475d2c0be4c 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -442,6 +442,174 @@ static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock
 }
 #endif
 
+static inline uint32_t jffs2_calc_node_hdr_crc(const struct jffs2_unknown_node *node)
+{
+	struct jffs2_unknown_node crcnode;
+
+	crcnode.magic = node->magic;
+	crcnode.nodetype = cpu_to_je16(je16_to_cpu(node->nodetype) | JFFS2_NODE_ACCURATE);
+	crcnode.totlen = node->totlen;
+
+	return crc32(0, &crcnode, sizeof(crcnode) - 4);
+}
+
+static int jffs2_pre_scan_eraseblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
+{
+	int ret;
+	bool error_found = false;
+	unsigned char *buf;
+	uint32_t crc;
+	struct jffs2_unknown_node *node;
+	struct jffs2_raw_inode *ri;
+	struct jffs2_raw_dirent *rd;
+
+	uint32_t ofs = 0, buf_len = c->sector_size;
+	uint32_t retlen;
+
+	buf = kmalloc(buf_len, GFP_KERNEL);
+	if (!buf) {
+		JFFS2_WARNING("Unable to allocate scan buffer of size %u\n", buf_len);
+		return -ENOMEM;
+	}
+
+	ret = jffs2_fill_scan_buf(c, buf, jeb->offset, buf_len);
+	if (ret) {
+		JFFS2_WARNING("Unable to read eraseblock at 0x%08x\n", jeb->offset);
+		goto exit;
+	}
+
+	while (ofs < c->sector_size) {
+		if (c->sector_size - ofs < sizeof(struct jffs2_unknown_node)) {
+			/* Not enough space for a node header */
+			break;
+		}
+
+		if (*(uint32_t *)(&buf[ofs]) == 0xffffffff) {
+			/* Reached empty space */
+			ofs += 4;
+			continue;
+		}
+
+		node = (struct jffs2_unknown_node *)&buf[ofs];
+		if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
+			ofs += 4;
+			continue;
+		}
+
+		if (jffs2_calc_node_hdr_crc(node) != je32_to_cpu(node->hdr_crc)) {
+			JFFS2_WARNING("node header CRC failed at %#08x\n",
+				      jeb->offset + ofs);
+			ofs += 4;
+			error_found = true;
+			goto check;
+		}
+
+		if (!(je16_to_cpu(node->nodetype) & JFFS2_NODE_ACCURATE)) {
+			/* This is an obsoleted node */
+			ofs += PAD(je32_to_cpu(node->totlen));
+			continue;
+		}
+
+		switch (je16_to_cpu(node->nodetype)) {
+		case JFFS2_NODETYPE_INODE:
+			if (c->sector_size - ofs < sizeof(struct jffs2_raw_inode)) {
+				/* Not enough space for a full inode node */
+				ofs += 4;
+				goto check;
+			}
+
+			ri = (struct jffs2_raw_inode *)node;
+			crc = crc32(0, ri, sizeof(*ri) - 8);
+			if (crc != je32_to_cpu(ri->node_crc)) {
+				JFFS2_WARNING("inode node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
+					      jeb->offset + ofs,
+					      je32_to_cpu(ri->node_crc), crc);
+				error_found = true;
+				goto check;
+			}
+
+			if (je32_to_cpu(ri->dsize)) {
+				crc = crc32(0, ri->data, je32_to_cpu(ri->csize));
+				if (je32_to_cpu(ri->data_crc) != crc) {
+					JFFS2_WARNING("Data CRC failed data node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+						ofs, je32_to_cpu(ri->data_crc), crc);
+					error_found = true;
+					goto check;
+				}
+			}
+
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+		case JFFS2_NODETYPE_DIRENT:
+			if (c->sector_size - ofs < sizeof(struct jffs2_raw_dirent)) {
+				/* Not enough space for a full dirent node */
+				ofs += 4;
+				goto check;
+			}
+
+			rd = (struct jffs2_raw_dirent *)node;
+			crc = crc32(0, rd, sizeof(*rd) - 8);
+			if (je32_to_cpu(rd->node_crc) != crc) {
+				JFFS2_WARNING("Node CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+					ofs, je32_to_cpu(rd->node_crc), crc);
+				error_found = true;
+				goto check;
+			}
+
+			if (strnlen(rd->name, rd->nsize) != rd->nsize) {
+				JFFS2_WARNING("Name in dirent node at 0x%08x contains zeroes\n", ofs);
+				error_found = true;
+				break;
+			}
+
+			if (rd->nsize) {
+				crc = crc32(0, rd->name, rd->nsize);
+				if (je32_to_cpu(rd->name_crc) != crc) {
+					JFFS2_WARNING("Name CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+						ofs, je32_to_cpu(rd->name_crc), crc);
+					error_found = true;
+					goto check;
+				}
+			}
+
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+		default:
+			ofs += PAD(je32_to_cpu(node->totlen));
+			/* Other node types are not pre-checked */
+			break;
+		}
+	}
+
+check:
+	// find any error during pre-scan, if found, erase the block, and write back.
+	if (error_found) {
+			JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
+				jeb->offset);
+			struct erase_info instr;
+
+			instr.addr = jeb->offset;
+			instr.len = c->sector_size;
+			ret = mtd_erase(c->mtd, &instr);
+			if (ret) {
+				JFFS2_ERROR("Erase at 0x%08x failed during pre-scan: errno %d\n",
+					jeb->offset, ret);
+				goto exit;
+			}
+
+			ret = jffs2_flash_direct_write(c, jeb->offset, buf_len, &retlen, buf);
+			if (ret) {
+				JFFS2_ERROR("Write back at 0x%08x failed during pre-scan: errno %d\n",
+					jeb->offset, ret);
+				goto exit;
+			}
+	}
+exit:
+
+	kfree(buf);
+	return ret;
+}
+
 /* Called with 'buf_size == 0' if buf is in fact a pointer _directly_ into
    the flash, XIP-style */
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
@@ -453,6 +621,10 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 	int err;
 	int noise = 0;
 
+	err = jffs2_pre_scan_eraseblock(c, jeb);
+	if (err) // only log warning, continue scanning
+		JFFS2_WARNING("Pre-scan of eraseblock at 0x%08x failed: err=%d\n",
+			      jeb->offset, err);
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	int cleanmarkerfound = 0;
-- 
2.47.0


