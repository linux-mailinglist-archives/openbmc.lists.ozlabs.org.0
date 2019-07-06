Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9948261A63
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 07:44:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hvX41MHdzDqWj
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 15:44:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=nishkadg.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MWBa7uPh"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gskZ32hmzDqQw
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jul 2019 23:19:28 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id 9so5895377ple.5
 for <openbmc@lists.ozlabs.org>; Sat, 06 Jul 2019 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SnNOt2zXGFNIELEcQnQ7yz3b9EGM1OUPYo7bpfq0Rr0=;
 b=MWBa7uPhQPJiiG4LdsXWu1DV74PtmqVMjIdejdxJMvLdMRmppuB7FI9A1uzAKR/wSx
 BD4YlNV3iPW3b3sh5hakELVuLzcQQF40dAh7BmXkKjQGxtTvQHigiPeM0KGf1kGu7J02
 IPS8349S3qI4t4vrQHYs51E8XuUkM6kfkDSJ5LteWL2WowkeCvI5xeE+6Gcbzg3vQhM5
 lUFmvMZykidFK1OFT+HS02FWfCr46bCaA1a7IylbG3/ipNgRYQN2G6GC7ftgLRDBMvvI
 OBeLiiUuU3stC4g9kcAx7A9kOc9iE0YwcGREVhjNgCEujfvqkKs4bPGUCWBb49VnJqHI
 GDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SnNOt2zXGFNIELEcQnQ7yz3b9EGM1OUPYo7bpfq0Rr0=;
 b=mSUNcoa3lLRloTELApjKWUpqXvkgZyJB8VJaZmGdkVsirE0Xkjhnxu7/o5t9BbQ9tu
 gA81j7H+WYQBNR6yWDBzTGZRs9z/uVbL5camJ3qvrrLw0abgR4eenbPS4EeF4C56ucAt
 OuzCJfqyYCW260XqZjGQ4wpEu3V3AcL9h5XmSuibCVCb5YSlT8Wjo84Op1qPUSWeoqFX
 m6hqmVvRx4bBI60UA6fg6CXjypS+88PqcTaeyrHAm5vMLCFJRY1LJDuJz3AHlqrdB9tN
 unIhm7vEh+nyQlEg8LjGYDQvbeoF8toQVxAcsfRlGdoG8TlDXLYnGlkqLyIi7XkOzC79
 LvKA==
X-Gm-Message-State: APjAAAUPQWeqSvaKn3ikzmKDJ16vEIziF+dZv+OkjWoarzJvn+kSK6lb
 MvbLpqfbtU6w/mYrqYye6qo=
X-Google-Smtp-Source: APXvYqy9dzozHCInt1iC7ZBcsFD6SL09tUCt9Bi1ouWM/k31j8u9R19oSTBiK4ygdVEfjxZ440TjXA==
X-Received: by 2002:a17:902:7087:: with SMTP id
 z7mr11325613plk.184.1562419164725; 
 Sat, 06 Jul 2019 06:19:24 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
 by smtp.gmail.com with ESMTPSA id l23sm11471402pgh.68.2019.07.06.06.19.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 06:19:24 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: eajames@linux.ibm.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Date: Sat,  6 Jul 2019 18:49:11 +0530
Message-Id: <20190706131911.3068-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jul 2019 15:38:32 +1000
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Each iteration of for_each_available_childe_of_node puts the previous
node, but in the case of a break from the middle of the loop, there
is no put, thus causing a memory leak. Add an of_node_put before the
break.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-fsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..5e01875082c3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -685,8 +685,10 @@ static int fsi_i2c_probe(struct device *dev)
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-		if (!port)
+		if (!port) {
+			of_node_put(np);
 			break;
+		}
 
 		port->master = i2c;
 		port->port = port_no;
-- 
2.19.1

