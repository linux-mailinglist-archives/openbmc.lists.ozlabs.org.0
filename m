Return-Path: <openbmc+bounces-944-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5EC95518
	for <lists+openbmc@lfdr.de>; Sun, 30 Nov 2025 23:06:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKLhh6rq1z30B4;
	Mon, 01 Dec 2025 09:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764435529;
	cv=none; b=N7g0TOPExJK0zPTZM27u5IBIWbUsWYsoGuMUSajDyh1tA4XOy651231p5RpDcNxnjC4FzMYdWj8rJqPx9tK911UY/fxj13TIENb3zvB922Rz7CsbIdGf6DSilTBXSw6TEonXf4OsAIAqRqrcCgLOPGaRW2Vfbg/p4F3dyPtMYT6HjrikUfrvk882sGn/yfHo4ayIqsVvwVPTWsZH6UCfib7fGx5pd+HUW5JlKrdBxCdqd2ZB4lRzVq0g1hNN4avX4Z8ckCb9mICU4+GGrrVySIaxcVpw8ZeL7mtWfW1IFDuglxdVQsC52u42fOccdLY2/nbJZ1jfDmH4vWPAI5/zLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764435529; c=relaxed/relaxed;
	bh=BNQekoeq5MvJ5okU84UxS4oYSbes7vTEJXlQrgYvFfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vn4ahwqDIIAgF1DzuX0bhUu2Bq4+2ZuSKHTqol+CL10VHrFiOuyLi64Q1wnPlM/Wn61sWp4HNCUJKq+zT45nK0RtR38x2JZ4d5eV/I60YppENMGQ36TfeIjVtC1In/265AcEcoUQI6ir0gsvppvWp+oyPRKBuHFwp+Qty0a0agaqc1NXJg6Yz2itN7KEVAUZBaLsMN3qEKHFpS0yhcOphboeoK41ZUp7FhqiFI1JKK1LBnCyLbWRel5CpeMIIRIJdZNGxFS+hUfMlgglg2HDSShnAIfL1xuM3fDMWPwNwHbBH2WUb2mhyw4ZxLvsqDZEE0y3PXZUZp/TJi72M6XM/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UfOtM+BG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UfOtM+BG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJbwS54Ppz2yvv
	for <openbmc@lists.ozlabs.org>; Sun, 30 Nov 2025 03:58:48 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so4458445a12.2
        for <openbmc@lists.ozlabs.org>; Sat, 29 Nov 2025 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764435525; x=1765040325; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNQekoeq5MvJ5okU84UxS4oYSbes7vTEJXlQrgYvFfA=;
        b=UfOtM+BGKB7v3YV9hNfMWfMONUXlBBbY+goDOaGnS3OVe7NR0+IDLsHZwEl6oURjTK
         3Z/Ji1UZFnL1AYDJDydtu8GmcDhUbtGruCJeW3WeLcb4J6Hy0RG7WCPSh7i6J5v4ns9X
         Va1rgvzVPUeO0acMsHLWQ8Kbt2rtW1W+C1wiQI4+ks2MU0bzPUEVqAu9t4ohixZu5ksG
         OTTqG9LbM43D0byCOmdvQ73ZHD9SlBg91eyYI0c1Z/yxY0eJRDYvWe1X9i7qXBb9upem
         RXRXXvr+EVL9nNsME4U5vEJ5iQvta98++xuCJTAFDSHMsO7jr2gJSGcZvsUR5p0pgeDx
         pAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435525; x=1765040325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNQekoeq5MvJ5okU84UxS4oYSbes7vTEJXlQrgYvFfA=;
        b=P4uT1X8RZrOfme9LU0S2cilJYwAEyHnA0grAqdRNzJJj6vNoIXYIIoS4dfh72gkuNj
         cX2DvlF5q7qzoIk1i9RgT3cp04Y2iAphGNCFUxfgp3RIvF57w/cPmuBI/f9C5dmzCQpN
         O1OpUlG20RjR+WZwaJrhZAuxNLHiLDmlKj/IPFtnFFoYkx70dJOth4pWRtmoihQV4B15
         4JG8vvtniyYQReOilRVeQUI06ksUGfNbc8YbcKRhKvfauOekoa37D7GJQ8XhD+W9Vae5
         MpXJeLyvDLGmMK3UvUo/zP4leyDff/Ttty3xn4DGgJAVPRJCNirzetScXmOzT40yQc8b
         mvMg==
X-Forwarded-Encrypted: i=1; AJvYcCXMicPctNbbyV3pbANhoZE35s1/sz7be8R2IH+nYe6OVckulFCMQYHm4bDjVtw8GdGfGk1saqOV@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJwBrPJjVTDe6Wi3N4FmOMY0dvGHR+o8jCEopCt4oCdWxjhPuJ
	48QW7hKzIjhzcCG8l5qI74z+yq8OT3l/h4H2cghnxQL2syRNB3U6uBzV2DvZ4G4ov0U=
