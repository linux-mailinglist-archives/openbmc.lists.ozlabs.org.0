Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF787FAE1
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 10:37:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+P2uMOt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzRTv1Fx9z3dVX
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 20:37:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+P2uMOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRRC1cRmz3dRm;
	Tue, 19 Mar 2024 20:35:35 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dddaa02d22so26716015ad.2;
        Tue, 19 Mar 2024 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840932; x=1711445732; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e94g+9vzH11aUQZhgMcMoQcXNPU48KmdzBLfG1dsEIk=;
        b=X+P2uMOtYEBltQxF/tmDLp9XzQywUfZPx5b3C/Z0ZCQdCjhQqAtKZJVaKVF/Qp8Oj8
         wMNLeETMetK++FDMAzD7DMTugFnXGN+iiQTbnIpFEtXG4YlQnuLHhQ2Sx3+2Ng7vRJ2C
         jKf4AVgkOfhXnb+4QYZfbrEDpigkRkLB0bqNNRKt/7gJLmhrK2fkfGZIuMJsE663TRHK
         ZelZj/ulMWpv40Ob44W1OLcxx8SteQQ0sSYNoOFZ83DMA6DKNop/tSXEsGQMXDNRT4Xy
         RcDYjJMk/mBfaV2Jkp4UGc6PkuAJyziwAHMtRoWl73EpzOpzES2bCgs5DJsoUqWr5c/E
         tE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840932; x=1711445732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e94g+9vzH11aUQZhgMcMoQcXNPU48KmdzBLfG1dsEIk=;
        b=wwHeQBRAzMQNgLjV+iNRGCphkm6h4fUgJD8v6C8s25g14I8YiNj7SUbTLXa8qi+44/
         GEYNE7pWwGZ8+fSUTFzUkEBlYR8Ix4GKgYbK58PmiskCVZe34J70drDFrnvvkbh68J//
         kxDm009EwgV67EOImoGsGo7QMfpyfnvjL3rPBhc7t8GeMPtTQjNJyg6EGSgcQNK1c5zf
         1xRhyG7VucjnnXKx4M1CLJHWkfoF7mM0UDcDgIg3aBEps9t2eidlyrV58EWqdXIhrf9h
         rabletGkt9FQyPfIXP/jqOJABLKJEjyxJqyPa+73klOpgKOvFdOpP7nGZuT4MCh5E9OT
         uwvw==
X-Forwarded-Encrypted: i=1; AJvYcCUvJYnxZxsMUYvXHm6OjQho930wgMnxGBrvxUCXW4HXvuLe8TcDMpL/mujC8PrZjJwD/YMFO6CrgqOFtvYmhJdw1thxwbea8u+12lM0FIVIZdICmLHrSGOR/3EYpDG9TxPUid6PtKFZ
X-Gm-Message-State: AOJu0YwgLe3dQcvixq3QtPOVVbJxF1hD5P/2MNsPy2727taCYLUxAvb6
	pA9skA6VgY8e/88WoEg9yeYj4LOJu/4FqpIUdFoc8Ob/yKp02T+X
X-Google-Smtp-Source: AGHT+IGRQerkxhBoo9SgQmB9rahSKXo6Kh9y5bn7m0LW33X3wWAr2V/9ZSigvft5pwucY8WqXpU8Zg==
X-Received: by 2002:a17:902:ea08:b0:1db:55cc:d226 with SMTP id s8-20020a170902ea0800b001db55ccd226mr12398549plg.66.1710840932208;
        Tue, 19 Mar 2024 02:35:32 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:31 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/4] mtd: Replace module_init with subsys_initcall
Date: Tue, 19 Mar 2024 15:04:03 +0530
Message-Id: <20240319093405.39833-3-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, manojkiran.eda@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

While engaged in development on the espi kernel device driver[1],
I noticed that the espi flash driver, utilizing the mtd subsystem,
appears to initialize before the mtdcore subsystem registers the
mtd_class. As a result, although the mtd device for espi is created,
it does not populate within the /sys/class/mtd hierarchy.

Given that mtd serves as a subsystem upon which numerous other drivers
rely for infrastructure, it appears logical to adjust the module_init()
call to an alternative priority initcall, subsys_initcall(), thereby
ensuring that the mtd core subsystem is probed prior to the drivers
utilizing its infrastructure.

Although this adjustment alters the initialization ordering, there
exists a slight risk of uncovering implicit initialization ordering
issues. However, I believe it is preferable to prioritize it reasonably
rather than having module_init() in order to maintain the exact old
ordering.

Link : [1] https://lore.kernel.org/openbmc/20240213-espi_driver-v1-1-92741c812843@gmail.com

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e451b28840d5..cc51c9fb2c1e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2560,7 +2560,7 @@ static void __exit cleanup_mtd(void)
 	idr_destroy(&mtd_idr);
 }
 
-module_init(init_mtd);
+subsys_initcall(init_mtd);
 module_exit(cleanup_mtd);
 
 MODULE_LICENSE("GPL");
-- 
2.40.1

