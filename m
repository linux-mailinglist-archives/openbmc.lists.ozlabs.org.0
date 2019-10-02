Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F8C4B55
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 12:24:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jsgq2rnjzDqXX
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 20:24:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QyhG0LGh"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsg61F87zDqL9
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 20:23:43 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id u12so6872463pls.12
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 03:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wmXQmgo/Vq6wehSAzBc33cGUnTqhxyTv8+0PNdVugP4=;
 b=QyhG0LGhcvJvcpPNo7lE7VsIt2d2FYbDPmTXpfU+HjuA4x5XDE/dXCQ5BoB5eXxj2J
 6GjO7A/gnSsdc76aWf42MElNHI+RjZNA0LiVw6iBSf9Mv+zF7nr5Dbzs1nbB8AIKm6/1
 KchreMWzCMs4HwqxD2liVN/zlYQHD0KFNIAKmcMYFcvNYV4uDoFtMugPD6jQETSMf8ZQ
 kt3+4XJwOBIajJWhs+i6FDzmqsYBPdVpOM/W9K1fBWJ4MalUzzlXvxL2SGjnatPvH8v7
 aVaS37a3HOH+9E6/giNmNfAGCeRQkdvF2p7sPAqG46bWtqSArNRMgMfHi9Ezos2/VLu6
 ZRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wmXQmgo/Vq6wehSAzBc33cGUnTqhxyTv8+0PNdVugP4=;
 b=JInZnIFpr8GCBMVTRCA/Vg8RDVaGeBf8spCUnbxilBN/IHugOUeQbot5jDvq6v2adA
 IdWs+OwLaAk7mkAzH/euhR4yysnAq/vs2PMkj2xZVh92Y9/gh6BHinl3srtUELIoJome
 L41Vd1PHmABsylufaVmMsQIqdCHba4iBL9q6kKbj7I7cmYawl0R9vgneaZm1K/PC0z33
 HlVuhJM0eGAY0fVXZi4w3YjNUwlwtnFkdGpbjnBh/US4tHxFBuuu2435sL0xJNxDwOxc
 sIt08aTtANdN5oM+Q8MOTE+75WmBIxfLo+w8hP5pr481yXmqHw042dgbvqVLdObeLhGw
 JbDg==
X-Gm-Message-State: APjAAAUeO/+gCOBpp6lFkaLhcfGY2MpdAxuxKtqnezcTOjj9vBjGA65T
 HWCWJOzfLs/iiBhlofyMMLLQMlhDBvA=
X-Google-Smtp-Source: APXvYqxnsFcBo/AC/HkAQpSDFXCtb8CJ0Qv/SduCSqFysHE+Vn2F3X7SBnzsJzZ8itCW+vTeuNgdjQ==
X-Received: by 2002:a17:902:7002:: with SMTP id
 y2mr2937223plk.303.1570011819794; 
 Wed, 02 Oct 2019 03:23:39 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id i74sm24187091pfe.28.2019.10.02.03.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:23:39 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/4] Tacoma device tree fixes
Date: Wed,  2 Oct 2019 19:53:24 +0930
Message-Id: <20191002102328.5196-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here are some changes to the Tacoma device tree that enable the right
bits and pieces to boot the host firmware.

They have been tested on a Tacoma system and Qemu, and checked against
the Tacoma schematics that I have.

Please review closely.

Joel Stanley (4):
  ARM: dts: aspeed-g6: Add VUART descriptions
  ARM: dts: aspeed: tacoma: Enable VUART1
  ARM: dts: tacoma: Remove incorrect i2c buses
  ARM: dts: tacoma: Enable LPC Firmware region

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 27 ++++++++++++---------
 arch/arm/boot/dts/aspeed-g6.dtsi            | 22 +++++++++++++++++
 2 files changed, 38 insertions(+), 11 deletions(-)

-- 
2.23.0

