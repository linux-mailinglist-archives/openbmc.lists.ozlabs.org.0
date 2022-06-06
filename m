Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FB53DF0A
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 02:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGYf04JWVz2ymg
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 10:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FFMjmgBv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FFMjmgBv;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGYdZ4Z6gz2xRm
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 10:04:49 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id cx11so11520496pjb.1
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2022 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5C6DTGsUHYkLNe+/lrP5kL1kFR1s9SM4C5g+nfJvvDo=;
        b=FFMjmgBvoQl1pgxXYBOBzgZocqDiZBT2oiUaZmWyIm1whszwgcvyR+5uy/6Qn/3TRs
         eULSqJkJddg+XI6KNdWwUqjboDRA2P6njrrgJXEeoggBFa+8VIwttuk5ZCdSwWU3AXSW
         5+iRi+T4g2mCzT5u6gzLQ0WUer7B0XcFJBdONpau5lr4jxUebAF5dmGxSDe0etKrUlCY
         2KNLUaj8cNaF8++BlnEoMqKjIu6Jc9I1cq/o9WXTEg4bckH++8Rd2hN8iN+v1J2t5u+q
         GqnZ7kfc/YzM+4b9VviGRwEFxyAiCu8K2sEhlUt92RL4uTFHjqPfJH2qNSSzXUSjPjab
         ojow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=5C6DTGsUHYkLNe+/lrP5kL1kFR1s9SM4C5g+nfJvvDo=;
        b=zVuSVM0DQes+Q0HBOKroy6jb/jFMSlD8liVE4SO+m7cawCmli8HnGkSyRpCksmaYTv
         huGY5JaFuuyR4b7+Wdtk2zHN5aj2BH9gFy49ECgWemWscSc2+PBq2j7sAFXe+EuC9+F0
         ywEudVDot6kZ3/uMv0ZzZTWwZaRbvzSWZYOFmSn6BXsWL4Ryf7Y/kfbosuh5WV5W6s8y
         9V7sfNn+NpaOr8E2Quaw6V02yCRN7rhMhK7URZUwUf43fx0CKYA0ly8WHMNuN+AxUQBW
         ipQuITMuKGfBH8wOk+vMoHqtjj29owUML8Hh15tBiechJMy1NGJiesDF9XaqL7pa8ArR
         uUrg==
X-Gm-Message-State: AOAM530vuujNJYnkxK65Jcdn7rT3rtKEa/DBhDxC2q52JRDvPcNIMg51
	9H9ioqgiHaKojLYgu5Pm8/s=
X-Google-Smtp-Source: ABdhPJwd6VORGgrPNC/AI+j6LRiQDzDO1bc/8HRA6xwp9xgaIm21Lo/lWHwYv8kwkJZ6m/VfD61/Ew==
X-Received: by 2002:a17:90b:4d12:b0:1e8:895c:e542 with SMTP id mw18-20020a17090b4d1200b001e8895ce542mr1319515pjb.128.1654473885651;
        Sun, 05 Jun 2022 17:04:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b00163b65c9de2sm9187402plo.170.2022.06.05.17.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 17:04:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: zweiss@equinix.com,
	eajames@linux.ibm.com,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/2] Rename Rainier to P10 BMC
Date: Mon,  6 Jun 2022 09:34:32 +0930
Message-Id: <20220606000434.1399583-1-joel@jms.id.au>
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
  ARM: dts: Rename Rainier to P10 BMC
  ARM: dts: ast2600: Fix indentation

 arch/arm/dts/Makefile                                    | 2 +-
 arch/arm/dts/ast2600-evb.dts                             | 4 ++--
 arch/arm/dts/ast2600-fpga.dts                            | 4 ++--
 arch/arm/dts/ast2600-ncsi.dts                            | 4 ++--
 arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
 arch/arm/dts/ast2600-tacoma.dts                          | 4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (94%)

-- 
2.35.1

