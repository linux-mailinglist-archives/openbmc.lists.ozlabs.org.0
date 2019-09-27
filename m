Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DBC0DCC
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 00:05:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g5SV00QDzDqyv
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 08:04:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S73QqHF8"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g5PT19JQzDr2N
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 08:02:20 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id j4so20264799iog.11
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 15:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uUXxItF92ftT3Y4SZ4gJlkx3vCTZgZROBgp32uY1cmM=;
 b=S73QqHF8fxozMw0foU4jpJ4EweqCRJTNVojhgS47hg9zQVQf1vwF1OgvDIvnmtxNqn
 TrGJ8xoBu0sT91t5gdKfoEjdC929hX4zrS8ZxL6K5oL6zXYUK/WtoEGYkDj36frbdAEp
 MiUeiyKYE42GVRtl73sIyVUzDX1XxHekVVg1J3vbrY0FoCihEsGgpxP/wHj0uc4ILdx9
 TQvXFOHWysQOAicL5dz+W3RLMoIz77EtFKl1QSz9//iqypyjUcYIe3Be8kUzNQ2yuT0a
 f8g0CXrbkPal8WzUkv3QYsAkKZ7CxXa15btpZG7TJMIgcYi2piqosqhePwRcLWwx4xBw
 v/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uUXxItF92ftT3Y4SZ4gJlkx3vCTZgZROBgp32uY1cmM=;
 b=TQJ9O0tHrb1q08hA66Vm+yu3JMoBUA9pBsLTsKLEUEUVC+opBeIIsUq2QZgsirFkAw
 esHKR9WN1wfvUSz1DXSxA913SFQG7o0X1ecpgns9oyKVtbEJXER6ANULoIt9dpqXDN6z
 jti7UpGrWr8n/rZaqwqOhft2zFF/wiHVOqA4jvS9o6RpYc/GeUxF2lVhrLssVVrLhELz
 YDVptartTY3M13X6br4VmzUx5d4Kq3Zlsps7QSwLYF9pzfQifjv2/L5kAoRtEzRpI+pZ
 Czmt28KbxnJfQ7DSBEYohTAHXlRhts/TcocSXr/u455+R2tnoQ7WFxrThN0VQoXgabd/
 0KSQ==
X-Gm-Message-State: APjAAAUqWLbttXR8j2giQOCGwZKnoYuVwUDsgaA1mTwCP2E4wOJt23/L
 E8irKuheVFDSuFq4yDDDJD7G8Q5ZQO3rViJkY3TYIA==
X-Google-Smtp-Source: APXvYqwCxvkDY2yTJGwlT2v2YyEGoirost26o8UBNN3D7Z77YYiMtv8vDSGb49NYB6boXvqMA0/jKLZK//dv2jE/H80=
X-Received: by 2002:a5d:8911:: with SMTP id b17mr10886438ion.287.1569621734789; 
 Fri, 27 Sep 2019 15:02:14 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Fri, 27 Sep 2019 15:01:48 -0700
Message-ID: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
Subject: Accessing kernel panic information without BMC console?
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Hello there,

Wonder whether anyone has had experience persisting kernel panic
information or sending them through network? For a lot of our devices
the console is either unconnected or served by obmc-console-client
only, which wouldn't be able to capture kernel oops.

We are starting to look into these tools:

https://www.kernel.org/doc/html/v5.3/admin-guide/ramoops.html
Ramoops says it requires persistent RAM.. Which may make it infeasible
since we don't persist memory (or, we try not to).

https://linux.die.net/man/8/netdump
netdump seems promising.

https://www.kernel.org/doc/html/v5.3/admin-guide/kdump/kdump.html
It seems we need more pieces to get kdump working. Have anyone tried
kexec/kdump on their platforms?



Regards,
Kun
