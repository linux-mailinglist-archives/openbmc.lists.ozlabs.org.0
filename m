Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B90F3D6CD6
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 05:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYj8D0jXJz3bYJ
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 13:34:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Na/XNAhO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Na/XNAhO; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYj7Q28NTz2xvc;
 Tue, 27 Jul 2021 13:33:37 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id c11so14141267plg.11;
 Mon, 26 Jul 2021 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRV39UkS2vNdaNCZM7bm7pzubH4EyQigeZjHSOfFrv0=;
 b=Na/XNAhOCzW+w2XPuKwo7S99feRZg+tPXcLZ5omcPU8TDn2cEoESYLNk+bo4MYkvkM
 hFJa4yVqelUjRK00K7iWz0JPUIlvWaWKI2MuqPGnKg7drEEfpCD74dGe/wa/SExUYPgC
 dEvmnw0s8lrkSHbu7wIxcw7rH1drZ6BcPM8NAzmJhOCJRgrze9dlADd0/uBZOFNt0sl5
 OQuaR+cFNca8epWtK7HlFZ5jXlXJp5YEHeSLADVCB1eglw451PObaChDhytwfCRRJhX0
 8kpUTFMYkfUneD1a1o2148h3hdjUG8K1UnYyguu3PqLQ52gcdTZdQUtIfUEmeMujnM9b
 oWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zRV39UkS2vNdaNCZM7bm7pzubH4EyQigeZjHSOfFrv0=;
 b=BARHt+PRi4TRGFmV3uIxcQ28fxA4TeEDuPCp3JlmhZvlP9fGKEgj2z0gJUYYs0EWIt
 GU/nShpRLW8ERMC7WdZGQsgQ1TIg2u09iHcs55j8mKg2ITPA5QuCJk47bToeC/pzemMI
 rYxpIav4wtIICOl9P3kB+KGwzlVNp2url0u52DDXpW9RK4n8INxLXwzdHhdoQbo+uCzg
 F/KY1aGDRmpjC1caC7Q/bzVSRvodaD/f9CAPvgNfj6FltLGRVLnU7Nd0ksUciSJWIO3w
 RkZOvhVtzFWOqWNU6Px276aWjBZjhdITbC3f2Lg6/4lHPdXEVv7FhE4L6MET75qJBGR7
 q/FQ==
X-Gm-Message-State: AOAM530NPeQXZfA0KUQoER/Kx1bL8ZUSTCDR4+SCKsnuZfCKZqVgqNdh
 qtTk7Wa0hUa+P7FrF4h3ShPYVCekfK8=
X-Google-Smtp-Source: ABdhPJwgc3J6FfE1EajwCPVtLDVBM0ynFtuxj42KnF4m/YA4Z7ar1vmPTzI/UNuI4D73FDqPaEDP7g==
X-Received: by 2002:aa7:88d4:0:b029:329:ab58:ffc3 with SMTP id
 k20-20020aa788d40000b0290329ab58ffc3mr21132491pff.23.1627356811422; 
 Mon, 26 Jul 2021 20:33:31 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id s193sm1528351pfc.183.2021.07.26.20.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 20:33:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH 0/2] ARM: dts: aspeed: Add TPM GPIO names
Date: Tue, 27 Jul 2021 13:03:17 +0930
Message-Id: <20210727033319.473152-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These patches add GPIO line names for the TPM reset signals in the p10
bmc designs. The lines are documented in the tacoma, ingram and tola
schematics.

Joel Stanley (2):
  ARM: dts: rainier, everest: Add TPM reset GPIO
  ARM: dts: aspeed: tacoma: Add TPM reset GPIO

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.32.0

