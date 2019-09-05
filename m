Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36784A979E
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 02:23:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P1d9635fzDqxq
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 10:23:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQbuAtI5"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P1cX297XzDqw9
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 10:23:05 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id g19so330295otg.13
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etjw9s1OYgYBlg01sssXMu9bLPew+LG1PLffme/oxTE=;
 b=XQbuAtI5LVdijthGh8qZByptvE52OJ+NctkuJ+gJscNJNSn3EAz4k3OfzeaCbc58Uh
 o59NgNtksTASagXZBjlv9mG6Q6rZtEvAEeGi+4e/a4J9FtiUUuHvqgPzwA8F0W9fAa9/
 9w7/uogBfPROCqyaSWtVXmqixQIxTwbwxeXb54+sGqL02xCv9tJKr/QmiZo1Eg/xAU+N
 WecKC6B+kUDZhdMrPW74k3/kaC6nHRT8f6HLzcp5y5sY7D6bM47ZzigiG6uytJbmviPi
 TlrpVwslCU8LGp8Vzhr3x5FGmQy8dPdJiCdtDORy/plgqxMiFCw6PyGmLODL4Z8ILiql
 n4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etjw9s1OYgYBlg01sssXMu9bLPew+LG1PLffme/oxTE=;
 b=DU7eUsSZDkp1SU0JXNrcdlnxDuMZU3kQSENCNP5Bh24PlZibiKaA1CjtSHpm4IT3Q0
 wBg0EvllDFOzjXkoDpgzqdolNVPr3rbT2PZwgOMg7FESFKk90vl9pZEOcaqoRXj2oOXi
 9PDzLPN3Q8yAvzKgrJxf4AtAC55vljRDQYb1oC2XY9X+ChvmGwtD7YbAaY7WkxiOxjEu
 HUcLcvmvn74pk7FdJIz5hArqXGbMv/2GLvJ4pQJTXFMYEPXOPYaA4ZBbOcZowe9913/N
 bynBpU7jeKA3LlGZVxAXe/n4Dnk3CWMJPh7/eakLZDnxKYtVOy6KnbROuZ3Nyy9I5MV7
 KBEg==
X-Gm-Message-State: APjAAAUWYBLZwcOwmXKswPUPQ3d+PVdTOaRk5R2NOVegkn4pB1rTyF+g
 v7RoBVtDwYENjSC3cpLS30rdCtdcZSccAjucvB8=
X-Google-Smtp-Source: APXvYqyw0R1aK/OeNYLi7hmQ3AmR5hfxjiZUqf88Qc470e8Rv5bzkpbUXyB9YgNnY7hHmnZi56V1wm2456A939uR0Uw=
X-Received: by 2002:a9d:7c97:: with SMTP id q23mr269727otn.296.1567642981738; 
 Wed, 04 Sep 2019 17:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR21MB119113213476143717F0DAFBC8BB0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB119113213476143717F0DAFBC8BB0@BYAPR21MB1191.namprd21.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 4 Sep 2019 19:22:45 -0500
Message-ID: <CALLMt=pGjG0MAofHA1G6732GjDQv+5YAhBHeng_NW9HYu-MyQQ@mail.gmail.com>
Subject: Re: OpenBMC Validation and CI
To: Neeraj Ladkani <neladk@microsoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 7:05 PM Neeraj Ladkani <neladk@microsoft.com> wrote:
>
> What is currently used openBMC validation framework and CI?  Can we use our infra to trigger CI ?

Should be possible. Are you interested in triggering CI on a meta-
repo (i.e. bitbake) or a
code repository? Did you want to run QEMU CI tests or the code repository CI?
Or were you interested in hardware CI?

The best documentation currently is at
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#infrastructure-scripts

Our current CI is based on docker containers running QEMU, unit tests
(google test), and
our openbmc-test-automation robot tests.

Andrew
