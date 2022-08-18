Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0C59CC52
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTPw30Cmz3bpr
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:40:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzQhgJqC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzQhgJqC;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Ygq6NRqz2xkV
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 15:42:46 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id y141so602873pfb.7
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=FY65PNSVWqDBYali+M38MQ8c+8txH8rOtDLMVLEuHdI=;
        b=AzQhgJqCkhVnq6Whc526jAOc8l46eN72vfZc0Q1wJH8g4vnxlw5KapuyGj1XtANVJS
         ojf+wsXFiLPP9Oa1YQIZeocPzFKamXqcQV9ma5uw6Yuc160Eaj7viH+EoA1yo7fsOJ7p
         Kw+WvpklkXb6wP4zrctYn+lEJuTE5lRHQ1UK7vr6bFhYhDVr3r/VDBrfG6qhK9+G0SBZ
         09rjw/8SGv5x1eTqCDiZ+BjJGvGrXOcCQFVxl12pys74xQYhiChvgBk0r2tJ8Sr2Jtsw
         7obzvaWE0lj5kLWt06VPQqzvj6DuZWsQzhIyTyGAUKl46ItZwK9aTF4IK8FWKdEvXw18
         m+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FY65PNSVWqDBYali+M38MQ8c+8txH8rOtDLMVLEuHdI=;
        b=N8voSgWDzKxGAsWwTygb84Xgmqpa/FTnGzL3DrXa1cPPqpA9LSBdIQYhAwMxZLNIMI
         zAAcGxR3jrndEuDEqRCNCQIaBMCPcrIyufc7a4u1SmhXBgCApqZ3NmUnWVedR6L8kbAC
         ffRZEA3cLPTaOhgEjmGYhfEFbW1hnqXiujjJygq4Jp5oFOaGOL89rYXsDycAGSCiM4Um
         dj5xZ313vi5WctO8u4gdWeKE+hb0JcjK+rWNndUeR2DdhJwxPNrHxVNfaXSwZuGdGFtW
         pRhx3xjQaj1zjYp9ZKnJidVuNugGB4tyABr3pxTgOvvINXhK/lyAP+BZMYebLtJKJrIl
         r2uQ==
X-Gm-Message-State: ACgBeo0Y7DZE9DU2jChH14SBBZKlMerSvD6FxfKUM/d3tBOQqRhLNVad
	oAkNhxBxPRKXdSuAe+R1MKqqAIgtIq6xog==
X-Google-Smtp-Source: AA6agR7Ylz3U99/o28VeRX8SOb4ypEZgugS1mFJKCoKRjiqK/xXMx+NXw3q5mD55eAE9tBuDxXiiPQ==
X-Received: by 2002:a63:d609:0:b0:41d:9296:11d4 with SMTP id q9-20020a63d609000000b0041d929611d4mr1336202pgg.102.1660801361776;
        Wed, 17 Aug 2022 22:42:41 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b0016d5626af4fsm459129pln.21.2022.08.17.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 22:42:40 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 0/2] Update Facebook Bletchley BMC devicetree
Date: Thu, 18 Aug 2022 05:03:54 +0000
Message-Id: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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
Cc: potin.lai@quantatw.com, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Could you help review this patch series and backport to 5.15? Thank you.
LORE LINK: https://lore.kernel.org/all/20220810004338.329832-1-potin.lai.pt@gmail.com/

This patch series add modifications as below
1. add a IPMB node for USB debug card communication.
2. remove hdc1080 node due to incompatible 2nd source (si7021). 

Potin Lai (2):
  ARM: dts: aspeed: bletchley: add USB debug card IPMB node
  ARM: dts: aspeed: bletchley: remove hdc1080 node

 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.31.1

