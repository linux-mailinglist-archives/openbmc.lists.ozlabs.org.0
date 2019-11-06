Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FEF11F8
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 10:18:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477LYS3Hp9zF1bR
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:18:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V+33Q3Q0"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LXK5S9lzDqJq
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 20:17:20 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id d29so4773041plj.8
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ov4FZGyBbfp3pIHr2moP5LQpsVbOHLq7p3fw6xs7MHw=;
 b=V+33Q3Q0zPFriCl6qijl2ac/+ekDS4EZEIiaXFHivS4SZIBVYhNtB9OSLeOTd608Dt
 wGs6IgR+p8AvttAFWclLpBG9jhhAPeEEjBxYu/NY+SV/8lfYQIzPznRRlmWkKAmPHJp9
 qbrDhU5hKGCtgxli/mz1BZ1p6COtINmj4YLtxD80hpsxHuEp9klPGaEfGOluD5NEfHHq
 2Mt7/l0AWzA+/qIiUBhQQRSX+Jh3gz/Dhp0zHuArsCKvkpBMp8FIyHoB9McM+RVazc6Y
 OT4PXinxJSUKCY49qOFMVp+8CATkxtOdUl7okA3mkFMWRnBGwZi3R6JdmVTSHchaeqIg
 lziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Ov4FZGyBbfp3pIHr2moP5LQpsVbOHLq7p3fw6xs7MHw=;
 b=ZSIhIQTMO9QOlIM9SxSJ4OhP+vGVBwyykLfgygSUt4aEwUGcXvYfqFj9XUYsCurhTM
 xL+LQinMToXf+d1k8dzw5sX1xzN2dHdpJZI99l9t1mdFkTOmMmInYvQh3yBKE2iGiQGi
 qBxRTnZJqmqKs679CT8dF8+lZGLaRPZPM/SaCzMVHT8ZaBgxWQJcxoVBJJYmrdcSVZNl
 0nAlfxtQYOYROd0u6k2T8dPBiX1aRmgyQEipc57IO918YoADYj5S74P40Y/yG5FtTGSn
 QPI5usuVnsiGtwwKik2pEGossikuTrJ1GAJGbBDZjgJDXIs57XWF8Yr7mZpCJqSuQRSn
 D0pA==
X-Gm-Message-State: APjAAAVGjLkVFh9XVMsKLtfp/A6ZMmR56AUfx60S8NiIz7r15pxkTGwn
 E2Hf9TR5TttIXBxrvuS6n7uCg8krEdA=
X-Google-Smtp-Source: APXvYqyB3DmSUWumRUIJl8uUAphVR438Z9vLU4t5a5OLc3UQ69Hs0VoyFODTB6bKVjO+q0tV/EDOIA==
X-Received: by 2002:a17:902:6b8a:: with SMTP id
 p10mr1567435plk.192.1573031836804; 
 Wed, 06 Nov 2019 01:17:16 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j25sm21144182pfi.113.2019.11.06.01.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:17:16 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.3 0/4] ast2600 timer support
Date: Wed,  6 Nov 2019 19:47:01 +1030
Message-Id: <20191106091705.7416-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In order to use high resolution timers, an ARMv7 system needs an
additional clocksource that is not the arch timer.

The other option is to set the always-on property in the arch timer.
This has been discouraged in the past[1].

I propose we enable the aspeed timer in the openbmc tree, and work out
how to proceed longer term upstream. I've submitted the timer changes
upstream as we can have driver support regardless as to weather we use
it.

[1] https://lore.kernel.org/linux-arm-kernel/341949c8-7864-5d65-2797-988022724a4c@st.com/

Joel Stanley (4):
  ARM: dts: aspeed-g6: Add timer description
  clocksource: fttmr010: Parametrise shutdown
  clocksource: fttmr010: Set interrupt and shutdown
  clocksource: fttmr010: Add support for ast2600

 arch/arm/boot/dts/aspeed-g6.dtsi     | 15 ++++++
 drivers/clocksource/timer-fttmr010.c | 68 ++++++++++++++++++++++------
 2 files changed, 68 insertions(+), 15 deletions(-)

-- 
2.24.0.rc1

