Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A767C5BF80D
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVpB2FrLz2xYn
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pvobrXsc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pvobrXsc;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVn51yPWz2xJN
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:44:55 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id s206so5126258pgs.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=2O3whgYZakuELgl2UZsTnJtPL/RW8rYfIIOx0aX9pTA=;
        b=pvobrXscc5KrK/rRa+ak4f49f3ghNoSjXHvUJMYUJ8bb5EmIumtXYSKxhS2dDMCC4a
         hkLUZarkM3Pv++v+rtWslDldK9oulEooykuE8hgfgmfwY5LICedgF+tBQ81rQGJDd7qH
         +KrpMpiTSFwbU/G07PCF2y37xpHVnXxEKOWKm0+sgLduKpvYPZIZeaoUsJYxhlkfxRwx
         1hB0DFL5YV/nqVRScx9NGznA4u23P6ReosgjDKuEwGNTu7QmJlMHHfiJ4N4COzMs1k79
         3fkBl9q8knX7Dz0cWFCrtj433kB7XWNJ0A+6+Z5ujbasFP+zr8HkRTjQF72CPMl4Dlh6
         DDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=2O3whgYZakuELgl2UZsTnJtPL/RW8rYfIIOx0aX9pTA=;
        b=aqradXkbSsUo2dRzd09fv1RjZy+qDYxzPGRY27uE7ybSNTVUo1tTyK4zcaOGdK6RJC
         KxaDGfwiaCIlaujcyX1lekbPUWdl0bP/hoHjTGmYC2ge8DG8KJ+kb2J+3XsDlSPDIgKg
         I3o2T3Xmx7dqjlGHRIay/va85sLUfaTUWOL9YIW/+GynTI3a+WekSt0lTxClmW7mQvKK
         AhEF8C5eI+48t7NCwlNc5Bs1oWHsvAUW3lff9wkdRdCHsVk0utw14xpQ94XclgojFvCq
         Fjqpg6H7A1aTC5HrAfTMqnZ3OQVYAIY02gQBwUHP2MSuXlbJwGVvpWQyL1oxRLAlJP2K
         MOYQ==
X-Gm-Message-State: ACrzQf2UEJmLflXptc4PPLAKKb10QoQYf3eJCVmEaXiPSH6aZlmy9SOS
	8L7mj/HKpqIf+bOD1jMHUdYggpFK6sg=
X-Google-Smtp-Source: AMsMyM704YqiMeIMEsG6cG0IkxQPduhPKXVv8wBUzW7d5j9E9gco57o7q+8dzCQyPNFZCbHRJU22Jg==
X-Received: by 2002:a62:a512:0:b0:536:e2bd:e15e with SMTP id v18-20020a62a512000000b00536e2bde15emr28020063pfm.1.1663746291326;
        Wed, 21 Sep 2022 00:44:51 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090a121600b001f22647cb56sm1192339pja.27.2022.09.21.00.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:44:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/4] ram: Configure ECC
Date: Wed, 21 Sep 2022 17:14:35 +0930
Message-Id: <20220921074439.2265651-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v3: Fix ast2500 change so it builds
    Add r-b from Andrew to other patches
    Add patch to enable RAM drivers in ast2500 config

v2: Rename property to include size
    Use correct size in printf
    Add patch to enable ECC in p10bmc

I will merge the config change first, but I posted it at the last patch
in the series to keep the numbering the same.

Joel Stanley (4):
  ram/aspeed: Use device tree to configure ECC
  ram/aspeed: Remove ECC config option
  ARM: dts: aspeed: p10bmc: Enable ECC
  config/ast2500: Enable RAM devices

 drivers/ram/aspeed/sdram_ast2500.c | 23 +++++++++++++----------
 drivers/ram/aspeed/sdram_ast2600.c | 19 +++++++++++--------
 arch/arm/dts/ast2600-p10bmc.dts    |  1 +
 configs/evb-ast2500_defconfig      |  1 +
 drivers/ram/aspeed/Kconfig         | 20 --------------------
 5 files changed, 26 insertions(+), 38 deletions(-)

-- 
2.35.1

