Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3ECEAA65
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:38:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Yyd0lxZzF5ZR
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:38:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JiSLr8s1"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YwV6W5RzF19q
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:42 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id x6so2158401pln.2
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FfnlzU9b6Vn9jcRfjBg4FygqoEgW+rHKo9bjoiWYTgU=;
 b=JiSLr8s1845pyq1QQvmqssh6OOhzgefUPfruHXSdIS6SFVD9nbYp9tUHSCidN4pzgD
 Hnga3UAhjhJRR3nMopEdigzHhVVNpW5WpFODFQGyBm4SPbLUv7I/5D8mLlbLn8/SNUaH
 YGcBzRSGLRtzqbTf6WQD2riuo6u/3XPXM507OMUIkSS2uWlTrhDg3Inx8MzI1YJY1wRs
 e4lYsUk3yNgkujWawvT2lm91b8wYoM7vT057gA0QgEkgxf6JukoPwEHDy0jaNUM4bo7i
 xZYc80ysoueI9xkzCAUTR1Mbz8Pnw7Zc3PYgS/TDGJPy6eyICSFXwd46xwmjfaawIgSz
 6HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FfnlzU9b6Vn9jcRfjBg4FygqoEgW+rHKo9bjoiWYTgU=;
 b=rp5Q/Dxbvo3j/+CTV8zXvUedRQ5IJdEvY7n0hche+DHIYotOT3y10k/X0+pkP0wsK+
 vWBNB394KhqN6gjERnGygvTcJqfRvnvtEfe2y7FTgDiBmG1xXOfexjFrDdK7nHYYoi7T
 7nWYjYHiWekP0WoT23wrUA4jBf+KvMn5pGTTBmULaBeVoryVkDt/yYtKq5rikDnZj+6h
 7xQYYAh2oG+yJxS9SG8c0v/N0R4z8eyWA3BkFSa07iO4aUPmsZbU58w05TZsx9k0WrSe
 /olLX3sRQ0BXSNBIqszKBf2M0VEb3KzLHa4MAAgBZN0zuu4JITLdM62DME2L8Hfz+fce
 d+Ew==
X-Gm-Message-State: APjAAAWVFghmciH1lSkamCNlVD7MDaVD3eGA4tOrLjAXJnAUZKDUNnVJ
 KSP6X4bPAVqE7mqfDIik+TrlhYztwo8=
X-Google-Smtp-Source: APXvYqxo4U7QaAnE+UNIP/6i6y/Xi+VySoWc+2PNeB8CqEHMj9ivlDEsBgMMcZ7EI4RE+ON2iYRXGw==
X-Received: by 2002:a17:902:9f96:: with SMTP id
 g22mr4211843plq.286.1572500198631; 
 Wed, 30 Oct 2019 22:36:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 0/8] fsi: aspeed: Access width fixes
Date: Thu, 31 Oct 2019 16:06:17 +1030
Message-Id: <20191031053625.422-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
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

Here's v2 of Andrew's series, rewitten with a different approach.

There's also a collection of cleanups that I've been carrying around for
a few days. Notably the driver is sparse clean now.

Tested on Tacoma and Qemu.

Andrew Jeffery (1):
  fsi: aspeed: Fix endian register to enable single byte reads

Joel Stanley (7):
  fsi: aspeed: Implement byte and half word writes
  fsi: aspeed: Implement byte and half word reads
  fsi: move defines to common header
  fsi: aspeed: Fix types in debugfs
  fsi: aspeed: Fix link enable
  fsi: aspeed: Fix whitespace in check_errors
  fsi: aspeed: Use defines for port reset

 drivers/fsi/fsi-master-aspeed.c | 247 +++++++++++++++++---------------
 drivers/fsi/fsi-master-hub.c    |  46 ------
 drivers/fsi/fsi-master.h        |  71 +++++++++
 3 files changed, 200 insertions(+), 164 deletions(-)

-- 
2.24.0.rc1

