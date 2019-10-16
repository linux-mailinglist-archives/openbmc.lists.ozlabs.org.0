Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE1D90B3
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:22:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWdX13C3zDqxf
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:22:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nnQUUo66"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tWZX0NGHzDqwM
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 23:19:45 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id c3so11203390plo.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 05:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHSx1kU82HwaEYgco+ROH8EBnD7i7cfqPDp+KwIVfU0=;
 b=nnQUUo66Ov2lPvwLjueJX9hxm/G/3rHwLaC39TRNykr++mXaOHb1ntZ4dDQbHEGf+U
 AGtYYzBB2oY2u+BDoTKLkgO+hbQqc3/obQmL90z0ZwN4nXKg0JQmSimrVOZEMDagyHR9
 jEuEmzAR4O/zZ7iCw81rMGOlbQMjLmMBPkRSwvIiEzT56nEyUtMBOU2NXpPPvRBsQbrE
 4QCjl72Lqae9LrOUzNBJ9MeUth3Ip9amQbVmN5wwaaFIfgCosigTjiDQ/iR6MSQY7BNJ
 wdS/if5aQxx/djHVx8GDWbdBBrjP80kZoJRBEXc//YMVzo9dvuDCCN3NzDquHjPsD48d
 eoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jHSx1kU82HwaEYgco+ROH8EBnD7i7cfqPDp+KwIVfU0=;
 b=h+9DrCLq7OolOVvSHLotRgpQE7NH8kNQKVC3Nj+AD3QJ7ktjomVrtIUZa3CPAoXMKq
 cCre/DCz/2qaTKy8MnIeBrMHwYihxiXfPvaQUmzboeWiUQmGXgQyMP4DuvAfb2iN66VE
 8H82FDpLDgR0RzoFjZi79ljk6LwndO/VUOTrFlb1KbO+LvjzTNtaXWglaE1/BmcOe6UN
 FMVblYLM9pY2K9f3RqDBmeJ9mV61p+01ZZ5OFzxynEb4+gS0UzCt4ZjOuRDaZVsAleRo
 Vvdd4lv2S/srJzxc2mIU9ue9F+AYForsz7Uos3DLVQYKURVtR23Yqa/kCDtc9bqY6YW2
 A1Pw==
X-Gm-Message-State: APjAAAVE58xLGXn3VnJ80n+Q+4p2207Boqp2EAyAHuO33LDt/op7adHS
 ZmD7GH9uSDcePqViKSIt7Dq/qEIZ6OE=
X-Google-Smtp-Source: APXvYqzYj1Z1K50lo9I+shUG8jJuQNkh1Z/JXqNBKtQaffYRPPyMdOXeOZknOITErPrrs53WQ0FEtw==
X-Received: by 2002:a17:902:8ecc:: with SMTP id
 x12mr41897834plo.189.1571228382788; 
 Wed, 16 Oct 2019 05:19:42 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c1sm39075531pfb.135.2019.10.16.05.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 05:19:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/3] FSI Tweaks
Date: Wed, 16 Oct 2019 22:49:31 +1030
Message-Id: <20191016121934.28481-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These patches attempt to get the FSI master working on Tacoma.

The host FSI device tree needs rethinking, which we can do when
upstreaming the changes.

Joel Stanley (3):
  ARM: dts: aspeed: tacoma: Add host FSI description
  ARM: dts: aspeed: tacoma: Use 64MB for firmware memory
  fsi: aspeed: Disable IPOLL

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 249 +++++++++++++++++++-
 drivers/fsi/fsi-master-aspeed.c             |   2 +-
 2 files changed, 249 insertions(+), 2 deletions(-)

-- 
2.23.0

