Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E1535A3E
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 09:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8br25MdTz3bl8
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 17:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mfpST5i0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mfpST5i0;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8bqb2D9Rz2yxS
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 17:22:49 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso3627822pjb.3
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRqDksZ3/+Jmlb/KSArXqsGCG5kXbmixg2TUMVa09KY=;
        b=mfpST5i0GX7OhpmjlnZpLjTKayN5weoOTOOqe1DRhGJz4iUre/T145awGqaxpfWKIB
         XDDG4yy1XKYPxBJvgdrgcFUXkBL7m+XU9WD3+zLGAUbOgU/LehSidb/cjHRgorOTVec8
         UyDL+aAMTTN1lLvEIk9n+CLGRVrQUZeFm6OhdTwnWWYocPW0v8BA5mO3TEPlkFEGDAm7
         IXWqslK5MQU5q3SqflHKn2LL5RkFkBlShp+imQ65YgakQMV1bIWzjSKup4JfvPrylg97
         y3v21ycVZRM6SmJcL8SqoLLnUP+Y7MPS3JP9z01FgYjnHu2NnhLmXhRxfIF2peZWhBhi
         +g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=mRqDksZ3/+Jmlb/KSArXqsGCG5kXbmixg2TUMVa09KY=;
        b=UYsMjuwQciViEz0kO4u67Gl0vBlq65t8hlN7tcN3Ap3Ld2GFkBOs5XiUKJv1gEbcbP
         EmgPdm1+2fkGwXMra+RI30mbIzbfYTi4OyhUlCPypeJxqddbnNHUYpp/LOl3JM5Qnzrc
         R0etKua7Qe+jmibwRX2VKmsAw8g92J6RglzRSiACNs+TB6wp/bywyB4L4hBWglvbaU8d
         48F9AO9HMHR/UhuVeIfpzb1opZp0Uj2KcpIVBlnr6+WeJJhSW5K9ci7SBOr0qcuhELEE
         fIBN0XKuQbXG7zSrtZ1ZU5JtXKmen9m8pYfpGgEXqRPrF19U9GXCrlOamkKOksdF9J4D
         l/bw==
X-Gm-Message-State: AOAM5336XqeE++LT9teMlDtbW1ym1RHU43m0KVTmbPZ53fmznYoMuNnS
	6hCY0ckaDJye2WNvUYAuu9s=
X-Google-Smtp-Source: ABdhPJx8fgI3TAX0hvjf0xglr9H65K4xUJTdBbYFUsvqvdZv9jhavIfyzfbfcTYYucGEIIeBHFixUg==
X-Received: by 2002:a17:90a:4e4a:b0:1e0:8e2e:e0a5 with SMTP id t10-20020a17090a4e4a00b001e08e2ee0a5mr6817644pjl.216.1653636165964;
        Fri, 27 May 2022 00:22:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id jc10-20020a17090325ca00b0015e8d4eb201sm2813756plb.75.2022.05.27.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 00:22:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: eajames@linux.ibm.com
Subject: [PATCH linux dev-5.15] iio: si7020: Revert "Remove reset in probe"
Date: Fri, 27 May 2022 16:52:36 +0930
Message-Id: <20220527072236.271404-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit 9f2084b7eb3d8bc99e700b01208be586006a9e42.

Eddie reports this made things even worse.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/iio/humidity/si7020.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
index f0e86bcb7970..ab6537f136ba 100644
--- a/drivers/iio/humidity/si7020.c
+++ b/drivers/iio/humidity/si7020.c
@@ -108,12 +108,20 @@ static int si7020_probe(struct i2c_client *client,
 {
 	struct iio_dev *indio_dev;
 	struct i2c_client **data;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_WRITE_BYTE |
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EOPNOTSUPP;
 
+	/* Reset device, loads default settings. */
+	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
+	if (ret < 0)
+		return ret;
+	/* Wait the maximum power-up time after software reset. */
+	msleep(15);
+
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
-- 
2.35.1

