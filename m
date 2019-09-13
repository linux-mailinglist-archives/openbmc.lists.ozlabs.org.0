Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B79B2632
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 21:40:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VQwK4BVdzF4R3
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 05:40:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NasOx8VU"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VQvZ4pR3zF3X4
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 05:39:52 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id k9so2649759oib.7
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GmKkIaX1nAsLGSG2vSb8dcNEwXIUrpP5EOvNBVNrPos=;
 b=NasOx8VU52XLFWT3fWMbbpGqua6/e4+4Eg8+E2dlzD6LGwsycgl7t04CUikcMkCVYo
 2dvY5LTk5qd8vgcBZf3b9oLaCOvEMKdS2dF+CysWAVScnTwe1fPFbNZ9Njc5jLLfe9q5
 S0RcK0p0kqj5Ai7k9BX1n57EMu1UDJT2y6+UfiMqTSLrwnCLS54WgEiOWmana4meJrhj
 fP7JhtUbMWplMT0W/8pr5nwaFePZS5F/J+uOmOIXAjuXuj32yv5Zt4pfNGuSTlm5uVDe
 skBmFTb4xZmytlms3gi3c9Q5xT+q4RWXKHDpS4afQCo6pl40t4+m7Fr5pYut/cuy9pYW
 afkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GmKkIaX1nAsLGSG2vSb8dcNEwXIUrpP5EOvNBVNrPos=;
 b=a9B9E0GbkXRXdywUsqxuXNtP5vs/KqVfJ9Mxjt84M/k9LEEb59s8AZnHxf03zpvssJ
 ALwr+O4JKhZi9i3nqLMciPUBoobkEdjKXHnsTk+bCw3qK9A9c1SRlWDXggGrqwWD2SLd
 tRX1jQY7lW+rcdoBJV3HvX+bEnjuVkFOI2r9gZK1A9LOW88z3ikZHrENPvydMgKk4VU9
 ltiQMXBpMmKItjapffcc5Mw9Wn3rw5qLaBk26Fsv7xN3dRsrv235BDICQdFQ1Ivir2sf
 sMeD/T0u8m534+8pQf/xLv6Rr3P2U8iV8MYJ2CZ/IRbdqP6w/TRhJ/vayVrttjTLEzo1
 2xwQ==
X-Gm-Message-State: APjAAAVSaySm+cQE6ruqRHFHBIt100/jDfqjHPy2zi8Lrl8Zj8R8L09y
 u6zWhcCNFQScoq6Z57+MxugaXDP+
X-Google-Smtp-Source: APXvYqwCWFQy8lleDLFULf2jIzPxGSxFUwZOt0rzuox0ocbMQQG7+ofJyi1nEtfUmow57PJVWp/79Q==
X-Received: by 2002:aca:304b:: with SMTP id w72mr4850111oiw.126.1568403589762; 
 Fri, 13 Sep 2019 12:39:49 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b5sm1254399oia.20.2019.09.13.12.39.48
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Sep 2019 12:39:48 -0700 (PDT)
Subject: Re: Rant regarding code review issues
To: openbmc@lists.ozlabs.org
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <935d08b4-3e01-87f9-8781-031c37163c0f@gmail.com>
Date: Fri, 13 Sep 2019 14:39:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 9/13/19 1:52 PM, Wilfred Smith wrote:
> I believe this is a justified rant. This is not intended to offend, but to assert that the process is broken.

Welcome to open source! :) Seriously, thanks for bringing this up. The 
project belongs to the community. If you don't like something, feel free 
to jump in IRC, come to a working group meeting, or do this (thanks 
again) and suggest a fix.

> I strongly assert that there should be a formal list of commit rules. If the rules were actually documented and published, one could go through the checklist to ensure that the commit conforms. The result would be less time wasted by the committer and the reviewers, as well as more consistency.
> 
> When I go tooling down US-101 at 90 mph in the carpool lane, texting my illegal alien girlfriend as I’m driving to the convenience store, in a stolen red convertible, with a bottle of fine scotch in one hand and an unregistered AK in the other, at least I know which rules I’m violating or likely to be violating when I hear helicopters overhead.
> 
> But it sucks to have a commit booted for reasons that (a) I could not reasonably be expected to have known previously (because I read the documentation, of course) and (b) I may legitimately disagree with (e.g. the insanity that anyone holds to an 80-column rule instead of 132 in a day of 4K monitors and 75-character class names inside nested namespaces that are just as long, not counting fully decorated traits). Oh…right…just use “auto”.
> 
> The process should be somewhat predictable, preferably programmatic.

As I said in the last sentence above, please propose fixes or just get 
it done and see who complains. I am here-by empowering you! Help us fix it!

> Mind you, I have no problem with complying with the maintainer’s rules, but I’d like to have some chance at getting a trivial commit passed on the first shot. Two lines of BitBake config, that actually accomplish what is intended, fetches a half-dozen complaints?
> 
> It helps the maintainer if committers are able to self-police 98% of the issues, and makes the entire process seem less hostile.
> 
> Also, there are too many places to put the same information. I quoted the warning messages I was remedying in the patch set comments, but summarized in the commit message because that seemed like the right thing to do. And that got me another downvote.
> 
> Now forgive me for my rant. I gotta pick up some M&M’s for my girlfriend before 5th period or she’ll be very cross with me.

Funny stuff! Jump in IRC and start a conversation with one of the 
maintainers, folks around here are usually very friendly and helpful.

Kurt Taylor (krtaylor)

