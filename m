Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0799963BD3
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 08:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvWxl0tW7z30YS
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 16:45:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724913926;
	cv=none; b=AaYh4bjOvPArXF5QLA/nvY2veegMie5VouMz15AsFF01DH26AkDc45QSTt2Oce15xV5cMqsF1LJNQ+tZgqBQCmR2B3f1m4d9rIkCM76VueVk42co3pQi67H4Qn5Yk2itauVF4B7yj2xXfbA1NHc5Tj3ks2pP/SxkOdnByU3mVHlZ5BFOsFbOkx8HMompW34QsMMuRp6SpaghdxpSACZ4MlXPMUQ8To7hbq7x8dtqs6rZG07l5uSwBvUbr00f62TbmjHCGdX+yJ13qobFWmjhkOnUkuqrSpzx39PRa6txXU2S7Qas4i2utYlyM9vUseHtyZqkdfTnxjSnkXVPR0a97A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724913926; c=relaxed/relaxed;
	bh=8NYYZzKP55nYKeb0QqOPvNVTC+zawuXSNB9eKJWKS1k=;
	h=Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type; b=gQ6lZPb3KZbsupteihklFT5XJoi+Xk/5A8HBAzMMCmjIsjwk3GbcnhAxiWeqKUp1Tv24rvResECKRIzlHvWRfnhaPD9cuuo9t4O6/mvSQGTiDhGHx+VS4Pj8H65+G8q+N/C927Z+EzZjZ8HTCOdn+4VjqWVpC3WtO1tgQYoljq/v73iNCIVszHMHfiXCj7cwH0AFewfNW+w+ElQbrOYPUtuL+RGuy+hW2uj0Np7Z6H8sxMvfSWwfFMOQKCHak4m+1697GmPjKl3ib1v/fo7aE+zPCzk//wUiJeM5m2uJxQqomCxCp3q3gXCWlhiLrbiv7y8rzuHMzIhT2NLEcTkyLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvWxf1Qt3z2yJ9;
	Thu, 29 Aug 2024 16:45:24 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 29 Aug
 2024 14:45:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 29 Aug 2024 14:45:08 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <robh@kernel.org>, <conor+dt@kernel.org>, <eajames@linux.ibm.com>,
	<mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<hverkuil@xs4all.nl>, <pmenzel@molgen.mpg.de>, <krzk+dt@kernel.org>
Subject: [PATCH v6 0/2] media: aspeed: Allow to capture from SoC display (GFX)
Date: Thu, 29 Aug 2024 14:45:06 +0800
Message-ID: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 v6 changes:
  - Replace aspeed-video.txt with aspeed,video-engine.yaml.
 v5 changes:
  - Remove dts.
  - Add doc, aspeed,video.yaml.
  - Simplify aspeed_regmap_lookup.
 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (2):
  dt-bindings: media: convert aspeed-video.txt to dt-schema
  media: aspeed: Allow to capture from SoC display (GFX)

 .../bindings/media/aspeed,video-engine.yaml   |  78 ++++++++
 .../bindings/media/aspeed-video.txt           |  33 ---
 drivers/media/platform/aspeed/aspeed-video.c  | 189 +++++++++++++++---
 include/uapi/linux/aspeed-video.h             |   7 +
 4 files changed, 246 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt


base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
-- 
2.25.1

