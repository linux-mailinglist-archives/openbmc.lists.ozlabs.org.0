Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71962C898
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 20:01:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCC7F1cDpz3cMT
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 06:00:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RXw4H5M3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RXw4H5M3;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCC6g4Xc9z3bYF
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 06:00:26 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id o4so31338828wrq.6
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 11:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zjwfR8HzuTvk+D3JgdxWzRmfAZMayBouv3Y8rBS/QeM=;
        b=RXw4H5M3UcRJLgfM/R74TwPPMHEyTXhWppbEABsPpb4/bnqrNzU1oRRgoXnKNqZAlR
         P/qmeI9HfTGUvNZ/ubKpONYb4m9OPykosr23TpSmquK3Hi1q6T70bO/rzd7ziFrPoC8m
         2Gk/lnoTiFbM/HEMLq4RStoUA8jcEmSUTyB6BFqyu/lbaAXHpq5em+89LBI7SEVfwmp6
         BcBZu+4wZ8ptpIDNzl0mrWBprYcwZys6eXYDu4TXxwJyBphkpNPhfWiTkAfoqBtcgz+9
         8CJgbnCk+tBFElWTeT6RQWx9nBJu8MHvXmcgY8xopgWGmRPj3xrGiIxOqWh/YJ5lmpV+
         qG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjwfR8HzuTvk+D3JgdxWzRmfAZMayBouv3Y8rBS/QeM=;
        b=X8uBopanNcNC3LjCccxknzeoTmaYx3k+4G+FKRoVes3ySWqowz6dbI1DKFb8r84FZE
         1bZTtzZZrPC6Vs9bTtLEprXFTsVUKr0fLm0UZ8HAWxZRuCZFHHxqdhEv4zlN+FuoqxSu
         lxmDiv5gW3WOAa/7U6NZKO62x2F81GeYX8tof30hcBeqhbJC6Wg74np+OeLSpnj+pQVi
         T80sZ/nKztmtgp0T8dJ+ChvJIKY0CUGWopfmyCL9ZkE2PAFP+jH2qPJ+cXVhUHCI2JR2
         Tv0Kz9JhkKnECbvXTnqlUI7/0XI+AgMj0dB2I4LE/a1n5n2ciAlEm3xNwBcBfT6I5si/
         xijw==
X-Gm-Message-State: ANoB5plN7HBPScMDmyUA7qgV9yg0dNXodM0R1+KA7yAzpqAY5CPgQslU
	StF0L0SlWUy+fSNz0T9QZClNb6j6TKRkbMQS+x/05e6iR9CuBHe8
X-Google-Smtp-Source: AA0mqf4HsOpyJWIQs3q9FTX6mDsQhJ9XADElSiS7LK6VNLJTDW/1B08cLOMxtUoF570q2ojYdTVNCHjY6Vz7nOBXjbE=
X-Received: by 2002:a5d:62d1:0:b0:232:c489:90e6 with SMTP id
 o17-20020a5d62d1000000b00232c48990e6mr14293678wrv.68.1668625219393; Wed, 16
 Nov 2022 11:00:19 -0800 (PST)
MIME-Version: 1.0
References: <CA+H48BRsTM4B_MHreMZG+_9abbjp5G2jcxmiMwqiPGrFytWWTg@mail.gmail.com>
 <CAH2-KxABvChOBiOPqMZfjhCfByBJj0=h0PKZ6HcATZoEoYkUqQ@mail.gmail.com> <CA+H48BTnEp5w-LgnswBgtxxLMbkCyLPs7cL7bAOsic7Tuix=Sw@mail.gmail.com>
In-Reply-To: <CA+H48BTnEp5w-LgnswBgtxxLMbkCyLPs7cL7bAOsic7Tuix=Sw@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 16 Nov 2022 11:00:07 -0800
Message-ID: <CAH2-KxDJJjLogUXBOJ6jj+X-Himwi6rqy1hrGkdxHkGsfZxkww@mail.gmail.com>
Subject: Re: Performance: BMCWEB prioritizing URI response in multiple redfish
 clients environment
