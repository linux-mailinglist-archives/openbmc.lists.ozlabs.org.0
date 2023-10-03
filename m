Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E337B62E1
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 09:56:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RIGsYtU9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S09BS0wfRz3bw9
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:56:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RIGsYtU9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S099r6BxTz2ygZ
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 18:55:59 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c328b53aeaso4705065ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696319757; x=1696924557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sG3es9LOJNepHfcbLIqaZEQhm2bx01GFyqQ4WaVdb2o=;
        b=RIGsYtU9C7nbxybnD/Q+O7qhMNqHkLRSRG2amNUWR2o+eK0AviAGWfREEPWHEEldde
         vCNMKbB7B1sri0p7M5yQGeHgtV9cqri16YbJMBpyEZLcBNFGxsKBTn5v1ptB+aYbN5Ib
         tUjc1QXDvJ0D4v82b8WMf4M/ouhYqvGPjw7ndT9hjrwHGxZUVXRo0eGEEtSlewfxAQsE
         3JszNeh0hXHmz29ZXm2bWyMTM7GPEEaZnNTQdUUKxkxSDw+AN7jrZsIt8cC+fTyByG5T
         N7Y9P4ccVwySd5BGX8EhoGsL4zNuBtIt68qfjSM5WR7zI8Iikn+gdQwdIA+zAJc/YGnr
         oNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696319757; x=1696924557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG3es9LOJNepHfcbLIqaZEQhm2bx01GFyqQ4WaVdb2o=;
        b=ekH4rPIjKbH+nS9SFQhd/BQka51AduAzNSctC9N0ph8nOa0Cng454m042au7w05Qi8
         hvuzv0GjXaHTTFADgpHgFYtwpmY46LPdjmPaO/xk2IepoEtTFdSCrAWiCjjvnUZYUX2d
         KUiJV5re/15PPEynBVpubcIDmKc61U/XgJAvwnuiDfjVg7S0wkVUVuP7uimEh1Hz5hP1
         8J7zUBUobhWwHfIHJcHDbWbNMqscCGdTH78NRPIeySix5zDVMxzMD0gYzUvF5AraD/JQ
         dXSeOuQc+e1T10FrDrsTRgkULwu6pkYUQX7fmuNYbwFRT0pLgMRHMNJJ3VkdZhcAmqOL
         XQkQ==
X-Gm-Message-State: AOJu0YzLGHUw6HegpVF4c60C38jjynroGdWNr1ZiUSlxFz/OB3ByEu5u
	aVk7BESZeFZQf+tDm/W/4Oo=
X-Google-Smtp-Source: AGHT+IHhmZBOFn6Hs3oxgHYi5uC5mu3CgaLNKzsBGSmH19XKhhnKWblUyoME4YnWdi7174VdRHyNzA==
X-Received: by 2002:a17:902:9b8e:b0:1c0:cbaf:6930 with SMTP id y14-20020a1709029b8e00b001c0cbaf6930mr12697266plp.54.1696319756505;
        Tue, 03 Oct 2023 00:55:56 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b001c75d7f2597sm786442plx.141.2023.10.03.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 00:55:56 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Subject: [PATCH] media: nuvoton: npcm-video: Fix sleeping in atomic context
Date: Tue,  3 Oct 2023 15:55:12 +0800
Message-Id: <20231003075512.2081141-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, dan.carpenter@linaro.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fix sleeping in atomic context warnings reported by the Smatch static
analysis tool. Use GFP_ATOMIC instead of GFP_KERNEL in atomic context.

Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index ac8d73b794d3..5d160978f7b3 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -412,7 +412,7 @@ static unsigned int npcm_video_add_rect(struct npcm_video *video,
 	struct rect_list *list = NULL;
 	struct v4l2_rect *r;
 
-	list = kzalloc(sizeof(*list), GFP_KERNEL);
+	list = kzalloc(sizeof(*list), GFP_ATOMIC);
 	if (!list)
 		return 0;
 
@@ -467,7 +467,7 @@ static struct rect_list *npcm_video_new_rect(struct npcm_video *video,
 	struct rect_list *list = NULL;
 	struct v4l2_rect *r;
 
-	list = kzalloc(sizeof(*list), GFP_KERNEL);
+	list = kzalloc(sizeof(*list), GFP_ATOMIC);
 	if (!list)
 		return NULL;
 
-- 
2.34.1

