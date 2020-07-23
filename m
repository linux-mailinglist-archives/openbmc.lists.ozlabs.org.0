Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95B22B9FC
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:07:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCSdw0B9RzDrfx
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 09:07:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UcZbYO2t; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCScJ03fczDrcN;
 Fri, 24 Jul 2020 09:05:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id q17so3377469pls.9;
 Thu, 23 Jul 2020 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Kx8J891apkIa/g8IE/ArV1cGSLaJdXykQLAbT7gapEo=;
 b=UcZbYO2tukUDPc5K2c90M2NirgPVRhjzR9QGQza6coVEV+vD8vN4Nog0ApFFbosbl/
 dG5b8aS8zz20MClvdvI0CFrZioWlWwP97Xda4pr0ydgi7Ambf+atwg9qDes0p60nHnP3
 EiKymcj568OiA+9MakggBgSNRdxny4zwuIq3c8uB7CrfKBPDrVpIjJAw7UH3OZqb7d1C
 uZG8Zi4DBymBaPBJnEzJd1rTJsYAzLXMV4DxhxPJzcqPlDcy2AW68C6rUKhVZS4/WLgq
 GLjn1jUOr2sRmzobipNkiDR7RQxrHq+HSoRIs1TW1Ky2e2hl8m1VcsUQGaLLiswGh4Q4
 gxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kx8J891apkIa/g8IE/ArV1cGSLaJdXykQLAbT7gapEo=;
 b=WotvZC2NodlnSiMeYDnnAdPA+341SwKTz1AZUB0XirssPVLMUK/Crr6Eo1aMTaLWVA
 5a0EtnAosdvGMTIEEVjbwdfOTb2FcB4VNmsl0wjXjSNU+qP3TYyy0BaEiZoKiT4oeNX4
 rosXUYjzGT1nq64nIZEwhoTojSg37vh9+RwpnoRT328zsqa9/OswUpibhLcSll1zw2QI
 Eu/74s4R7XkIwzsutPGtVC7OERgNeL3Gf0REGodDTtXTPjaf4Aylj+5UM5q0L9irGf/g
 mPfDd+guaXq8dhEVrY01+kYU82Cm2wOVqIPeD5kHmF/5jbLbEriYy1VQsRnNAqo545MV
 9U+g==
X-Gm-Message-State: AOAM531YpWNALDqxFzK2MC9anIMo+TMEVo0Jg6ytDArEmVDCmBep/FJ8
 ARMACxhyjugKoTHzCdDYUPY=
X-Google-Smtp-Source: ABdhPJw6b+CjqeczL6p7Kx1ZCNCp9dSoVlVCajK91Ff4+2KvkMLg88KX9mwSw72NK+D3DT3J0d0/xw==
X-Received: by 2002:a17:902:d211:: with SMTP id
 t17mr5914972ply.106.1595545548328; 
 Thu, 23 Jul 2020 16:05:48 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id gn5sm3644742pjb.23.2020.07.23.16.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 16:05:47 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 0/3] ARM: dts: aspeed: fixup wedge40 device tree
Date: Thu, 23 Jul 2020 16:05:36 -0700
Message-Id: <20200723230539.17860-1-rentao.bupt@gmail.com>
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

