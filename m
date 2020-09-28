Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD827AB12
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 11:46:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Hj41sPjzDqRs
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 19:46:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=w+wnTsqp; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0HhC1l0WzDqQy
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 19:45:44 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so333999pjb.0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjWerTuGm2rfimasKjR3hqL5FBl1twmUkdm3sQzi/0A=;
 b=w+wnTsqpqJg3duf3pV1+L1bpra/ABzDUw6P4Nh2b71fduZLiIDch0RX6XIwXOvVL0Y
 3HLRIhJbH6BxQMujtM95UCkvhBTMPq4rnSxrjgKDIu5elUh2KCSpDeeFEyEmausNu8v+
 qk7DDFcUIgSOYfW76MQi5nhCfyGX8oXTVR5MjQxkyJ8GIEwmM9IhRfjRzBWURLV6dsUA
 GYY45PMI6umvK7fgAwudaETE34XRTZ3+LOESx5LlADYSUv+gn+vmNFXUA+7QIa4/wbdS
 2EikN2+bPohTdUOV81oHx2KwlTgeAL0XGW6sfIqGJSvuMot1TXczDL8j2avf8/Qiaf4D
 k+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjWerTuGm2rfimasKjR3hqL5FBl1twmUkdm3sQzi/0A=;
 b=a4QWBL8BYi3RjfhDQ6o8EZO2BDzGfKm72G3inMltCM9JqQmRaKXef5UAKTFX+YOVg5
 SFIuVHgC99eOH0gLU9+Pb7jRaxdTfrWhHKd/AWy8SIPOwUB+Jx5PQl9SGJTPv7fjXflU
 CFVRVTblCQubeOI8W6Q70xNb5c4VncPHvRb5SHyRX45v6n+Lf3GMMHXeGOIVw/p/deiY
 BDQw5+wxUof1KiHqqm1fuwO9vWviCCLP/S7d8hxDHY+nB9K0HBgN6uAnrYTEsKIkHzsT
 A9wUd3c/nfdr3iLMmHZEsJ3c9plYTM7otUhCodfXqvlrKa2BkxgjMh2NerU1VT/tPZy9
 z2ow==
X-Gm-Message-State: AOAM531jIhANZG5wlm2IsaAeOm/Cqfh+ZNaMOiwIl4SDzqoWxGG9lLJ5
 Xa3gGcB9nuUAyTVhqQYs0X5IT1nuKv04Fw==
X-Google-Smtp-Source: ABdhPJwKgXjaYieTYuqYRR4vhgMWXfzjpAJPwaB/BnCZRjkDfxSlzU2sOzfZNweTVv2JNBIY/+SA/g==
X-Received: by 2002:a17:90a:e64f:: with SMTP id
 ep15mr595815pjb.194.1601286339050; 
 Mon, 28 Sep 2020 02:45:39 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id gg13sm752827pjb.3.2020.09.28.02.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:45:38 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.8 v2 0/2] Add Bytedance g220a BMC machine
Date: Mon, 28 Sep 2020 17:45:33 +0800
Message-Id: <20200928094535.4100-1-wangzhiqiang.bj@bytedance.com>
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
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 919 ++++++++++++++++++
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi |  35 +
 3 files changed, 955 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi

-- 
2.25.1

