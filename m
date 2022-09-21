Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20F5BF5A1
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:55:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXR1c484Sz3bsS
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:55:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YzJo1TGE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YzJo1TGE;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXR0Y2kt6z2xtt
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:54:37 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d82so4744426pfd.10
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=Nb8gKAJ52ObzJaaV+kedld87sfF3vcHrdLGJl8ces/A=;
        b=YzJo1TGEoRvK7EG0TCw2jFJOWNhYe8dCWzhFNcgerH6fNzgDG4lYqq4sTyp/ffs0DL
         AVnanFfgY3Du/G4RNr4b4YH4CZJF5kN9LBcXxsDgkEDxUTiMETUCHuUL9EZZTt0q4dmZ
         akPq4VTTzsT98r104hc1zT4uKZ/yUwwoKZqczcwbv211L+/+O3H5HbIimLDvyuRI84n8
         nIzi5jqE63Nvr7KkrxUK51wCAGOXXWHHG+q9J4+tzvYVERq9mcQ36P5oL6el4HKmHTGz
         HBNHG6bvrsx4bL4AJ6D0QdF0TJ5JWkvbDFEArO3ZCyb1PtHXE6U1BiHgYC4KVHJL5HNW
         CA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=Nb8gKAJ52ObzJaaV+kedld87sfF3vcHrdLGJl8ces/A=;
        b=GwWYtZTHxae7yJiaGPcgnNf7dfocQrdg6c8bvZ9o5H0HyRIvdMjJCB9mpUvWjQBG03
         Nq8nZ+c+BMHSt1FuIljwKRH4kokc2RvVk16hq4Cd2BFfrE9keQFBr6EPnLuzp0y7Bc0I
         qpqx9U1EcABJgjG67K3pURiLyLhE27E6wkN9/jiomeVAmqv72c4RfHcSFT701fx+XsH4
         wrYQqIYbv/ewfknYNt6Fc2KWMwbCyYek6XS6SNa6O+JWvAnS81mr+DKJ5oQmwtUznkq0
         hhnND/pzfMjtzvxKPieMfRujxHzBQsNPqg5M3Qv1jXn976H7KZKE/3Q6upah8+uBOirC
         4VMg==
X-Gm-Message-State: ACrzQf0IaRcpmsaa+xD7//tK14Pa6AOebbbKI/NexW0dlZ3Kqm3Gqj9U
	DrBuU3ifah3HE8Ns6nvj0gMIEPWByWQ=
X-Google-Smtp-Source: AMsMyM7usuncaDqocp9W+UbiTEUZbzr97dbMWNyO4UDSIWQiuU7WmJgkfHkltCRnJg6XC5OYzTnZoQ==
X-Received: by 2002:a05:6a00:a29:b0:54e:6aed:c655 with SMTP id p41-20020a056a000a2900b0054e6aedc655mr14525483pfh.25.1663736072338;
        Tue, 20 Sep 2022 21:54:32 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b00174d9bbeda4sm819918plc.197.2022.09.20.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 21:54:31 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/3] ram: Configure ECC
Date: Wed, 21 Sep 2022 14:24:17 +0930
Message-Id: <20220921045420.2116037-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v2: Rename property to include size
    Use correct size in printf
    Add patch to enable ECC in p10bmc

Joel Stanley (3):
  aspeed/sdram: Use device tree to configure ECC
  ram/aspeed: Remove ECC config option
  ARM: dts: aspeed: p10bmc: Enable ECC

 drivers/ram/aspeed/sdram_ast2500.c | 18 ++++++++++--------
 drivers/ram/aspeed/sdram_ast2600.c | 19 +++++++++++--------
 arch/arm/dts/ast2600-p10bmc.dts    |  1 +
 drivers/ram/aspeed/Kconfig         | 20 --------------------
 4 files changed, 22 insertions(+), 36 deletions(-)

-- 
2.35.1

