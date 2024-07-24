Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5393B5D3
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 19:24:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QC6t8rGA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTgqF5f8Vz3d32
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 03:24:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QC6t8rGA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTgpj2k05z2xps
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 03:23:40 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc52394c92so147925ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841817; x=1722446617; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBmyCwQ2ky7cP4BHbFdG8vGjWVDZipX80jWFQ7NxVh4=;
        b=QC6t8rGACCiIpbMxugcfOjoLBx46WCwxW0n387m3C8c/DWynpICBexW+1jhCc6em57
         b/i0YVTb/Mcax1dCP7fFiGcHBNKzOl8SU8DT4rLFZcq1CGpzZ9WQJqlQe1P58JdnM14F
         ocpDTAG1Pxi2kwaHQ41W7IbMxHyqUs3KqfyhJEXy3FWfffW9BXIHFBcfG3YHhgmuhXc3
         sbaQ9bf9oZfebobIEmYvvqbDs6wr3dsef13bT2sJRbeUR7HXiOT0zNDkcSkl3EmvTyTq
         PA9A0tGKTZRlOEE5PLLNlgK6OA9htbUm8fAo36eWKj/p5ptJwK6zDQR3L7+0J/+/gXYj
         aOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841817; x=1722446617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBmyCwQ2ky7cP4BHbFdG8vGjWVDZipX80jWFQ7NxVh4=;
        b=ZKN+0x8LitKladJlvcPQcnpFKpTul7kzstKdluJBLkMfsJ7665ZjIjENi1wgMvKys+
         fKFNvwNhKxTGPOyTmJgj7Z0ZVpXVD7IpC1uauyy7o+8EbM1DD/xtAhNitsZ0vI0yar7/
         VnPAyk84vDOQYpjJnph0IUAB7NHyiVidKGGLsAyyhb9yGgdkcYkoq4A7MInixInFSoBB
         R/STbHKK+OlK0uddmKxuh5Iz7ad2Cjs+XXEA7W51H6v8lUhclwOfK9LeO2NRCXuBrm0h
         uR1qln1MrfgmA15ybOqwhx/FgL6EpIcf2JPLLRgkXtYmMGa1emZB3NGWtOAdiQUykxOh
         1Yyw==
X-Gm-Message-State: AOJu0YzT+RFAHuXP0ei/M4ibc9su2VA8AXoBYtUOzOmFqy30+Ss4zKS0
	TcxDCFWSgmMyA1elmKyrijzfk0R55yehmh3yEtzkRHpcyaWOmkwfaBONvg==
X-Google-Smtp-Source: AGHT+IHkR6mBhFwWFa7518jHqIeN5lq8AbbTP41wMR1BK3SAH9tUGaCN9fGj7LUED4RMyWNaH7cfDw==
X-Received: by 2002:a17:902:ce8d:b0:1fd:9b96:32f5 with SMTP id d9443c01a7336-1fed38bc6femr2474215ad.31.1721841817325;
        Wed, 24 Jul 2024 10:23:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f318457sm96830945ad.134.2024.07.24.10.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:23:36 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 0/5] Add NCSI pin group config to aspeed-g6 pinctrl
Date: Thu, 25 Jul 2024 01:21:24 +0800
Message-Id: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
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

Add NCSI pin group config to aspeed-g6 pinctrl.
Backport the patches listed below.
Link: https://lore.kernel.org/r/20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-3-a6fe2281a1b8@codeconstruct.com.au
Link: https://lore.kernel.org/all/20240725-potin-catalina-dts-v4-0-aa6f235a2e78@gmail.com/

Andrew Jeffery (3):
  dt-bindings: pinctrl: aspeed: Use block syntax for function and groups
  dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe I3C, USB

Potin Lai (2):
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
  pinctrl: aspeed-g6: Add NCSI pin group config

 .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 169 +++++-
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 188 ++++++-
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 514 ++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |  10 +-
 4 files changed, 796 insertions(+), 85 deletions(-)

-- 
2.31.1

