Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC420E9EC
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 02:11:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wlCS3Z3hzDqdZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 10:11:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ofjxhuaw; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wl8K6s4RzDqcn;
 Tue, 30 Jun 2020 10:09:05 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d194so5694592pga.13;
 Mon, 29 Jun 2020 17:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Kx8J891apkIa/g8IE/ArV1cGSLaJdXykQLAbT7gapEo=;
 b=OfjxhuawS11Tyw27qrDv6z78jdyLU+y90/sALz95jSn5ElzsTBhObyaJPWIUD06A8Q
 Rq9XbItl+rW0T4wkm3urohy2MEtJxfCb8Zxdtc2EvR4//sFm4GNqIQ5CJdw2kcr/h3Kk
 SniFgSMVoyHJMiixcZZjfmshzJRypFvUzhO1JSqygFQSDGN3lgJ9cn7Bf8TfA87dnXPF
 7KLoCYmjfVzAxwkcHXac+9fkRa9st4bULqoFc1xWKDAv2tGSeiC7B097UFowCgbfi1AE
 ySFdSzcfGj6S0Z4ATo4HcLrBUQ70+lNBm5vHCZ6KSVPBr18nMWacb2eK++3xPAE1PdJB
 4WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kx8J891apkIa/g8IE/ArV1cGSLaJdXykQLAbT7gapEo=;
 b=PFCjNyAQAMwfULlRgE1cSUoPJgyUHsrdRwxPRvNm4TPCWw7Iw3aAiClm2QGg+0y19T
 TNcDP9jIWKc/ZYdv/OrMnsaZNnib2ruZnVhiuaA1qTtniNf4jUNNmGqd5OaNNcXriuS7
 hIODv0BOQdYcct9WD4i6bnHq8G7YvL5autCB3DsDBGK+Z36zy0t9Weean4y+9ZdiYxSO
 6V87g2TiN1H6WHdc9nhpqs4xCkEFdO+jnL7xRmqswLVBbMKcFyYLHQtk59CD28eU9c9I
 MJcobVMGOZun+bv3M0ydH+KM1FEXXoSQ0nI6inqK3PHjUvexSBUC+t6kL+72UqLE9kDF
 RtfQ==
X-Gm-Message-State: AOAM5302msrsO5ljnVQnPVaKG9aNTWhKk9a0HU6djDOF/4j07JDOAH3t
 aFQQYZ9tZrYxgxwzoWj9yd4=
X-Google-Smtp-Source: ABdhPJy27ifQA45ma6XMOnXykokl5ViL5QxEvsVBhYpeBWZBo8l1JoEZW17Z+4iSRG19EFlNaLhJHQ==
X-Received: by 2002:a63:125f:: with SMTP id 31mr13062566pgs.239.1593475742116; 
 Mon, 29 Jun 2020 17:09:02 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m9sm754600pgq.61.2020.06.29.17.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:09:01 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/3] ARM: dts: aspeed: fixup wedge40 device tree
Date: Mon, 29 Jun 2020 17:08:48 -0700
Message-Id: <20200630000851.26879-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series update several devices' settings in Facebook Wedge40
device tree.

Patch #1 disables a few i2c controllers as they are not being used at
present.

Patch #2 enables adc device for voltage monitoring.

Patch #3 enables pwm_tacho device for fan control and monitoring.

Tao Ren (3):
  ARM: dts: aspeed: wedge40: disable a few i2c controllers
  ARM: dts: aspeed: wedge40: enable adc device
  ARM: dts: aspeed: wedge40: enable pwm_tacho device

 .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 42 +++++++++++++++----
 1 file changed, 34 insertions(+), 8 deletions(-)

-- 
2.17.1

