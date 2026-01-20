Return-Path: <openbmc+bounces-1255-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L00Ohuob2kZEwAAu9opvQ
	(envelope-from <openbmc+bounces-1255-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:06:51 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792847126
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRVk3070z3bt1;
	Tue, 20 Jan 2026 23:30:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768912222;
	cv=none; b=SRDozyGaTJVlCr2FWK0f8BA8THDwllR9IHlJY2cpte5PlgRX4CzH3LYC4cthKD63qyDupb1hOLKnulTXRTHdmRVA6pCUkFKY6pPisWNNB55uSTt9gCoviMXJt2P+zO8SwGwRmpdUoI5KJFPZsTDCcerYDM/+HByArPACJGkT3PUPYrWiXBuWCm9XtXVBs2lQyhYjcd424RytgeocS7mOWQ02fnbGlilKDjFMh04qI+SGyJzjMmkG1oZjhkQ/2rTiFfB9a+IR0IrtVmOEwCV9u0zcv71KOPpOuRMnOcpczXrcZOrW6o2ELoS3w3SUp2LzqU3C8YIszR+zB8ETC1Y0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768912222; c=relaxed/relaxed;
	bh=jBs2FcHIwGE0vDy76F9E8yyDleDXgCZCxTBRyyIUk4c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdaUsuj9VmB/7g3tgXoC+l2Q/7Bo42NDUP6l8TR/eykHJL5Amgl7gvmeAwu6FNgprF6Xoq65If0oRBBCEOaOCLq319V03Vv/WLhoBdpicd2wJk4nNPuYNMWNurR4eVvUBa0JMRRI2Lo1g1z+K7W8pHBgXohubcw8vES0qOEncQngAlw7Pzr9J3juKGw0FJe7AH+MPMyEt3LyReqYSj5vsPxLzQ9mplh/ZDd0i24YR7K6qU52KYhxJQp3SYeJlLFCxcS5Sz+WNCtuqygnS+4RTQgOHWZKBzYgKUeMEM/gU1HBWhEGKAZF67IlQwxx6/mQLB+nfDcpAXA6wpvqTRnWGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRVj5sndz3bjb;
	Tue, 20 Jan 2026 23:30:21 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 20:30:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 20:30:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <boris.brezillon@bootlin.com>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
	<pmenzel@molgen.mpg.de>
Subject: [PATCH v3 1/2] spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
Date: Tue, 20 Jan 2026 20:30:04 +0800
Message-ID: <20260120123005.1392071-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
References: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [1.50 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chin-ting_kuo@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1255-lists,openbmc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 5792847126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

spi_mem_dirmap_create() may reconfigure controller-wide settings,
which can interfere with concurrent transfers to other devices
sharing the same SPI controller but using different chip selects.

Wrap the ->dirmap_create() callback with spi_mem_access_start() and
spi_mem_access_end() to serialize access and prevent cross-CS
interference during dirmap creation.

This patch has been verified on a setup where a SPI TPM is connected
to CS0 of a SPI controller, while a SPI NOR flash is connected to CS1
of the same controller. Without this patch, spi_mem_dirmap_create()
for the SPI NOR flash interferes with ongoing SPI TPM data transfers,
resulting in failure to create the TPM device. This was tested on an
ASPEED AST2700 EVB.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/spi/spi-mem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index c8b2add2640e..85702a77b3c8 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -708,9 +708,18 @@ spi_mem_dirmap_create(struct spi_mem *mem,
 
 	desc->mem = mem;
 	desc->info = *info;
-	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create)
+	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create) {
+		ret = spi_mem_access_start(mem);
+		if (ret) {
+			kfree(desc);
+			return ERR_PTR(ret);
+		}
+
 		ret = ctlr->mem_ops->dirmap_create(desc);
 
+		spi_mem_access_end(mem);
+	}
+
 	if (ret) {
 		desc->nodirmap = true;
 		if (!spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
-- 
2.34.1


