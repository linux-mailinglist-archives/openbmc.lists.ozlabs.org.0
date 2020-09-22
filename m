Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC22749C7
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:05:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwsjn5BSszDqVb
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:05:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=P8X+SKQP; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwsj30LpPzDqSy
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:04:35 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id v60so13712915ybi.10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 13:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fb6IrSOcGcP69ROa7woq6nzlt4pXOrkYjLb3v6hYHck=;
 b=P8X+SKQPijkWTWw8+mh5RyDjhuq59gIvlhRewufoDDajQzcWbjhxgQVJ2tsXydkAEU
 WgoC547tTjaGmzG3gtPjGkbRtNXvFdLf5zdJkgbIO8o935iKebF4ju5wNvr5WZtHBoo4
 oyr7Rm2ImS5VIhDd2/xcvHJB65YTCCBAoETqkbHoFSYMPWH9Pge14rN29bbOzsMxIFFr
 39ZIsVNUdaW6wKvQ4sN0+MB9wrSguMHZuCPZfKZuAdt5qapUt8wtlEF69xXpYA5h28Ft
 gdHDBLLOCH8bK/FO7pyXnJJSBit2Lc2PE/Zt5JoLh0WxTqa7HLuyKaozhy36o++XZneL
 2vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fb6IrSOcGcP69ROa7woq6nzlt4pXOrkYjLb3v6hYHck=;
 b=qnjN7c2ZOJYlkYAHDrJXXJKwX5O8F/EuXtnRmyCdoXEW20cQ1woYcfrZinB1Uawn8l
 nS6VaCf0N1p79OxSo+AWeiIqRoGfDeZb+D0Rn2KgMsgGTv1tjLIj+D4hOOq1kSg2DhV5
 owZZvAWE2HLjCwiwMiy+TPnvkjgVZvh7kL7/BSe4XyTWKnA2mCRY5uSC1wbLT0QGVvZR
 pW19sX7q9Wzv6tQoR0+Sfe+cEO+68Oa6U229amUwp/xoFM3hpH8XepKhDe0TOo3RZZjH
 UDR9bwiPyy4cwkW8hTYk5C10AnrLimlNoibsVe0lSACVct7qSPwXeWbTWu+rNNQ0nbCk
 z7Ow==
X-Gm-Message-State: AOAM5313s5HJx+OiVaKsBZ6d10wr5DDBBFyzg3cTH0Qc31D4Q1koSW9y
 KwegepMUcH2vj+8Q2oyu7Sqo45CisBGpW+Io6vII1w==
X-Google-Smtp-Source: ABdhPJzMqj0nHW4xt1n23gfCv8LJYImIdE1p0RVb93pLATiRzF12D0gBECYbPKcpu7c6VQuvgc3r3TZGLXtLgL40n3M=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr9579222ybm.203.1600805070924; 
 Tue, 22 Sep 2020 13:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 22 Sep 2020 13:04:19 -0700
Message-ID: <CACWQX821UAEHGadwcOoYMDFM-G_JDsipx9cVo96W0L+U21ysEA@mail.gmail.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
To: Kumar Thangavel <thangavel.k@hcl.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>, James Feist <james.feist@linux.intel.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 9:44 AM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
> Classification: HCL Internal
>
> Hi All,
>
>             Thanks for your comments and suggestions.
>
>             As suggested, we are planning to implement a new process/service like  xyz.openbmc_project.IPMB.FruDevice in entity manager module to support Host FRU through ipmb rather than using dbus-sensors/ipmbsensors file.
>
>             Following are the advantages, if host FRU handling in entity manager repo.
>
>             1. All the FRU information is handling in the same repo.

But IPMB information is bifurcated in your plan.  Ideally, Fru-Device
wouldn't even be in the entity-manager repo, it's there now just as an
artifact of the history of how it was built.

>             2. Entity manager Probe can work.

I'm not understanding this;  Entity manager probes can work regardless
of where the code is checked in.

>             3. All the FRU Functions are in the same repo. We can try to reuse most of the functions.

This is a valid point.  Maybe some of the functions need abstracted
out into their own libraries?


>             4. Adding Fru object to dbus handling are done.

I'm not following this point.  Are you saying that code wouldn't need
duplicated?

>             5. All FRU validations are done here like Format fru, update fru property, validate header, Fru AreaLen and checksum. We can try to reuse those validations.

See previous point about "maybe we need a library".

>
>             For scanning the /dev/ipmi-* nodes, we are thinking to use ipmb-channels.json cofig entries in entity manager repo since this config file has valid slave path and bus address.


It should be noted, there's going to need to be significantly more
code added to be able to scan and parse the SDR.  I'm assuming that
code alone will be larger than FruDevice is today.
