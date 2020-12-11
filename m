Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9092D816C
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 22:59:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct4SC2XXrzDqxg
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 08:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com;
 envelope-from=3murtxwukb8mt3w7rpxxpun.lxvxynwkvlur121.x8ujk1.x0p@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Yq2V2+0S; dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct4MD07J6zDqwt
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:54:39 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id o19so2844322pjr.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 13:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=hYQLpIQAE5/Axip10es018C6XUh3MhNHtJpTlD1WAo0=;
 b=Yq2V2+0S/HCmoRwuPzTrXXqUv25lxJFRuUv5r7ayLhb8FnOfnEARyaJkpBzfJL5h0W
 SLjC9hGEOX/MTmi+SY3koZs/ZkE2dfUWqywpj+e1ZUDVELZetvYSTt+BE/LNk11UIo6C
 KQ/9GhxMIaLFSlmA9li80DJZ53+biNSYNjJEUMHpA9JUh2X+P75thAjpPw24cEEU0xwv
 KegG221gNp94gxhUAiIJ1saLt1E7YAzulaySc4XMmZrWNa2tt+yRTj4/FFhlp0DCppUB
 OCptSkHJLUlehIwV0kzeXp6z/+Ezpt40k8gtYS2O28oe82tJ72ofv1DRUMphPfKsIVVk
 no6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=hYQLpIQAE5/Axip10es018C6XUh3MhNHtJpTlD1WAo0=;
 b=LeyvD0eX8Hnyj9uG7MQXGoLkl8ysATHc0T7YxGiicQ9WjN7Z7z2MAx0OA3g7nblt3s
 VQeNcA0aFJ9TPjt9wCeFKAHIv3ZKKf8wMXy3sTOt3vyIoFHaWNa5VKyjg+goDz4AeGgZ
 5lnLG7t4AZibJyxpZi815ugBOT1VNGPIFBVj3y9LnYmwucmrMrsAZCt9I/nOMXky+o8m
 narS+2LMjCUDQXxOHOCyognhQDCFqXB2I3qkXK/rYGYXxY6IW+2fGAkK1T4cqK84LeKm
 L/sL6QThygzZIVFqQPXhdUC/k0tlGg3JAb7uDZTAohSFUZnq4hAag2O+smWKc6Ys5fGS
 1oaA==
X-Gm-Message-State: AOAM533NCkYFcEUXQNk/KQZtkNLB1SHGSj/uVZjzgX53H7poaArFlC18
 wMyBJZHgYyg7pZbodiaw+FUaDd3alA==
X-Google-Smtp-Source: ABdhPJxtfdrdKRpRKa4d5PNa0dLBVDAHtyXSihMPO14aQqpZ26aPmkyBpZu6VDejyrLbK+HND/kTNhUhag==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr1446850pja.0.1607723674991; Fri, 11 Dec 2020 13:54:34 -0800 (PST)
Date: Fri, 11 Dec 2020 13:54:24 -0800
Message-Id: <20201211215427.3281681-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH linux hwmon-next v5 0/3] SB-TSI hwmon driver v5
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com, supreeth.venkatesh@amd.com
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v5: addressed comments in v4
v4: addressed comments in v3; converted DT binding to required schema
v3: addressed comment in v2 and improved documentation
v2: rewrote using devm_hwmon_device_register_with_info() API and addressed
    comments received in v1
v1: first version

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/amd,sbtsi.yaml  |  54 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sbtsi_temp.rst            |  40 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 250 ++++++++++++++++++
 6 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.29.2.684.gfbc64c5ab5-goog

