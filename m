Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFB56AE7A
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 00:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfB5n5k8Lz3bs2
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 08:33:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=YBkm9hYt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=YBkm9hYt;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfB545N6lz3cdH
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 08:33:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657233193; x=1688769193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TcUtv2DA9TauFtWmdy0u5hTp6vY1Yk4R8a7WYIj87qw=;
  b=YBkm9hYtpMWjh+Q7dpcaQweQL9+KjEWe/bZbjjOLykADAZInCovl3EiQ
   sHGhyjqtD2R1kXMJ1VQNBH792BADoUvFrTeAceV+cWC+cssMxF/ekGrG6
   CyfVJjaetdgpf0F06rYqLpNHmpsPpq5lhitJlLlJ/QTMlxLoKVJP/498H
   4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 07 Jul 2022 15:32:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 15:32:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 15:32:08 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 15:32:07 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] ARM: dts: ast2600-qcom-dc-scm-v1: enable HACE
Date: Thu, 7 Jul 2022 15:30:57 -0700
Message-ID: <20220707223058.2722999-2-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
References: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Enable HACE to support SPL boot.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Newly added in v2.

 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
index bbfb4c7e9e0d..40048e19c5d7 100644
--- a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
+++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
@@ -170,3 +170,8 @@
 			  0x08 0x04
 			  0x08 0x04>;
 };
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
-- 
2.25.1

