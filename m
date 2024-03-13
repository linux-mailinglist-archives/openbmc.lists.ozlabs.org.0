Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39A87B53D
	for <lists+openbmc@lfdr.de>; Thu, 14 Mar 2024 00:35:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g4ShL9Ki;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw6Mb2Ttbz30hY
	for <lists+openbmc@lfdr.de>; Thu, 14 Mar 2024 10:35:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g4ShL9Ki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvmt22pPNz3bn7
	for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 21:27:36 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ddcec424a6so3757305ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710325652; x=1710930452; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6I+qAvjriIhZpqTRPosft+26w34QnmoHMX0+mS+KQ4=;
        b=g4ShL9Kikis5z+Dj9TJ9R2rRmfIberglSWaAARkGK/S7np05EjrIzyJNeO+8W1vMM9
         AdDq18/tktvPzCwHPAoTyDm/o5pnI+2jxA0mO8LTzXcVMS54YSshRCdSKk/pmfjaVWHo
         inf0ZS+VF2AtfkN0Atyj8u5BtZ/ub8C/pMbCB/vuBWilXLzz1SZc71yz4odqTyc9kTn2
         S/FveCsAxaDS96YSye/j8I92HOtu/K9efolsLWa3ZDoYPQPifH1vvlE96KK5JO8Tpk2I
         P42kdGvdZitpG8n/k13XFFUROgFC5hZaM36eaSdnWd1Wa3ecpOjyFUAkVZFtYHUBivqS
         8aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710325652; x=1710930452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6I+qAvjriIhZpqTRPosft+26w34QnmoHMX0+mS+KQ4=;
        b=ToJluBWAdbDS+oW3UIV7sc2i/8Tp9uLMfmNDTeSOWG/QECzzszk/6kqLDxU/KV+OR1
         spLqXeW81ZCz3f8SDuTygDBjF/86mC/MM7go3n7DgembPnK02/sdrFQKd8T+bJmXX8nW
         Kn32ZGkSB+SlOhrUdxgM8wYydHgkau+rDVE4rErBVt4TGBFudqGqrgMFc58ZvV/dBhIp
         fCuX1b9bI33Am8+8Tfqezi8lj35LredCXFJk0mq95iDUsQP+0DGlABUdY5GT0UNdN5fh
         30RTNaxkInFuXU6vXjCNxEVRJqYE9NsOT2HSruES65zEXNyx4Rmryf56KGRToEmMn+dF
         FFQg==
X-Forwarded-Encrypted: i=1; AJvYcCUiDVYYYHb9Ofj/D3a5gohc6Pqi9/tvll4lFeSaoKu5MAWb1MePSLfaeSMw36McXb+rnw2wCZZdKyAn3LQt+ppKahfh7nudCNo=
X-Gm-Message-State: AOJu0YyWNER7o8hhWWD9jphXy+mkA9Oeri8w4kXbAFqqhD4UDauLkunS
	86gZBKnUJ8+9lWsnz96ypMKmQC3sD7xJys0BhHinE5GFab6fcXVO
X-Google-Smtp-Source: AGHT+IFz/PcYK+7iAlI0rAb2eLk4kxpGfZxHON8x8DkcBYjeQWhhbtobZ6sqWsCvPLDvSd+2NEsXoA==
X-Received: by 2002:a17:902:e54c:b0:1dd:2b9b:8898 with SMTP id n12-20020a170902e54c00b001dd2b9b8898mr14437697plf.14.1710325651983;
        Wed, 13 Mar 2024 03:27:31 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id jz3-20020a170903430300b001db63cfe07dsm8249282plb.283.2024.03.13.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:27:31 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: u-boot@lists.denx.de
Subject: [PATCH next v1 0/1] Add new bmc dts for ASUS X4TF server
Date: Wed, 13 Mar 2024 18:27:24 +0800
Message-Id: <20240313102725.2067651-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Mar 2024 10:35:27 +1100
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
Cc: marex@denx.de, trini@konsulko.com, hai.pham.ud@renesas.com, clamor95@gmail.com, jonas@kwiboo.se, openbmc@lists.ozlabs.org, neil.armstrong@linaro.org, christianshewitt@gmail.com, kever.yang@rock-chips.com, Allenyy_Hsu@asus.com, Kelly Hung <Kelly_Hung@asus.com>, naoki@radxa.com, cnsztl@gmail.com, patrick.delaunay@foss.st.com, michal.simek@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add bmc dts to ASUS X4TF server, we also submitted dts to linux place.
Please refer to here, https://lore.kernel.org/lkml/?q=x4tf.

Kelly Hung (1):
  arm: dts: ast2600-x4tf: Add new dts for ASUS X4TF

 arch/arm/dts/Makefile         |   4 +-
 arch/arm/dts/ast2600-x4tf.dts | 161 ++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-x4tf.dts

-- 
2.25.1

