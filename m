Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F06CD90B5
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:23:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWfw24zPzDr0B
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:23:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wwuv8YZl"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tWZb55jfzDqwM
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 23:19:51 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id a2so14609646pfo.10
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RFL4DWod3iOwHdWMx2O/EDC1gPMRd7rs1NSXqo6F7U=;
 b=Wwuv8YZlglu3B5WYhGpiygiOfqrucm4ooSUBRvadgJWDZMH1wVe4gsMxkRHGUaP0Yq
 v9vY3UaPm3AqQ/RRzGG7D0S0o3w4rrh+Mg1N03zFWr/xuWdreh1bRgJ0BJPkViUPEDfV
 OZwineQ+D51R+ba4HQLEjza5mbJYzzwZpQ3Yvzfsf6Vh7SbwS7cOJOtao4rMICswMOrL
 6jMFi0BovcHcfD2ALln43lAe3S6cjvBxbW9qSo21X19y/hf48qnU1xCMRzvJXMi29SE/
 MO0V+VyhA5QXkT4hoPfdJgsOWq2HTNk3KG1rL8fTW1OTm7sczg1mCJvk2qPFLPx5iZj8
 XtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1RFL4DWod3iOwHdWMx2O/EDC1gPMRd7rs1NSXqo6F7U=;
 b=qNj+DkjvrIkCoa7pezaBBOh5GK432wrIYM6ALoE/1PH2ulJArQCWcX9P4fH9jd65c0
 5oJinYmXOvs4/xD8WFNkR9Knv5W7MAOAvHBJuCAXav3dkW2g/32VXKswksUZdvTsyyix
 VndRwWtK00BkAddqII6MskA8GqLmyPYQIEmfMQVZdzYcBP3DiyklqJVAVVdW/HUwrMy3
 NIbi6qNzrM4do/e+4QE8fDWqlw8956qmNpAJkS3jfnKvT1fZ+QO9F9Bco/J9498DTY2P
 C0EOpoTxBj6OJjzpY3pF+JU1lnJXnBCv0evRfaVf5RjTd4BPxYpSziq58D4OD7Bngpiy
 fISA==
X-Gm-Message-State: APjAAAWWCJnGtotplaRQyDBui+c6IpBwhMukiLilPBGDbv7mPvHtORNi
 /Pazqzu8S0OOwtJK2qO9WOqdnj2F7ZI=
X-Google-Smtp-Source: APXvYqw/0rMNRf8mwVtZy9s/VuoID+CTHoD8soCIvddf70dGxiYfNM88YXx4ocaXbFuY2dT5eVHobQ==
X-Received: by 2002:a17:90a:2302:: with SMTP id
 f2mr4784633pje.132.1571228388521; 
 Wed, 16 Oct 2019 05:19:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c1sm39075531pfb.135.2019.10.16.05.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 05:19:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/3] ARM: dts: aspeed: tacoma: Use 64MB for
 firmware memory
Date: Wed, 16 Oct 2019 22:49:33 +1030
Message-Id: <20191016121934.28481-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016121934.28481-1-joel@jms.id.au>
References: <20191016121934.28481-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Mbox's file mode needs a window the same size as the image being loaded.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index c073ad8d071f..f0d2f741800a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -27,7 +27,7 @@
 
 		flash_memory: region@ba000000 {
 			no-map;
-			reg = <0xba000000 0x2000000>; /* 32M */
+			reg = <0xba000000 0x4000000>; /* 64M */
 		};
 	};
 
-- 
2.23.0

