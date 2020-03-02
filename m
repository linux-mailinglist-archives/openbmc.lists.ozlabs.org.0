Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B81761F9
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 19:08:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WSnh1RbWzDqXQ
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 05:08:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WSkf0B11zDqWr
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 05:06:15 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 13DA53897A;
 Mon,  2 Mar 2020 13:05:05 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 72A1EE6;
 Mon,  2 Mar 2020 13:06:10 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Samuel Herts <sdherts@gmail.com>
Subject: Re: BMC Compiling and running
In-Reply-To: <CA+k9xxb=5KMq+yruOAja9L9asquJ=FNPMoajyOsdHda2Ae3jTw@mail.gmail.com>
References: <CA+k9xxb=5KMq+yruOAja9L9asquJ=FNPMoajyOsdHda2Ae3jTw@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31608.1583172370.1@localhost>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Mar 2020 13:06:10 -0500
Message-ID: <31609.1583172370@localhost>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Samuel Herts <sdherts@gmail.com> wrote:
    > Apologies for all the constant questions. I am trying to add code to=
 the
    > Hello World tutorial, specifically a system call to run a shell scri=
pt on
    > the QEMU BMC. The problem I run into is in the image below. My bmc s=
tate
    > manager main looks like the following as well.

It looks like your hello world program was not properly linked.
Usually, that results in no executable being created.
Maybe, you linked against a different version of a share library than is i=
n
the target image.

--
]               Never tell me the odds!                 | ipv6 mesh networ=
ks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect=
   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails =
   [



