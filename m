Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD256AE78
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 00:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfB4N0SkSz3c7r
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 08:32:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=blPYQjEa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=blPYQjEa;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfB3z2NMmz304j
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 08:32:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657233135; x=1688769135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u32t1E37cjQkPqg9GCVHL6Ipx73O6iOdV4FMN5Co4NA=;
  b=blPYQjEa8h6RHzPD+oVd/ENuxtsqFyyyskOE1TATaBkBLjE2IWIs4tvG
   ZwQ//rnpa8NCZod5KMlH0xSR7scv6iXVrwbpYqEUKbSsGC8mTvGtkRNI0
   awc5QHIepqFJnd13jVd0jyKHrK3dEk3TOD/P8OzD27Pz+u00697oZ/9j6
   8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jul 2022 15:32:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 15:32:08 -0700
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
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/2] Add Qualcomm DC-SCM V1 board support
Date: Thu, 7 Jul 2022 15:30:56 -0700
Message-ID: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
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

Hello,

This series adds initial version of Qualcomm DC-SCM V1 board support.
Please review!

Thanks,

Jae

Changes in v2:
* Dropped board specific defconfig and use openbmc common defconfig. (Joel)
* Dropped unnecessary default env file. (Joel)
* Changed GPIO handling using GPIO driver. (Joel)
* Moved board specific code to the manufacturer folder. (Joel)
* Enabled HACE to make it run on SPL boot.

Jae Hyun Yoo (2):
  ARM: dts: ast2600-qcom-dc-scm-v1: enable HACE
  board: qualcomm: dc-scm-v1: add initial version of Qualcomm DC-SCM V1
    board

 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts |  5 +++
 arch/arm/mach-aspeed/ast2600/Kconfig    |  8 +++++
 board/qualcomm/dc-scm-v1/Kconfig        | 15 +++++++++
 board/qualcomm/dc-scm-v1/Makefile       |  1 +
 board/qualcomm/dc-scm-v1/dc-scm-v1.c    | 42 +++++++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 board/qualcomm/dc-scm-v1/Kconfig
 create mode 100644 board/qualcomm/dc-scm-v1/Makefile
 create mode 100644 board/qualcomm/dc-scm-v1/dc-scm-v1.c

-- 
2.25.1

