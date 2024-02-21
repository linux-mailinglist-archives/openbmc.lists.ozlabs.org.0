Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD88608E5
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:38:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mfbdt/tz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvMn6Kvzz3dX6
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:38:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mfbdt/tz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfwx942sLz3c1w;
	Wed, 21 Feb 2024 23:45:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AA8D614DE;
	Wed, 21 Feb 2024 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A688DC43394;
	Wed, 21 Feb 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708519546;
	bh=uiy23fzx9AJKJeZCc+CpWKPnHutJKS8U/tiBSjzkWs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mfbdt/tzKycr73ZDAk7GADyV0VOth8+8m2uJuA/FWjrY8NWMxeL+k935y8/94xl/L
	 UzOFwT2yPLro34Zht05MDR34hSmnhXRbgpcWAKYiR3d7xqOCXCvQpgq2VQepHj5T6f
	 Zld4xNyhZ9qvWR4IP79yKwx6nTcgAOHW0zg5piIVVPprwgdHFPSsl85eP5VGufMxrH
	 Prm9nDLYqEsFNfUkUP295KwIiWxXTruPpEXNsdw6cjw0zaqU+PdkfCtz7/l/K7eIJA
	 RwvwaWOgEB0E1TqQiqqmJBbYGLHw9sMjv6gP/8Y6PIyY92H1tRcasdZtxurivifSID
	 GilK9MR2xPS9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3B6C48BC3;
	Wed, 21 Feb 2024 12:45:46 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Wed, 21 Feb 2024 20:45:04 +0800
Subject: [PATCH v6 2/5] mmc: dw_mmc-hi3798cv200: remove MODULE_ALIAS()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-b4-mmc-hi3798mv200-v6-2-bc41bf6a9769@outlook.com>
References: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com>
In-Reply-To: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708519512; l=722;
 i=forbidden405@outlook.com; s=20230724; h=from:subject:message-id;
 bh=MzqKbWX8E5l9h/hzBiWtMINHXtoCtQN0jkOqsqOv7OM=;
 b=2Hrl+eLmAWmN7TCgsrVHwExtTo6VrvpDNenLFev/0tw/H338tnvC1eUX+jbpCNdr+nprr8WXq
 HlUAHWGYwrMD9OxFqjIbDP3scqJvug/u9CuEfP39mxQlJbkj+p4Kers
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
Cc: devicetree@vger.kernel.org, tianshuliang <tianshuliang@hisilicon.com>, linux-aspeed@lists.ozlabs.org, Igor Opaniuk <igor.opaniuk@linaro.org>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, Yang Xiwen <forbidden405@outlook.com>, David Yang <mmyangfl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Xiwen <forbidden405@outlook.com>

The alias is not used and should be removed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 drivers/mmc/host/dw_mmc-hi3798cv200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
index e9470c50a348..61923a518369 100644
--- a/drivers/mmc/host/dw_mmc-hi3798cv200.c
+++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
@@ -201,4 +201,3 @@ module_platform_driver(dw_mci_hi3798cv200_driver);
 
 MODULE_DESCRIPTION("HiSilicon Hi3798CV200 Specific DW-MSHC Driver Extension");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:dwmmc_hi3798cv200");

-- 
2.43.0

