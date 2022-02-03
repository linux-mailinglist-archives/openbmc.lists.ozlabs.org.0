Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D64A7EA2
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5CT3B9Pz3bZN
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:24:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GP7Xu0PP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GP7Xu0PP; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5B14z8mz3bVf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:22:49 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id z5so1124975plg.8
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTz+Zb3nuM0Ml5tqTW0KFgwUKo8tuquiqWfmc9a7zWM=;
 b=GP7Xu0PPrPVuUDoCu+EauxaWMOXtKM+TuM1rdENtdoJhyaPJTnJC/y/OX54YXi6Iv4
 kOlzrWbeHD4GSnUNtVaXMcRoROYP+JKIIAP9ln4pYOm3SnjQPcbaYtm8/2r41kCdS8VD
 Xa/lGe+pyKERhfftv6AU8iCmOZ1iwaMnVkj708r0jktX6xV3gKBPKyLGJu/CLOAM7HRu
 2ywnUaLlhD9250TD5T09dAg9a204EU434nlrY0K0jbWF6PTxFiXs5ktlIt+mWyVj4bqN
 PjQDdTY+8OPKkcEgT0OqmrMhOD6hNfqDlvAZzFiJZH+aGbpBK11Dc/a1HBYzEFswC5zy
 v4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CTz+Zb3nuM0Ml5tqTW0KFgwUKo8tuquiqWfmc9a7zWM=;
 b=IdDcvi1dS9uUFE0JJabVxf4RAUgaSzLC/N+IhkvQPSchlWb+EIjij51ief74KnuY6u
 KiTDaUU/LI3cuzdYtrvzgFRwp9ZdZeJptcBfP0z7hwApuGiy1dVdNZGDHppmSE6Wc8UH
 9g9Xxh39exqgrbwia4P/Eq6Z8Kd2GZ28JOzRDbXgUhUc/iXemlQOnQq3yeDywE9KX0GI
 KYAYdfJ27JoUEGhjDXs8N+KaHmC5neDFbWkKcHBRQciIBxXa3WEKbR0KZtUxh89k8vj/
 WXqqmDWcLwJk+91rNUv952TagGG+/7zNeMlmU6Yk9wh/eC9+vQ7AZRktlVzCS8CbiiKt
 Kiyg==
X-Gm-Message-State: AOAM532tGYq4MofSWiH2uaTJsKKuPhZO4x2YN6+maaxuYrScmwkm6kpu
 hffhXb/COF8UuX5C6z7q+Pc=
X-Google-Smtp-Source: ABdhPJxDzWOsRyxe5mSn3a/UD/9d3xuAuJSzJ2mUKRREPvxopLXuNZHxlSaDPRdLr3K3IPX05frTcg==
X-Received: by 2002:a17:903:92:: with SMTP id
 o18mr33494314pld.62.1643862167534; 
 Wed, 02 Feb 2022 20:22:47 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:22:46 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 1/7] tools: Clean up scandir memory allocations
Date: Thu,  3 Feb 2022 14:51:28 +1030
Message-Id: <20220203042134.68425-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The code copied from gpiofind didn't free the memory from scandir.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 0dc3d52668d7..c83e68a2c1e4 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -190,12 +190,17 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 
 			die_perror("unable to open %s", entries[i]->d_name);
 		}
+		free(entries[i]);
 
 		offset = gpiod_chip_find_line(chip, name);
-		if (offset >= 0)
+		if (offset >= 0) {
+			free(entries);
 			return chip;
+		}
+		gpiod_chip_unref(chip);
 	}
 
+	free(entries);
 	return NULL;
 }
 
-- 
2.34.1