To: sharad yadav <sharad.openbmc@gmail.com>
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

On Wed, Nov 16, 2022 at 9:49 AM sharad yadav <sharad.openbmc@gmail.com> wrote:
>
> Thanks for your response. Responses inline.
>
> >  Can you elaborate on which URLs your clients are accessing?  Is this
> >  on an upstream SHA1 of bmcweb?  Do said clients implement HTTP
> >  keep-alive?  Keep-alive is important, because otherwise the bmc is
> >  negotiating TLS for every request, which can be quite slow, especially
> >  when done in parallel.
>
> We are at the latest bmcweb upstream code.
> We have 4 type of clients collecting set of URIs:
> All thermals: /redfish/v1/Chassis/<str>/Thermal/
> All other sensors: /redfish/v1/Chassis/<str>/Sensors/<str>/

When you say latest, do you really mean latest (rebased within the
last couple weeks).  There were some pretty significant performance
increases made in these APIs.  There's even yet another still pending
that you might try:
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57653

> All inventory: /redfish/v1/Chassis/<str>/ and /redfish/v1/Systems/<str>/Processors/<str>/
> Log services: /redfish/v1/Systems/<str>/LogServices/EventLog/ and /redfish/v1/Systems/<str>/LogServices/EventLog/Entries/
> /redfish/v1/Systems/<str>/LogServices/EventLog/Entries/<str>/

If you remove the two EventLog APIs, do your problems go away?  These
endpoints are known to use blocking filesystem calls (which is now a
documented anti-pattern, and we have alternatives like io-uring) but
could be the source of your blocking.  That would be a lot more doable
to fix to use non-blocking calls.

>
> All clients implement keep-alive so clients avoid the TLS handshake penalty.
>
> >  I'm not sure how a priority system would work in this case.  Can you
> >  elaborate on your idea?  There is currently no queue outside of the
> >  TCP kernel, and async tasks in io_context.  Which queue were you
> >  planning on assigning priorities to?
>
> We want to prioritize our thermal sensor URI.
> Is there a way to prioritize HTTP requests over D-Bus response messages in bmcweb?

I can't piece apart what you just asked for.  To create a response for
a sensor object, the flow goes:
Http -> bmcweb -> dbus -> sensor daemon

if you "prioritize" http socket actions, then your end state will be
no faster (possibly slower) because the dbus calls required to get
that data are de-prioritized.  Can you please expand on what you're
thinking, ideally pointing at the specific queues (in code) that you'd
like to make a priority queue?

>
> Thanks,
> Sharad
>
> On Wed, 16 Nov 2022 at 21:59, Ed Tanous <edtanous@google.com> wrote:
>>
>> On Wed, Nov 16, 2022 at 5:28 AM sharad yadav <sharad.openbmc@gmail.com> wrote:
>> >
>> > Hi All,
>> >
>> > We are facing a delay(till 6seconds) in bmcweb URIs responses when there are multiple clients(4 in our case) performing GET requests in parallel on different URIs.
>>
>> Can you elaborate on which URLs your clients are accessing?  Is this
>> on an upstream SHA1 of bmcweb?  Do said clients implement HTTP
>> keep-alive?  Keep-alive is important, because otherwise the bmc is
>> negotiating TLS for every request, which can be quite slow, especially
>> when done in parallel.
>>
>> Can you put together an example script that reproduces the issue?
>>
>> > We have a very important telemetry URI, used for thermal monitoring. On standalone, telemetry URI response is within 200ms.
>> > But with multiple clients, telemetry URI response reaches till 6seconds.
>> >
>> > Can we get help on how we can assign priority to our telemetry URI over other URIs in bmcweb?
>>
>> I'm not sure how a priority system would work in this case.  Can you
>> elaborate on your idea?  There is currently no queue outside of the
>> TCP kernel, and async tasks in io_context.  Which queue were you
>> planning on assigning priorities to?
>>
>> >
>> > Thanks,
>> > Sharad
>> >
>> >
>> >
>> >
>> >
>> >
