Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920240A31E
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 04:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7n0n1h2nz2yPL
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 12:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hZU+Hq/y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hZU+Hq/y; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7n0N3DvZz2yMM
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 12:11:47 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id t35so10025367qtc.6
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 19:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=0mcUPdTOIsSW7Z0hGpTTkz5/5Pa1QbqWcUNoawoi0yQ=;
 b=hZU+Hq/ybKmshkBAS9yOwDK3bQOzMHP0w/HBbe6bGc8V52WRjMnEg9wmvwODZB7ru4
 dVPXd6ZOArfGRwdCACZoopicHCN6tYgO4pFo4X7L39hsOl9jSgWOJfrdhTz0wsP+qGuE
 mj5/YLQ/OSwtdi4/dU/c9K+diGhU8XWgPtWcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0mcUPdTOIsSW7Z0hGpTTkz5/5Pa1QbqWcUNoawoi0yQ=;
 b=DOdX30jFRfldEs+btnsWqW+i66OKUfVu358Kq5SWwDHUyOGXNgYfmI3juUJTeFVJ4a
 r4Ts4D0q0kzLMGWsivzwCOsYjgOyhDv+4H6W9t8wcnl5vZzoJr2Ag/Hk4lnF8KcGyEt6
 uc3CHjrOyXN/5wq6GRHIwlIB1QBHIFWjN021BQrfxUB4puJ986R+Ae6vsx7AVVmHZYGF
 Z4bGJen0BbtK6a9eOspnaoN/yobO9kCd0bqAhXgnNytiC59cLdqRF+dvLsXf5529AW3w
 8xK0rorgPqipU94Kq4aSivSPCuN/sVeb5bY6XV/hms98OAZqjHJGtZBvfCNOSkWm4/4/
 5wtg==
X-Gm-Message-State: AOAM533M7O26p9L4h8WBuNXkMumBozOU9jiKvmgc5xolUW/OXr7/w8NM
 CELHDMV92pzpFWfZwDF0ZUx2+Nk++h0af+4rr6hm+mL00PQ=
X-Google-Smtp-Source: ABdhPJxE6Qb5qgVELguZM/k5XtEj+VblYYSl+dz1kLOJJ+/X+XtBZfoXa06/iebjE+Ka2mzOPuuOnnS/mkfwiHz4O04=
X-Received: by 2002:ac8:7315:: with SMTP id x21mr2488729qto.392.1631585503469; 
 Mon, 13 Sep 2021 19:11:43 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Sep 2021 02:11:30 +0000
Message-ID: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
Subject: Kernel moving to Linux v5.14
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

The openbmc kernel will move to a 5.14 based tree for Aspeed and
Nuvoton machines.

    linux-openbmc: Move to Linux v5.14

    This moves the OpeNBMC kernel to a v5.14 base. There are 78 patches in
    the tree, plus a the MCTP core and device tree changes that were merged
    in v5.15 which have been backported.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46847

Welcome to the party to the MCTP core, the first new subsystem to be
added to mainline for the bmc since we added FSI support in 2017.

While the v5.14 tree is not LTS like the v5.10 kernel was, it is
necessary to keep pushing forward the version to ensure upstream
development integrated back into the openbmc tree.

Cheers,

Joel
