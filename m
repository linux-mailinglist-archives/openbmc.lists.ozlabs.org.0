Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF99DD5A2
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 02:03:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46w34y4g3fzDqnK
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 11:02:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rkwTUUKW"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46w34K0g1NzDqhs
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 11:02:24 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id 205so4803204pfw.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 17:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=K3AQqI1KmEEoARY33/I571qha+ypvgBXOZuHaO3vibs=;
 b=rkwTUUKW6mv+jQ59Q93QqjLBhe1LczwnTqGcpSEHecQjhEY1xXhaMLGTuDYswOcHoK
 I8HnJCx8FaVwI0I3a39lwwCbyrX77V0ecBgItsRsqkXigMNUTN3sfjVSJwG3WFxjNjEw
 AP91ezii0U7xXfqkbSRIJWqjcJPGDcw27qiBa6CHKVEpAQps6CeV6zLpyS7OBHOhwVd7
 yGsWJsw3z75q7fkinjSrDzfhFA9XBxlYtgnFp2/llYAm2MFz5icfikQmEt3uVtby+vXj
 mF65xl/oi21bntB5vODvZk0bs2OdA4t17X2lyBYwNYr5EfTCbvZiBd9vSaCkW2OVMxsr
 ZLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=K3AQqI1KmEEoARY33/I571qha+ypvgBXOZuHaO3vibs=;
 b=Gd/K4sBaE7KroDclyLlgH1iqBBvGwx4JQ0X8QggotlD3/MvmEHyT7MmG04WUuYtv/J
 UmLBbWa80JUmIEa+Nzj2RayD1Ik1/3wvmeWHcRTOFa/d6ePbudi8VtyPqp7Z+UnpsBjz
 hOGAdKwWO6mQcQJQhQ+ROLCxfXLS5uMHYbMs5USyAMlJELMDfMrPMadwxPQD93RlKKw9
 wWm9LBb43oxZgRgnbzbP77yXbXnygmIOalxd62GmoRdVE/wHaEwm7wpUacbx5wvOr4gi
 r3nnrC14LYdlYH0DHt0mAAbLmS9RIXctrpVWjgu3LAs0+jv5TC6rBcVotwkjmNe7yO7q
 KEow==
X-Gm-Message-State: APjAAAUSMEGbXsAq0kjAZd0w4P/UHRoIYOfy0S6L5xpSIeXlwFWHRAcJ
 DzryDyy4FH49bKBGkUN+JtG9HbE/DsbK0dfI+uAv8A==
X-Google-Smtp-Source: APXvYqxfNbGjLaU7fqP6cLvwDjiGbHMwbmxYp9X4GzOTgX8FAoMREtZDK+PVyGMuPC+kQ8jU5fghbIzytgXweoeIWMw=
X-Received: by 2002:a17:90a:5896:: with SMTP id
 j22mr13562462pji.55.1571443340986; 
 Fri, 18 Oct 2019 17:02:20 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Oct 2019 17:02:10 -0700
Message-ID: <CAO=notwQoW6zM_NnDbukXpvhG+OKXn2Nw0Lnzh_E87P4SF+kAw@mail.gmail.com>
Subject: entity-manager frudevice interface
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

James;

As you know, I've started adding:

"xyz.openbmc_project.Inventory.Decorator.FruDevice": {
"Bus": "$bus",
"Address": "$address"
}

To my json files.  But I was wondering, this feature -- being able to
point back to a FruDevice by bus+addess may be sufficiently useful
that entity-manager always adds it when the probe result has a
bus+address.

Thoughts?

Patrick
