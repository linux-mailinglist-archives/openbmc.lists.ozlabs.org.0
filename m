Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF47577E2D
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbWK5DLdz3bYG
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MUVowMI+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MUVowMI+;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX8r15bQWz30Qc
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:16:00 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id l6so9855840plg.11
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=hZpH+jjHBanXNKXLJIsGD7EvYPamEgyaGZv+JpUAvQo=;
        b=MUVowMI+ZxHWE8BQjZNE+VGuJjprv12fujzN2IRvz0qj0TJEsSh/VdihRNvaYVayMy
         QdSMgEc5o82qbTKCJg3yO8cQFcu5nqYB7CBdRrL4Az3Urd2YzzJk9eeKd9cnX4Kz84nf
         fWNvRvC+cOvUW64QuJC2drz5IpKTimS5gTJed4vVVIHAaK9DjQ2dj3ryBg+zHSelc/pt
         kDyL0ruFjksD2FW7xQeLea27geXJOmX0+Am706XL1eomTdkl7vBz02Fik73OX542VSXK
         2L2kKSnhfe59Eqtck2fRpINU0QMOukOO56sa8FvOp5s8cM+WZmPJw9HBmXKUP79NA/WS
         PEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hZpH+jjHBanXNKXLJIsGD7EvYPamEgyaGZv+JpUAvQo=;
        b=KNhDrSAKd4D/oWufZrRzzkaeXoXfupJXOqHgeJo0JK7s1BtCZlvlLj36tmX0MACXkf
         Yr6u/NMJ/YtQmeNsIL4AyHxYQY36Tjk3UPovrr49fUs0+61QI1eUe47FjC6CqY/Ui2c5
         cr8fAu4bXQFTDLUs/VDKeg2qU/+QUmuDZk1ZJSxsofWUCq0i2nIOnnspm/3Z0j5KNekz
         6qGhUT/uPsOG6aPgAPGh/Dd1bbv7heAizQjdG/2Lnj9ISMuaIg3R4HWEsvNC+mX7qPoj
         Gcm8wan5DPqOcnSCLSBK6vjHMTzZAN/nxUxfdr7kM8tCSbfM5YE/kuewpr6+N1kSa5Py
         cWgA==
X-Gm-Message-State: AJIora8W59iwSo8WPL9OblUeZXcxSiAhOzVVdphb74aBvwEPTuDEqHMI
	jkCgIa8JrzbH7H2IWGz3h/h19kDx2a8Qaw==
X-Google-Smtp-Source: AGRyM1ugHhS9uHhthiglEpWo9ikNAXy8XKoZmb45rRXajmG/zQ+9zitY8twApqtmDuGwRcjwW3ZLzQ==
X-Received: by 2002:a17:90b:4d05:b0:1e2:bf91:8af2 with SMTP id mw5-20020a17090b4d0500b001e2bf918af2mr19866720pjb.210.1656386157491;
        Mon, 27 Jun 2022 20:15:57 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b0016a0b31a8bdsm8046511pli.4.2022.06.27.20.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:15:56 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 0/4] Update Facebook Bletchley BMC DTS
Date: Tue, 28 Jun 2022 11:13:39 +0800
Message-Id: <20220628031343.21097-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Could you help review this patch series and backport to linux-aspeed dev-5.15?
Thank you.

LINK: https://lore.kernel.org/all/20220613095150.21917-1-potin.lai.pt@gmail.com/

Potin Lai (4):
  ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
  ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
  ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
  ARM: dts: aspeed: bletchley: update fusb302 nodes

 .../dts/aspeed-bmc-facebook-bletchley.dts     | 197 +++++++++++++-----
 1 file changed, 148 insertions(+), 49 deletions(-)

-- 
2.17.1

