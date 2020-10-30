Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 652822A0315
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 11:43:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMzRY4MpPzDqsX
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 21:43:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=IHSny2Un; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMzQg2gBlzDqQQ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 21:42:18 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C878741394;
 Fri, 30 Oct 2020 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1604054532; x=1605868933; bh=4N95RywfhJVBskr5aB346c2p7
 JPZZMVRR0BjWiwir1I=; b=IHSny2UnIAq9tuWnpLeUpHsbkmoi/R460y8TDUVyc
 GTxeRIyBU3fYgt0x+ReV6uJS/aXiT8kA7qsipaUQA+NkKqi2Fu+qNvPqrPre7t5X
 ckBWVQPJJRTDda04Wwh1kzd/u5exctxaGZieSmDkQ3sjIhZRBTJAUiJOMdSeHbZn
 lw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orribYb4JJil; Fri, 30 Oct 2020 13:42:12 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 09D5C41385;
 Fri, 30 Oct 2020 13:42:11 +0300 (MSK)
Received: from [10.199.0.254] (10.199.0.254) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 30
 Oct 2020 13:42:10 +0300
Message-ID: <aac742e708ec91c95228b98b26da61b494996f41.camel@yadro.com>
Subject: Re: bmcweb logging
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Ed Tanous <ed@tanous.net>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 30 Oct 2020 13:42:10 +0300
In-Reply-To: <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
 <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.254]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

I disagree with you here. Once we have logs I expect to see errors
information by default. I'm not gonna to build applications with
verbose logging unless I debug it but but bugs could appears even you
are not looking for them ;). Logging unusual/unexpected behaviour by
default typically helps to localize problem.
So I believe, we should formalize and cleanup log level usage.


On Thu, 2020-10-29 at 09:22 -0700, Ed Tanous wrote:
> On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <
> ratagupt@linux.vnet.ibm.com> wrote:
> > Hi Ed,
> > 
> > I was having issues in getting the logs from bmcweb repo, If I
> > don't
> > define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get
> > me
> > any logs in journal(not even error log) and if I define the
> > compiler
> > flag then it gets too much debug info.
> 
> What's your limit for "too much"?
> 
> > Seems it happens because we have hardcoded the logelevel  and there
> > is
> > no way through which we can change except making the change
> > manually in
> > the following place.
> > 
> > https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
> > 
> > Suggestion is we can define another compile time flag for log level
> > and
> > use that log level at the above line for type of logging , by
> > default
> > logging should be enabled with error log level.
> 
> Thusfar, we don't really have a definition of what kind of detail
> should be included at each log level, nor are we consistent about
> setting the log levels.  If it's important to you, and you want to
> put
> together some patches, we certainly could define the log verbosity,
> but we'd also have to come up with better definitions for what level
> each log needs to take, and be more consistent about it.
> 
> IMO, that level of log granularity was never that valuable to debug,
> my thought being that if I'm enabling logging I don't care about
> performance, so the more logs the better.  When reproducing a
> failure,
> there doesn't tend to be a lot of logging present, and it's easy
> enough to find what you want, but maybe you had a different
> experience?
> 
> Long term, my intent was to just get rid of the various verbosities,
> and make logging ON or OFF in the code, and downgrade to a single
> macro, but if you see a need, we could certainly go the other
> direction.
> 
> > If there is a need user can play with new compiler flag for more
> > verbose
> > logging.
> 
> I don't personally see the need, but if it would help you, I don't
> think it adds much complexity to do it, and I'd be happy to review
> your patches.
> 
> > Am I missing something in usage of logging infra?
> > 
> > Ratan
> > 
> > 
> 
> Just to be clear, you're using logging in a debug context, correct?
> If we're trying to use this to define an access log, that's a very
> different problem space, and the existing logging infrastructure
> would
> be poorly suited for it.
-- 
Best regards,
Andrei Kartashev


