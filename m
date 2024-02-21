Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA58608E8
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:39:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JnpJNOWU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvNk2yG2z30Qk
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:39:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JnpJNOWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfwx94r90z3c2C;
	Wed, 21 Feb 2024 23:45:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59623CE1D28;
	Wed, 21 Feb 2024 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 891FEC433C7;
	Wed, 21 Feb 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708519546;
	bh=TB84W7Tu2siA4tIKu3yesEUxKHpCOYUqZbf+Veml5KM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JnpJNOWUVTYBFT+i+XagwsGgIK7/A0MhPqyfyu6xjZoR2HUyLZiiheZfOrGf/OtXF
	 LARvs2ThlNDs31G+0/6CCrZPzGm8ux5whyvtVY8thhdLOWRo4bbIvB0B4P+ilWVx6g
	 NYEKpxCxYA4WHfxuwyfzyU1oXvMh5imvtpNpfXRpkVEIsXSXNpW+LeqnZlZM7qjjsX
	 7K79qyTZQGy/5+C+aGB5FuNZKlA6z7eVC5OVvABCU2jBUs1Ou0t5ULCekysLgACvKG
	 VMITxPQuRDNe1beHRwX92Yk04SR6g9h9hB6P1G+ibuNo/rjw8B4MX+VqYxgGVdkeTU
	 O9ZWbpePocR3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7006FC48BF6;
	Wed, 21 Feb 2024 12:45:46 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Subject: [PATCH v6 0/5] mmc: add hi3798mv200 specific extensions of DWMMC
Date: Wed, 21 Feb 2024 20:45:02 +0800
Message-Id: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7w1WUC/4XOTU7DMBAF4KtUXmPkGc/YCSvugbpI/EMsSI2S1
 gJVuTtO2RQlUpdvpPneu4o5TCnM4uVwFVMoaU75VIN5Ogg3dKf3IJOvWaBCUoAge5Lj6OSQtG2
 bsaBSsmOrVfAREJ2oj19TiOn7hr4dax7SfM7Tz62jwHr94xDMHldAKmk9Gd83xF0wr/ly/sz54
 9nlUaxgwccIVkSB8kYH04HnLaLvEbuL6IpEYDIE1rRktwg9RmhdEr1ve08Na9wifIeg2kV4XcL
 KOObYBNL/kWVZfgEVSG0DygEAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708519512; l=2922;
 i=forbidden405@outlook.com; s=20230724; h=from:subject:message-id;
 bh=TB84W7Tu2siA4tIKu3yesEUxKHpCOYUqZbf+Veml5KM=;
 b=FFPZK/QxMFGsqomSktavHt+7L+NWbqTXJM+fy71PZsxVFDZLZIyPHvLXWS5hJF2X7Q3PP38nV
 rqA/zqDDt8rBYiA4jDMV7TVqFW6E2R7dUq4li2T1s9fN4Xd0gWjq8OO
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=qOD5jhp891/Xzc+H/PZ8LWVSWE3O/XCQnAg+5vdU2IU=
X-Endpoint-Received:  by B4 Relay for forbidden405@outlook.com/20230724 with auth_id=67
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:36:41 +1100
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
Reply-To: forbidden405@outlook.com
Cc: devicetree@vger.kernel.org, tianshuliang <tianshuliang@hisilicon.com>, linux-aspeed@lists.ozlabs.org, Paul Menzel <pmenzel@molgen.mpg.de>, Igor Opaniuk <igor.opaniuk@linaro.org>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, Yang Xiwen <forbidden405@outlook.com>, David Yang <mmyangfl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

it's modified from hi3798cv200 driver, but quite a lot of code gets
rewritten because of the hardware differences. Actually cv200 DWMMC core
is called HIMCIV200 while mv200 DWMMC core is called HIMCIV300 in
downstream.

Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
Changes in v6:
- apply the comments to the first patch, add their trailers
- Link to v5: https://lore.kernel.org/r/20240220-b4-mmc-hi3798mv200-v5-0-f506c55f8e43@outlook.com

Changes in v5:
- pick the dependant patch: https://lore.kernel.org/all/20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com/
  to fix the bot build error.
- edit the semantic meaning of hisilicon,sap-dll-reg property (Rob Herring)
  The suggestion is from the CRG driver side:
  https://lore.kernel.org/all/20240218205741.GA1561527-robh@kernel.org/
- Link to v4: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v4-0-0fdd9bd48532@outlook.com

Changes in v4:
- rename dw_mmc-hi3798 back to hi3798cv200 - Suggested by Krzysztof Kozlowski.
- add r-bs to patch 1 and 2 - Reviewed by Krzysztof Kozlowski.
- Link to v3: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v3-0-f15464176947@outlook.com

Changes in v3:
- dw_mmc-hi3798: fix bot error (Rob Herring)
- Link to v2: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v2-0-010d63e6a1d5@outlook.com

Changes in v2:
- dw_mmc-hi3798mv200: use dev_err_probe() helper - Suggested by Krzysztof Kozlowski.
- dw_mmc-hi3798mv200: add missing err=0;
- dw_mmc-hi3798c(m)v200: remove unused MODULE_ALIAS() - Suggested by Krzysztof Kozlowski.
- binding: rename the binding, a lot of tweaks suggested by Krzysztof Kozlowski.
- Link to v1: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v1-0-7d46db845ae6@outlook.com

---
Yang Xiwen (5):
      mmc: host: mmc_of_parse_clk_phase(): Pass struct device * instead of mmc_host *
      mmc: dw_mmc-hi3798cv200: remove MODULE_ALIAS()
      mmc: dw_mmc: add support for hi3798mv200
      dt-bindings: mmc: dw-mshc-hi3798cv200: convert to YAML
      dt-bindings: mmc: hisilicon,hi3798cv200-dw-mshc: add Hi3798MV200 binding

 .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 ----
 .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         |  97 +++++++++
 drivers/mmc/core/host.c                            |   4 +-
 drivers/mmc/host/Kconfig                           |   9 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c              |   1 -
 drivers/mmc/host/dw_mmc-hi3798mv200.c              | 239 +++++++++++++++++++++
 drivers/mmc/host/sdhci-of-aspeed.c                 |   2 +-
 include/linux/mmc/host.h                           |   2 +-
 9 files changed, 349 insertions(+), 46 deletions(-)
---
base-commit: 8d3dea210042f54b952b481838c1e7dfc4ec751d
change-id: 20240121-b4-mmc-hi3798mv200-a5730edf122c

Best regards,
-- 
Yang Xiwen <forbidden405@outlook.com>

