Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C69BEBF7
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:32:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4qC6nJ1zDqnw
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:32:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZT+4Su89"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f4pd3RsZzDqm9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:32:09 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id t14so970565pgs.3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bF+5o9LxX/4LIUVgoCvZObdeVaZh/L2lm+LVF4Yw+CY=;
 b=ZT+4Su89A+g+/WJhAPGdszhB5jjddIQCuRCi1GSetcQNrIz4+xIX1pS5RNfZg6VJVL
 NtBnjI9angiDqw2l3n+2cR14zjTtVWmV3IRBY5rfwnGRfgfAyL+pZvIZHPJmB+e/PYWR
 AI+msYHzX09vYPbHPzmGt7KNwKcyGj7aIoL/dqmG5/vVglEg3V9BQMFTUuArtRWHOsTh
 nIRM36ESbnr8C6N0FM6ddvO9f0xkvTya63w+Un2I0ETTJIrSrrFmpAkmlZ3Rg0O+FfDR
 VgPkvtpfZexVJmRlRA8rT+aypPGOVjSndWfdj2oXgpZIoGsAAWHJhuocisxgEvTiKSOR
 V4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bF+5o9LxX/4LIUVgoCvZObdeVaZh/L2lm+LVF4Yw+CY=;
 b=GvPmL2aTLffCWQ5HMtQkd9zO5OzNY00CNN8Rd3pa9Tp9B7ZgKJzdS02RRfZxKFiJmD
 +i1KN1l/VDdqHVc4jzO5yE/s9miuAxk4CAulVSCyfe2DxptgBSPg9piJOBdth5eSg5i+
 ajxY+3xUmnEdbelY50RQt+jn80rAF4WL0p1Qzq4ux/XDA7zuxVdbRSPuWklwOwXZMUbj
 bASXooX1pQGWRmF2OTEOMUUPY3qkUJCJxQTsKfSztnIEO9KloOLtOdSCjWvdiXsfvHT/
 GtxPlvijdQcKdkvr/IJ9JNBiXpJXoId95V6BEMEHx6MF73RD2JQtumaB5x9qSzNqDtav
 sjow==
X-Gm-Message-State: APjAAAXcVsWwrGg2W+pcIuK7F44kSKyZLn5M9X9TZIQRwW6xQCncDvJn
 KEzb91Jn6yTccEGQGZ7zA/qwT2r6
X-Google-Smtp-Source: APXvYqyiGWwPpGJ5+czKRRTsO/7GwrMJAT1ZAVAMD9a43RMOgqPyu5pOSyoYMdPK/zwO1csuuVhGTw==
X-Received: by 2002:a63:d901:: with SMTP id r1mr1824708pgg.159.1569479524681; 
 Wed, 25 Sep 2019 23:32:04 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i6sm1899984pfq.20.2019.09.25.23.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 23:32:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/2] AST2600 Flash layouts
Date: Thu, 26 Sep 2019 16:01:55 +0930
Message-Id: <20190926063157.22743-1-joel@jms.id.au>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here's an alternate proposal for the flash layout. It makes the u-boot
and Linux partitions slightly larger than Brad's patch.

There's also a variant proposed for the evb, which as 64MB parts.

Brad Bishop (1):
  ARM: dts: Add 128MiB OpenBMC flash layout

Joel Stanley (1):
  ARM: dts: aspeed: ast2600evb: Use custom flash layout

 arch/arm/boot/dts/aspeed-ast2600-evb.dts      | 32 ++++++++++++++++++-
 .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi

-- 
2.23.0

