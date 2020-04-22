Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277C1B46CA
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 16:05:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496hyq0bqTzDqrj
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 00:05:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PNyPciPe; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496hxq3w2NzDqpf
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 00:04:15 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id e26so2098408otr.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oKDYuladfMHYv7YAajInk9lev4P7gtAmD0cywck/jwg=;
 b=PNyPciPekm2z6cGs1Q8HsJh+D6iKBtOzZoDdsdSpmaML6wXYo3sYXWLT+x0YAydAu1
 M3WRk0e7ULEovzY9y+FF9DkEcc4kiN54HEiLDk8L/zB2dUbfDbJIaZuVMfEEgOvhwyQn
 4v0/0lVviqn6Mbfswj/YBYKUl0VCopEu1ClkSfQyqCNcOOLRh1xzTWYFS9wEl5vN8Eyo
 rRTDs92QVwbi51T2K3cOuJ992lZ2TwytJvVXNUenH5CGKDPErdupOT0ExO+mA5hJ/DCK
 UQii/+3eqo646MwxwEvIfXmcKnJvci9/G+Mjz0dLF5itaIiPxx2PIzri7Ag502Qt2EfP
 KI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oKDYuladfMHYv7YAajInk9lev4P7gtAmD0cywck/jwg=;
 b=LT1L6vCr+FZ425f+UPPmsb2sb8cIYeMJOG1OiaMkqsg10cCqCUm2P/kydkyGFEEsi/
 4ZhFWNBkbUD0aOpewSf7/TyxupxvsZeHWIOSGYM/vH5TD/AJJRtAFmc+78Xku68H3TTF
 gwsEY8DKoCnSx2xI6VEPyAQfXtamSvh4VGUHLxmp4+gV/Q9kMfHM2Jl7HyhEPmwUnE5p
 lrGKOLggSds5Yy1DXNwS6ixrLsDvHCHjGIYkeH1WM532DHHEJPua8+cgdZdv1ZbNhGJJ
 E3xpQgJyu2v70Bj+FNDAkFFTXIGyqp13Q00zKG42eCZp38xBD7qnq5NdtH8e6nO/azfv
 /rXA==
X-Gm-Message-State: AGi0PuZ01Y51rMqDG3xHnl0ICYmUH9jiSGbsyIKNr9JjhzsH/XirLdMm
 9kd1QaTsdAY1//IR95RQRY34fbpV
X-Google-Smtp-Source: APiQypJIS/ym7EKNjbTxQNYHuXlS6BgpX/PuWv9y301ZUCrVWR8m8dUminlCVzmX7xJwGbaK2gC6CA==
X-Received: by 2002:a9d:12f6:: with SMTP id g109mr18246980otg.0.1587564251141; 
 Wed, 22 Apr 2020 07:04:11 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h65sm1533188oth.34.2020.04.22.07.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 07:04:09 -0700 (PDT)
Subject: Re: Call for Gardening Tasks
To: Richard Hanley <rhanley@google.com>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
 <CAH1kD+ZSFEPVrYsf69auE8iEGxyXg6ru3RArcZrDi2AHrbxOJQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <ebea0fe4-9fde-5025-a765-6c1ce9515fb3@gmail.com>
Date: Wed, 22 Apr 2020 09:04:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+ZSFEPVrYsf69auE8iEGxyXg6ru3RArcZrDi2AHrbxOJQ@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/21/20 6:18 PM, Richard Hanley wrote:
> Thank you everyone for your suggestions.
> 
> Scanning through this it's clear that documentation is one of the 
> biggest most generally agreed upon area to work on.
> 
> Build tools and package management seems like another area with some 
> agreed on improvements. I like the idea of moving to meson. Getting tidy 
> files and revising our style guides also sound like good ideas. I also 
> really agree that we could stand to do some consolidation of 
> processes/repos.
> 
> There is also some use for DBus tooling for both improved code, and for 
> visualizations.
> 
> So here are my next steps:
>    1) Since we have some new people getting started, I've asked them to 
> add documentation at the points they get stuck during on-boarding.
>    2) I'm going to take the ideas in this thread and put together a .md 
> doc with any relevant information I can find. I'll be adding it to 
> openbmc/docs.

That would work, but I would also suggest a wiki page. Docs have a 
tendency to get stale quickly, where a wiki page has a lower pain point 
for a small changes. I can get that started if it would help.

Kurt Taylor (krtaylor)


>    3) I'll follow up in another thread about some of the ideas around 
> DBus tooling and package consolidation. That seems to be an area where 
> most people agree some improvements can be made, but I'm not sure there 
> is an agreement on how we should do it.
> 
> -Richard
> 
> 
> 
> On Mon, Apr 20, 2020 at 10:19 AM Sui Chen <suichen6@gmail.com 
> <mailto:suichen6@gmail.com>> wrote:
> 
>     > On Apr 11, 2020, at 8:15 AM, Andrew Geissler <geissonator at gmail.com <http://gmail.com>> wrote:
> 
>     > Systemd Visualization
> 
>     > Another complicated area of OpenBMC is our systemd targets and services. Building on the upstream tools to visualize our systemd targets and services would be useful to new people.
> 
>     __ __
> 
>     +1 to visualization, and I have a few thoughts on this ---____
> 
>     My lacking a mental model of how an OpenBMC system works had been my
>     pain point in the first few months working with OpenBMC (I’m a bit
>     new to this area), so after learning the minimal set of survival
>     skills I did something similar to what you mentioned – visualizing
>     the messages passed between different dbus peers (and conveniently,
>     IPMI traffic, as IPMI-related dbus messages exposing all IPMI
>     payload comprise most of the dbus traffic on that particular system
>     I was working on.)____
> 
>     __ __
> 
>     I think packet analysis tools such as Wireshark and graphics frame
>     analysis tools such as RenderDoc, or system event-based Windows
>     Performance tool like GPUView provide great examples of what people
>     might expect to achieve with a visualization tool: capture, inspect
>     and (sometimes) playback, across multiple layers in the
>     software/hardware stack. Many similar existing tools process
>     sequences of events, and in this case of BMCs, the events could be
>     dbus messages. I found a prototype visualizer made at work greatly
>     helpful in explaining to new team members some basic concepts and
>     the IPMI stack on the BMC.____
> 
>     __ __
> 
>     The IPMI stack is interesting because it’s one noticeable workload
>     on the particular BMC system I had been working on; in my current
>     limited understanding, having lots of I/O capability to connect to
>     hundreds of sensors is one of the many features that set apart a BMC
>     chip and a similarly powerful smartphone chip, and the broad use of
>     dbus is what sets apart OpenBMC and the desktop Linux distro I had
>     been using. I heard optimization is best done workload by workload,
>     perhaps this rationale applies to visualization too?____
> 
>     __ __
> 
>     I realize I was mostly talking about visualizing the run-time state
>     of the system rather than build-time, but we could visualize the
>     run-time aspect of systemd units too since I have seen many times a
>     dbus message eventually triggering a systemd target to acutate the
>     system, so it would be good to consider both dbus and systemd (and
>     maybe other parts of the system?) to have a more holistic view of
>     the BMC’s operations.____
> 
>     __ __
> 
>     Thanks____
> 
>     Sui____
> 

