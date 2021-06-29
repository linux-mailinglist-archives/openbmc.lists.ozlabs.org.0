Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CA3B6EE0
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 09:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDbrJ1YYDz30NG
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 17:36:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MpfgRZnj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MpfgRZnj; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDbqY38tTz301K
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 17:35:35 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id m2so17712018pgk.7
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPohnix/AWfuANCmybGcGLnwHn0R6vbvbRLb2EBgVIQ=;
 b=MpfgRZnj0Ecdf1g8IgJrXAmzeRyLh7BScaivUCbeSAdjo4ASi/y6CfJ/kskb2fY1vS
 BQFpmet5ehON3Kz8jg+GgpUPrHUxj9Urv961cTWNoTAwlSg1a9Rqexv1xJx1A6raVsqa
 /T4Gw7MYkGgJeW02yv9XuXsLTxViOuG2uXKw1ofr4lHy06RMVsQ5rSZ9r4R/v+lT1tt+
 QyK0A2VlE7FWGAC5d8xasCWJPqiSj8jSpB2JlaOiuXRdaacmYAQJCv7R9DI4DybT68b4
 UNVuw/ohU8C/ZgqhZ13nzBWFU4MWKV5+yGzhfTZvjPEQuVzX+BFQTokIzQGHKQyAMkFa
 9NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GPohnix/AWfuANCmybGcGLnwHn0R6vbvbRLb2EBgVIQ=;
 b=fV++x63ct2fhHYLTIPddL/LmLX3ogqTT9upR42RX4MVKnRDWtPT89ykBEmoAIGcwuJ
 O5c2omscqTaHVJd6eaNa71Cf2n3PYnhcKi1DxBtHs6rolW6xfaozvhNNwSlTmh/cOFSW
 C7gIgB1ENAanDc26af4d+1kCSE9aQTKpSsgUy1Ws4m83vuYJ8reBk5mJ+uZJhzg3QCNz
 Yb1lfVqxTfLuNNki++U7T6GoK6ZgyQQQFG7Y/ineROGdY86KcUmdKilwQtxjvkO9L3wq
 M+sn6hNtj3SIAL0Us9OTFaH27VgqyG8IBi6ioidpxycDHajs0gArtXFlgEGm+naYz/9J
 B4gg==
X-Gm-Message-State: AOAM532/XRNEpR7Ynwa+wWxyver1Lw2G8gWJpoxCo5oEfLkYZLsR0Vdi
 9LyWBjLdjLZogR1FOkhPQQo=
X-Google-Smtp-Source: ABdhPJx+LTFCzsVa0UxzZ0SaWWI2z5WbNynTVJrO7BmqfceFO8dKA5Hfq8OpNF9FxXNWjW8lK6chjQ==
X-Received: by 2002:a63:27c2:: with SMTP id
 n185mr27051258pgn.178.1624952130418; 
 Tue, 29 Jun 2021 00:35:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p8sm17622438pfw.135.2021.06.29.00.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 00:35:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.10 0/2] soc: aspeed: Reenable devices
Date: Tue, 29 Jun 2021 17:05:18 +0930
Message-Id: <20210629073520.318514-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The latest u-boot SDK (00.04.00) contained changes that disable some
devices using the 'debug' register in the SCU. This re-enables the
devices in their respective drivers by clearing the disable bit.

With these changes a rainier host boots to standby with the latest
u-boot on the BMC.

The first patch could go upstream once tested. The second needs to be
folded into the xdma driver when it is next submitted.

Joel Stanley (2):
  soc: aspeed: Re-enable FWH2AHB on AST2600
  soc: aspeed: Re-enable XDMA on AST2600

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 29 ++++++++++++++++++++++------
 drivers/soc/aspeed/aspeed-xdma.c     | 10 +++++++++-
 2 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.32.0