X-Gm-Gg: ASbGncv5gjsTN1zj8gKzhsPfR0/dfJrX1219sMHqZQrSgFJ/7A2FL9+FALYCVDqvbgv
	VdcpptE9W2sHA8tqPqrwsAlX4h+BjkbghER3BGEvsk9hzcGNjKIWPVjx9f1SLlIDV/rFMYZ8dzj
	M7DMT6pGDPr94XxTDgisAZ19/+F5nlIqM7/zo9VgM91OMasJO79Iabf5LqR10Uwz/VQg1fRg/Q2
	g1jX/bcWgn4jODPZ2tr9xFYX+ae+xa5dJkJLPbXEHbeMpj1DUE+9xgCMEEOiQu4CEK8LvOx0epJ
	Ntei5HiaG1rDFwnJe/cRA2MyRsMr44Vto9aEVwGKFlTzyH4/NF4OqiFTyYi9zAhvxhQXDO/rFiO
	IHQ/4GBRy79+TqTsQXnnOob6yi7tBJcyKbL4YKnfP/ouEcDxgODldGHT19yXjjIb3+lTKvSXwL6
	CvGOQ9QwxXO3/ot7kA
X-Google-Smtp-Source: AGHT+IH0MuHRfQrTehiJ52oUZvyc1bRjVVlQ90Y5BVCZU/AGDxq3c6qhZBRECgPEx5G8y1z2CMPY2A==
X-Received: by 2002:a17:907:a09:b0:b76:7b8c:a6a2 with SMTP id a640c23a62f3a-b76c5513f0amr2236776366b.30.1764435525382;
        Sat, 29 Nov 2025 08:58:45 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f519e2a7sm746363266b.19.2025.11.29.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:58:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 11/12] i2c: fsi: Convert to fsi bus probe mechanism
Date: Sat, 29 Nov 2025 17:57:47 +0100
Message-ID:  <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764434226.git.ukleinek@kernel.org>
References: <cover.1764434226.git.ukleinek@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=lFoITZ+8y9h+znHwjqA5lzaUXuTbRHz9vr6xKWUfQoQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpKyYerMbqnhdrESWnep/VE+BwW0xpjbtreFxEN ucImWFZ8nSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaSsmHgAKCRCPgPtYfRL+ TonZCACcm2Jdwaa3XVZ2Cp3JYYBZY68UG0Sf3G/dj+JWPDhCBlZ+/+v7prYyU4O3d63j5jPdYaY EHU3cy3rKORxvZQ7O3dHJ8Q2skeRpnrR2wTftedZVfUPNiB5jYlJKSe3sx3ktLQbThCQ1z2Zbvi l3lkI4FFBwsAaYkhjWjMj3y3qF+uJZn1qQdQSZZsqQwJFFf27tnOaNp0FRCvfmBqGmdpuMEMr5a gc85eibDINIZDLq4D+16foZZgOyemHYvJKOMt5G438IZ32J4vutnfcPLxCpIxrHsLlkcUkrFaJy CKa7WQj6VFAJxp9cuDEC1oHlZC7RgE+vdw20Qp5r1jOx9j+O
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The fsi bus got a dedicated probe function. Make use of that. This fixes
a runtime warning about the driver needing to be converted to the bus
probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/busses/i2c-fsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e98dd5dcac0f..3a7e577e6eac 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -674,8 +674,9 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
 	return NULL;
 }
 
-static int fsi_i2c_probe(struct device *dev)
+static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 {
+	struct device *dev = &fsi_dev->dev;
 	struct fsi_i2c_ctrl *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
@@ -735,14 +736,14 @@ static int fsi_i2c_probe(struct device *dev)
 		list_add(&port->list, &i2c->ports);
 	}
 
-	dev_set_drvdata(dev, i2c);
+	fsi_set_drvdata(fsi_dev, i2c);
 
 	return 0;
 }
 
-static int fsi_i2c_remove(struct device *dev)
+static void fsi_i2c_remove(struct fsi_device *fsi_dev)
 {
-	struct fsi_i2c_ctrl *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_ctrl *i2c = fsi_get_drvdata(fsi_dev);
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
@@ -750,8 +751,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 		kfree(port);
 	}
-
-	return 0;
 }
 
 static const struct fsi_device_id fsi_i2c_ids[] = {
@@ -761,10 +760,10 @@ static const struct fsi_device_id fsi_i2c_ids[] = {
 
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
+	.probe = fsi_i2c_probe,
+	.remove = fsi_i2c_remove,
 	.drv = {
 		.name = "i2c-fsi",
-		.probe = fsi_i2c_probe,
-		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
2.47.3


