Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BE5F01C9
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 02:31:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdrl14T6jz3c6Q
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 10:31:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AtqAjSPE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AtqAjSPE;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGW33nd0z2xGk
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 11:49:19 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id y20so8630plb.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 18:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3xsyEgS6wQEcilNczAH/RzYC55tqd2/l/kiFkCkLEFg=;
        b=AtqAjSPE0MLtcXsr9aNrULZK7HHQYEBiRHkAwRCkBu2MAZOx1pp4BQoPXrck8c63MA
         i/bv0SrqA23kvurQhOy5pFiizvlMC4R+m8JmPqFtcvlsRkar/M3Kpj+Et5hVv3eLagBD
         dd9BD6Fg0SVWR/Fdj6327uyehHxcMd/+QkD0r7+DAipYa1j57KZ9U+6P558EfKst5eI7
         NDECXEljHH0qTgj9IPmO+39R8MeIq03pMjVeOXg617ypi4JEevQ3IUgM9uUXvzJe9SZP
         0yC6nINxK3GuRRHiiXb3WBBcIU5OPKTJPP7ZJ0D7GRahvzSLAgGk4on3fWiw2JquYcAP
         xiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3xsyEgS6wQEcilNczAH/RzYC55tqd2/l/kiFkCkLEFg=;
        b=YRMs1/lHvl/oPW3nkrEBqG4QLs0zdwDmrMJ2ru6CEbcPiLKbFrjbtm8a3js5UPsUpq
         AkiDExD0m+PaUAYquXchvQ5Tib41ILiKz/SwgiXenq6AxmqrOmDyi3Y+Jug/9ImOn5kT
         89ycbgyNUYJgOQ5NUfzCd6DHysDkFbnewTgzgUJ1eBhYA04lmr0pzYi49XMdk+cosiEB
         5CAku8gOCHI3nydUQM501a9ldZWnPBOSm/OdLRbGGKblKBRL/iJQ9zbcFx8fjDI9ObDR
         9ZLW4x551MUE6MJ0dzAPIgSKE4VG9BCTstS/ziHhf7ysNHbJYllpxBzvAeC+mKBb6hRi
         SQ5A==
X-Gm-Message-State: ACrzQf2ydgseduio7IwfHmGP2FpjJv3hk0durQ7IoV/fzIWU/XoHA9Fr
	j+7fJomLFA6PMDBd+rJdYC7/Pcekx+8=
X-Google-Smtp-Source: AMsMyM6iduWswIQ46YQa6b4x/PMRPiSS+Ld//04eKQ4xBt9nmKULSMWc9pLr5yg/HMWyV5eqGUUZpg==
X-Received: by 2002:a17:90b:3b50:b0:202:9e4a:2fdf with SMTP id ot16-20020a17090b3b5000b002029e4a2fdfmr991558pjb.240.1664416157257;
        Wed, 28 Sep 2022 18:49:17 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id b6-20020a62cf06000000b00536097dd45bsm4597072pfg.134.2022.09.28.18.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:49:16 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 0/2] ARM: dts: aspeed: bletchley: Update Bletchley BMC devicetree
Date: Thu, 29 Sep 2022 09:47:04 +0800
Message-Id: <20220929014706.1917372-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Sep 2022 10:31:22 +1000
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update Facebook Bletchley BMC devicetree base on Pre-PVT HW design.

link: https://lore.kernel.org/all/20220929013130.1916525-1-potin.lai.pt@gmail.com/

Potin Lai (2):
  ARM: dts: aspeed: bletchley: update and fix gpio-line-names
  ARM: dts: aspeed: bletchley: enable emmc and ehci1

 .../boot/dts/aspeed-bmc-facebook-bletchley.dts   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.31.1

