Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C697A6E6D0
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:49:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7X13RhKz3g88
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:49:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742849955;
	cv=none; b=AWMin27bOMwqo4WbtkWt0AYsTG/Wv2ZmC1VfJajUdnSOy1tPgvBXhrE54xggDnRiJbXhR6IBQLlf4iqSo5lr8bFvWK1ih5tVBbhCCd6htXS9x7WNaS0cSF6a7OxcHC/v5meKkOAUXxiRyYltOlnZZHU6ZXdGbYmaBcLaZPy0Cp0vVE7n8B2E+ti8ldf02KYwnB2RE9OB99imvuvAOyqOC6b/ddyRtC3Bw5ADXcK6QsMRggaHLd4cWNF7yc5imIMP1obojb4+Q/e+cSC6G2Kz1ojW+htiPqt1pmox3XoSFle+oQyen+/2UGbiatKIUG6L2J/8xaLGIHqN2BO+yVhkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742849955; c=relaxed/relaxed;
	bh=iRDcngEUjIrRz5dFZAAL9+m4qEIjY5kJnMxmUbBbxFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/ghYdbXZe8nptlL2mbr0y9n9xndcVd7sdoGSHTF1q2NW6GKcI4vFIufNlVUMYsTArQf5NM1IXbCIR4UX/h6DyL/ofi8Cn7Jg6eFJZcHOeqlYdgUt98W+Z/1pTdoE2S8AunJiLPbktpaLELdiMJ3Lcr+WaNsKwUyBTj9v1YdSg0WRDb6MpKHEiuj3Qie0niPKrbJMjz3XS1AipYLK8KpaED7wBr2GgS3EDqoLYo6d+JBrOXDRmSct+OoRWzjuOmvQtZKUd4G6X2uSMdqeoUg2GDHoT1kq4rlhIADpuOFTwBWNN/HSxIWIEtGk9taeqt36cDYmowz2+EghJXjvCWrNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dnu3Kdiq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dnu3Kdiq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM55H29x4z2yqL
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:59:15 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224341bbc1dso92144395ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742849953; x=1743454753; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRDcngEUjIrRz5dFZAAL9+m4qEIjY5kJnMxmUbBbxFM=;
        b=dnu3Kdiq0WeUowI2AU9nTMotk6WjNJId5KgnQKBIHoPmbzBbeaEL0UQepbNZ2WHZPr
         rMWOhIPrjJxLv9ICwMP+rnt53Tv7IGycIRWegHxqb4elCEtvSqlHqf2vOcCrPdP99S3T
         8O6h4nEXfExizAQXrSRq2j1WZC2VHfSsUhOGx9hJ8bZZJEi/eJnpKjDOD+8cseCZW9nn
         VK/mlGTBgDeCXqM9n/hZEaVryyeLzoUcL+3P05lRPx5l0Q+9Ut14Be+eQYO9pQSsiXZ5
         l5sNijDY1Zz0dg2UEbGZ2J85uMZb7OysPWYKSTat7ccyu9k/ha4UVFgHfOH5/aGdceap
         1WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849953; x=1743454753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRDcngEUjIrRz5dFZAAL9+m4qEIjY5kJnMxmUbBbxFM=;
        b=X5skY0wilJaHfU+bsFi6XLquJxMVb7NwVF1Eso7Vv0PO1AlnvQCBW/w+2zumTgUW1m
         yqemvq4JBo/nD4oehCIWtN91HVzm5gWCfbl+AJDkHDysG9BETPyu6OfO66CIjwDRlO5o
         jQNV1aR8Ft3clqsOfBivh8dIE10BjLlGpRt0MBlQt2SVRlXgwhwzq0A14VD1mSb+3/ce
         dPZAIhidIberwvfiy4wnrFkj9owzm3iUR+5bfIidJg3cMQiVIDd9iIXLL+vyTY8JKrxa
         6+jwXlusTSxoZjiiXYyMUtIFwD8DMzLAkchDN+b2InmtwKBYtnFk3clNoYuLI19/ztEi
         NrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvFkTlgoruCmhNFJb91EpUwRMk9jIrh4xhGrnw+GI7NLE4FoA0U3svsQqJf9ctvlDvSa7Czq/p@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJLi9oGr8MYxxfhRnz+oOJEgZSsJ47ny55i69pbLt2m21QhSLK
	W/7sy8tQZtpxTSP+42tX4/qSQxo3c38iqww2j1sm3pivURVhY8Ra
X-Gm-Gg: ASbGncsBOk0LF82zdvxM+FIrgtSdfox5j0uERxYTUEz6AvAiMZ8LZfG6TDD4FwyzP1b
	vNWbuXT+K3vvKqrY3ymyI+eUMTYuhMsPPFi45yvfh/+mU1JK3wQLxpKFZ857qrXr20PZERCwhZU
	BDPakcxB3qhv+ADqHJiz8v3RHVz9uDtC8c7XYrR3v8J0/Y6XJI22Xeq6z4wHjTjt2/LsVBf6mMv
	PhqmkCSFfdKazNpGGTkkmloSJZu6EYeIFeFfcq8w8Q+8fkprU9aZWmEbx0NSDLD+3TRDeg3lhcm
	yLelw13BJya1Is9/n0qyXI5z+qo9dg5tHqfTxNuaBqwxX2yZE3HMsJi+zblyZ+IYvL884Ta44c8
	bYzO5Ed0HYleeWG/PsJXjgSuFahftNFs/ZkpC0Qz63A==
X-Google-Smtp-Source: AGHT+IHkr2sTzQNuh0LuuVwrL/ch5KdFMGZS1R3V3qsOxZmXsMv1kTGG1KRM7YCEP4lJq/mAzF1wCA==
X-Received: by 2002:a05:6a00:1886:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-7390596681fmr20612552b3a.2.1742849953101;
        Mon, 24 Mar 2025 13:59:13 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4e8d7sm6537479a12.72.2025.03.24.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v2 1/1] i2c: npcm: Add clock toggle recovery
Date: Mon, 24 Mar 2025 20:58:59 +0000
Message-ID: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Mar 2025 09:48:45 +1100
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mohammed Elbadry <mohammed.0.elbadry@gmail.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ad6124be80f..78c85015d955 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.34.1

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
