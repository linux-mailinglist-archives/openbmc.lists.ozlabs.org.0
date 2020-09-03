Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258425C14A
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 14:47:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj0vw0Q3nzDqwD
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 22:47:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 558 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Sep 2020 22:46:29 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj0tF699BzDr1Q
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 22:46:28 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 40C32389C6;
 Thu,  3 Sep 2020 08:15:56 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 84oGPNBcUIp6; Thu,  3 Sep 2020 08:15:55 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 4A971389BA;
 Thu,  3 Sep 2020 08:15:55 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 6824986F;
 Thu,  3 Sep 2020 08:37:00 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Asmitha Karunanithi <asmithakarun@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: Resolving service name conflicts
In-Reply-To: <CANGK-S4gjNiLqnpZcT3bkKTycGEi7u1C-dNW70gMcXb02fS4zA@mail.gmail.com>
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
 <20200902155801.GX3532@heinlein>
 <CANGK-S4gjNiLqnpZcT3bkKTycGEi7u1C-dNW70gMcXb02fS4zA@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2947.1599136620.1@localhost>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2020 08:37:00 -0400
Message-ID: <2949.1599136620@localhost>
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

Asmitha Karunanithi <asmithakarun@gmail.com> wrote:
    > Yup, it would be like "ssh-hostname" because there would be service =
name
    > conflicts, say if there are 100 systems in the network publishing th=
e
    > service with the same name, there would be name conflicts for 100 ti=
mes and
    > finally, the service would be published as "ssh#101" to the network.

If I understood correctly.

That goes against what RFC6762/6763 say.
There is a deconflict system is there for a purpose, and avahi handles it
well, and being able to find all the *ssh* services is actually useful.
There can be other information in the PTR/SRV record.
One can ssh to hostname.local if you know the hostname.


--
]               Never tell me the odds!                 | ipv6 mesh networ=
ks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect=
   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails =
   [

