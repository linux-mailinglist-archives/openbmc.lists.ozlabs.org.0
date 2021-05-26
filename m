Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325839165E
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 13:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqptC1bPTz2ymM
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=omDGLV90;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=omDGLV90; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqpsw4jy5z2xv6
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:40:35 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so183871pjb.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUP6jtUTkznQOmMaIgPy/DSyICtIXcle8TPO0t3Fdj8=;
 b=omDGLV90g5WamhhIu/XFOGWJnPEyxBUqHnXqIKwnfrjrJPmBKtVyoHyzOTnMVe/rUu
 5SN8UI7AV2VAQFwM6s6KWVb6nMz1ks4pbtgcwFf30E5DlUq2Udfmp9NjC459tvqlEEIp
 ecV6MhcpM5vfy9bMnWRZ/PApKt0kUBhGd3pYl20XVBqVVMmBOdwjJcy5/sCdHJ7tTyqA
 TOopp1apCKWFh3nz7bm2TpxNiqqhgnHSb384wWrwW6VqnbDwhhcqAPXNcdrLVrTuer9W
 ySwyXeHhbnWqNqVPfgfpjwuyJUrNRQqHda24LaO4B2Iv7et6qVOqVD+R/qC8TQKkX0sp
 ENPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUP6jtUTkznQOmMaIgPy/DSyICtIXcle8TPO0t3Fdj8=;
 b=jHJ4PEgJ5XcLR9yLSA08Sp8E/KhktgJtxK/Fg+XZDNOx1M7CTdU5JeVcatI4aEhSru
 9Fw3lhOm9qzsw1oBKCwwzI1k9swEvaVNi4aXsaZjEsnGh2ZsABhoU8Y0o4T0e0wN+49P
 2pR/iTTlZXTy9MG5upqia8cuWkZwEr+KF8v5oRf4jQaJ24IqkUhXMmTgdOxXReqRpdz/
 pA4/tQy9I9LdTyAI7MFv9lp8ebXB4O6ZcJaBoLpy74Qdo/WKSW0MQewqzb2t1rn88u7O
 p2RNvAb7P7pmNJLfRoG/kR1pnnsXBRtoO18kKfel9DgyYzuZTDsnLEi/tJG8HuTkE10M
 Fx5w==
X-Gm-Message-State: AOAM533JKB57tljYp/UMw9x55mjvdXSh+u8cBrIgPMSRVYXB451vRl13
 dTZa3B2peqbEmxhZgDMHaA4=
X-Google-Smtp-Source: ABdhPJx/CaNhigBceEGQ3FuuxamUFFPKbMhH7HY/Ti2oFX4LFdG0Bz17YL6NYHeMEfyeGtnVXQ6ijg==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr34736360plk.57.1622029232291; 
 Wed, 26 May 2021 04:40:32 -0700 (PDT)
Received: from george-Quanta.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s14sm17124805pfs.108.2021.05.26.04.40.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 04:40:31 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1 0/3] ARM: dts: nuvoton: gbs: minior fix and update
Date: Wed, 26 May 2021 19:30:58 +0800
Message-Id: <20210526113101.7457-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, Fran.Hsu@quantatw.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Minior fix and update for NPCM730 GBS kernel dts

George Hung (3):
  ARM: dts: nuvoton: gbs: fix pca9535 and GPIO node naming
  ARM: dts: nuvoton: gbs: add fans-efuse GPIO to gpio-keys
  ARM: dts: nuvoton: gbs: add page size to all eeprom configs

 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 191 ++++++++++++----------
 1 file changed, 103 insertions(+), 88 deletions(-)

-- 
2.21.0

