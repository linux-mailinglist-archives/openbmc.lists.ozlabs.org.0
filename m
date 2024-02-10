Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD24850C28
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 00:16:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=p6cV09os;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TY3PD1nTGz3bq0
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 10:16:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=p6cV09os;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TXDfM6RxYz3bc2
	for <openbmc@lists.ozlabs.org>; Sun, 11 Feb 2024 02:09:46 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e0a9e9df2dso84934b3a.0
        for <openbmc@lists.ozlabs.org>; Sat, 10 Feb 2024 07:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707577782; x=1708182582;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1QaPWOuXyEob5IK2dCavHwEdoH6YtSk2GJpGvgSELY=;
        b=KlvfFxLEekR/4kXLc9WQ3D6siT6+uKHktT3fzVg4fXAbfTQZSG1qsJGLDFWF5WX/xN
         uwJBfZMaL9ddkw+UxeEl9fc8QT2+T65R0NxyoFllxz+A+gY2XlZLnUy8V4CFO5ukLDgn
         pXrS5g4y/LlA7KMVvGnt2cCVPgecGPJdIuzhT2/uWfRR54GHJOoptlBt/j6uaCL8DWC2
         mW2iGZk+I4OYXVr6HSPN/eHfzTsH7cr8lt6RRBU2ik3MAp0dfvrZ+btzDkTUFiieX2wy
         yV0nOLSO8AVrlDVobKKeVe/0gJLTe9la28OyDNQi1Qp1tER3tlwIQq+38D2lPobriGyl
         nAow==
X-Gm-Message-State: AOJu0Yz1JxzpfalIdPCsLFru8oSPS5Ssc7MHiZU1WXlZmNgINkqN6R7d
	L7VSNqwiEvwDvDCy+mvBKOZF02GOdbQUaDV/Py9PmMCwnCAoHmO8
X-Google-Smtp-Source: AGHT+IEsyTUHG3qU4Yn7ugUfww2m9F1UsL44fJKKGPdKg/28BPHL4fmIvrgXt7VzyeovZ3AL03D9ww==
X-Received: by 2002:a05:6a21:3189:b0:19e:40d8:7112 with SMTP id za9-20020a056a21318900b0019e40d87112mr1863911pzb.6.1707577781732;
        Sat, 10 Feb 2024 07:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVz+eVDf2QrkjRH9PbkRVoZt6Cz33Uy2qYjHWJVl6h3YGdNBHweldCE+2ibA7ZlBw5e2B/4vVw8nbwQS72m8shvtxzjqnX1F8WfOWx7ul/jayv4qXTuMVIHtSaPtFIEUE5DqKjHm//5Wg==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id bj18-20020a17090b089200b0029709558393sm3415554pjb.57.2024.02.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 07:09:41 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707577779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p1QaPWOuXyEob5IK2dCavHwEdoH6YtSk2GJpGvgSELY=;
	b=p6cV09os2arbl8jiR6woLygay+CZTtYMmja+YCLQgNTSDhk47QnFAlWTV+1EC1tioVWtk7
	g6bu+TnaKJ4wdBpiFSeMt5aLh1rSS2nfo/8DeF3SBsUSMjXwpaRi4xcjYL3FB1TK3MFxoS
	wxooKCB7oIzD+1KS4lOHfvKrnsi6mr53owZtTc01PeL1KwqWIKI+Lpnej97mRXL7JEpxFt
	XPJG6f+boxVuayPq79BvFKNYn/7lSTKwKnw5WeE4vXZCkKMvyVtC1trHRTVSPgre/OA3Y9
	nna465EzfP5pKq1HI5Mi9zHkqHPJ/wpWh57JhIELOaKH4y3lcov1M+64uhDTVw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 10 Feb 2024 12:10:14 -0300
Subject: [PATCH] peci: Make peci_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-bus_cleanup-peci-v1-1-1e64bef6efc0@marliere.net>
X-B4-Tracking: v=1; b=H4sIANWRx2UC/x3MQQqAIBBA0avIrBNMK6qrRITaVANhohhBePek5
 Vv8/0LEQBhhZC8EvCnS5QrqioE9tNuR01oMUshGyFpwk+JiT9Quee7REheDUraTw9r2BkrmA27
 0/MtpzvkDNxWhc2IAAAA=
To: Iwona Winiarska <iwona.winiarska@intel.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=O3woKGLAIjryni1Jeart9hOwJG1ZEmeJEcbj6CVWNTo=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlx5HWXzeWYjUWC3gyPmxiPeBYUjpkdgMwR4KjY
 kwmqhCagn2JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZceR1gAKCRDJC4p8Y4ZY
 ptqkEACYh760FzcDVXtJDOPHGR2/2HxArqNC24eB5cpwNwQBObCSz45PVXmsUMAP7n7HUYOGkwp
 cOtsjL6cfUywVIw5x/FhShGiToozgdzBCDXmnS5GeNskcD8O4C69RXRzJPF6k21SkHVk+X1n5KA
 rdammB6VVxv9vb25p++4QxR9QuZIlo+wwAE/GOZKRDtcbNba7Sy/Q4gNOzyqDoXmKPGWAsBMvtk
 ATAHvWBFfLUDqNxEpbUNItC5ypgLCl8izX+vjE5fxuIA+3cTq2h9Aa8dSnL1umJW6XjeIrVeHEx
 3SZsKHfwqRmgZEiyUwdeHDepFChtKYDlGCOEXflP8ppK/ecFXniwNXikSZRD6TdfRtTjqlNzKVL
 ATEFUUAtTFLpKZYk7MOUrK35N9P7fwip3tluVNghHyyUTJvTJ6tShXe4BOZHZKnQn3nbhRhM2te
 YwlViQY1Ne9ITmY0toOXQpIvHTQh+f/7H5ZCoxzseHbuL2nm4WKOj7iR/hf6I4I93mz7+gsljLI
 xRZ1Z5MJrgbf3MgkqxZ+wBiDk/1KKDWPZ04U9IhxUY7lVd/RmEu0hGUb8ezQQQ3hfJpYeveX3JK
 jpgMuaQ3TCF48WRR1xbLxTGyiIvJlBwgeW1G+O1gFm3ta113Fu2x37NHtl6r9Ewel5EY7EhyFCG
 KlLs/0oG+XOF55A==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Mon, 12 Feb 2024 10:14:56 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Now that the driver core can properly handle constant struct bus_type,
move the peci_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/peci/core.c     | 2 +-
 drivers/peci/internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 0f83a9c6093b..b2f8db967e9b 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -201,7 +201,7 @@ static void peci_bus_device_remove(struct device *dev)
 		driver->remove(device);
 }
 
-struct bus_type peci_bus_type = {
+const struct bus_type peci_bus_type = {
 	.name		= "peci",
 	.match		= peci_bus_device_match,
 	.probe		= peci_bus_device_probe,
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 9d75ea54504c..8a896c256c5f 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -81,7 +81,7 @@ extern const struct attribute_group *peci_device_groups[];
 int peci_device_create(struct peci_controller *controller, u8 addr);
 void peci_device_destroy(struct peci_device *device);
 
-extern struct bus_type peci_bus_type;
+extern const struct bus_type peci_bus_type;
 extern const struct attribute_group *peci_bus_groups[];
 
 /**

---
base-commit: 047371968ffc470769f541d6933e262dc7085456
change-id: 20240210-bus_cleanup-peci-0933c629d58b

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

