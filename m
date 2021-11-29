Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47642460FE5
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 09:17:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2dW01CLkz3bXJ
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 19:17:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=az9FuY++;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=az9FuY++; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2dVZ5hT6z2ybL
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 19:16:54 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7E1FB420DF;
 Mon, 29 Nov 2021 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638173807; x=1639988208; bh=ULBfuqWKzU2NtZjuenkM1io9t
 Ne/QEobFNDSPYFmMZY=; b=az9FuY++3KRidXaJuOa0p9teUdZY9vTc/7QXniusJ
 CYC14EPdxKnEdyUzb9vfxVAc2FzgKvN4I/Z/rD1NCJn+v/d5hKqfOFLtKrPX0zbM
 6wEn5b7+EL+MLZaSfFcFd8EaVxZNl3DdV0LT6ntnCk+PuIexhcivU6fwOfjX88rG
 WM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmmQ982OKfIS; Mon, 29 Nov 2021 11:16:47 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C4149420E2;
 Mon, 29 Nov 2021 11:16:43 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 29
 Nov 2021 11:16:43 +0300
Message-ID: <954c1bbd0bf7996b82b5890b1ecb1a6903c8b047.camel@yadro.com>
Subject: Re: C++ co-routines are coming soon...
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
 <openbmc@lists.ozlabs.org>
Date: Mon, 29 Nov 2021 11:16:42 +0300
In-Reply-To: <YaPzMYi/UHwvEiGf@heinlein>
References: <YaPzMYi/UHwvEiGf@heinlein>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Thank you for your effort here!
This three are really long waiting 'must have' things.
I will try to test this proposal.

On Sun, 2021-11-28 at 15:22 -0600, Patrick Williams wrote:
> Hello,
> 
> I just pushed up some code I've been working on for initial community
> preview:
> C++20 coroutine support in sdbusplus[1].  This code should be
> considered
> "experimental" for the time-being but a good preview of where I plan
> to take the
> sdbusplus bindings.  I know there are complaints about the current
> sdbusplus
> support in one of three veins depending on your perspective of
> importance:
> 
>     1. The current sdbusplus server bindings in phosphor-dbus-
> interfaces are
>        synchronous.
>     2. There are no sdbusplus client bindings in phosphor-dbus-
> interfaces.
>     3. The code using the sdbusplus Boost/ASIO interfaces is very
> callback
>        intensive (and difficult to read).
> 
> I've been wanting to leverage C++20 coroutines for quite a while in
> order to
> address these shortcomings but haven't gotten around to it due to
> lack of
> understanding on my part (and lack of time to fix this) and lack of
> maturity in
> the library support.  There is a proposal for C++23 (P2300)[2] which
> attempts to
> fix the "maturity" problem and the authors of that have been using
> libunifex[3]
> as their proving ground.  Using libunifex and becoming enlightened by
> Eric
> Niebler's excellent talk at CppCon'21, I've finally been able to make
> some good
> progress on this.
> 
> There will be more to come, but I wanted to give a taste of what a
> C++20
> co-routine-based sdbusplus agent might look like.  This is an example
> of a
> task that reacts to D-Bus "NameOwnerChanged" signals:
> 
> ```
> auto watch_events(sdbusplus::async::context_t& ctx)
>     -> sdbusplus::execution::task<void>
> {
>     using namespace sdbusplus::async::match;
>     auto m = match(ctx, rules::nameOwnerChanged());
> 
>     while (auto msg = co_await m.next())
>     {
>         std::string service, old_name, new_name;
>         msg.read(service, old_name, new_name);
>         if (!new_name.empty())
>         {
>             std::cout << new_name << " owns " << service <<
> std::endl;
>         }
>         else
>         {
>             std::cout << service << " released" << std::endl;
>         }
>     };
> 
>     co_return;
> }
> ```
> 
> I currently have `match` implemented and I plan to get `call` working
> very soon.
> Sometime between now and late January I'll probably do an educational
> talk on
> co-routines.
> 
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/49117
> 2. https://github.com/cplusplus/papers/issues/1054
> 3. https://github.com/facebookexperimental/libunifex
> 4. https://www.youtube.com/watch?v=xLboNIf7BTg
> 

-- 
Best regards,
Andrei Kartashev


