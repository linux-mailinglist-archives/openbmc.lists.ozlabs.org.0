Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E23977D18
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qvM0D5Rz3ck2
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222539;
	cv=none; b=Cg/T+AtMSqEn0TP1LIiUsxgzbgupQxsFum9hlAF3yl0gu61EZpo4P8AhsV/VyFUpKTDAbWW2h25MqCtFTVyYR1wb9grqCpprbB/GeU/0JzySJyeoB1fXB7cWszBtQtjmvDeHzvoQAyY9FqgEnECrZmaG0u8NGh41Afa0/n+GO1RGGGloDHOTN4aVnmUmGrq3gAGDJlR6KIjZowvn3Qp89fKDiddQ++mNv3NNMVt3qxCMfsapG6HrfT3WjAlW5X2x4moZ1IxL3bfpkhmFHJIWAP7dVIUkuoSS1HbiIWSUBXVbWjyq1fSO2sK1kKmQAsRvpYiBbdhguuUmbkovwVhBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222539; c=relaxed/relaxed;
	bh=jVTHLdi2Mm542zmwkkAlJabphNlWmnDQC/mhVmCZ97o=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZZI/fg1nrGiMijiPEHR9ZeFPJawj2QiDF9GdJLERpJtcr1xk2MgUWml9g8DBypKY+wYbfzKjqgLX7UGIPKAQW/JYgnpBJmd7hd7J2dPWm4gZIyUgwnT02fzVyPwJth3T7GYglD6hdqLlZEtG6JUIHFb4aVwx8R+AN/1u7idg3RmIhgVwhnOZotGSL9+OcidJxfA+N64FJbE8j/jLjrEjb6VX8bqP2LSJB/3K0yHj8+qv5F/O9IIm5b6ZNLu3KxBq/+qft9nLGuUVop4fCNJEkCXwVUZ81zne6q7UFCAwaimU4ng4OACt4U1vbsmKg6juYAttNMo+6EHsMy4sArX9OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e1/wHTQM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e1/wHTQM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qvH3Bg2z2yYK
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:15:39 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20551e2f1f8so8025155ad.2
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222537; x=1726827337; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVTHLdi2Mm542zmwkkAlJabphNlWmnDQC/mhVmCZ97o=;
        b=e1/wHTQM5O1FIXv4KribQdYDN0Cn98soiD8b3OB2MZSKadD94gti3u+NcC7qoKkjE0
         DjDgZxgIsnyiF21EwXNdHQg/7imV1jdw9RQduF7TRRCEsXj8gderH0wCXhsgHEux0nfF
         T2aONRNbr3Qw0cIsggtVtfM7COLwVdao8d7KmWyrdpbAjSqi671d11r7mitQtDT3e/L9
         UXBfd/wWbDV/658KaXSN6ofup7qylSCuHSnxvd3W6ydqynrxzBM1nMHeif8ON2c8Se5o
         +h9pzbH64Ug4HTIMcDRKOhEmsAMxtmstRmbokodyXhQxuFoVGeE0BugNQ4Nq9BOmMCR8
         AcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222537; x=1726827337;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVTHLdi2Mm542zmwkkAlJabphNlWmnDQC/mhVmCZ97o=;
        b=E6v+IKpVV79l8LX1F5i/KsZ4dKXF1wGtvpm2LJI8zP7zLNC/qK9cXAYBt9cLEd0ZfL
         RNmEDlrV8dyOkxkNOQEd4nAOnPQ8jGttwD685WXlw5KGfZlw6IvQgtALEHQqtA8R+IRC
         GKJ0CdinjHSDb9ji4ANYDTtmcniP1rHCiMzj85K3hqAzdtMitP15nRyPT54BTn4upT54
         oT+WAWF9jt9uJW7zpRV0t3IKDCmIoCNQFXAd2E2dU8p3MIDuwdKtFU/FTnLSAYaewlS5
         +lbPfqS9Fp50O6r0t+/ojL5Tyet3TUsn3BPpQ9B5P+O7cT4fnONzhtZg+BTblIIigT2A
         ALGQ==
X-Gm-Message-State: AOJu0Yx8OlxR4y1WzkJ4OGdpyWv343JYBI6v1EDuyxwOEp0gVFgc22oD
	3tzfW7LNUnWY6s+Or4FNHlAZHxCwcEBiljdaIH3LfmzbUh7gzao=
X-Google-Smtp-Source: AGHT+IEqBgm2LjVIYJxzm7H8JtO4VCPi7B8otV/hieFQza1fVLggbc0vnIC/IgXxwUmecHv9UgzFEQ==
X-Received: by 2002:a17:902:e54e:b0:1fd:791d:1437 with SMTP id d9443c01a7336-20781b476efmr34377225ad.6.1726222536829;
        Fri, 13 Sep 2024 03:15:36 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd48esm25709495ad.178.2024.09.13.03.15.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:35 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 13 Sep 2024 18:15:32 +0800
Message-Id: <20240913101532.16571-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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
Cc: openbmc@lists.ozlabs.org, Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 03de1353ad6e..bb4586563c0c 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

