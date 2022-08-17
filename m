Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D7596719
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 04:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6rp34Qz2z3bxt
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 12:00:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEzh+jmK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEzh+jmK;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6rnR0CFfz3blT
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 12:00:10 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id 130so10876654pfv.13
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc;
        bh=MOGdACYjlYyVfLWrvYygQ0vy8aDM05nuJDut1pK6MvY=;
        b=FEzh+jmKMoSyg/hjKaXuaLvhtJ8/agMvtPZS1WSkNeHXA75VXeCcC47cwgQQYSs671
         XVKcJ/v4wdBRBpfyxruX2gte50gGAPgHiXQUTce2e/PN4Mvh26IdjQfPiB2izfg3YrLF
         XLzpEoiTlv7lBAzTOTnRXLXt3Mq84vU41oDDOw4pZvJui88nz9MwxLismwBL+USfvNnP
         78q37mJuue6Oby+ZDSWi17AX4PgDi1IdJT8zNTvMkVMRSbW+aMH2m4x4Q6s6hkUu6ocU
         eknSNRWMDU8sU47m8DmabnKNryk9eHXGI+VIT3iuL85UDTjMJ9ImZU9KOZ9rnaQpBujc
         LQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc;
        bh=MOGdACYjlYyVfLWrvYygQ0vy8aDM05nuJDut1pK6MvY=;
        b=yYq4NppS7jnYabB72kpAIy2lXbRYLsrP5fmBXXLFphe2OG2OlD6Uw1p0mszGqYSPPz
         9JJC6ID+6Q002ECu/yFYqWo7G1pz+omg4G5nunF7ldSWBr1fb6DutEbzgs6EFE9kUAkv
         l8w4sF9a1OUZLMSV722XIrsjRMS1MJt7kEQh+Ctc2tK9q62z6Xo9BUTfRElk7XyAOYVy
         DwbFKf5NMQiBVwdzhoItx2+69TLSapKSY5DRi9WZcP9zYXxhS8x9sVFWl0SieK8v4hEM
         zrgVruX5Ir5J4U/NBLd1ID/4HQeyXx7H3ytHm2on5O5yvoGGwEyDk0dCDgaYmMZnB5VW
         IFtQ==
X-Gm-Message-State: ACgBeo1w3pI1AfWuhTFUE1i4Zw8dQf0D9KUI38EiDz3EjLXh1nngWY7T
	oJcEXn/jMCjn3wvUQQ/EMJxtJucQBL8=
X-Google-Smtp-Source: AA6agR4PqM+Vg1OBLCBcT/E519wYJzp/spJFr/kFd6DGeoSDPLi/72yG5GIdV4HwbuKtEQQmVLz1bQ==
X-Received: by 2002:a63:5264:0:b0:427:e7f2:a43 with SMTP id s36-20020a635264000000b00427e7f20a43mr13152895pgl.159.1660701605488;
        Tue, 16 Aug 2022 19:00:05 -0700 (PDT)
Received: from voyager.thelocal (2403-5808-8af8--7926-51ea-3ff2-71dd.ip6.aussiebb.net. [2403:5808:8af8:0:7926:51ea:3ff2:71dd])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090a02d000b001f10c959aa2sm212675pjd.42.2022.08.16.19.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 19:00:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] ram: Configure ECC
Date: Wed, 17 Aug 2022 11:59:47 +1000
Message-Id: <20220817015949.16946-1-joel@jms.id.au>
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

Joel Stanley (2):
  aspeed/sdram: Use device tree to configure ECC
  ram/aspeed: Remove ECC config option

 drivers/ram/aspeed/sdram_ast2500.c | 18 ++++++++++--------
 drivers/ram/aspeed/sdram_ast2600.c | 19 +++++++++++--------
 drivers/ram/aspeed/Kconfig         | 20 --------------------
 3 files changed, 21 insertions(+), 36 deletions(-)

-- 
2.35.1

