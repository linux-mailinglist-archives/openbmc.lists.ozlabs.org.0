Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB223A07F
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 09:50:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKqmp3nL3zDqND
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 17:50:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ucXRyYO2; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKqm302VGzDqN5
 for <openbmc@lists.ozlabs.org>; Mon,  3 Aug 2020 17:49:36 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id e14so5829427ybf.4
 for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2020 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mlbeBwvuGYPeRUI8YXU4s46dAjE9xEk3MQYWCXf0LY=;
 b=ucXRyYO2SkZW7ZXw/coCC0G2oVkIRVMsPpWfv6kOCdZKtpRgEpolsq8e+Nr+xlCoP3
 OSMNZ48yKMwpaLt+xMwP8tUhfv4if/1a5xkoZRa+RDGRg5cnthm4qDhoYQPNrc1D0BVu
 kknmdkV1h9IGcEhayZG/RwgHjh/mfjkl1swUjVOTNQvz5l7iPu9mzS5/uaQdH4+d1ZJo
 jx2yPR8D4sRKACcBRDWATWD+9E2xqaCyn1V8b2HGq5JGbw8GrCN6WrgCeBmWT7EscX/4
 K1mX+YXF2nfMKpEif75/FKHyJatLQpUSLX71c+8HTR/R4O0r+OgI0Oo14bJPV3Cx5esN
 E3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mlbeBwvuGYPeRUI8YXU4s46dAjE9xEk3MQYWCXf0LY=;
 b=ei9xza4OjFKMuD2YW0kpYu9hhwsxCnlBqnp7yG9nxA6Ye8qriYImfPDUmGJJRqCryi
 LEhqY/JjxGVjUP6QE3wC3Z4CWN8g/RBj1H9oDUMILklwC1CGAsK+6ISnQ+/LBt6dyW7Q
 E70kjyEk7JP22gtMn2tdHyxHSn25/OTmCiZQEOYcgl9uaQSc9wHcaDoROU2urkvY4eq3
 e7wv4tZaokW6vCINtUcfHJwSJxMImMEMGwKi0uRPucSMpDBVoFfKQKx+ZJnQd/f7f4zK
 lmfgFKmT+9zqmlFA2ZZ/FxxJ761NNcuMxVAc0LCnkYY6FuU3pF66s/DputxhSQJZ5NHX
 y/rg==
X-Gm-Message-State: AOAM533OSvzdhnu/1Tal6PeJMndQxdhzdV4baGEVZf5gAfdj9TcpeiCx
 xG1kj894WLJwDVhSBgEQk+KOW18wqkvlZTgxwJ9Yjg==
X-Google-Smtp-Source: ABdhPJwaNVyZyYJ7dMJ744h/fPtYooyl/xvj0S0EqYf6FpeA3t6+cLcFB4f5avTe8r744yT4XHjMu/n+VseGEypNASk=
X-Received: by 2002:a25:7344:: with SMTP id o65mr24055159ybc.417.1596440972693; 
 Mon, 03 Aug 2020 00:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
 <BN8PR12MB32820389DABEE2E32ED84E57C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
In-Reply-To: <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 3 Aug 2020 00:49:22 -0700
Message-ID: <CACWQX80rQkOZ00q3C9HcR8deSbekcVF8GE2e7-HC-Wxt5i4DMA@mail.gmail.com>
Subject: Re: OpenBMC : FRU Inventory management
To: Andrei Kartashev <a.kartashev@yadro.com>
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

On Fri, Jul 31, 2020 at 2:02 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> Hi Deepak,
>
> Saying about inventory management for non-BMC accessible resources like
> CPU/DIMM with EntityManager: is there good example demonstrated
> preffered way to do so?
> Trying to bring up system based on that Intel's fork, but looks like
> they have own way to do things ).

https://github.com/openbmc/smbios-mdr is probably what you're looking
at?  If you're trying to implement a custom inventory scheme, that's
probably very similar to what you want to do for your custom type.
