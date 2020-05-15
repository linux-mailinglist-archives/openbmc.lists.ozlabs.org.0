Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB871D4623
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 08:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NfF96LwdzDr09
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 16:50:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kW8ouuav; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NfDH26kpzDqfq
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 16:50:04 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q24so557720pjd.1
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=71U7JpJAG0zCtJ/g/wQ9DTauzWlqVdEFG4Y+eZV5L+8=;
 b=kW8ouuavXuzq5gLOHbzMpDeuTMbTkThHKGgODUxXQ4EBLDOiyB4o1SZNjsndq3Ha8Y
 DgW6gBBl6r/euFdTp4Ci2FTvG4bCvO/l0enqoiN2fCONO7AIsLCh0jxGQ8K82yHx7gYN
 Xzc7ji/ozRQgsv5pWszW9HepocF0OYZ6+U9VtqF1/eaU5o2w2DCIWLQifnOl7LsisQFn
 8vLNymhabJ2y5Wj+KFVOnOQRrmDdMmIRluvm13hbspkArtTbKjmNJCg+UMmz0J0VTxS/
 wwR6IlTe4xWdHeb1gKjlUdoam+TSe6G+1kxeOXdpU2FF8OkaoOy5U8bcsfm8SEkYRx0l
 hW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=71U7JpJAG0zCtJ/g/wQ9DTauzWlqVdEFG4Y+eZV5L+8=;
 b=d5yoNfb1pK5NsV8973rl3KNYHe8UxxiUE/8nwLil6gl3aInLvIRqlB6bb9BN3ka83V
 F+JJkfrujoCWCXQzLWKPao3MDmFOZ5jP/3hjmqYpisx6B4wFFmGqklZ7RnumcRALSDzz
 LpSSfiGc0RkAf9z2jJpuT5gBPGQlSK4PYm7It2KqeZD9kpABhG60Hitbf0XR84bMABVF
 uTfiNaf9rXQfO/aqJJfVaRLpuHrm0/XHiic4rdDmWC2FaGGZ1LTFLG5qg9mNTQ31API/
 +p5MLiNy9pk+QPqQUqzqrK7ZMFSH+bILQ7JFjQsVjLiTml4tLjHZzAvILmLGetSJqzwc
 AaxA==
X-Gm-Message-State: AOAM531zTftP6K3vICuZ3G9HNnskfXnkX1pmLAKInItDL9itz6GkhfR9
 Lxf2Uo7lyplFqPIk7uvl8rpeeuZ11PCLTelpluVMyDIa
X-Google-Smtp-Source: ABdhPJzN7mqfZFDLnJso9e4aUZJLTAIcyPHA7TbTWncvRdeBpmGlhE5XlTK8M9r7R/soO/4pv7Fz15nejBkTnw4ZTFE=
X-Received: by 2002:a17:90a:8c8e:: with SMTP id
 b14mr1756685pjo.222.1589525400899; 
 Thu, 14 May 2020 23:50:00 -0700 (PDT)
MIME-Version: 1.0
From: Zbyszek <zbigniewku@gmail.com>
Date: Fri, 15 May 2020 08:49:49 +0200
Message-ID: <CAB_SOc61Z0F=pkRfvjYUATAkQvYpu3+Qo7hSoGmmvT7+hzQhqA@mail.gmail.com>
Subject: OpenBMC userguide questions
To: openbmc@lists.ozlabs.org
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
Cc: andrew@aj.id.au, bradleyb@fuzziesquirrel.com, anoo@us.ibm.com,
 gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
Few days ago I have pushed to review something that can be called a userguide.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32234

Because there were no user guides so far neither any template some
questions arose, like:
* Should we use the reply markup to indicate side comments though-out?
* Do we want to add user level doc to userguide? or put this doc under
security? Currently userguide only has a .tex including other markup.
* Do we allow the `---` line separating doc header and text
introducing to document?

I will appreciate you answers here on mailing list or as a comments
under mentioned review.

Thanks,
Best regards,
-Zbigniew
