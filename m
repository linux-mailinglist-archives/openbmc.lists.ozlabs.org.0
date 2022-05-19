Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6252D709
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3tYv0VbFz305H
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 01:09:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=O2PDgplY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=O2PDgplY; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3tWQ68J5z2yyf
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 01:07:28 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id y13so9811692eje.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TzWy8IpWXFf4QcdnvcMjYq4nzBOuUkzd1RDivYTla34=;
 b=O2PDgplY1dAenX3HLMAErbfYyQwuu0uPdRvBgPzYXUqSBGXDmByVLmWjBDHDu44xHO
 VgfJ5vsf6hAqQ5GYbfE0Rm9/73nzdUREsL8toGLE7XUro9dLlacbd21VZTePHynbvneB
 C6jNMDJxOl62s/wkEK8FfhhXcodSHlx3YtVUQEWabyGSrTndwOupvFG8PAcKOJAjPkWM
 TChs48xBxTCisBnoo+BK8WSsDi+6D+LkICbmjK+MD9fKV43J2CjfXnWUoLAS27+rSEL1
 tsvwJc7CZMmCS0lAS6ZsYUpBUPBSecfhY+3tArb9aIudG4pWwGw4y8uuy/ctZFb+rWHn
 jMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TzWy8IpWXFf4QcdnvcMjYq4nzBOuUkzd1RDivYTla34=;
 b=4KMS2pm+em+bZpBSq26Q4+qBd71+wB6ekmEkxPORYdId6bn1YIyM3TjEP6zjT4hBw8
 uF0srkVbG2uJxKrXhHXIs8GfrHPXygXWDP+mduLUxOgUUKwVe/G5rHoZYQCM3+YaeJMn
 smbp2sReYDRlcAotn61gn3FPKyE2tizlP+Fn/vCtJ5YySnRELgFqGiGorua+E0U3D09H
 2vm7M0kWS1TNgADtrkzlHHNO2Bg6bqN95PF1taX0l9tYHaD7GwpcE5SCyiilwBGjIGBO
 chjirWlh7uH2XKH2dBO1UIe2z9AFGCj0+2jPEN9f3eASkqn2vOoQW5nDbodOGa/E5XbV
 CGzA==
X-Gm-Message-State: AOAM530n6uBHzzP55X18rjeHAs/x4eDZpwoytlsAwk/aNz+DSXUeO5fR
 KI4YgYJc8XHJEGNGAg6MNm/bTw==
X-Google-Smtp-Source: ABdhPJzAgOuZlppdpvC6Xd5vZ9Wj+Xbo5n3hdDqLFvGhtojvWID7BfxsSY4cl4RvGaMbMyPLdmg/4Q==
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id
 kx5-20020a170907774500b006f3674a0339mr4774210ejc.207.1652972842009; 
 Thu, 19 May 2022 08:07:22 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a056402124300b0042617ba63d5sm2962263edw.95.2022.05.19.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 08:07:21 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/3] Add support for IBM
 Genesis3
Date: Thu, 19 May 2022 17:07:16 +0200
Message-Id: <20220519150719.22338-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v3:
  - Drop FIRMWARE_2ND_BOOT patch
  - Include reference board DTS instead of copying it
  - Rename DTS to ast2500-<boardname>
  - Describe defconfig changes in commit message

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (3):
  arm/dts: Add Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_DRAM_UART_TO_UART1
  configs: Add IBM Genesis3 defconfig

 arch/arm/dts/Makefile                 |  1 +
 arch/arm/dts/ast2500-ibm-genesis3.dts | 28 ++++++++++
 arch/arm/mach-aspeed/ast2500/Kconfig  |  6 +++
 configs/ibm_genesis3_defconfig        | 74 +++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-ibm-genesis3.dts
 create mode 100644 configs/ibm_genesis3_defconfig

-- 
2.35.3

