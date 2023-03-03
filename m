Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398F6AB385
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:32:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHzr13xqz3cMR
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I58DVR3Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I58DVR3Z;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYc5K5Dz3cJK
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:37:08 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id oj5so1533606pjb.5
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4P2Gtj5voz2AvXPNtKglz66q8024rYl9baxTyNpUVU=;
        b=I58DVR3ZkpufsMpFPu8HBJQSctYJDzdZYy2bPl6NpVdhXfkp556X4bYC3xYQQma672
         OX5CXQ54v+ddd2mzH9wJp1tr5e0u+6N4lLITeFM2H37rbrPK7nBWQSdGUbq8FPGm84KU
         k98DJ7ENPfkGicXSu3c99luYIe/eyQ97WLOCpRY8LZZ1yfhm8bZj7g2fUZ+sDrBf1rMB
         QUQzJWaqEKgNjuGfjxexXNg2MqThnjUI1+I63yHOTvCN4T35AUuJNVtsDwb/qejYdAEJ
         t3B4GzrIGNrSaYBWuDhw+wdGO6xeUHEuguYF0h12i4T6AFj+csMf/rRssQ3SCKIuuBUg
         LHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4P2Gtj5voz2AvXPNtKglz66q8024rYl9baxTyNpUVU=;
        b=V5vujt87ADSxaiMAnoGPONYy+/BMcAJUVrryTebMe7/IcyWV+muNN8FkPeKax10WJ3
         xhfHyZp6NEQ+ai8FfHJNzXGAu7GVCobOja6THnI/0+ZyaixUdWlK3anAqlc8ymcZCdZQ
         YjkvVltuyjRywVgtsofqzWe9yWtOUq0UoVSCZEhkL2ApJDy51aWN1ScPviKF5NFsECKg
         6kTMh3PrxY1MgzjyMj2eiIUOUWR37ypOdhhdW87K+3hD+qKB45XihOIqmPBZxusP8Dp5
         XkSRFBGOos+G4uZJ00aT0AqI6QGVtqm4Lfp4gfHWApS7PlG9ncua5YavcVbF5EJ3Ce7G
         +7NA==
X-Gm-Message-State: AO0yUKXE1xMcvOTAvcAvcp92IqhlqsgVWEOFLINfTLMafdnJKverWqaa
	QoW3sQ1Mb+DCyGqFW8x9YxQ=
X-Google-Smtp-Source: AK7set9SihwApQZyw9Nh5YizzXYCQiwk6r3kApgwNF1x1wistEFc3Fk429ZCAu01fQxVRaueOScvGw==
X-Received: by 2002:a05:6a20:7883:b0:cc:8a62:d0da with SMTP id d3-20020a056a20788300b000cc8a62d0damr987051pzg.12.1677825426931;
        Thu, 02 Mar 2023 22:37:06 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:06 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 7/7] ARM: dts: nuvoton: gsj: Remove ethernet aliases
Date: Fri,  3 Mar 2023 14:34:35 +0800
Message-Id: <20230303063435.803097-7-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Alias "ethernet" in dts conflicted with systemd v252 naming rules and
caused a rename. Remove the aliases to avoid renaming.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 48110f8aa3ca..2b3e0af5b928 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -12,7 +12,6 @@ / {
 	compatible = "nuvoton,npcm750";
 
 	aliases {
-		ethernet1 = &gmac0;
 		serial3 = &serial3;
 		udc9 = &udc9;
 		i2c1 = &i2c1;
-- 
2.25.1

