Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1A597EBA
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 08:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7ZyV3K2Wz3c8s
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:40:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BvMfSdmw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=stanley.chuys@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BvMfSdmw;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Zy60rKGz2yxF
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 16:40:11 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id s31-20020a17090a2f2200b001faaf9d92easo3808745pjd.3
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=+EcI+M0jWu532uLt2hWLsV8GCbNtP175QZTSaPB/QA8=;
        b=BvMfSdmw9slIi35AIn8wGFxNkfDYUocvSo+SlQ0NfdlYNFn11rychFwPs0vlryPCks
         Z+OUU2DVqM/1/fCOomT0ONx/WQ67vc8vok3an/XzPlLWSg/TFwObOiUOkpDBIYIZ6rli
         EXGYVmtznhOUolrv9zV9sqNVMyjtBvW8vrpIwO8byVqucFA5ck6GvK34aWdIOAmQfP37
         mlLM6g0Yv4Hhzj5crCw4e16nTrske6O+WIu2IHLMs+UNsdrGRkZke1e0Mv70DiDE6nhW
         fsAhD0HboNQFHWlG1D+YBvo8pMjB96bf5s0PGlSohz4he1pkn2y1LAcRJAUxiaDLuB9H
         Ul1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+EcI+M0jWu532uLt2hWLsV8GCbNtP175QZTSaPB/QA8=;
        b=UjDC4CxhYZljbsNHrkTppvjvDGcpQkduZSFEgV6YRtaRvHBl5fFHnCY1OruonAU/ox
         ScAkZ/cdIovLDnUpo/5truzx9nqHjiEadBKR52hCMqYk8PDiG10QgmsjQ6pkvLEUVgbI
         zoGA1hck+va6eRIGA0GAnEBNWxBGbwcdBtI4ETp6l1YQwG5TkfMOge2LKkWydrvv6p5/
         NqEVI+SLk6dHfWnNvvascGcgd5rxba0smXm5l1TGd48089FF8VnseacIh+R7m4ypILGc
         ZWZQlO9j5SGQipU9K0h/3oZdcRXc9UL2ATINtQ4GgsyfLbQ7Fnx76vbWifOQWg9jTc6I
         Zkow==
X-Gm-Message-State: ACgBeo2i2DkYs1aSGawFEZg3WnxAo+RDdBYRW9rUg62W+i3idxsiLHyD
	Dd8jKLMYQW/XjNh+JP+QMw/AbfArrfsVgA==
X-Google-Smtp-Source: AA6agR4r/zVH8Ddd0rlEd/4oxnkTcVVfqPHnRejyXGoIRgJQt6DsxTSBow5arBaAoSU1uvulQk44YQ==
X-Received: by 2002:a17:902:aa01:b0:172:b0dc:ba40 with SMTP id be1-20020a170902aa0100b00172b0dcba40mr1387808plb.101.1660804808843;
        Wed, 17 Aug 2022 23:40:08 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.143])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ecc900b0016bf4428586sm553188plh.208.2022.08.17.23.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:40:08 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 0/3] Add NPCM8xx JTAG master driver
Date: Thu, 18 Aug 2022 14:39:48 +0800
Message-Id: <20220818063951.12629-1-yschu@nuvoton.com>
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
Cc: andrew@aj.id.au, yschu@nuvoton.com, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set add DTS node, dt-bindings document and driver for
JTAG master controller present on Nuvoton NPCM8xx SoCs.

Stanley Chu (3):
  arm: dts: nuvoton: Add node for JTAG master controller
  dt-binding: bmc: add NPCM8XX JTAG master documentation
  misc: Add NPCM845 jtag master driver

 .../bindings/bmc/npcm8xx-jtag-master.txt      |  29 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |  28 +
 drivers/misc/Kconfig                          |   6 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/npcm8xx-jtag-master.c            | 902 ++++++++++++++++++
 5 files changed, 966 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm8xx-jtag-master.txt
 create mode 100644 drivers/misc/npcm8xx-jtag-master.c

-- 
2.17.1

