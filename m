Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F21296A3
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:48:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hLKV6tK1zDqM4
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:48:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gjmg5fXE"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hLJk32phzDqL5
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:47:49 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id l24so8865338pgk.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4NxNni0oSXUitae4PPfVoUS8QCU/WmNzH4JMKkeHPg=;
 b=gjmg5fXEz3BlKffuSk330Qy5GEy/NLansUovugDZ7yL7DfS8/+CY7bSS/MQ0xd3pv8
 uGc8nbnQ6Iqn+y6Sj11eYefh1MIsSBbMmJ29/uh+yFWPSMehaY0brMlTz+36c4BhJwnX
 FyPGbJm2zcO556VLn9GGG5GEDwspqIWMwlcBnBrC3pNofr0isu5yeEYkR7YtSuc6i/si
 tpxzfjJf6t3mDyU5/QeRb2EWxRVj1ZbkYGs9kPBLF8y56VfTL3wuNFW54iDxQ6Xkx7/F
 Ig3VJmUIAKmod4/lb/SuzayCF2bdh2WuDzn3mju3PT+Ks2i2B1q/cC7/hk9HIhXbT2ea
 uW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=E4NxNni0oSXUitae4PPfVoUS8QCU/WmNzH4JMKkeHPg=;
 b=A3kEoE5pZPbde217EGaM6DOlPKtgDuKb1Pq2y7t3BI0Tl5YoIY0MkWg8OzOrWBxDgS
 714vPwFgq6gGSf9fJAlllrdvJw0zUkcJ+OpsOCxagnbX5C7p0FscsG9nliUNUiX41SqJ
 JS5yKZh51ZXmaSC06WLDH8dfPx2zqCX7sV+05ZdCR+k43Q6JOG5lgjbyxLZ/ptxTpeMJ
 0oTKLQE2RHD/VT9zcC+v3LMTjn5YtqoXLuM3CG6bThSvBMuytNDnv/Qf+m02FkVXb9Ua
 sXat5dOwIBLkDHyqLYoMdoJC28+g1b1amt6RqeWL7ksscp4hQ/p0O1Msm9MNQUMql8U5
 450A==
X-Gm-Message-State: APjAAAVUAEu92n0BWL2ZT46oQ5xFhoJRBZaVyQBAAfcw2uWIWhUGPYkf
 U32khsFS/zL6pp9M+UvB73jZyKRf
X-Google-Smtp-Source: APXvYqyNZ5H0HNWKT9q6hu+cWk189cjD0brDkYhDJtdJzhnKE8ppTTxAHS0MwkQmYRqxLnYQ4aeuWw==
X-Received: by 2002:a65:4381:: with SMTP id m1mr32006802pgp.68.1577108866215; 
 Mon, 23 Dec 2019 05:47:46 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b65sm22988588pgc.18.2019.12.23.05.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:47:45 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 0/4] ast2600 device tree fixes
Date: Tue, 24 Dec 2019 00:47:31 +1100
Message-Id: <20191223134735.559200-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here are some fixes for some issues with the device tree.

Joel Stanley (4):
  ARM: dts: aspeed: tacoma: Fix fsi master node
  ARM: dts: aspeed: tacoma: Remove duplicate i2c busses
  ARM: dts: aspeed: tacoma: Remove duplicate flash nodes
  ARM: dts: aspeed-g6: Fix FSI master location

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 403 +-------------------
 arch/arm/boot/dts/aspeed-g6.dtsi            |  39 +-
 2 files changed, 24 insertions(+), 418 deletions(-)

-- 
2.24.0

