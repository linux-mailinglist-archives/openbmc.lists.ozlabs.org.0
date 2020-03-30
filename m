Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1C19738C
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 06:48:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rKhc04jTzDqZ3
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 15:48:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZokZgJpa; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rKgt41L1zDqWW
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 15:47:21 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id h11so6246106plk.7
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 21:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICzdoYO6/GiKM9bK+j4hqKBIY/7HODpOUzfjM5sb3Eo=;
 b=ZokZgJpaD4WkhcdKYYjR1Lb9TmoUw7353PFq7ITkajzn0An19qUBMhFPPs+AmJJyOE
 BrZmKUJgr6p0K8Lhk2UbjnQxOwHI2mgvhpa58U13WyIerh1l52Ww+MqFWjym7JhWDxsE
 zK8UemkfFtx3zY6BCtnth/dv2r2l8aBJ1Ix/EwnhLCgCzUPxF9hC8g6lpx6KxnnbGhzf
 9CxKBebDAniGQ7sadWFNwHUkKJhyS1fB0r+9pPfblTxi/5r6L2VBNYrjvbjSMAvt1GUE
 vWjfkvyYF+mQbMNQZ1rYUmisRBSCtd5ioCyzahSu/Rbe+NjRscc+BY+GQSfSaKkLPJnT
 QITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ICzdoYO6/GiKM9bK+j4hqKBIY/7HODpOUzfjM5sb3Eo=;
 b=Qx89IrSgUyIis50P+xr6ELVd9RRRtTKvT4WaIuDkR8xTw5k7t0OsKxqc4He6rQry2z
 S0dp/T/JSOBmMUcJ11Wb9izWet91B5uvBuG+vMVGTSKfvm6g2p3nzOxWHFpXQEcqDLpz
 C2NZgfd+iJTZ575RXkIVVSP1+uOz3zXgkjx3ltn9QTMQUIb1/0k1mtBVgeRl93f4Igcg
 vK9Ngvrp+y/tuStUUmNKZZ/G2OYlEHQyRtfaLAC3lMKpkj+OSeRvB33cWAfrLo4qCg6Q
 oSVnrbCFAbxU37V8WlyY+UU2YwRhaRUtwurr6Q/vPeCIxcy7BqzK+tiaZ12J7Us6ATXi
 LXcw==
X-Gm-Message-State: ANhLgQ0YYJ6NmCawmAesDnU6FNK4oXHNoHp289+wSbqDBgpn88g2chSD
 FnI+kAwEmyhMO9SbsDyoMlY=
X-Google-Smtp-Source: ADFU+vsFUA3ZrjSaonhsGjJRXi9lIp69EjcFWp16WGe6+nzshrqxqACqWZS6xBosTzCFBwcnhz6Ksg==
X-Received: by 2002:a17:90a:26e3:: with SMTP id
 m90mr14101978pje.144.1585543638251; 
 Sun, 29 Mar 2020 21:47:18 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id x27sm9239537pfj.74.2020.03.29.21.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 21:47:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Eddie James <eajames@linux.ibm.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: Add XDMA to Rainier
Date: Mon, 30 Mar 2020 15:17:06 +1030
Message-Id: <20200330044708.195184-1-joel@jms.id.au>
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

Joel Stanley (2):
  ARM: dts: aspeed: rainier: Add VGA reserved memory region
  ARM: dts: aspeed: raininer: Enable XDMA

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1

