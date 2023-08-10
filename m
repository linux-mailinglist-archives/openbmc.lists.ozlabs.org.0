Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B17774D8
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 11:45:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cWEuGD9k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM28Y6LBqz3c1t
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 19:45:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cWEuGD9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM26v5prKz3bsW
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 19:43:34 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so5661985ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691660609; x=1692265409;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWehwRx2Inhk/fUq70jnCFdNYEvhO3U8cIjUBtfVKAI=;
        b=cWEuGD9kr0kHJaa02VTFoYW7Scd7qcX9gZNN7GRBdJHXAKxiTKl3Sxqi/1k+lRq7f/
         5YNEKQVBPgb1al5KYky+hRBgXRjOSHo5N2/F74tPmPzDMY+dFNnOigkiQ6NruWAq0D0x
         BB6x4eARlTU6NokPR5sKkhlAT9+60G40q/3LWlfHtMXlL5B9FdxfnsjoS8TbXRY1oh8z
         vDPNjtMKbR7HLUXPe9mUhcNIvBgn1eD3NdLbHFO8oPMLmniYAD9jdJBcNDZRB6/ZwVje
         jrWbOoVL0743R6j9tf4YpZAjyPgwb3sGLwAGxiioneRZqobVUU6ZbgCfV/UuHxPwFrSD
         OFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691660609; x=1692265409;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWehwRx2Inhk/fUq70jnCFdNYEvhO3U8cIjUBtfVKAI=;
        b=ZHgR4b6Ofkmc7r1BgqGHrx2YamWiFuDW6gLSXKNWGNwv7ltcG5Lwran7nESlVEEngf
         dRBIez/bAaxS0sNI9ISut61rK24hnhl37bHjTwDkdqM/oK4JL8Xt+eHYu+bGP1n520dm
         ljVM7J+RXZ6ivDMPmpUXl+r0qxIZkwio7P9J4LazyroTXKr9vmnxG8gB3n+U53SgJbCL
         uSVPvk1A90UzMg38nxXgee7dcZdbbsXwqhsFGhTEe7D/iQO8XW3xmPqh+0wSTUd81fBs
         N+icETTxTiIv5KjGBuCNTO4p2hdG9HOcxp+LpmtAHIXJQBcl9HqCzfsaPz0byqZJtv4v
         GEDQ==
X-Gm-Message-State: AOJu0Yx5ElVRZ3f4PZCyNseerPIrVzGIwxb2IAGTPTsNqwDgGPNsSEcm
	rZQJjjgHvLvjZywk7GKMXdk=
X-Google-Smtp-Source: AGHT+IF3PCCPrn6HxRQlivjViuAxLBokR9KAe12ZdDvbvawzvVjZUgETjcH3B8CsXzBO4ugHOSiXag==
X-Received: by 2002:a17:902:bd0b:b0:1b2:4852:9a5f with SMTP id p11-20020a170902bd0b00b001b248529a5fmr1367143pls.54.1691660608854;
        Thu, 10 Aug 2023 02:43:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id bi8-20020a170902bf0800b001bba3650448sm1233665plb.258.2023.08.10.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:43:28 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v3 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Thu, 10 Aug 2023 17:43:22 +0800
Message-Id: <20230810094323.20077-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes since version 3:
  Remove the comparison between DT compatible and chip data.

Changes since version 2:
  Add DT compatible to check the chip matches or not.

Changes since version 1:
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

Mia Lin (1):
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

 drivers/rtc/rtc-nct3018y.c | 63 ++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 9 deletions(-)

-- 
2.17.1

