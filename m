Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30759CC54
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:41:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTQc4h16z3c1x
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:41:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnJR2LJx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnJR2LJx;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Ygt0rmkz2xkV
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 15:42:49 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id 130so583970pfv.13
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=K8PB1ciS662o1jhXEW/30/xnIB1fBOdqWTq+opSx6m8=;
        b=ZnJR2LJx6JLFKPktZAmHODUTC+zFX0t8v698kWg7VG12fqbxXHK0AT9walv8s2Lj8l
         Sil8xZf2sdQxekWzzrmkGthP11jQOSYO7E36zDtV9ktUyciqMlidFZyAjIqhZCHloVR6
         ucCUdClihsrNSRr/VPzJ0SeauoSfKk46DMR9iWNVL532bCP7E2JKwWDdJLpUWvhTnWyt
         sP2fD5O0Bey1CnPLHl939ufZ6HrFikAMoIlRrHVI4X2In2nGK4GFVbQaaM7a2QZLNRSc
         5y32tvFCeZrRv0ZncEPvqopyKC+tEbKigtVAoHVuYxrA9ZgzstZ3HJ7OdB5FLq2VoEHZ
         v28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=K8PB1ciS662o1jhXEW/30/xnIB1fBOdqWTq+opSx6m8=;
        b=YTS2y7IHwRRe0EhVC0hbghcWEBn4mx8Lk8a3j31qU3JkjWfD+mSUzcIYx1J5dlnqaM
         OxiszWXXu/f90+WNtnjYMyrAL+zuPrAwiLDTs+A/RN+Y9KHasTl3Nm9iv6WmM2OFaFHz
         ca4WzdX4r3GN/Dw4xL0IJ4YM1defPZhN4UzoEfKBhsLUj8ma2wOISjlQRoCfWlbiuScy
         2my23TXDzklyEFcQvcWS5jlQYWKX0egLBWOQ1AXtZnEMPDjAttQkAxYtTsQMw5mU2wQ8
         Qx/GVrvBdFEdevWfShMpmjfQsvBegVVQ4H9RPqOZeLjWVm+n7P2q50QinS43apZC82kB
         iNvA==
X-Gm-Message-State: ACgBeo0EqXcgm9xWtHLDiXOcCqD2KkcFtQbN+/Umjjm5+IBBOnTiP5Mc
	xhHGAZbuK6qEA7Aw1TIRSMWPUlzIx3VRxw==
X-Google-Smtp-Source: AA6agR69nmYBukSHwGFjc+28f6PheldTOKoxB6UwUS+aV+B74UeYQr7M7haj0u5TtyNWulswMM2nMQ==
X-Received: by 2002:a05:6a00:1303:b0:535:c666:7d10 with SMTP id j3-20020a056a00130300b00535c6667d10mr1483237pfu.60.1660801367211;
        Wed, 17 Aug 2022 22:42:47 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b0016d5626af4fsm459129pln.21.2022.08.17.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 22:42:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 2/2] ARM: dts: aspeed: bletchley: remove hdc1080 node
Date: Thu, 18 Aug 2022 05:03:56 +0000
Message-Id: <20220818050356.1459349-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
References: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
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

Because of incompatible 2nd source si7021, removing hdc1080 node from
devicetree, and move node probe to user-space layer.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 54c9f182f6a5c..1f72017c1e2d9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -882,11 +882,6 @@ tmp421@4f {
 		reg = <0x4f>;
 	};
 
-	hdc1080@40 {
-		compatible = "ti,hdc1080";
-		reg = <0x40>;
-	};
-
 	front_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
-- 
2.31.1

