Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E77602CC2E4
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 17:59:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmQD40kZyzDqNk
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 03:59:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3lcfhxwukb94kunyigoogle.comopenbmclists.ozlabs.org@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LGWULYKL; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmQ974VqQzDr34
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 03:56:17 +1100 (AEDT)
Received: by mail-qk1-x74a.google.com with SMTP id s29so1739348qkm.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2020 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=H0Lx50SxnIIzq7vdxrU5tdSCLsBn1UooFpJpI+vmNx0=;
 b=LGWULYKLmYseaGlBpFr0VLKT3quD+zRnAUWVKgLWK0z4+g7iRjme5rOGmC3FLCL9sf
 1gh5HghvmJy2Dj0dPz08xJBiWDYUsJkyfhexNtU8yEFFpuVOfMkpiFP9OCxUtMbSBctH
 RLmES9P3LBxpnKkJfo5rxSjb/pc1vfwyjn5+EdeX8sWzvACAkpi7RRgXjd/bh2nZBtLG
 BljQEy2G8HsVGEtOAbtUNdK/2w214g3N3nzYthEZ94M3IfxLYyI0cSJmxcZERKLCwN1F
 3bLP6W39o0Z84bj0AZYLr7Y5qDBthOOaTO4BkbApdoPK83XAFG0brnppFu3NspPRFrDK
 moDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=H0Lx50SxnIIzq7vdxrU5tdSCLsBn1UooFpJpI+vmNx0=;
 b=TGWPTyAmzY46eQ1KZcPRRQTdaGmjZ0F5XwYGFDIYauze0z6mvNSW0evSdJTQu06c/C
 n+8bggqAGJVAgYjdCjXM36wuOv96bN/0pRfZ9cl1qZKwMZDcho9Cumd4HTDAZctfFeV/
 MC5w65zA0i92HQ2B86FqzoAIpiqNBPieQmE5jD261jwKRQIXIAkXjq1SVnsJtBaKK8xo
 J01KmLnFhTIqjDg/BPIZBZ867dMtR8BZ/ICc2+MRWTUFpyJllgc5nyuO6X8WK7krLSwu
 +e/7zpXt6SVtAJiEmZ8BbEwPVZ9Qjch9Siix6AkAVCcHJasLkaD3Qe55G+b59Ur7C0lf
 lj9g==
X-Gm-Message-State: AOAM531nesen9qvXvkhpgAXCEEprmpBvwN5V6SU0Tgpn2aeGtmLn9Ux0
 chZkXScpBxmNI6RdZ8nOPtVse2MPHw==
X-Google-Smtp-Source: ABdhPJwSn/rOgK8TFtSRu2/m7GlbGrv95pPDs73+aOV6pufVL7iwq4wJYVgLy7E57bcSmSMQIqMtQMSTkQ==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a05:6214:a8a:: with SMTP id
 ev10mr3649574qvb.41.1606928173217; Wed, 02 Dec 2020 08:56:13 -0800 (PST)
Date: Wed,  2 Dec 2020 08:55:58 -0800
Message-Id: <20201202165601.1532213-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH linux hwmon-next v4 0/3] SB-TSI hwmon driver v4
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
 drivers/hwmon/sbtsi_temp.c                    | 265 ++++++++++++++++++
 6 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.29.2.454.gaff20da3a2-goog

