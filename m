Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74E22BBFF
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:31:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYB11PYNzDrgH
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:31:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HJSivD4I; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCY9B6xH5zDrgF
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:31:10 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id 72so3650280ple.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rO17q3trvzVcMd4fMyAs4xFqR775pXB92W7uUhFV7lE=;
 b=HJSivD4IIxO3iJRYYYOTFutimy6ZyJjSpQXknVm+D4phZnOhrBCEXLIHosdeOZrmhE
 1wrI10q6VIoMlMBASauNFDz8PslzXKgvZnbNZeck2CmIQWlpdWz9NYGaLdT502Hh3OUq
 iVPLk3G5gnqwZflZeGPfUTZU8i9ld13ePTp91Gxs4Cv/HaBWT7pqZ8UesmPykZ6zAUGy
 aRgJ7Jg5Uns4sAHCoM01GLsvr6UraWP1A9bJ9+oRxlkrBQWhglNo0bpUL+oaArf5KP2Y
 JORbbgynX2FlWejAuk6WLphdJ0agCdd/JETbXGIwnMRKkMBB4JCTKa4PA5TQJgAPTWhF
 CIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rO17q3trvzVcMd4fMyAs4xFqR775pXB92W7uUhFV7lE=;
 b=Y46DLDDINlTQrSlUoRTwiuhAcHU6tltX3VdwfT4Qt8rtRkNb4wpIbOpOotvE+zWnFw
 Lc/hU3HE+WfWFM3YWYzbGIL6A40danLMxupjbyWzqdmrOogwl1SJHJP6WVkxj3XIFAz0
 Igs8GGimgqtL8MzokTHdMQdQuYp3U/KfMQ6NpnMjZ5xWVyiEDsmUl++ackxtHJ+DNAi0
 M2oXPZSxxgyZdqLQZi4YqzcGJm1LHv8+uwb6Kf573cgGTipcJ9HeoCDbaba7rQibsztA
 bF2U+cERWmxSWKIya91Vm2yAiEjBu9fxEf8ISt/7S1RPv9TrjPMzF8uyMpA2noLPN7Pu
 lIcA==
X-Gm-Message-State: AOAM533W/K/lj6cTYzmwF3ICTd5JRwTV+pdZ0RsR/3kxZrOFbLlPqLIW
 PbxL++Dx3NFFNHSm2StpLDFjrDPpLbc=
X-Google-Smtp-Source: ABdhPJzXksmYIr7hfP5utJMUV3xh9McgbxJQmIZ50stg6kt3Q5KXSvlrzzKDLYO91pZ784m4ce4uiQ==
X-Received: by 2002:a17:902:ff0c:: with SMTP id
 f12mr6430091plj.254.1595557866115; 
 Thu, 23 Jul 2020 19:31:06 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w9sm3880239pfq.178.2020.07.23.19.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 19:31:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 0/3] fsi: aspeed: CFAM reset support
Date: Fri, 24 Jul 2020 12:00:33 +0930
Message-Id: <20200724023036.354310-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
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

See patch 1 for a description.

v2: Fix levels

Joel Stanley (3):
  fsi: aspeed: Support CFAM reset GPIO
  ARM: dts: aspeed: rainier: Add CFAM reset GPIO
  ARM: dts: aspeed: tacoma: Add CFAM reset GPIO

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  6 +++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  |  1 +
 drivers/fsi/fsi-master-aspeed.c              | 43 ++++++++++++++++++++
 3 files changed, 50 insertions(+)

-- 
2.27.0

