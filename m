Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AE5D053
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:15:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dPrC0mtVzDqYX
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 23:15:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iNncWwvr"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dPqD2DMGzDqLr
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 23:15:03 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id j6so36853697ioa.5
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0ztf1PZrt5oedAcicUONlFjNaMMVTARFA+N8wrNUA0Q=;
 b=iNncWwvr3JS+GVKMI8sE6eC6JPeOW0+/n7i58LiHB012ztLksHRJlxh3Dx/feaC/c8
 WLDKUGg8QbTbvSU/T7QUCZ8szt5D05PzsX95kpiHiZVQUMqclatZAuKUzRcp0eaPFyII
 GUEEFK5XISpOKmQLQ1HShxxuEOWypcMZgih5/2c/WKpCMa6YuJ/8dyTC3Q2JEGhPFGdh
 fa2PtercOCt01XjTcsrJ+dte3/XLQvFruM3ctguP8K5igwqz458wdgeWwn+YbNLoLRig
 2/zL9MfdnX87SJ5xAJjT6E/Njspq4/rtAFOnwC+4l9xtdn90Jpexxthdt60OOGN/Rz2c
 8bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0ztf1PZrt5oedAcicUONlFjNaMMVTARFA+N8wrNUA0Q=;
 b=RLwsfMrU/nACykv6npcN4VDVr2471mFJkBDk17Oh264CeNLs/2vTimgyHc5EDar6kb
 J1B7QvMLyjGDSUVhGODt80a2asOnriOGy8RAPPZw7GILJp74LWfQ6GjsPv+P1whpX17Z
 U5/PMzhYdOxXOyhH4hbM+oK/4ZV5A1Nnz8yTUsOx0gA3pEW631hdcMrARvjxj0pmY8oa
 BRQK3Fu9KT/zTsQ2nY407kIhneAfHVHFCLcGI3jzJTI9vB+GGxEfx6ZKgHYFKuLWxWbv
 VE7ujiO4Rw8RdC7o3BxVKFfo5HJv9kGpu2IYHzeZGVD4VBcmFUt2nu+/t9a5GwJ0WYbx
 t9kQ==
X-Gm-Message-State: APjAAAW6B+fT31vs8nkYNLzfvyUmcO4w7iiFMP8hauXCLCjlhAydYnUe
 OJVAmXcsSXGrudw5+AOCNkBV47rBa+GjDRAJWA==
X-Google-Smtp-Source: APXvYqxx7+xmweS9/gtiu7nUJE63to7JLzDZUwYe4YWkIkWVeq2Xdqecgw6rkU3/6F3u8u3XKiPu4y4tT5b/AxDTXrA=
X-Received: by 2002:a02:b914:: with SMTP id v20mr35251356jan.83.1562073299013; 
 Tue, 02 Jul 2019 06:14:59 -0700 (PDT)
MIME-Version: 1.0
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 2 Jul 2019 16:14:16 +0300
Message-ID: <CAKKbWA4jw9xiHkfF3bk4KTZPazPM5hb9ZANT6hjZyLuv8DM+mA@mail.gmail.com>
Subject: [PATCH] mtd: spi-nor: Add Winbond w25q256jvm
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, 
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Similar to w25q256 (besides not supporting QPI mode) but with different ID.
The "JVM" suffix is in the datasheet.
The datasheet indicates DUAL and QUAD are supported.
https://www.winbond.com/resource-files/w25q256jv%20spi%20revi%2010232018%20plus.pdf

Signed-off-by: Avi Fishman <avifishman70@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c
b/drivers/mtd/spi-nor/spi-nor.c index 0c2ec1c21434..ccb217a24404
100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2120,6 +2120,8 @@ static const struct flash_info spi_nor_ids[] = {
  { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
  { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
  { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K |
SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+ { "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
+ SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
  { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
  SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },

--
2.18.0


-- 
Regards,
Avi
