Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A051C490F
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 23:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GGFY3kSkzDqTv
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 07:29:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 416 seconds by postgrey-1.36 at bilbo;
 Tue, 05 May 2020 07:28:20 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GGDh42GXzDqTY
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 07:28:17 +1000 (AEST)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id A3B043818F;
 Mon,  4 May 2020 17:19:09 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 5F11A26;
 Mon,  4 May 2020 17:21:07 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Richard Hanley <rhanley@google.com>
Subject: Re: Survey for Certificate Management Needs
In-Reply-To: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
References: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11788.1588627267.1@localhost>
Date: Mon, 04 May 2020 17:21:07 -0400
Message-ID: <11791.1588627267@localhost>
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

Richard Hanley <rhanley@google.com> wrote:
    > 3) Finally we need to
    > support revocations lists. AFIAK, there is no support for this today.

What are the certificates you speak of for?
If you are talking about HTTPs end-point certificates for bmcweb, then there
is nothing to do for CRLs, because CRLs aren't a function of the HTTPS
End-Entity certificate you are worried about.

They are provided by the CA, and it's a problem of the HTTP browser to
validate.

So I don't understand your CRL point.

    > Finally, I'm expecting we will need an out of band mechanism to talk
    > with hardware root of trust (e.g. OpenTitan https://opentitan.org/).

Possibly.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


