Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBB1761C4
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 19:02:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WSf90bGFzDqdb
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 05:02:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M042azmT; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WSdR1yYHzDqGX
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 05:01:47 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id g96so91045otb.13
 for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2020 10:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nQSZRaI+4jaTXM3he6yY541hGtwUGBYlEiwqj7sOMZU=;
 b=M042azmTL6rTpvBAtWNSzADHaWtcpiZ5nXKwAOEhNYva0xJ0STNbMUjm1gk4eoxd82
 2WDLBJNSF8CtWf4EOBo7lbUS4st26VNxwhdcs9eB9EpHnevo2pVZctLQO0TC4tVgGBAk
 5jTkL1QmCoE0hHvCxMCwbQpZeqqBskfhEqZ53MsXSw/WVDremRpF1TT92SR1mBEebKsx
 ZXmTIB0ettj0Lu3TUpFDHL6MJQxWMgbhES5Ht3+XyHenHtR0+2LE6gxHn819rwHWDV/+
 U+gA/LTA+FOslEJYu7MpEAWodigHIzI3f12qG+uck3cJR9hUmrHW1MdMN2v+Ngr+arN+
 bIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nQSZRaI+4jaTXM3he6yY541hGtwUGBYlEiwqj7sOMZU=;
 b=L7NGF7YEC+6oBN5Q2Q0zNf09TbYKhOAgArg0iMrDXxS6DNdsQ2s2DAWYbCnp52J1X4
 lGsKG2RFoE+29b4bo/F6YJ+hwYyH43K7KTDtqJzHWy/PNJ1Tfv2L1IeT3oF23w+3Tbri
 FOl2wW2jM18W0XUYSRxGx7j3fiutqAYI7qxX3RtT0VxZGsKVLyn+ed/KGXtAOfwLM3Fr
 Iaup6NKMCbpTP/rzlP2xqxUFGIWLn0wHhGKhxb+pLOY3ZS0MjUrvnwb+RGVE3R7ZI06S
 +1aQTEKpidkzn0USElDCAZGIR31hRGeQEp5WPMl+J2ca7q9j3oq6lF1F8P3YZmAgvZLN
 KOpw==
X-Gm-Message-State: ANhLgQ3RcdcjCznepNIsvSokFaBa8YcHQTchelq39fgeje+IEKulDi2R
 H62/QufPvTIrkwy0nOrGQ5xwilrP
X-Google-Smtp-Source: ADFU+vtel4PFmxv0UqKhoK6obfwSACkX46lBr3Sr9MDenaavkTi7j+FFygmrOPa+egTt1tlwVZPcKQ==
X-Received: by 2002:a9d:6255:: with SMTP id i21mr298182otk.183.1583172103467; 
 Mon, 02 Mar 2020 10:01:43 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id g17sm4641232otg.55.2020.03.02.10.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:01:42 -0800 (PST)
Subject: Re: sdbusplus commits missing CLA
To: Andrew Jeffery <andrew@aj.id.au>
References: <20200220203546.GF41328@patrickw3-mbp.dhcp.thefacebook.com>
 <97f984a2-e975-c620-7fc3-e3b7defb75ea@gmail.com>
 <db64d727-02eb-4414-9624-dc174f2cb01a@www.fastmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <7b24effa-06f8-a317-13ea-15602c59e6d1@gmail.com>
Date: Mon, 2 Mar 2020 12:01:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <db64d727-02eb-4414-9624-dc174f2cb01a@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2/23/20 6:14 PM, Andrew Jeffery wrote:
> 
> 
> On Sat, 22 Feb 2020, at 06:40, krtaylor wrote:
>> On 2/20/20 2:35 PM, Patrick Williams wrote:
>>> Kurt,
>>
>> (Not a lawyer)
>>
>>> We have a few commits for the openbmc/sdbusplus repository that have
>>> been floating around in Gerrit since early 2018 and seem to be stuck in
>>> "missing CLA limbo".  It appears that there was some discussion on the
>>> CLA at one point but I don't know what happened to it.  I don't see a
>>> CLA from the Bosch company in the Google Doc folder.
>>
>> I have not received a CLA from Bosch, or an ICLA from the developer(s)
>> referenced.
>>
>>> https://gerrit.openbmc-project.xyz/q/owner:mark.jonas%2540de.bosch.com
>>>
>>> There was recently a request to revive this work because someone else is
>>> finding it useful (and we've had a feature request open for a long time
>>> on one of them as well).  What options do we, the maintainers, have in
>>> this situation?
>>
>> We cannot accept/merge the code until resolved. If they cannot complete
>> a ICLA/CCLA for this submission, it should be abandoned.
> 
> So "contributors" can DoS the project by authoring patches and not signing
> a CLA?

Never been a problem in any project I've been a part of. But,there are 
plans to make it easier for a maintainer to check (maybe fully automate) 
whether a contributor is part of a CLA group, see "Community Support" 
thread.

> 
> What happens if someone forks the repo in question and applies the
> unaccepted patch, and we end up changing the bitbake recipe to point at the

Why would we do that? We can't stop anyone from forking our project, in 
fact most companies that build a product based on OBMC will fork a 
"supported"" version anyway. They can add or remove anything they wish.

> fork? And if that's bad, how is that different to consuming projects that don't
> have a CLA (e.g. Linux, u-boot, qemu etc)?

It still remains the responsibility of the company to accept the risk of 
shipping open source code as a part of their product. This is as old as 
the open source movement itself.

> 
> I feel like this needs a bit more thought...

The CLA protects all participants; companies and individuals. I know for 
a fact that several of our participating companies (if not all) would 
have a big problem with the CLA not being in place. It is up to us as a 
community to incorporate it into our processes, and we have discussed it 
at length. I don't feel like the current policy/process is horrible and 
needs fixing.

What changes would you propose?

Kurt Taylor (krtaylor)

> Andrew
> 

