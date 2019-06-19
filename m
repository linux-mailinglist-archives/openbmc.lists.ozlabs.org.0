Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED664BDD8
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 18:15:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TVR80bMRzDqmq
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 02:15:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hN8bEPPn"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TVQZ61DgzDqW1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 02:14:46 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id i10so800351iol.13
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pMW/Nvfh+M6UAmK70l1YA74LDT9w+ILmCFfby8ojw+s=;
 b=hN8bEPPn9ZyK7EGaEYNC1PfWHkj8bKMb+e3XVyhOj8T30KY1RSqzj5niB4/fzuXpYX
 zhB8+/PiHZ2BLh3pH9gkrUHw2ZN5EWz1KHQDOs57rJDqhrY1Lbzb80+9efjvsQZlMuYd
 vJeBG/Vxqg9xTThPjsuv3+6uNA1NKEOYyIuRQLMK9ojkikMcE5/PGQpLliPg13hodnuV
 saEs8ZZJeqpokMovkLAilp5Iw8f4U7y19LfrfEnVW5wrIMAgG9T8j1K7bLDWBMRIytmY
 1J70r4eBrZ5YFoozvzAZaoFzTKZ6PkxcKYAvkpq0Z2yQ/wmWaxOqfOMXasqXe7t5Xk6I
 Mmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pMW/Nvfh+M6UAmK70l1YA74LDT9w+ILmCFfby8ojw+s=;
 b=U9l/TZlC+l2r1nZVS66cCHmIGz/Fp+pTmvBRBVhUDtXGtHub2BNQwzupkMP0anPZrM
 HJgihGlZ98u3u/cUzBt6jwx3r9l9C0rX7B9n5C0K3pB1ttLYneJtojJE8HOzyu9LjjEl
 cfZ9ryoq4lO9TCRUpwS3HKzbEFqmgkreV+rCpm2zzgA7E90XAAAn0ywJAZ97e0cog4K/
 Eoe7ABqmB2Cf6cVkYokyXoqOwZpYphdAW179RnaKNND2HmN4kM4dlaS6YPM6J6XhHSP1
 BqsZGi4txdhG80/XHRGoevAeXf7xffPtQMaQ64vZ4nKbQkKDkRKLi9LjbF0Zd0gZdzrc
 r6Fw==
X-Gm-Message-State: APjAAAV9qQ7kNCSbTvsu+IVccRBl95n9aRaRLCBvAjTGNb4vymFH1ZXn
 N0ICo/d6mhIWK4/Wod1yeA7yJfLWZGF5kXqgBSc9FXQDJUM=
X-Google-Smtp-Source: APXvYqxduX07h18FMEUUq1CK9j5TsZjAkziGShXAj/3uiPurV3+YhWWDURViKtj+GAFALGuLaAB+nMGVLNu8K6yWTUI=
X-Received: by 2002:a02:7715:: with SMTP id g21mr11195612jac.24.1560960882892; 
 Wed, 19 Jun 2019 09:14:42 -0700 (PDT)
MIME-Version: 1.0
From: Derick <derick.montague@gmail.com>
Date: Wed, 19 Jun 2019 11:14:31 -0500
Message-ID: <CAOUmYFQscR-QSS3AzMGJB4MkN4ji4+fNbS2_q6YEU1E-J-yS3w@mail.gmail.com>
Subject: Button styles and icon implementation updates
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>, "Wang, Kuiying" <kuiying.wang@intel.com>
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

Hello,

We have some changes to our button styling, as well as how we plan to implement
icons. The review is
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22396.
It would be great to get some feedback on the implementation! This
change will allow us to
control icons using CSS and start to remove all the duplicates needed
to have icons
of different colors.

Thanks!
Derick Montague
