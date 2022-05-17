Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE8529EC5
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 12:05:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Ww968Qqz3brp
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 20:05:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CN+dHXm2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3yxodygckb3agiwqvsbuccuzs.qcacdsbpaqzwghg.cnzopg.cfu@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=CN+dHXm2; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Wvp2h72z30QN
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:05:24 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 z39-20020a25a12a000000b0064dbcd526ffso3923639ybh.15
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ZA9V5lO/+F+bF8jz1FqVjCsKgJDekjpTcf5RC67Rb+U=;
 b=CN+dHXm2PBRqvy1rf8fgS0o1jp5PYo7NivTVKQ/nKjhnlxSy7HON46mSOSXnbxnGt0
 0sM5TU3u1zBA21392OldZVr96LXY6KYit/jNYjk5EXR2CKoahlGMahwQ3FJUVseXyfI9
 cjBk1AWdrStlRBMUoPYESDY747UFkaFerpdGd9zJn2SF9wswLfipINF+E48kcMMNxFzF
 q4qSS/wz8gpL9dt631yseTk9m+wgmd+eNfv/jyPAJqke0+nnHbJavlK+Dqkq+5zr3Lw2
 jkxf/YGWa6gjweNW4DGXn5BjStf5V4Q9H6pXaZnnq3VkYUYWaAXIH05H2Uc9MjHsoekj
 DBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ZA9V5lO/+F+bF8jz1FqVjCsKgJDekjpTcf5RC67Rb+U=;
 b=mC1MQxqCCpAGzQSq6miGJRQmxA51bhUZG4MMhrhBQNFhF+0B3q7V8hGnvUlnGqUh0n
 a5ujBThcMTSOVC339mYxlmssFRS0QmEik/lXIUu4qhVKlDDr0laYe6dSySPTzOo2qiU3
 joEKCSn5BivNwyyBu3ilAdXWJf481u2rW+veSPAeZT+tQV2Ed0crQX/KrlTiHbqiueU7
 ewmNVZ6B9uGA/bwXwgcVpHoJcgksRnk1EFhe4HcxxfMy9Oa9whHX7ErSX/U9kWBVyALi
 oEsydg585nzvYD6Rt6PvCnQa0rhXMR08ceuPubkZ/F/ftTG5FediJkYbJoKcOS2oi5Jf
 r9lQ==
X-Gm-Message-State: AOAM532aTeUh1Otg7YTNlDCFQER/F/vOU8VYAPmhCR3gSrC53yMqJ+Yd
 Rc+R9VrT57Ru7s4UMZt3PSvCTdU4bQng
X-Google-Smtp-Source: ABdhPJzMkGHc7O1/Q7FmKZm+eLOtBU+xuDYiFF/nyYQhd08PMvWlme4OLTlm9m4QdO//1tq2jicPIWNqvZsR
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:ae7d:134a:180d:9b32])
 (user=suichen job=sendgmr) by 2002:a25:6406:0:b0:64b:17e3:9dd with SMTP id
 y6-20020a256406000000b0064b17e309ddmr21661588ybb.186.1652781921142; Tue, 17
 May 2022 03:05:21 -0700 (PDT)
Date: Tue, 17 May 2022 03:05:04 -0700
Message-Id: <20220517100505.2569874-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC Patch v5 0/1] i2c: core: Adapter and client stats as sysfs
 attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, wsa@kernel.org, 
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: andrew@aj.id.au, krellan@google.com, Sui Chen <suichen@google.com>,
 joel@jms.id.au, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change adds statistics to the i2c_adapter structure as Wolfram
previously suggested
(https://lore.kernel.org/linux-i2c/YgEYEk355t8C4J1x@shikoro/).
It also adds relevant statistics to the per-address i2c_clients where
applicable.

The list of statistics are:

- bus_errors
- nacks
- recovery_successes / recovery_failures (only applicable to
  i2c_adapter)
- timeouts
- messages (only applicable to i2c_client)
- transfers (only applicable to i2c_adapter)

The statistics are located in /sys/class/i2c-adapter/i2c-x/stats and
/sys/class/i2c-adapter/i2c-x/x-xxxx/stats respectively.

Since the counting is done in __i2c_transfer, where the number of
messages transferred is not known upon error, the error counters are
attributed to all unique addresses that appear in the message list
passed into __i2c_transfer.

Currently an rbtree is used to find the i2c_client located at a certain
address. Would be happy to know if there is a better way of doing this.

Thanks!

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

-- 
2.36.0.550.gb090851708-goog

