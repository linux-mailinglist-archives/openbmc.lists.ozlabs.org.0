Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B930F877992
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 02:35:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e4lAAaZi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtK9J0V1yz3dTL
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 12:35:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e4lAAaZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtK7n2pjLz3cH4
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 12:34:28 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dd922cbcc7so4445825ad.2
        for <openbmc@lists.ozlabs.org>; Sun, 10 Mar 2024 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710120863; x=1710725663; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VR+QQ5l8PpU95Y/xTT+3n13mQ9mpbvLS9Y3rI68/ZfQ=;
        b=e4lAAaZiqteuxoKdWSReZLjZfCX4S2UcNVMzo2UwlZzohG6lU9hVWfdQRvRPvRLRfd
         pgvzfOyM+zYZu9M+Fng1fOGbotnxMYuOxHTQSBtxE0iMZxyd+mTKKCmWjDk6lx1QeKaj
         vryfRcw6KZ6sMjMgc0bXr2J3AMA2Z33cCXRFN0Endt0ltgWXp1iDFfkjciodQ4e8lC3E
         6gxb4uC7f/4hSoa5eigeow7f2oE8nr3KwzEx9snEw1hLQFu0P5Gaa/wJXbWR3NXNiPD8
         XudRYIovnBJONiqoQsp2bDLBTJ8qt96koCeUoV3pyceTFOGm0oU+JA/U+GWNnroMC10d
         CGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710120863; x=1710725663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR+QQ5l8PpU95Y/xTT+3n13mQ9mpbvLS9Y3rI68/ZfQ=;
        b=ONzRC71FrzqSSAmjHtSkzGo5jwPpfBGxHw8c2YpZlZtN9R7TdWXIQsoZLtNkdCuDzE
         +YjshFrbiNmecOzF3aETxqb+Lk4qRzni92OUxaYbHmZxDbxNbL1ltsGkBoAfyzcH5TbD
         Ht9fUcEl+xrSdJo37eTyEzwGlR436TmtqyaMMZo59stPCXsqLXMwQUDlL3DjNJRre7u9
         tXKihiiyMZOjPgo8teiiC0bpiYzlg5lgn766a0sQ5j/3uPiNKhoemDg7kad0N6qcd6Gf
         RFbRAkLrVHTxK3Lupx5Kj1ZvWVj9A1YwluiXi/qCV9zX6wIIWb3GuDWbrHpvx+tx9Ctq
         NycA==
X-Gm-Message-State: AOJu0YwvcxBRAQDBy7KrwRiUaDrpPrVQYrR/1uRxYhdaKiwQArCEGYWs
	5NP4rQl+hGY/Xea0lYoBe5zuAUyUzMYZAgt9fRjPe5ouc2bVQ6jz
X-Google-Smtp-Source: AGHT+IGJdwZSdNxwoxWO8o+tapZOOpCyTd3U4i83c6tdD3UW5sHog1iZN71eTpdlG5F1RIfTI3rIAA==
X-Received: by 2002:a17:903:496:b0:1dc:6d64:dcff with SMTP id jj22-20020a170903049600b001dc6d64dcffmr5204730plb.37.1710120862533;
        Sun, 10 Mar 2024 18:34:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902e54c00b001dbae7b85b1sm3255012plf.237.2024.03.10.18.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 18:34:21 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	alexandre.belloni@bootlin.com,
	mimi05633@gmail.com,
	KWLIU@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v1 0/1] rtc: nuvoton: Modify part number value
Date: Mon, 11 Mar 2024 09:34:04 +0800
Message-Id: <20240311013405.3398823-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes since version 1:
  rtc: nuvoton: Modify part number value to match datasheet definition.

Mia Lin (1):
  rtc: nuvoton: Modify part number value

 drivers/rtc/rtc-nct3018y.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.25.1

