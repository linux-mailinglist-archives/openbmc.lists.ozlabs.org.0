Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DF5F4DF3
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 04:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhzkb2SR0z3bjL
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 13:57:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kI86Crkv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kI86Crkv;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhzk02lCxz2xfv
	for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2022 13:56:37 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id y8so325352pfp.13
        for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2022 19:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=eUpr6W9z2VANCeNwBoI1qH+3XaeIaG80KhK2f5gUlp0=;
        b=kI86CrkvK6DLz2gurhvIxLaNNx+b6NvbteBhj7JoGJopRRyJ0nhGUQTLsujU/ATtGp
         N1op4QuIl6tWHx0sGrMpiJDPWY/cUkXtnSXVRVndPD23yTcSwr+UZ5g8sLtkQmKb1q7p
         xAyVbKKFj2UrZ5jJeCguyq/LeRgVERYMFJbU1mOnUmozsXJfW3sgPO8nNHxKAo5AMbvK
         0uBztVMlxJ0ZZHMgXzW+F9nCEPI56Jrg4cFVvykWBiKS4Is8tczMXlIweOoKWyHvpZFS
         bfrORUbxislvcP1HcvlzS2Sf+EsTPNxUgBCGluLhZcKFa6MqyIzmsXCMvCApGov54KBr
         Ho+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=eUpr6W9z2VANCeNwBoI1qH+3XaeIaG80KhK2f5gUlp0=;
        b=t4gZIhZ8YMoa06yt47x22j/HH5vYcAffuXpRyjqlia305UVMew13K+0b1R6DoGCet6
         AQq+Us/9PYCeJuWX19V8jTkRnQgh/wIOxwmAwgiPLXNJQHysRrJtkczxMPhhe4yOc17z
         fT/SI98UetwJKpA8cFDUKOBpa6c5p6jIbch+dHLhsEj+EhdC+DsWSi1Yl6huufJf8yAB
         7utAMiVkXValeLiR3CbJ4gkr7p1QVZM0/mBYnHMonhGBD6o8q53P8R0xhbvrFS5Ce2PD
         bNl6bJjo9EKk1rFH0X/w3ULKRUlJlJxJZmsZxAuLcckvSaBnIXTpCiJDVOwVxg0lslt6
         v4rg==
X-Gm-Message-State: ACrzQf2ELF9kXmSBLNCl0dXMnK5dQjTiVG2I09ueBVxq6M3mKUfcrg+i
	D6HI0F6oqoxZjG7c6VtAfv32zRlluWA=
X-Google-Smtp-Source: AMsMyM5EEZEwzfFbE3l8weTEydQtqj2yiBiLgJk3ZhMRPKRYpYAl6NEZ1MfhZYHh3a4zNhZro8nDAg==
X-Received: by 2002:a05:6a00:1141:b0:561:e46e:ffa8 with SMTP id b1-20020a056a00114100b00561e46effa8mr4311629pfm.41.1664938593354;
        Tue, 04 Oct 2022 19:56:33 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b0016d72804664sm9604242plg.205.2022.10.04.19.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 19:56:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Depend on setuptools
Date: Wed,  5 Oct 2022 13:26:25 +1030
Message-Id: <20221005025625.64000-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Linux 6.0 requires setuptools for building the perf Python bindings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index edb133515423..c87880b2c14c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native setuptools3', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.35.1

