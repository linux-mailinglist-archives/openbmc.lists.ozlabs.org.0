Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6AE1202
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygG05vFQzDqQd
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 17:19:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ovTQUBng"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygFB4J69zDqN6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:19:10 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id f14so11482233pgi.9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 23:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weUcViAteriQHQBY06gVyZNoeX36hm7taPyYoJbopXU=;
 b=ovTQUBng+uUGXrPy1BxaAKcDq/Tyw6k/zzuCuaY0ZtZ1RxyLuhPv/WHFuRryJ4bOXu
 f0+7uhyNgJH09LV/T44kkPuDdIeFpJ7EH+tlfz9OvW+1ic/0Yn/yFlRFsr4wAWWs5osc
 D3AZTyPIKd+BScKPAY+wKlY2zkn9qwLycAS4Bi29AvPP9KF3+Z6awF7nGTK1EOLMakRN
 Plaov7/K7Xgl6lSk3i2nEiJxJKP6Ev8J2wgq0cRFo7VfLZQZN5PhRqwGtYxZKA2eXq6a
 kpsdwX3peIhXtcv4/6huy0nGsYqxj0CZ1FY4QZprefNyKsd3ELNH4qT0KaFDevtZwYKW
 vpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=weUcViAteriQHQBY06gVyZNoeX36hm7taPyYoJbopXU=;
 b=oFmfquVw93/LQmy+X14LWJZ7fD/q2eUZmYuyeZ1foRnfOZ5bg73A/zYDy+omg1nLhS
 MkrUNiLfvm+kCYnqdDPEU+9c9H4gKA+NBUOTsB5uyyfjYpX8Y11qGO2krG6TSW1S63Pv
 QZ3glkYdnIdF8cRSfrWxPs1HiqfW1IZ6tD9fTG1wG9fYJRvY7q/zdgGBW78na8yIstF6
 botxHqi/pouvhbb1v1P6uQ2GjVfNpaHse+fMaJuwmhoX9yRJ+cK0LBQWvmsRJj8tpeGc
 H1xB2IrPNLD2eWlEX/u/qpReXzVb8W1uPEh7o/PZErsvOhIop5eg2ptWfY0F/MMvvcri
 CoUA==
X-Gm-Message-State: APjAAAWGTceqGzcE/eHNoj0VT5bolxRDyY/P4K+2YuwQ7WjAhSRIrmMm
 l+ups7YwQA1qy0yYaXBvMiMUOBLQ0FA=
X-Google-Smtp-Source: APXvYqzqOr27FfuPZCovIz63S+JQ0+94lVa+5ZpkYYi3zzLFuFif27BlmQmm3FH41q1RtLHj1nJrZg==
X-Received: by 2002:aa7:8b4d:: with SMTP id i13mr8851371pfd.29.1571811546657; 
 Tue, 22 Oct 2019 23:19:06 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 4sm6364598pfz.185.2019.10.22.23.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:19:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/4] FSI master improvements
Date: Wed, 23 Oct 2019 17:18:44 +1100
Message-Id: <20191023061849.16926-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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

Jeremy Kerr (1):
  fsi: aspeed: Add clock debugfs file

Joel Stanley (3):
  fsi: aspeed: Give read longer before timeout
  fsi: aspeed: Add more registers to debug
  fsi: aspeed: Implement byte and half world transfers

 drivers/fsi/fsi-master-aspeed.c | 109 ++++++++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 13 deletions(-)

-- 
2.23.0

