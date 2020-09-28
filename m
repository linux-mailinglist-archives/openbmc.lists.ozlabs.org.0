Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB227A7CD
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 08:47:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Ck92B0XzDqCk
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 16:47:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=q2jdRYeh; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Cdb0pkrzDqG0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:43:11 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x22so11903pfo.12
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALBYEqEQM5ex/h9jJZtrXKB6tMmK8YtxLMuBYU/ooyc=;
 b=q2jdRYeh7IvOPuK7ASWosvvK5tzrcUudeCze4lDbaO4k2eqDV7oqiHmkiq5n5DWUiP
 zhpDxzU1dpkGAlwHrL9p3hvNVmJl0SB26RGJ7gjey/uJfXqDFo6ZujlTbbEu/EKO1lV6
 HmIOkT6kbBYPR21P+4hMm540zs+RayppNn2OF8WY0H4RsXoS/eDGhsy2DHWgqo5oebbd
 4j5EwFQckbWhi/PrCKN4UOvNa8qZ5nAvL5rZxOyIHE53vigK/Lyvojd3dx3Pq0Ah0+DQ
 gLwZq5lcE3N2vE1Xd93FPKl3Ew2qN0SL+fpnbrFqVMGG/D95zqYCTquWxqkhsWSQMBx+
 8h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALBYEqEQM5ex/h9jJZtrXKB6tMmK8YtxLMuBYU/ooyc=;
 b=caFyXFWnqfsFOVFjsmtOgasZyx4dqj9lHXqOG+HDoDktLNgdiDoaTYwF1srON4iJOH
 6lqe8/e1nzfn4u1WAC8n+RsFsypp1Bv+NPk3lnh0F1aLmjPfOYvPtrU3uaP3y0v/avOy
 r/IXe5yoq907VJ1s5Pbqx1/QSVGFvTb7zL89Id2lGn0CApyhPT/3vCPjh6e1V4ddr2kK
 Y2aHUlzTnHy22RCpfL53AgUVd7BsKNMCuXDWiPKBc1t+I/fARFoDbn3/5O7s33HuQ10g
 R7btKESRFjr5Jhkg3StL14Ukydd3D2iIQv1lgtm7oav9+U0yfcBaBAi3QDyGG+3nE++Q
 3EEQ==
X-Gm-Message-State: AOAM531sU/3uocHH4+UZuCxJdFyCQrmyYwVPX7dxy21TCf/sxOMLqRpa
 7sUIf5onUHKWWmKbtHrLOACYMVWQ8qhcQwDn
X-Google-Smtp-Source: ABdhPJx64nHx6pI9EZSbd5fS3vaVcP8f586Icbbq17yYMEt4wfWyoGSw3zS9NkIuKQqZHQbx/wgMSQ==
X-Received: by 2002:a17:902:b713:b029:d2:6153:fb62 with SMTP id
 d19-20020a170902b713b02900d26153fb62mr265586pls.28.1601275387261; 
 Sun, 27 Sep 2020 23:43:07 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id u15sm233309pfm.61.2020.09.27.23.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:43:06 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, yulei.sh@bytedance.com,
 xuxiaohan@bytedance.com
Subject: [PATCH linux dev-5.8 0/2] Add Bytedance g220a BMC machine
Date: Mon, 28 Sep 2020 14:43:01 +0800
Message-Id: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
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

This patchset introduces a 64M flash-layout, which is used by the G220A.

In the openbmc project, if we want to use this 64M flash-layout, we
need to add fowllowing lines in the machine configuraion file.

FLASH_SIZE = "65536"
FLASH_ROFS_OFFSET = "5632"
FLASH_RWFS_OFFSET = "49152"

In this layout, kernel's offset is 0x80000, the same as the 32M layout
(most of the ast2500 use it), So we do not have to care about the kernel
offset

John Wang (1):
  ARM: dts: Add 64MiB OpenBMC flash layout

Lotus Xu (1):
  ARM: dts: aspeed: Add Bytedance g220a BMC machine

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 926 ++++++++++++++++++
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi |  32 +
 3 files changed, 959 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi

-- 
2.25.1

