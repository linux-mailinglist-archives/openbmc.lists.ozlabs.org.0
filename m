Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D172065E5FB
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 08:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NndFT4hFNz2yg5
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 18:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=af2W0+59;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=af2W0+59;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRmJ4g3Xz2ynx
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 16:53:34 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id jl4so3700494plb.8
        for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 21:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLSvcKUr/LzSUoeSULqWf9KKBJSvPiEYMba+dOztS9o=;
        b=af2W0+592B3E3y5UuwyH1RK1KONmM2OeaU/RDlin3sObxAeheKNDelbCtlMB+WKj5+
         tJIaINq6s5TRTQgwg9hQ2NgIHVYUTNDT+YUzel94Ecb5qT0gd/7CUmeGkEEATRqfRKx6
         hi7yDinD5pHe5Lpg9xZibMLezXjZWCBJ5VeOYoq7ebjk1jFyLYZF7POmSwC5FukgBeYL
         kEL1DTPGVRlbNNXqhthCIp0DUdY83RZ1IwdtrlEEV4sYuE+rjtwwpnFUej2TfiwFSmyT
         tLBUttFEMJXbx9SAT+kxxTX408vGw4ru9hnLxFPmCkscN7WyCHDGIUcdZfSiHyK6Jay0
         hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLSvcKUr/LzSUoeSULqWf9KKBJSvPiEYMba+dOztS9o=;
        b=0bYSYaitpWyz6GkY2tcSfFw40liEm7lDZB73U+V4Dji4krmBUdMhyvi05lEeHlCptk
         FStRiogZdlCVOajTRkRQSyfjtVFEs90LBwYjQpkzOnUfFEl3OX006bGOZdxuFl5l+gTs
         FGuoYW+zD5hAcnbTg5QN1gE9aELyL3oSHkfYjFMFVUOsK2ddmH9R03xHfEx3jEFEulf9
         1/5hAHI2KGpOGLa5bv8dQhcUaE59++ntQyZoyRm6JkjpCZ9uFNAlJGEPPCN5xCm72udd
         oaK5P25PjB6G1RcYYEEAG5lIL+aKVUZtDA9tna26/nkCTRQhjvIRprIaCjHMMauj213W
         NewA==
X-Gm-Message-State: AFqh2kp1Qoro9FCCuT+mvFmAe+Lrep2nHOFNNhUaL9YZlMCxLQNQ6JW8
	FzvHiOA+azrPx1EBwhuc3GG3uL6usl8=
X-Google-Smtp-Source: AMrXdXu5advPnZI6SNG1d36KRjsKjivJZl9vuiDx5qA9hYT1g31Ag3Oz4Ln9kyEE7tfBQjLZlVnMRQ==
X-Received: by 2002:a17:90a:8a08:b0:223:3642:f74f with SMTP id w8-20020a17090a8a0800b002233642f74fmr21665902pjn.0.1672034011711;
        Sun, 25 Dec 2022 21:53:31 -0800 (PST)
Received: from localhost.localdomain.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id mm2-20020a17090b358200b0021937b2118bsm8202726pjb.54.2022.12.25.21.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:53:31 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 0/2] ARM: dts: aspeed: bletchley: Update Bletchley devicetree
Date: Mon, 26 Dec 2022 13:51:16 +0800
Message-Id: <20221226055118.2836493-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jan 2023 18:19:27 +1100
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

Update Bletchley BMC devicetree.

Potin Lai (2):
  ARM: dts: aspeed: bletchley: rename flash1 label
  ARM: dts: aspeed: bletchley: enable wdtrst1

 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.31.1

