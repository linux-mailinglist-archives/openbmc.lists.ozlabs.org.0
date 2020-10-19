Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A806B2924C4
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 11:40:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFBZj4d0dzDqYq
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 20:40:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=nqtBXPN0; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFBYc1rV4zDqQ9
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 20:39:45 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id i12so9865823ota.5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=d6PfV+nK8KR56S/+0Hz+VJRwopEkc4FXo7y35QH4FcQ=;
 b=nqtBXPN01fXxbuI93EFN1NoZYU5iXI71D3F9FHrmF7MeHfO1jQDRsOQdRmJSjMzDns
 XOoE/AZtBHb+1E/jcPJBl0kkjrsAMGsrLE5akdcTpo0l7aA+IGdLmiLx8ETwy24Ao7ZV
 4BBzMbUjzGdmj/yLvkZUH1VWxe2VnDa2UevcFjMbVpiQ6qedjhnAREgst7Cbcg0KufqD
 iK3kOzTDnTrIZlpxvNr4J9KSEGkbRjeLGSwIcESV8VrZhgvblxB5eK3muLBeqL/WFMJQ
 Phge3qyVCr6T3WOqsQ20oOHgqVtyR9Xaa7ejqcxheAY5EBtN2GVr7L5yy79/LwWdPPDJ
 FuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=d6PfV+nK8KR56S/+0Hz+VJRwopEkc4FXo7y35QH4FcQ=;
 b=uNOumuz/Jv8+XF67/BacQ6MyrnlHd4oCDLuWA2/0mTR3wR09zLBuASQAeEzyTIPDNU
 4xs6NpKcKVoUhGGUFfRZhrujPjUXij15WGr0nzX2R/Gh0fZDdVinWSx8ViTf06SX0MHY
 ZU+NW1oEinGm3nxijeJ1iVu9WJ1FQVn2Ayln4M3wO+Vh73Zo+GEPpwUX9Z4TB8IOjUiG
 AVyvhNOzfzSRzrXYoS4UydwBaGbP22/RunKNz0tZOMSPmZZXhPePD9LUdZzQnP8LLX4I
 qNQYi+78x2jdwppl5jisDQ0KBE6WDac0N57/1KNLkKwDKE7BZKbrzDNoEMujOOUNmaTJ
 QErg==
X-Gm-Message-State: AOAM531i31IFUXF5z2Gn6yJ7inlfEaYzKzlxRDFceAbrOz2PA//ggF9O
 d1ezd28tp8P6dPwez5CBPeeslY59/blVbqFUyjw0q+cqTgDa34lB
X-Google-Smtp-Source: ABdhPJwbohb+dkx+4jvXUtSgWMtp1o19eqgRAb3WsubSfCEOGYEboRIjgdt9w3aMaJ0PG346oCugkUpgMEcUOjN3Sno=
X-Received: by 2002:a05:6830:1bce:: with SMTP id
 v14mr10565269ota.361.1603100381769; 
 Mon, 19 Oct 2020 02:39:41 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 19 Oct 2020 17:39:31 +0800
Message-ID: <CAGm54UEiiuBbBbozu2xecjq3HHBvOJo+afqOkd+ppx00XFKTOA@mail.gmail.com>
Subject: Moving phosphor-power/tools/i2c into a separated repo
To: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Matt Spinler <spinler@us.ibm.com>, Shawn McCarney <shawnmm@us.ibm.com>,
 Jet_JC_Lee@wistron.com
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to propose to move the i2c library in phosphor-power to
a separated repo.

In OpenBMC, some repos need i2c/SMBus access to various devices.
E.g.
* phosphor-power implements a C++ wrapper of libi2c in tools/i2c to talk to PSU.
* dbus-sensors is going to have a wrapper to send smbus commands.
* We have an internal (probably will be upstreamed later) repo using
i2c to communicate with a CPLD.

The one in [phosphor-power][1] is a full C++ wrapper, that supports
byte/word/block read/write, supports both I2C and SMBus
communications, and provides a mocked interface for unit tests.
It could be a good candidate for a separate repo so that it could be
shared by other repos.

What do you think?

[1]: https://github.com/openbmc/phosphor-power/tree/master/tools/i2c

-- 
BRs,
Lei YU
