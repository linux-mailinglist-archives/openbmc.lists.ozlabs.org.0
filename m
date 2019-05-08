Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48617AA7
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 15:32:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zcpT4fXLzDqHr
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 23:32:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zcmS46RXzDqGn
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 23:30:29 +1000 (AEST)
Received: from ([218.57.135.44])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id ZSM85417
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 21:30:17 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjncas07.home.langchao.com (172.30.26.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 21:30:47 +0800
Received: from mail-lf1-f53.google.com (10.100.1.52) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 May 2019 21:30:46 +0800
Received: by mail-lf1-f53.google.com with SMTP id v18so12340788lfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 06:30:16 -0700 (PDT)
X-Gm-Message-State: APjAAAWcSWlGjVtQd8I3Dp98njgI3f0zT/sdek7GhnarlGAe2jvvEfwt
 wtbR/03zCVgIzf7Z6iDDHeuQSoJM0/xUFeV5Roc=
X-Google-Smtp-Source: APXvYqwQgO8kJfcg2hAvcPxW6TCAfHns9cuTovVI2ilN59Y5m5qPsNKaA8xPvnw61d/uVXZ3CAKjZjOp1nC7cirMOYw=
X-Received: by 2002:a19:c7c3:: with SMTP id
 x186mr21971782lff.107.1557322212013; 
 Wed, 08 May 2019 06:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK0_+4z7TJd_g9WszOFoPkFw5D0nh=EPhaqKSKinO7rzQRA@mail.gmail.com>
 <a4a4ca92-d1a4-cb24-aec9-7ff31c79ff64@linux.vnet.ibm.com>
In-Reply-To: <a4a4ca92-d1a4-cb24-aec9-7ff31c79ff64@linux.vnet.ibm.com>
From: John Wang <wangzqbj@inspur.com>
Date: Wed, 8 May 2019 21:29:59 +0800
X-Gmail-Original-Message-ID: <CAHkHK09SGJ1mcrtOakyZECEZ45+G3Nb02b3qj8rwOgGEnEtNUQ@mail.gmail.com>
Message-ID: <CAHkHK09SGJ1mcrtOakyZECEZ45+G3Nb02b3qj8rwOgGEnEtNUQ@mail.gmail.com>
Subject: Re: Can't log in to bmc via ssh
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201609.home.langchao.com (10.100.2.9) To
 Jtjnmail201617.home.langchao.com (10.100.2.17)
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

On Wed, May 8, 2019 at 2:43 PM vishwa <vishwa@linux.vnet.ibm.com> wrote:
>
> Hi John,
>
> I have always used -vvvv option in ssh to debug ssh connection issues
>
> ssh id@host -vvvv
>
Thanks Vishwa.

It looks like the dropbear process is out of order. There is a log on
the system that is suspicious
=EF=BD=90rintk: systemd: 31 output lines suppressed due to ratelimiting

I referenced this link
https://forum.manjaro.org/t/systemd-shutdow-output-lines-suppressed-due-to-=
ratelimiting/52811
and the problem was not solved.
Through the ps command, I saw that many of the processes that should
be started did not start up normally.

> !! Vishwa !!
>
> On 5/8/19 8:08 AM, John Wang wrote:
> > HI All,
> >
> > I can't log in to bmc with ssh, bmc's network configuration is good.
> > I wrote an `echo server` for testing and found that it was able to
> > communicate properly.
> >
> > netstat -an did not see the monitor 22 port,ssh -p 2200 also doesn't wo=
rk.
> >
> > I don't know how to debug and troubleshoot the problem, so ask here.
> >
> > Thanks
> >
> > John
>
