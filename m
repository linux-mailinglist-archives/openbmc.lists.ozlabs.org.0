Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2472640F
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 17:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbrbt430dz3dt7
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 01:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=alDCByfz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=alDCByfz;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrZG0LXjz3dsN
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2023 01:17:57 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b1c910ee19so43114761fa.3
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2023 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686151071; x=1688743071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CX0Oc+oR0doRcnj4n06+nk35DSi85z+omNnBlOlczO0=;
        b=alDCByfzDIV34p4I5QR5uqL1E+QPO1aOYeag0xlan/RSJa/t/xzeb4ZHIKwDQj3QS9
         /yqqqIrYwYUBzqMlbNEqcxlvTYVd0S9U/FQ1peO0LH4ocerNH4Pp6hq9qVqo5mbIIhVu
         U0hZJgmpcCC88hwhSS9Bx0uHkpAInOWZB/eAFW9tyZpgJl0hc28lHxu/E6WeF0WfrHZu
         I18ziSNssiKSLRzWKS9Dpb6GSqjEZFX0NOwD9bLxjtdL9+9bmxC3n9Zulu/4CMiuB1BV
         2CyV3he1fD1uPQ4LIHQOG7x+9fz7s3PdlmLXnufI7jHPm9W8BZ/Hv87IFvTPxi69HU1z
         C9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151071; x=1688743071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX0Oc+oR0doRcnj4n06+nk35DSi85z+omNnBlOlczO0=;
        b=gTSD4vu4yl4YRFcwpa5vAjEuwm/5XUB5zOuUenC5TSG6jVXh5uY1HtkHuYcKih0vmF
         LzD2Dxn9Y9fsRQWdjsN1wJcjefV+4uJ1g30YeIu8U3BhbXIoTraCv+r+wNPKA63iAsyD
         nPZMRhx7K/LU0r0n2u7Q5G7fJiJ5v7+Vn15/zsZQjA80yHs4Ta0nGFY2aZ7OD88P/9a3
         ZFIumRMSbtGAWoMAJioRuWLebFBXQkrEdcgcEjHycS3BblNvUrIlH33yUASeCEd0gTSb
         wQ2vaPwvcvYuiRhsZDWJbz0hKDZa0/xWM1rOTdJAoGea0I/rwZ8m7BTv6bcvJjsYw9qH
         F8Wg==
X-Gm-Message-State: AC+VfDxTxDyeZETEmnH+Dogh2KV110cYGAgQ/s33ch73h8gW7gKeFz8F
	tmbwM8nQgyolKgJyqIjFiRI=
X-Google-Smtp-Source: ACHHUZ4lxlkCjI39/Hnufpw2oEtp+i68IAqhAg7vE3iwbRhSDwNcb7toK919ZbaHvcZu8bHyUDy4/Q==
X-Received: by 2002:a2e:82c3:0:b0:2b1:b301:e651 with SMTP id n3-20020a2e82c3000000b002b1b301e651mr2529080ljh.3.1686151071292;
        Wed, 07 Jun 2023 08:17:51 -0700 (PDT)
Received: from localhost.localdomain (95-31-191-227.broadband.corbina.ru. [95.31.191.227])
        by smtp.googlemail.com with ESMTPSA id v5-20020a2e87c5000000b002ad9a1bfa8esm2302014ljj.1.2023.06.07.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:17:50 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH v3 0/2] net/ncsi: refactoring for GMA command
Date: Wed,  7 Jun 2023 18:17:40 +0300
Message-Id: <20230607151742.6699-1-fr0st61te@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make one GMA function for all manufacturers, change ndo_set_mac_address
to dev_set_mac_address for notifiying net layer about MAC change which
ndo_set_mac_address doesn't do. 

Changes from v1:
	1. delete ftgmac100.txt changes about mac-address-increment
	2. add convert to yaml from ftgmac100.txt
	3. add mac-address-increment option for ethernet-controller.yaml

Changes from v2:
	1. remove DT changes from series, will be done in another one

Ivan Mikhaylov (2):
  net/ncsi: make one oem_gma function for all mfr id
  net/ncsi: change from ndo_set_mac_address to dev_set_mac_address

 net/ncsi/ncsi-rsp.c | 93 +++++++++++----------------------------------
 1 file changed, 22 insertions(+), 71 deletions(-)

-- 
2.40.1

