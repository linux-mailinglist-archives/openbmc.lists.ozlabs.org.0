Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD3816645
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 07:09:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=efWd8a84;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StqCz5B3Pz3c75
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 17:09:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=efWd8a84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StqBQ6TZTz3bYQ
	for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2023 17:08:14 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d3954833a5so1421202b3a.3
        for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2023 22:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702879688; x=1703484488; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ow6D4JgQK6UYlo9BLTRI63szThqGowEF6dWx5BIsHc=;
        b=efWd8a84jDrY/UpEwISruZKQki4o7+x9/pkEA9aPv+b92LCdRJFuGXMU08v4qlT8SI
         Ic05NlvhsGJAaSB7cHRIXaZQwbnEiiwxMjAGRWC+HlkZmDFGWAwlOEwL3XEnRDjNYyeC
         Ze5nB1oN12xwDU2EMvGaGPOIa4vQ+BIEsYxtZLV5hpnb3Mvb6bsO3MvQ1lTaLXFa3Aqs
         08px43DucBekVa2SDmgwygMcHsQrfZUXFDvM08yQIQFF7x2DUZ1eLMbPp70DjnUuloX5
         yJUznYCBUoRKUI8bHcMC9+QKJPDPhRvNyqR57A7Gq2Fmp+HhMcoRScCbcXJrutr3+qnv
         somw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879688; x=1703484488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ow6D4JgQK6UYlo9BLTRI63szThqGowEF6dWx5BIsHc=;
        b=n//CAFk1piu/E29SfPxun/h8fvEBk1/1QII/fGKafsT+lgPLLKaiBrBkD4At6t59nY
         FGRRPG+/oQ9DgTvDJBGhAbOSs54t3wxuzPpCyuowhPjvynsMcRvZSlhpUVohSUaoKAMi
         YPo2oFnPip5h3jAnCjP06zEcggkBQipx5DbQ8mwioEJy9SA6StE0YgOYRiCwLb5ceLeh
         zOL4y71jZyQl4Q9McqUKoxCuZGnfE51zGtdn2E017SpRpg6LzBWX6lTZPF7/+5zJXBzo
         dE4rr1UFpoe8A5hrO6x7gSeyh7aMJJoJSl/rfsXDf+QV35aKZkSd9BCQ/Yf96Tjfdp2f
         RksA==
X-Gm-Message-State: AOJu0YwVpDDA0+vKqnOylOHCPsmEXKUpDhUb0UYlJtnFCGMkmJlPoo6v
	IWRLyE7YjuKr31qI9WTzpY5SEU+J+3I=
X-Google-Smtp-Source: AGHT+IHwV5ZcBGqY3333CpxX8rhW8Z2EHoJLOulmczQoS+gqIZ1/yZg8B9aPRq7ghybew43wHYB25g==
X-Received: by 2002:a05:6a00:4804:b0:6ce:f69f:7055 with SMTP id di4-20020a056a00480400b006cef69f7055mr11785914pfb.17.1702879687727;
        Sun, 17 Dec 2023 22:08:07 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id hq10-20020a056a00680a00b006d5b877aa9asm1877689pfb.41.2023.12.17.22.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:08:07 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 0/2] hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857 controller
Date: Mon, 18 Dec 2023 14:05:57 +0800
Message-Id: <20231218060559.2302459-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
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

Add support for mp2856/mp2857 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is a dual-loop, digital, multi-phase,
modulation controller.

Link: https://lore.kernel.org/all/20231108024222.2026546-1-peter.yin@quantatw.com/

Peter Yin (2):
  dt-bindings: Add MP2856/MP2857 voltage regulator device
  hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857
    controller

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2856.rst                |  98 ++++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2856.c                  | 466 ++++++++++++++++++
 6 files changed, 579 insertions(+)
 create mode 100644 Documentation/hwmon/mp2856.rst
 create mode 100644 drivers/hwmon/pmbus/mp2856.c

-- 
2.31.1

