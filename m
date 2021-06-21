Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72003AE354
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 08:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7g0q39XVz308H
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 16:41:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rHWcJOnL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rHWcJOnL; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7g0Z27bVz2yXM
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 16:41:17 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id g6so12879054pfq.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 23:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDj11a0Ak78ik9Kg5lqAJ626/1JQo3c0EdsQxSfCuf0=;
 b=rHWcJOnLvYCArn2eFQsVo28GdAYQYg9YGTbNjCMFIGWYqENZcRq592Ep5B5vNelCws
 vVbPl7+tzAaPTVFuy9mbh2EQuEmomX1LOoQYOhmudXHaQDucVjW4x0mwPFMWTw29X/kw
 e2daqc0KFL90xg49NpgM/N6wn5XeDqd4iopWk+c42wAUiS9SkGJMgC2GE8l3x1AmndY+
 HpDGUYSQsAP3Q7dZ/vEzL4+WP/FChDrBSYevTHCWo+mX3Y5FsGp5JoYWm2FBMrFDkYtI
 g1AEDnMcUZbP3Fy91S3xL/dgdulKh98DsnnqoIM6yHuCpx8prYk2ggx0yAlpEzgsUa28
 MqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VDj11a0Ak78ik9Kg5lqAJ626/1JQo3c0EdsQxSfCuf0=;
 b=RlIer2pWsw2S6haEFSfG03LHWytuiQ7Q+9eVxx006KTw632bfYwAo4Nhw/kBGUh7Sd
 2yu8Yt+MKhExXFg2u14q73eKor2+XUq2PYbtZCJYEkF19WTPQdHqdR5dt4dA16weQmla
 1Iz7i870n4qrLs4lBUUBepitKrflgMbTNXm51KZDNaOBWkJdY4sKhsxTVBhI4uNuPWPh
 xfC911AjCh+Ih55YL0rBdLuna28TTs7DZGzP0703fcmaPl9hi8o24V9ZW4ViGxAcvejd
 RwCa0h0S46rWhMVm5TIMAbGp97f2mwKJLQ0KdfuFUPRzdSeCy3rWc8R49rBcEoXHuaN4
 NydQ==
X-Gm-Message-State: AOAM5323z9WrLPUsk3Bv0sVgWxoVN7S7E8dzjyaTldDYlipzR+sMkNPZ
 X6Lei0Rog/g2OuXaPleSq9zmSN6OJOY=
X-Google-Smtp-Source: ABdhPJwmR3QNcOI2YxATL9HvCaJnrSeTxKeZ8FOSyE09mfnpzOQpsnmPOce+IRmUJbRRl20Nt/ASKg==
X-Received: by 2002:aa7:9729:0:b029:2ff:1e52:e284 with SMTP id
 k9-20020aa797290000b02902ff1e52e284mr17680436pfg.71.1624257672599; 
 Sun, 20 Jun 2021 23:41:12 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d16sm7865633pjs.33.2021.06.20.23.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:41:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/2] Store default u-boot
 env in
Date: Mon, 21 Jun 2021 16:11:00 +0930
Message-Id: <20210621064102.961633-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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


This patch adds the u-boot environment to the u-boot binary, and a build
fix for the new configuration that I have also sent upstream.

v2 uses the latest boot commands from openbmc.

We currently rely on the default environment being populated in the
image. This has the downside that if something corrupts the environment,
the system won't know how to boot itself.

The ast2600_openbmc_mmc.txt is copied from
meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.

Adriana has indicated she will update openbmc to use the .txt from the
u-boot tree to generate the filesystem image (or we could stop doing
that, and simply use the default?).

Joel Stanley (2):
  Makefile: Conditionally add defaultenv_h to envtools target
  ast2600: Add environment for booting from mmc

 Makefile                                   |  2 ++
 board/aspeed/ast2600_openbmc_mmc.txt       | 11 +++++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt

-- 
2.32.0

