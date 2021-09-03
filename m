Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA083FFB0E
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 09:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H18XJ3RbJz2yJd
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 17:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PXFCYIUw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PXFCYIUw; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H18Wx3Hwlz2xYv
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 17:27:39 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id m17so2785927plc.6
 for <openbmc@lists.ozlabs.org>; Fri, 03 Sep 2021 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sb5PobrMd/CpY6GDAweGLWrl0F+trKCdRyLNW6VHJJc=;
 b=PXFCYIUwu0ka5vARkYYmg42i7FLMxsIwCLKYCocv2Ks1kvRMsmA1X2GXColrpuHxsP
 NG33m/GeiHF+mJVKzlVhNiqGABA8XqhI2q5oEbTP72AOre4PNsTePKSSQWXwOyyBoWLd
 PeRT9PVB54AkDY2i3v09+/8fMcWbMttQXHGKHIHjZKi0DAxYCUBxFxciWI8OtEq5xO/b
 bq05MSBC2wSsrSxp6Cq5BaUtqNcHpU5FM2gvo9GehedKNQtXYSHYOWVDn3TndAEoCq6/
 M2xKtdJhtP/OpB3AdymLYzWJUYv6TJp5jVEpMHbYeQ0B5SX95zBawSQv7FfTOV57Az4T
 iYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Sb5PobrMd/CpY6GDAweGLWrl0F+trKCdRyLNW6VHJJc=;
 b=PV8AITgpIzdAUNtkxyd8OG1MuY53OCDXj4uthRToJ+rVNMsRknhPCWb1JI9QkAsJHZ
 5mugdVhg8SRNYfxv3Fsgvix18mhEX7C5zyXGuBsZNEBNHZoBewzXPibVPw4LBaFHsbc7
 EZnjbSwumyzzlVo1A0ItJJNynw+iJSNV+2Sul5qdSTJbm90dznb48BQauwuKfT4gRte1
 qMZgpyHf2zJxSn5EDoCXMlYwQfCSNEk5Uyf+WB37OqTwwFfPoukEabW6NmqrH+Li49ZF
 6ZI7OHgHydphdTNE3e+4auXDmwzkkQvKwErcMvnheZXOLwmweVH36m1OhDdYGlCvz9oY
 b2mQ==
X-Gm-Message-State: AOAM5317Tyk8HUPr5B007RjCaX/ocmqy2IBwHSk59Oh2G9435PlFEWhx
 EEr/tIcibyDdSHRaAedK9mxBljn8MF8=
X-Google-Smtp-Source: ABdhPJy+7Sz8RLLZPIfeURjVhUJRz5dp3bUkLDMEJVL5pawOqlrMpni/EgBFWNO6Iej6cH88WK/BRw==
X-Received: by 2002:a17:902:930c:b029:12c:d5c8:61c4 with SMTP id
 bc12-20020a170902930cb029012cd5c861c4mr2140418plb.73.1630654055691; 
 Fri, 03 Sep 2021 00:27:35 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id y9sm4395413pfc.193.2021.09.03.00.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 00:27:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND linux dev-5.10 0/2] ARM: dts: p10 i2c and leds
Date: Fri,  3 Sep 2021 16:57:22 +0930
Message-Id: <20210903072724.316336-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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

This is a resend of Eddie's patches, with the diff reformatted so it can
be reviewed.

Eddie James (2):
  ARM: dts: aspeed: rainier: Add system LEDs
  ARM: dts: aspeed: everest: Add I2C bus 15 muxes

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  158 +++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1133 +++++++++++++++++-
 2 files changed, 1279 insertions(+), 12 deletions(-)

-- 
2.33.0

