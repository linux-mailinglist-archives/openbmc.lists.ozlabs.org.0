Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F791D6B61
	for <lists+openbmc@lfdr.de>; Sun, 17 May 2020 19:20:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Q86q3zHFzDqZD
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 03:20:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36;
 helo=mail-oo1-xc36.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JrVGepBU; dkim-atps=neutral
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Q85v45RHzDqWc
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 03:19:44 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id a83so1552704oob.9
 for <openbmc@lists.ozlabs.org>; Sun, 17 May 2020 10:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=/abISnpcTTSHPD+jPmh4gpdAdr01tcF2mdoGpDVy9t8=;
 b=JrVGepBUVak1b3pLHejfqqpkC/Ike0QSLcJMe1naHB7DH6fIQMseDgzDls87hu/ZRw
 0wIG49bfnKsUYqmlZKAoG3KDojWZyBxj23YVdELdKnIbFuqpB61TGnnSWVJaZ0yBKc6W
 99nBdbUSAtQu0HKHUyN4SZmuGzvV1xTUJ6kh6bVf0qw4qru//XpO/m9vFXpqwhibbItx
 4q79hm+wxL5tiOELHl6tXh9MPxQdic2lPDC+QW7kL/y1fmr1A1QHNuLyhB9iDVrTr2et
 MO0GIgei0Ce5qhhZxhELfqqnjfpXg40Y3hnHWBwR7PPa/Coxoqze7t495vG4iEi3AHop
 USvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=/abISnpcTTSHPD+jPmh4gpdAdr01tcF2mdoGpDVy9t8=;
 b=QSvfgKkbUBEs35lxNu6A1A4j10k69KdUlw148RMzM0io+wyog/CPeu1LCGv0YgE0jE
 y+CGVJTg21x34JXLuLvMOrtaZmt+X2Toloqn/xmOKY1b3bOcqEyvL09KkNdEEhXdtOSf
 AirqfIQQgSCytWQ1tOJ0e7Qm3sg+zDCTqhJ5W41DVq6pCzAB6vOS6+owm8Wzh8/7viJW
 prrmHns8p0LSKAOg8vCTj0tMaced9Vqb7mJAL4bAd7hKZENkRBuhOBRMjQ9Mr6bWEQ1R
 W742hEXMmVFPaSrQLMQybBoQnyvbHZ0eagYO3SfMZGepQkx368o1ZXJvFdqM/S/gi1Ix
 5VvA==
X-Gm-Message-State: AOAM532lfg41PDl6VQI82RtZMa/f6i2k1CPf6QIfYGmqL9DKU3EkJa7W
 MLV1M0RFp+jv+a7G+B+BQ6VsD+SVHjc=
X-Google-Smtp-Source: ABdhPJxIILyfOVJL9AgpiK9bdDgUMYFlIC57IZOD4/r/ko1pE9lsipCWwXOQ9aUMVvkbpgt8+xJyGQ==
X-Received: by 2002:a4a:a286:: with SMTP id h6mr10072598ool.38.1589735980305; 
 Sun, 17 May 2020 10:19:40 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:c964:8cee:2a23:36f2])
 by smtp.gmail.com with ESMTPSA id c25sm2274580otp.50.2020.05.17.10.19.39
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 May 2020 10:19:39 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Upstream Yocto Bringing in GCC 10
Message-Id: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
Date: Sun, 17 May 2020 12:19:39 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

Ready or not, this weeks upstream update brought in GCC 10 (along with =
the normal slew of new packages).

The only upstream change I found we needed was a backport of a =
nlohmann-json GCC 10 fix[1]

For OpenBMC, we had a few minor changes spread across the repos[2]

Would appreciate if we could get our changes in quickly (before more =
upstream changes break other things).

With the above changes I verified we could build witherspoon and it =
booted up in QEMU.

If you=E2=80=99d like to pull the changes in for your own testing:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/32482/

Thanks!
Andrew

[1]: https://github.com/openembedded/meta-openembedded/pull/232
[2]: =
https://gerrit.openbmc-project.xyz/q/topic:%22upstream%22+(status:open)=
