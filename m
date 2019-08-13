Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1038BDEE
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:04:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467HZt3vH6zDqjL
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:04:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E5TUe6PB"; 
 dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467HZ73RXYzDqWd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:03:25 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id a93so49407065pla.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DcAqD1Cl/EppR6UmxJCofk4p1Cd1pdHn5dy+ALSYTOo=;
 b=E5TUe6PBLhja4yXMYTK7cSijSt7EhGg6p+OGgadofWZ8Dq2j7IobvaP49CZqz2fozW
 dG+Vyr89T8+erACZe/LF5oloaNYWiLML0coCFNDRzvQPxRXKgGtr8/9wI65N4ZWwu0Qt
 4T22UT3jUgCW2hXrvmd60b1iJyLIEDR4aZ0UYkxzQaK7GV6CQfR4rG8/gEv5/kvc9ndq
 5FGBu4HCWKM42Iy75DnWJ9PZXH6x1LGA32FPbid5qf8NkMG5Hw+Wj5iCjF6hfT81MRQu
 FY7aUjU4qT1ZZXob6lbvH8j0T6O3/9zGlc/SG4j1YRd2X9s1GeQhP//k8ilFw+IvRIEh
 aHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DcAqD1Cl/EppR6UmxJCofk4p1Cd1pdHn5dy+ALSYTOo=;
 b=oU779BJBGtQgwOJWyvVbBsh0NlpSwezOxRRdfIs/28dck4dMyYRW1MZFAG3zsPZNsh
 HagoV7H41KNMLsz65iytRLoG4uc5eagJpp4+LpvALorc9VDMCoYJhm+tdjdSpIqWYkSo
 gCDQslF6dZZcd+k1oYQLV7yA0ev7rZC7Oqz937TPI0Yte1oEsuBT/lMeVpHSCk97NnWp
 jWmp8LKQ+mEzD7to2IxMz8Y9C++PK3PqgQY/1YvZXwWZKck5GwLIbNzdv5KYu2mqACVV
 Iyhk/KPlwJmPnSXbO18hH8rrzg+Pw9+UJGD4fs+UbVf+JeRyvgaEkjc+Tb2QGlU9WIE4
 3vfw==
X-Gm-Message-State: APjAAAWulFOOZBz80prNa1rqfMq+1huTaPI+pqk/FcJ1sbbULUHrfQZd
 w1RmmyBF72nsS2kDHjj4b5+yoZhXU9DdaPFFvwU092cG1SaRnA==
X-Google-Smtp-Source: APXvYqxu7K62fgW3W4B+ZaJHh7Qya6/NQKssJ7BIGJQwCnoysyG8OA8PYx8wDZc4WJsNxhy1Keh/NL+latGW9U9feWM=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr38037923plp.47.1565712201742; 
 Tue, 13 Aug 2019 09:03:21 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 09:03:10 -0700
Message-ID: <CAO=noty9ksKUrPEvtgJGCmW0P01MBPGV72chtABF=vTyBCyuhg@mail.gmail.com>
Subject: FruDevice - next device name matching
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I wanted to verify this was the expected behavior:

      |-/xyz/openbmc_project/FruDevice/Card
      |-/xyz/openbmc_project/FruDevice/Card_0
      |-/xyz/openbmc_project/FruDevice/Card_01
      |-/xyz/openbmc_project/FruDevice/Card_012
      |-/xyz/openbmc_project/FruDevice/Card_0123

It's fine if that is, albeit in the case where we have 11 cards,
that's going to be problematic.  My theory is, it's meant to increment
the last number part of the name.  This can be done by a regex parsing
of the name string and then pulling out the number, incrementing and
tracking the highest number hit.

https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L869

If that's what it should be doing, then I can submit a patch after
some testing, I just wanted to verify.

Patrick
