Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C698370C82
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 00:25:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sx4q0v7WzDqWT
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 08:25:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WIN2De8n"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sx4G2m3TzDqVm
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 08:24:44 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id x15so7986012pgg.8
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7GPECxQRKAnKTUwVlZarnVhPXcrtB4d+f/aZ8v2+Yjc=;
 b=WIN2De8n96W1LzympXEO3jc1YoSQCWsnYLCHlxSDaWUzDbJtOd2BVzQ1R9uwXumNfv
 jIKRyPrQf9uJOqpj3XIzVWmCna/KWPWmuFrp0Hu+Z0z2G1WMoYPekjoxeO/btq/AYIgi
 N2SFVTjiWZKZHqrifzgOP5CyQ0z36Ao2Ht68USBx0H96HWnarVLMVEIXaFwy6Hzp2WXK
 jKqg+/ofAF8wkmNC6LXdGKeS0ZfaHcJzBH/VLwkQT24puw1xeyEnQjJOsQCai7qMNW2y
 4c3sNY9rfxiZyxxTIUti9nUjRD/BLsVXRe2YG60c464Z+OeClUdUEECek9Vq2rlOqEzb
 hc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7GPECxQRKAnKTUwVlZarnVhPXcrtB4d+f/aZ8v2+Yjc=;
 b=UATf/XPCZHptd6c8eDomuazm+VUxTzLJQaT4gDlQcgShBVTYswD1RTV3G86xXht4Zd
 Rd+J1nhNrrrjuKvW2XCRoBBdmeSA1UVcYU5jJ8ye8IZs8kx1m8KWFE4mqAORoXGfNxlt
 XX2Gju+SRf0JGpFSH6yfWkeSuacU36OlHBXxVNgNcp4Dso0tDSGS1MRd9m7paA5dkjUm
 0RkBQ9jqCQPHGmicQq9lJpPv0u2+fQOUpBB7MQvCt5zZnhjDbKPzNobthj9vmBT2IaHf
 pV2TthUJuzeChYqLjxcRv/r5B3WBks0r+w1cITu82y3Yc4+Khumy3UOiaylUBY8sBXZ7
 7nRg==
X-Gm-Message-State: APjAAAV8/UHCul9w0UMZADmAc+Vgep41zojkEFZjFkGYhZMdmQwjZ+DB
 W98KKd+mDQoEAYaFJt4zGGHNj/jK0LkhgPW6xH0s0A==
X-Google-Smtp-Source: APXvYqwfhuAV5FMiYsQQZfjPA3szyGKIp4wHw8vf00lM9QiZWO5OukRSM3c4I6pmB7NDp42H8fCjNgrd1coGdfOu4XM=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr72706172pgf.353.1563834280249; 
 Mon, 22 Jul 2019 15:24:40 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Jul 2019 15:24:29 -0700
Message-ID: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
Subject: ipmi-fru-parser + entity-manager
To: "Tanous, Ed" <ed.tanous@intel.com>,
 James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Does entity-manager manage the FRU eeprom devices?  Or does one still
need to configure ipmi-fru-parser, etc?

Patrick
