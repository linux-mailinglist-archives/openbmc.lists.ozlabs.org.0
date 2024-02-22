Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D7860038
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 18:59:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DbjFc6bu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggrj3b9Wz3dVp
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 04:59:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DbjFc6bu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tggr86QSfz3cWw
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 04:59:03 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so79760e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 09:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624736; x=1709229536; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cz55Zzpfo/zk1u1UrDBK1WZgp/imaYiWSbF3hiJkto8=;
        b=DbjFc6buZZXvRnMJWkjwvouTRYAXT27cmJNIN5bUuWxn2e0pipRmvz9VqsgMmEO5EG
         iDN43gh18QATsQITYGyj72iRBPlz56vr9uMtBZKEPu9ydHhgt9OQByjqdZjNvT6c4/37
         8fKnlZUTVosCVQjFaajRyGZODFv8s9vKF+BntAJNCskNJ6gcpGg7FDCNdpzgonPy5T1i
         1tNnjXLo1u06HOqefk2NIUyKvD/S2qqQGBn942Ujcnn7bKlJdyH8Km4ZAQMU0jFoeANt
         ozevzhk5Kzm9qwvWRsZhx+z7I1NZLZNMqqgdDqnFt0IULnEXeQuxf4nmQELqpOPgfLjb
         C58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624736; x=1709229536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cz55Zzpfo/zk1u1UrDBK1WZgp/imaYiWSbF3hiJkto8=;
        b=JRYB693qdd61/zkG3/kkw7NyzNH+D36SwvRK0DOMgP1FDsyNUxlv1GNO1/LT7rtWIi
         6BWoFXTpvwkQ8uCc+yfhdp/6j4T61YZsAV7YkihHxJnzUHsjXH0gf/i97FjsxnP/4P12
         /jmNss7HH73pRxw5kLO2xRMCPgtQwrqzGFAIvnMCV2UStXI58MQ/r87wCXlPlSkNIbQF
         ec+XO3ooEF54G/Hwqqzo0O+3ZjViekvUP3BrlBu5VyIaDh7gXwTjTuSQnnjoWcXr7lqk
         uUWAhiy5llM9PoBYUxkBzepDjX9jmIkUEiNM3eopexFdskquJ81b0pl+3rvLQf7rV0Fj
         kb9w==
X-Forwarded-Encrypted: i=1; AJvYcCXJs8tzQMzM15nrXnd15VenxcLIqMyEHTsCc6Oa6BNMWoZWW8AWpLio0aPEgtB+z4NTfTldCxHBV3NAB6n+2eKTt+g/AEhklC4=
X-Gm-Message-State: AOJu0YyHUHUWpuIkTj8aRPWRRRauKBo9v2EETrMoB8rSCpOuTmlvPAS0
	aPg07Ne91p/utEA9Dpj1ajoZC779SX8iP1juxE9IActcagOGbC0v
X-Google-Smtp-Source: AGHT+IE/1Dk0fjNMEbmuMP18Tm/K1SfZnMv41lhns0HjNNdVpdbheULkXP3yVIXQIWLc1QyRxeNXzg==
X-Received: by 2002:a05:6512:2349:b0:511:6c63:f76a with SMTP id p9-20020a056512234900b005116c63f76amr17664673lfu.41.1708624736307;
        Thu, 22 Feb 2024 09:58:56 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id q25-20020a05651232b900b00512a949a4d6sm1957987lfe.7.2024.02.22.09.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:58:55 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v2 0/4] net: pcs: xpcs: Cleanups before adding MMIO dev support
Date: Thu, 22 Feb 2024 20:58:19 +0300
Message-ID: <20240222175843.26919-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As stated in the subject this series is a short prequel before submitting
the main patches adding the memory-mapped DW XPCS support to the DW XPCS
and DW *MAC (STMMAC) drivers. Originally it was a part of the bigger
patchset (see the changelog v2 link below) but was detached to a
preparation set to shrink down the main series thus simplifying it'
review.

The patchset' content is straightforward: drop the redundant sentinel
entry and the header files; return EINVAL errno from the soft-reset method
and make sure that the interface validation method return EINVAL straight
away if the requested interface isn't supported by the XPCS device
instance. All of these changes are required to simplify the changes being
introduced a bit later in the framework of the memory-mapped DW XPCS
support patches.

Link: https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com
Changelog v2:
- Move the preparation patches to a separate series.
- Simplify the commit messages (@Russell, @Vladimir).

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: openbmc@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
  net: pcs: xpcs: Drop redundant workqueue.h include directive
  net: pcs: xpcs: Return EINVAL in the internal methods
  net: pcs: xpcs: Explicitly return error on caps validation

 drivers/net/pcs/pcs-xpcs.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.0

