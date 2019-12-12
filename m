Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93B11D9DB
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 00:18:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YqTh6WmrzDqYW
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 10:18:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jjb4J4Vz"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YqST27tGzDr86;
 Fri, 13 Dec 2019 10:16:57 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id a17so284644pls.5;
 Thu, 12 Dec 2019 15:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QugmQVfkr5kZ5L06QzjGjrkPPpkKJsHosocYw9nkXYU=;
 b=Jjb4J4VzVLPOmC6bbFASdp8Qh98F+OA+usrxiVMhS8CCy4yqe3wt7Coib+5Kam75vL
 JC32YNicxYhCea7HUEKC6kRu5HcOESEN/qt4vxIBl15a93NfUQE3VYepnlkCKA9OZP5r
 d4LSMMzRRPeLdcvOT1yqHfZ7Tdo9ohpUKwryKqOuYwLuhqOAKd1AL0GnmkT3TJvAvXGX
 O4uZges96v3Zb1JH7yZuxRfoYib/b4DANcxU9AdHlDxPcTtf3QUb2TJ0q9Kk3kX2nk37
 ZpkvZ5ud19a15wY7VX+ytCc6nfiOdomTTuAaxZatfrIH0Eh6P+7PHih/VNUouM27NfGt
 acwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QugmQVfkr5kZ5L06QzjGjrkPPpkKJsHosocYw9nkXYU=;
 b=G9OMuPnrrUc6OOmZTOCXL41Z+YedYTsGA7iQ9UbxEK09ClddtmGoyTiYhLT27+JlJ+
 CdMLiNZcj53zi3oz34NGAhh60FaYaf3MJ+mRIGlCF1f6INmI820+juplmUkwd6LleT26
 A1eFIVrYqwQh+zySsKgGdo1orDtIN9wU05DRF2TAUsJLdV1C3QboZTuCyKuSOLAmIQgf
 /OvIm3ZBFURzcRpIqYabfZtLbblvkz3TdNeyUiwSjjRrhxfqmfGIT37aOVGdklYPyG/9
 CK0M9fA2SYNlzmvIqLmt+8twMvL7X06HcsHLL85maafQxEIgQKhcA5qjWrBlDXK9wnNc
 WOOQ==
X-Gm-Message-State: APjAAAVujCJjP5k0UVQpOYZSq9jAzhooKjpxhQtbC2iMrhiasz/w58/e
 Cq4R8uVNqYjCKMiKuK4c/rU=
X-Google-Smtp-Source: APXvYqxyMrVg9IcNBWLaeMiBnoSXUAohAjqNoUjd0LnkUQuoYfNNWWihyzKcX1cckq+MRBMfevi95Q==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr12912024pjb.95.1576192608724; 
 Thu, 12 Dec 2019 15:16:48 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1072])
 by smtp.gmail.com with ESMTPSA id ev11sm9423307pjb.1.2019.12.12.15.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 15:16:48 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: delete no-hw-checksum from Facebook
 NetBMC dts
Date: Thu, 12 Dec 2019 15:16:20 -0800
Message-Id: <20191212231622.302-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series is to delete "no-hw-checksum" from all Facebook Network
BMC platforms, because ftgmac100's checksum issue has been fixed by
commit 88824e3bf29a ("net: ethernet: ftgmac100: Fix DMA coherency issue
with SW checksum").

Patch #1 removes "no-hw-checksum" from Minipack and CMM BMCs (MAC-PHY
connection), and patch #2 deletes the property from Yamp BMC (MAC/NC-SI
connection).

Tao Ren (2):
  ARM: dts: aspeed: delete no-hw-checksum from Facebook NetBMC Common
    dtsi
  ARM: dts: aspeed: delete no-hw-checksum from yamp dts

 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts        | 1 -
 arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi | 1 -
 2 files changed, 2 deletions(-)

-- 
2.17.1

