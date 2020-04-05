Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29619E8BC
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 05:03:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vz5K1QN5zDqX8
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 13:03:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3auqjxgukb7qeohscaiiafy.wigijyhvgwfcmnm.itfuvm.ila@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hKp4kxrW; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vz311JsqzDqSg
 for <openbmc@lists.ozlabs.org>; Sun,  5 Apr 2020 13:01:25 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id a12so4940313pju.2
 for <openbmc@lists.ozlabs.org>; Sat, 04 Apr 2020 20:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=591U0a3uj9ivd77KkEIm1wqfWLnwA8UR+XpmgbL5TUM=;
 b=hKp4kxrW6XAOSPo5e47PZ4T9BUTPc550lpDbhxsApbvTsaCDnClin7TtKDNYXp3dgP
 naCTlZnAkqVQMptnT5UvtXV5t8y1k0lxANTtKavs+a0uTTxQAxSL135y/fcNhEwjbwQh
 EmwKH8BflZkz8oTREBxpCuZ4W/0jUAqoZQCXwctmGtwBOwCLLJU0HxvqXjGu721cnLzm
 Ok379Ew5s+3YK9HCiWtr7YKzpMCQ3FXhWMqikaeW8JJS9dklYlLHLxGegJwWmBxdCZ90
 J2l+heXciWqQPv+YJhOHbrx+Ct1I+yrA3QtiFsqnq8syOH53vchx3RBdNYEfkK4CWCb8
 SM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=591U0a3uj9ivd77KkEIm1wqfWLnwA8UR+XpmgbL5TUM=;
 b=NnikUTiaZdjyOfSK0FU/trrJ814MUe3H0J/o6nKrWd/Hq7radnzbR25d9F1xkqlYb+
 /IbaMCY7GZr5HXcS3xRCHt7I6EGLITLB08WH0kc9kKM6kv4+6ACX9ahEeICh5BWkmKNt
 qcIJgUiLyHPQvA2elomSzjBGzH/UK9nwBTfnT9wNT2zkenv0I7gQZdNMEkMokifTQqzE
 8K5rVGaNex/FNKFOmAGMCkw7fdPJ0aPydYyLTlMpd7ZrGPLOLpx4BpHcCPK37ixfSJY6
 pF6BitS5APm9fpmsEpmU/Hl0B2L/m+on3e4v94oELm8vsuC90Jf65KAaALbKuvcPuIyF
 yDyA==
X-Gm-Message-State: AGi0PuaAc7NDOG8ylCkd9yANyK33hDL0CGc04wjiDOJCwG0RISffYxmk
 8Zw7ihtDIvd92PQ8WIUhQoy9aoR5xA==
X-Google-Smtp-Source: APiQypIpVtgrpRGuQhmH8vpxld8wtXdjmuaKlv6sGDOC8MvvoytVECMHXLkOuA7tHJE0sC2mGX6RM6rHEg==
X-Received: by 2002:a63:4d57:: with SMTP id n23mr15911198pgl.59.1586055681735; 
 Sat, 04 Apr 2020 20:01:21 -0700 (PDT)
Date: Sat,  4 Apr 2020 20:01:15 -0700
Message-Id: <20200405030118.191950-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 0/3] SB-TSI hwmon driver v3
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com
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

v3: addressed comment in v2 and improved documentation
v2: rewrote using devm_hwmon_device_register_with_info() API and addressed
    comments received in v1
v1: first version

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/amd,sbtsi.txt   |  26 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sbtsi_temp.rst            |  40 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 259 ++++++++++++++++++
 6 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.26.0.292.g33ef6b2f38-goog

