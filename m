Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC15623C4
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 22:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYq696zFJz3cj3
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 06:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=iq2iYgaW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.39; helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=iq2iYgaW;
	dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYq4z6vKgz2ywl
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 06:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656619380; x=1688155380;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mStF7gmi5HL1FVka7Jv3G7H7k+K8ZLG4A1020yILARI=;
  b=iq2iYgaWteTxyRwrNcEdyoo0uCTNHp6mRuAqHmDJI/iGG86lFllhsJf2
   JY2FTm2ZRzYPnjQ2O0jBSEmt9jV7crWU14M9+RE8WYIxbfufWbw8CqQRk
   X3uqD/MMD6OIieBVRrod3wwn/GR4L7ugcMBQlFVlrAeXa7yTFhYDsD1W1
   M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jun 2022 13:02:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 13:02:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 13:02:53 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 13:02:52 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/3] Add Qualcomm DC-SCM V1 defconfig and board support
Date: Thu, 30 Jun 2022 13:02:24 -0700
Message-ID: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
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

Hello,

This series adds Qualcomm DC-SCM V1 defconfig and initial board support.
Please review!

Thanks,

Jae

Jae Hyun Yoo (3):
  configs: ast2600: add Qualcomm DC-SCM V1 defconfig
  board: ast2600_qualcomm: add initial version of Qualcomm DC-SCM V1
    board
  board: ast2600_qualcomm: add env default

 arch/arm/mach-aspeed/ast2600/Kconfig          |   8 ++
 board/aspeed/ast2600_qualcomm/Kconfig         |  15 +++
 board/aspeed/ast2600_qualcomm/Makefile        |   1 +
 .../dc-scm-v1-u-boot-env-default.txt          |   4 +
 board/aspeed/ast2600_qualcomm/dc-scm-v1.c     |  33 +++++
 configs/ast2600_qcom_dc_scm_v1_defconfig      | 119 ++++++++++++++++++
 6 files changed, 180 insertions(+)
 create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
 create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
 create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
 create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c
 create mode 100644 configs/ast2600_qcom_dc_scm_v1_defconfig

-- 
2.25.1

