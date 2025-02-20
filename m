Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB49A3D046
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 05:01:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz01460nsz3dS6
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 15:00:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740024050;
	cv=none; b=n2Crex1cCzaAR1DUEOVf38Tz92ylwlvcO/1+q8fyZaEWAYXFGjkcafD0g37nh3cOmzS42mVNcegtcgoKvrOgXK4IhlRzqK/ImZmBkmxYqdGIzxSzdArjWRrhVCMxVmK7YxpiMDwz+LQYowHKUWArOzrYEGxkyI1FEl4IAZ17iAsduaISl6f0TrATWwBSU1z1eeGo7Lb9jM0/GE3BU1OFPbf/Wxyw4jGY32E9K2XUMGnnp2DAW+Q+gz3YIS7U1FM5EUoS2vD9UrqBtVV25EgPJxDHDKYjQVVrPr+rBdVRzw+xSy2bAA3jVH/DiqZIaqcoq5PrVVg9ovHPq0RFrZ2SaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740024050; c=relaxed/relaxed;
	bh=uv3tZqQaWCjcD6PO3eDwpFBkA9euhFlwIT4UxpHFlTU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZT3hyN2p8lGEi2gE0aUPqxgKL5UYSlZSXV56DkLqVt6lXvXGvjgwTh37iO02S24YoqbmL5wjTDbTPzYWWs7x23MaaHL4QDzYYyaA652GIjGtJFBOxCuSRDw2KFT6xfDv9x7uCbif9sMIuT9DSilCkprjA/ZQI+EAKwFSrrFfL+ANnLbAQcwhKIbAKUZ5D+9uLivD1FVfPOy3RQQetslLkKr1qSOKKQwS4k878bb9EgcojsIMZuMcMmMD1JTJvjV549fxrwZNunJCqdGcB7A5AZjBa0z0RMCrpDm8NsQfl283sU15n84+kVP9V/xDoD6v7akqUoCeabH4s3o8nn4GGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k48CWh9/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k48CWh9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz00x331dz3028
	for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2025 15:00:49 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220e989edb6so12169945ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2025 20:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024047; x=1740628847; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv3tZqQaWCjcD6PO3eDwpFBkA9euhFlwIT4UxpHFlTU=;
        b=k48CWh9/IZa0rTmArqRKwLBnD/AnGyIDXnXAc0Kmm4miQJ7t2VXcDvomvqpCuSpZWJ
         Ei2Qp1VqcOmB6l+cLNmXPfKJETdJyPHY71yiYyXJawOiJPLRu2fGESYLIqP0XO4swqmI
         q2bzbGMNiTgV3eOyV+/PxKmvK0+VJ7N2qf+/foPd0jDb5gYc4W6BXwHxekI9zrEKm3OX
         4vMdrIOpHihSUeHDimlnsD6uzR1JyNasq+ERiUduxgS7gKs2dqNxiD1ZpMbw0Q64RnmS
         6UJasVsVnIZUTX6g+GUNeUDus2INp6zWx93E6EQCyY/flK/XIaRz6CRHtj2zXI8KteO7
         McZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024047; x=1740628847;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv3tZqQaWCjcD6PO3eDwpFBkA9euhFlwIT4UxpHFlTU=;
        b=tZFhgE1502QYYvJujBc6coaLbE4ZtEN7bVy7JjwAnkqTNLPPcAwbJ7L444aE0EyqBG
         0kGW/WRxbr2fDoA1RtU0uD4kBwRxGgD97fIPTwdao1zuG1cX8UJHaYlAnAIoOYLzlz84
         aPEWfnt0iCNRoRapoLt/I4rxWPSmONv8XGWKOMR0YdXaQ01ruenV/FEbf1TNbY0zi44N
         1NshZVOXmyEg3+P0mFIBe73CcO09jKog+vTeekETdMP9RXHLV2/SeFgvk6oCauzzCA3e
         RCFZklWg4M6nOmpsLqoAyd7QOnzbqKGK7tbJZfpm4fzy/vc4PboE619TkbltISFlz0F1
         9FJA==
X-Gm-Message-State: AOJu0YzL0lu6VcWS/KM2grvtCAqSQAcf9ya1Kyz8LmRpGxnIGm956AKA
	JiQXLjaQVRscndOEMfxrRTSzaVBuagNVdmzR7j6UcZY+1ECetZU=
X-Gm-Gg: ASbGncu7QiOxeb0x1SCa5xs3mjQsz1AFy2RcT2w5L5inr8u72nMXte0Wyl5+0nCVTy/
	57V6q8ZxpwnHStQf5zVHoRIvlLb+q0Q4r5ChQMRNY+IBadS1dOfula2nbofit3zoDwjimDTa4Iq
	6nEAlX83mCVULBMGYZsMA7qAMszr6GXCejGYHwyNYN3Othu0OTIexWlciyyFcy6s5wor7FMLf8+
	mN2N4MdPiV08GGfMNTTD2FY0RVqQGXjg+t1iFmq9wwr64QwBjrJTxHQs+8OcqIRVfG020enH7sN
	dhUUJHyEzN+ByCRbrgaVWlOfkHGnszLT0L8QMreiAslid+KxqU6Tx0tIqyosiAilIZ9LmY6kmON
	C2ObY8Ok=
X-Google-Smtp-Source: AGHT+IHhgygbVKUP14J9iJrQW7688uwtCOUG7BC5yeECXStlcnjspZZNlv6/TkWbGHer0YMEczqlCg==
X-Received: by 2002:a17:903:1c5:b0:215:72aa:693f with SMTP id d9443c01a7336-22103efeec8mr337742115ad.9.1740024043346;
        Wed, 19 Feb 2025 20:00:43 -0800 (PST)
Received: from localhost (2001-b400-e386-8f50-c5f8-9184-9e47-206d.emome-ip6.hinet.net. [2001:b400:e386:8f50:c5f8:9184:9e47:206d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491ecsm111768555ad.9.2025.02.19.20.00.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 20:00:42 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v1 0/1] i2c: npcm: Bug fixes remaining interrupts
Date: Thu, 20 Feb 2025 12:00:28 +0800
Message-Id: <20250220040029.27596-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patchset includes the following fix:

- Disable the interrupt enable bit to handle the asynchronous smbus/i2c
  interrupt status after the machine reboots as the interrupts were not
  handled in the smbus/i2c transfer session due to the reboot.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Tyrone Ting (1):
  i2c: npcm: disable interrupt enable bit before devm_request_irq

 drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.34.1

