Return-Path: <openbmc+bounces-943-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E551BC95515
	for <lists+openbmc@lfdr.de>; Sun, 30 Nov 2025 23:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKLhg75p4z2yxl;
	Mon, 01 Dec 2025 09:06:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764435517;
	cv=none; b=cyvIMr6Jwcd2KTr11ozFrsoaRBnyOYW6saYyAx3yMznVWQomEowF7kmIuwRIvLFSA/natOAFACG3AKnyf/iGb6/+Gx6GQGbeMSXfmswePIyH88Hb/AmsEjuqIaf2XJbHxZ7z5JJKXq/op41IrtLCd/fefGQ2iL1+QtNBh4jusdWR3SBW6/63SXD6ka05+0ovIHzfWw/9kx9ow3g4vab+kA5l2q5wGrnkm4xfjZzcIY0guXS8rBz5B0Dez8YQQDPYI3gB8pCvd0UZS2zT/9htC1N7qOscAX6QT45HSy75F8zXYRca43NXMS/NpBoapJXtohkxO4vBkAhemhQ/j02UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764435517; c=relaxed/relaxed;
	bh=Gr1otfYaqpnm7bjSkZRheFMZkv0FIFM3TuO+TEbpsfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyxGyi+K7OzVENYEoKzXpoutaMpqAI96oLcPsvEqb0lnx1m4AS+anDeGp+IfkLvIbf0yfXUUQd5SGuAMb7aH/IDip+WtK5l4Z3+fV2DHutODSOicyoIrJMhCuJaXsgM13oT6ArVcXqP8RbYuFgVD0cJOY/LqGSBMIKAO2geASM82z3uaXPdSSOnq29BZTgfVC1+w+C5nehx2tdgbpWAbdeBeMhZ2bSXaBQyFRhCWWFBR6F+lis+6ZUDUTDzu4WFzp1fyWzyEQ+a+eQ/IMEPpdGEq3tPy0Q6xd0yUDt8p9eqPLHLZOi8USRhao5YyxeiDANJzuMkoWuTmqO5vblm57g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=G2E0v82m; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=G2E0v82m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJbwD4w0lz2yPS
	for <openbmc@lists.ozlabs.org>; Sun, 30 Nov 2025 03:58:36 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso4995331a12.3
        for <openbmc@lists.ozlabs.org>; Sat, 29 Nov 2025 08:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764435513; x=1765040313; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1otfYaqpnm7bjSkZRheFMZkv0FIFM3TuO+TEbpsfc=;
        b=G2E0v82mghepJc/AhMslvFhxDFwwJJi6cEABuhZV3uR0kPNuN+AsWyER05t6Lb9b0o
         WrrNPYHfCAY32bQa9gIiA6xv8ka6Nsbp0QqCdYE3/24JoeJy2TjOWvh906QoFiazFtiV
         kTA/89z/YuWvui3b4S4PjdudwIwu8/5tPlo5TPliYtI6Q0fkOX/b1LaQbPdAPZ1iKvuG
         pxk8HVNRTaFeGznVpJQQp4z7pdv2SFb9ANEA1xemtczZAQ/J1RjqbOjrDUiULvVk0WS6
         5T6jxFAD2wgQTiibmepfA5NcR90YZKlDgXAm9kOx70k44QQ+rfOJLPjS/mi4xMXQTtr3
         uwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435513; x=1765040313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr1otfYaqpnm7bjSkZRheFMZkv0FIFM3TuO+TEbpsfc=;
        b=PMhxTP+mnCaoRr4iTsx2mlgCl+Xyw9K/Tdui1KY/iTPn1tCtzUQ+5s9RPQ1whzolaD
         FRb0jCHYvC+5+qbcGaUwtMBxW7MTv1z+vLxmxYBhImupRr1OKIbT6RtKCupWBuhBdFEa
         6MFvUoe4JsVdK1YtwYrS3uf6dPKW/YaSPY/WvfDqemtTEq+qwmCJ1uI1laOAYtHsI8TA
         7aygpbYRXZxFELYeXrrgcaDLJfegbooGauLzt/UQgkpFf7jV8PKuspoeWIL7odVn7MYk
         3I/O76VV7BlcXSM11oQbeFODv/WfYHE7LC+3FyDW/53/78x8NvzosplrUGHaGo6NEnuz
         12kg==
