Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539E77546E
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:50:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YU40hlqX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMfW2NKMz3bW4
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:50:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YU40hlqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMdt3HkRz2yV8
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:36 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686ba97e4feso6145469b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567372; x=1692172172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BF53XRtfmJ55ZNLZ7Zq8VaVfYvDjcxZOPUeHTKoISVg=;
        b=YU40hlqXYn5kPDEl9e7NKtxeNXYjJq9CFyUZnSMa/r1dJlBTRdYBnQ8S8NyfysNUwj
         l5YoK6zsrs3/RFnAXZnEDEnpekMFVgp+RMUcCiIW+KnsrV6ozxZ+J2hKD6cvcx8tBFP/
         w78A0Wm8ajQcMzBb4IdhZfV/TsYRGtof0Osxh8B5VmBFj7mRvdQ6uUdsQ6aYcBCDmOhp
         p9N80Kw9yt6+fU14hA1NQdXszoMYtliDA5/WWzGApx1/JA/8ypdQB8OvXAv0OMPPhpw+
         5e4UnRANd8ez9n+64XyhJzLhwhYc8feeZV1P4BfKHmDiHJJA6XnVEfzr47I9O5n4jxIy
         sOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567372; x=1692172172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF53XRtfmJ55ZNLZ7Zq8VaVfYvDjcxZOPUeHTKoISVg=;
        b=edbNfxzO0+wyuFYkQ2dXBF4BHHANndf0N+yVteLq9L9TNOFjMSULtX5JHp58vyXnXF
         1fvql5YQwFWhpvqb3lZ8hftc20AzdyKc5dg1SX6vDE7NtB83XKdJijsmGA3OXN9uFEKW
         3N8a6nqm/WOaMxnbCBKw31kPvaUicvaKqr8a+cZa4R1XYaga/pxfxplSUPdEv5JSknvQ
         9nYNUI9dcMshRsLrzI+FxWJJoTJPVZSWJG8YDuLKUaf+7BHN6czvCR7WRT4jC0jJU6CR
         TiN1dj6QxdjTb5xpTRxjF5IvVqPk6V14Dr0tolhwZxLEJm19ASpNllWyiHJ6DAaNP4DY
         pODA==
X-Gm-Message-State: AOJu0YzvOSAH1pP6e+WaLiI7e4I3NLl0AKmSpZX8rt5DFO+xmfb2NYnw
	RWtk3Vhi7ydov5ednOomCKtOm/rLF9o=
X-Google-Smtp-Source: AGHT+IGV24U/OuZAaNjP916evZ1tvTohNP1pTWp4qb1xizMgsIlshDp7ZsC53jHXhU6Qnmv/WFNbmQ==
X-Received: by 2002:a05:6a00:15c6:b0:687:8417:ab58 with SMTP id o6-20020a056a0015c600b006878417ab58mr2184298pfu.32.1691567371630;
        Wed, 09 Aug 2023 00:49:31 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 0/5] ARM: dts: aspeed: Reorganize P10 FSI tree
Date: Wed,  9 Aug 2023 17:19:16 +0930
Message-Id: <20230809074921.116987-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
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

Hi Eddie,

This is v2 of your patch[1] reworked into a few separate commits. I
found it hard to review the whole thing, so I split it up a bit.

Let me know if you think it's okay.

[1] https://lore.kernel.org/openbmc/20230412195017.2836161-1-eajames@linux.ibm.com

Eddie James (2):
  ARM: dts: aspeed: Add P10 FSI descriptions
  ARM: dts: aspeed: everest: Reorganise FSI description

Joel Stanley (3):
  ARM: dts: aspeed: bonnell: Reorganise FSI description
  ARM: dts: aspeed: rainier: Reorganise FSI description
  ARM: dts: aspeed: everest: Move common devices up

 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts |  384 +---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1837 ++++++++++--------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  678 +------
 arch/arm/boot/dts/ibm-power10-dual.dtsi      |  380 ++++
 arch/arm/boot/dts/ibm-power10-quad.dtsi      | 1305 +++++++++++++
 5 files changed, 2782 insertions(+), 1802 deletions(-)
 create mode 100644 arch/arm/boot/dts/ibm-power10-dual.dtsi
 create mode 100644 arch/arm/boot/dts/ibm-power10-quad.dtsi

-- 
2.40.1

