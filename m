Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0B1A78CA
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 12:52:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491j4C4QDZzDqcN
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 20:52:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g3RHP2Os; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491j3Y0rgdzDqWR
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 20:51:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a13so5891958pfa.2
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jryGiSpOzAUnTSPByMu8P85OVM8Tp1VW/wh7Tg1Xbw=;
 b=g3RHP2Os7qPZL/GomdraOUkf/jcpKhZDZ8Zp+z69gfVFt5d92d8FBbgR3JtqYxoSwj
 tg3Jy5Wxwkyme+T2f/MbZElBeKYIRv0EQtgaAr9sox/GTcxWsPpiyEdg3JTmQDHaMwIK
 6eGiQqsBZr6OoGICmRyQUCuasaBjRxHwWveS1roecBHWMG+EqWWx07wQW95h/CFS8b7I
 syp+tEPOBKHi2AMbL7x13yQUq1TR/Dnkl8tSlMFzxMPY4t94QyLPGlHx0qtL6AvoT8Gg
 vKmfdr7zlP3mmENe96/PBdtLa0drFJZK0y522/C1oTvYOEm3aP9EqH3oicTS1HHPv+1Y
 stIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1jryGiSpOzAUnTSPByMu8P85OVM8Tp1VW/wh7Tg1Xbw=;
 b=jYkNKbTjMJJm4wRZ9tMOpGkWoRoDD4vZiLtRucMYIIDPixBLIQQlZR6GvhoOkUtYjj
 zZ44RYYblWY9Qj9aOql999VEiz999s9feLQ+RNiH3TsLsaKoxmMMpDgwQvp/ZDU+2bo+
 e8rPXZ9rxOF7KeKABuwfbn2q6sKBi5s2WeV2HBflPee6nVfPmywbTQ/4R3zd/B5+Jmsu
 DTHRCtsT3aFCeX5t/QRBvyuBspBh3aI5JCQbYjqyhSJUJDLjZaYfaOLpR9QzqVyJCfJ3
 Xt+3QcWEBhDd7Gk0j5us6xViy7pvlMzJm31stqSZ5TzcrChzyIrRlLQ05M1AchxD3AK0
 nDtw==
X-Gm-Message-State: AGi0PuaRwpF30+ky57JFZMP1Aegai5tkPmg0gH1obCSEh5LMVn7a/xWQ
 xxWYKf3jKjaUsw3O2LA+uAZ+K3/4INM=
X-Google-Smtp-Source: APiQypIkZ70S++b6H9bJhowo3sF6ujRmmW2P23XTjdUt3oW5VVycaMhZR19bDESxMKQ99mavQqKCJA==
X-Received: by 2002:a62:778d:: with SMTP id s135mr23461343pfc.21.1586861509089; 
 Tue, 14 Apr 2020 03:51:49 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id r28sm4556820pfg.186.2020.04.14.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 03:51:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 0/2] fsi: aspeed: Divisor settings
Date: Tue, 14 Apr 2020 20:21:38 +0930
Message-Id: <20200414105140.1089095-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This defaults the ASPEED FSI master to a faster bus speed, and allows a
user to override the speed using the kernel command line.

Joel Stanley (2):
  fsi: aspeed: Run the bus at maximum speed
  fsi: aspeed: Add module param for bus divisor

 drivers/fsi/fsi-master-aspeed.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1

