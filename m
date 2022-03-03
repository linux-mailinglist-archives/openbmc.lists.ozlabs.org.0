Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C224CBA16
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 10:22:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8QVQ6KSmz3c21
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 20:22:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NKZoGBfk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NKZoGBfk; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8QTz2c4Yz3bnd
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 20:21:42 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id f4so3275991qvd.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjLVAHYQdC3TfzYteC4e+EJhOBPlyxvi64+3KhE2C5s=;
 b=NKZoGBfk+iQND9eakA2JUeF6APzkG+fv/OG/s6y9qLE6vDgNzd4Fu1MU8cLlsXjbC5
 SxYslRU5jgrTojt4IRaWKAE8k4aN3iy0hXVGcslqTDTJjfGu7NN2YVm7hcpmILxITJmy
 gxT/txtX3M5tmL8tkkeX3RJ9z97DxmjgZFf/86GN3WK83PFsoHrIUfkKMuFLt0i1qrDz
 atyxM91HleoV5OiyR4Yz1hjTS5NHRZVe6614yfTKNgbtpbVb1ApgqXSBvQKn+MUDcXU+
 xGDSdX4L93QwN1OH6ysP1WkwfflwQ/+jCaVZYT0pX52jub2MY5Ou+tSjWE8xBGZlcvbd
 CrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjLVAHYQdC3TfzYteC4e+EJhOBPlyxvi64+3KhE2C5s=;
 b=6OGUkV2x8jLEa+h7TPzl5rOsjswZoBX2R+BI4kEHMYs6ICspfPnKYAqTHufnfi9jI6
 M+o9JKuXZVtT1vQquoNqSPrrL+OM1Uzw5kk1vpyr2X4HI372TGEyb1xT4qd4WcJTyuM+
 t9hdiK+1ysXTAd1TU2IEkzQMR1b/BTRjoALEFvOCSRkV7P4H21/rIiA+xogjLcl8XrPo
 NUlGkpwHzsgpnadGKMSQY7N/3GtzmbzUWCJw/aQMRHpygDFDREM8nyIdQZ+1PNixVFVa
 vkfJIeBHAelzrDycgy6iCDhMThukvfYG7w3u6WxGjYI3HUuSxtpTO7xFKVQ062zGsSDJ
 foxA==
X-Gm-Message-State: AOAM530+XEiP1yTLyGz9iNdYnxkB0s7LOjzE+dCIQ8FpqRmR4vqM+XMD
 eDqRhsvERQEtQxoXQwZnq7U=
X-Google-Smtp-Source: ABdhPJwTYr80xdhkF6DAmqLB+Q2CxbEpRoiiEYyuf1CvwDdKaCXLrR6Ek0NzRds1DRSDXCtp6IhS3g==
X-Received: by 2002:a05:6214:2265:b0:433:2aa7:5a5a with SMTP id
 gs5-20020a056214226500b004332aa75a5amr12275641qvb.114.1646299300872; 
 Thu, 03 Mar 2022 01:21:40 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05622a119500b002de3d0bdf28sm1084461qtk.45.2022.03.03.01.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 01:21:40 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: avifishman70@gmail.com
Subject: [PATCH] spi: Use of_device_get_match_data()
Date: Thu,  3 Mar 2022 09:21:31 +0000
Message-Id: <20220303092131.2060044-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 tali.perry1@gmail.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/spi/spi-npcm-fiu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index b62471ab6d7f..71ed75bf0a20 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -671,7 +671,6 @@ static const struct of_device_id npcm_fiu_dt_ids[] = {
 static int npcm_fiu_probe(struct platform_device *pdev)
 {
 	const struct fiu_data *fiu_data_match;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct spi_controller *ctrl;
 	struct npcm_fiu_spi *fiu;
@@ -685,13 +684,12 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 
 	fiu = spi_controller_get_devdata(ctrl);
 
-	match = of_match_device(npcm_fiu_dt_ids, dev);
-	if (!match || !match->data) {
+	fiu_data_match = of_device_get_match_data(dev);
+	if (!fiu_data_match) {
 		dev_err(dev, "No compatible OF match\n");
 		return -ENODEV;
 	}
 
-	fiu_data_match = match->data;
 	id = of_alias_get_id(dev->of_node, "fiu");
 	if (id < 0 || id >= fiu_data_match->fiu_max) {
 		dev_err(dev, "Invalid platform device id: %d\n", id);
-- 
2.25.1