X-Forwarded-Encrypted: i=1; AJvYcCXwmP/MSMo7VcLDdi75pOdB4haT74xZOVoFlzmbAlmNHob8IHAL+KYmNswatvEhQAWppVUNvy0n@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywd3yX2iEx0+3RdtJ+nsOeJE5pegeRDANJnPLe3ar3usnfAFtD5
	UEHGth22jHejRXeL+toYtqM+Wau+qTLiOQJ+yk53H0IwIlCxF2+15mZrbc+vlrShdEE=
X-Gm-Gg: ASbGnctHDipdRC1xywpV6E+2Jc7wHfVl77wZbQ08gUHF01TGDS5ecGULyaw1ohEq7Fn
	HpK5QJYyuD6ZFkK3dvtd9fD93643EekHjiLBxMNVyvodgad8S6htzAWOg+e4ySxna18rQa6/3Tg
	crgdb3NS9Au0rMfK9A0QhU1E6VfGjxocMnaVTHWkUqVZGQkyig49RIsBs7/4uXNQ8Rk5zxuU8VV
	cYgHoHOEspVb5vx8j5MRJj5yTNk8mTmvrfnbTaLpOSpn6HufjCOoYhxRPZz3hd14gFHNwjsLfou
	pEPqlqvwwUcdpnr9P+7tr28Wjriek+oD8dfWKyqzxPz/Qf0X+AeGRr0Udt7Bq76By8D1XoGJA++
	qP03FW6vILBuINypOOYzXuKa20+GmTs2NlSu89P1BNmzQcyW+DWTjeqGBCDhYveU1fkH+4U4bPA
	JWzu1wqWmiUX/kZy4Q
X-Google-Smtp-Source: AGHT+IFKnLXqE8LRIlt2QVhHOKoMN+oTpxrL+57F7QBEnjRT27+V6LIYdrwq+mi99tb4ALfJSxXVkw==
X-Received: by 2002:a17:906:f34c:b0:b73:5db5:b6d9 with SMTP id a640c23a62f3a-b76718aab35mr2340211066b.55.1764435513394;
        Sat, 29 Nov 2025 08:58:33 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4a652sm742627266b.65.2025.11.29.08.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:58:33 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Date: Sat, 29 Nov 2025 17:57:40 +0100
Message-ID:  <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1VfHxw2ik6pzPD8vLs+mn8BWmuJDAturdWzRRyIrqd0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpKyYN8lBrGJpOMDv2bj2UXkW6vOeHEDQSWIxFR +fQY+otSveJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaSsmDQAKCRCPgPtYfRL+ TjqhCACJ26AKCTEQ2AdYGn8TW4BjKP668+yBDwJOS/VEho+vaICy9AGZPulA2zsc7SyxgONX9UQ WByf2w5LQ1eNkxcYyKRqCPaG2XJZ3KrF93BTAD2LOt7OcwuD+1SDMMvoRY33JU8Lx9T8/2x7U2r dsLH9479cCnr9qM9gw+mt4en/auHBnxLEP1utO6n9UkLIPTFenquh2ydFCF8mRHq3082Lrd7G9B h8hvNdEtNYXz1+e3yguVT9Wl3I9PkXpl3/KPgqt6EXXKe93KiMjm9p685un7xZxJ8zpH/wdK18j n3RjFo1f2KA7qNeCBuBr/tdll8V4RQIa9tdBGt2eDa/BtZPv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
module_fsi_driver() cares about assigning the driver's bus member. Drop the
explicit driver specific assignment.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/busses/i2c-fsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ae016a9431da..e98dd5dcac0f 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -763,7 +763,6 @@ static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
 		.name = "i2c-fsi",
-		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
 	},
-- 
2.47.3


