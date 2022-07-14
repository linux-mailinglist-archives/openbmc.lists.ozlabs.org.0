Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD257442F
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 07:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk2ZD0RzPz3c44
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 15:08:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9YX9E03;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9YX9E03;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk2Yr0mkkz3bdy
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 15:07:59 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so1563098pjf.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 22:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnN61B7Kc/cl4YmVZNXJD385VgnpAj5bL6/+01DreJI=;
        b=i9YX9E03iXteT0IS8tDH+Qq4UWCRg5ghclUJs6LKhfa1RpvtMSzzxOE/iaR6f0BOhP
         nA/R0d+HUFQsbmOIcAjdhvkDYMCcOBwzCPVHZX3qAbg1TGg0BzWj/2n2fnYq7jL4zzv1
         qNcNAqTvWDs8lcx6JxWFTwHWJsNbMmrO+P24xQOmS6qS60FmPoPvLR1GSVf49ZNw+AUW
         VoJfnkNHgzVakqH8TfMR4822VbGs2WLjQ/mSaJlZVoAHJtieO4l1svwG2Hv8dSLUOfG8
         ZcrOBwaEyx6dOyNXCOfys8Aa7/rsH2/k5Y4BNVTSpipq1o1RrCga0d09IhuWt19e4r9J
         XbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=jnN61B7Kc/cl4YmVZNXJD385VgnpAj5bL6/+01DreJI=;
        b=odDmwEAaC8b9HuNwwtf34YAMM+wUWGPPJVaikxZJLXYPAs1ksG2Ylage0CL2ioi9k/
         GnD8R3Ueds8FGvdvgFOBZoxtGvSCaUuAp61dDkygqy5D3WzHd9G3bqTmaec8PPuQRLuC
         yBlorOFl7Vus7ou046A4n2/5wrBGl8ix9JQmUjXkG7sVnCHTnXw0b6s743xgJuR3+852
         zMwoovXqn9tCWyj5qvfZNQF+Yj/Ytw5CLJnm+AZ9Ax8HG0+8bb7hB/Qme32xsfPNrowB
         yeaHaYCl/FzV6BWoaa/EUkAQItPiRrkhzXauLDDGYrxhEeQQjCFYDxP/5l08pQUKV1SS
         znNQ==
X-Gm-Message-State: AJIora8OtLRdt2SukhPxEmcgBJ638TemU+BavVhT18+9p+T2GaHSvEnV
	9ssAOhgIOuT4oynejEidrdC/lR1/D7E=
X-Google-Smtp-Source: AGRyM1sN3QbZ80pmYqthwI8Qu6IyMCDJibNK2P7lPflXECCl5qZ43Ihj/mhfC4+I/3Ke1j6Q2T3I2Q==
X-Received: by 2002:a17:90a:7a8b:b0:1f0:80db:129c with SMTP id q11-20020a17090a7a8b00b001f080db129cmr7186188pjf.209.1657775276336;
        Wed, 13 Jul 2022 22:07:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b0015e8d4eb26esm356059pla.184.2022.07.13.22.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 22:07:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] NCSI config fixes
Date: Thu, 14 Jul 2022 14:37:42 +0930
Message-Id: <20220714050744.572275-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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

This series has some improvements for NCSI configuration discovered when
debugging Palmetto.

Joel Stanley (2):
  ftgmac100: Fail probe when NCSI selected but not enabled
  config/ast-evb: Enable NCSI

 drivers/net/ftgmac100.c           | 6 ++++++
 configs/evb-ast2400_defconfig     | 2 ++
 configs/evb-ast2500_defconfig     | 2 ++
 configs/evb-ast2600-spl_defconfig | 2 ++
 configs/evb-ast2600_defconfig     | 2 ++
 5 files changed, 14 insertions(+)

-- 
2.35.1

