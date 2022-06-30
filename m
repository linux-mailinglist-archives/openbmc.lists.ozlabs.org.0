Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D15623C6
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 22:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYq6w3STvz3dpL
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 06:04:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sMHZsEWy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sMHZsEWy;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYq506SgHz2ywl
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 06:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656619381; x=1688155381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oAGsnP6P1nbnf3+dl9tUOYmwBH2h2knhrH3Ob22FbXI=;
  b=sMHZsEWyof3rJQ2RvDd9pSbituXLP32eZFJvHNmhCs/Hkkonh4nf8ARA
   c3o+yyZHl8tsCMa2ROJvOARi3efsYsq1FPvCKuWFh6e5V1rbvVkRZPWse
   uP6bWGRRkKQUe/4TPyjgGPtAg5bJww+foi93tkUyPHbHeQ/5rVsz0UbwX
   8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Jun 2022 13:02:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 13:02:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 13:02:55 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 13:02:54 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/3] board: ast2600_qualcomm: add env default
Date: Thu, 30 Jun 2022 13:02:27 -0700
Message-ID: <20220630200227.2292079-4-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add env default to dc-scm-v1 board configuration.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 .../aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt  | 4 ++++
 configs/ast2600_qcom_dc_scm_v1_defconfig                      | 2 ++
 2 files changed, 6 insertions(+)
 create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt

diff --git a/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
new file mode 100644
index 000000000000..9aebd38424ef
--- /dev/null
+++ b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
@@ -0,0 +1,4 @@
+bootargs=console=ttyS4,115200n8 root=/dev/ram rw
+bootcmd=bootm 20100000
+bootdelay=2
+loadaddr=0x83000000
diff --git a/configs/ast2600_qcom_dc_scm_v1_defconfig b/configs/ast2600_qcom_dc_scm_v1_defconfig
index 353882deed26..e602163e1caf 100644
--- a/configs/ast2600_qcom_dc_scm_v1_defconfig
+++ b/configs/ast2600_qcom_dc_scm_v1_defconfig
@@ -67,6 +67,8 @@ CONFIG_USE_ENV_SPI_CS=y
 CONFIG_ENV_SPI_CS=0
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_USE_DEFAULT_ENV_FILE=y
+CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt"
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
-- 
2.25.1

