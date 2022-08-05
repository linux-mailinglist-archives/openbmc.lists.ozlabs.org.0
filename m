Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920258B0CE
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 22:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzxmg04nGz3052
	for <lists+openbmc@lfdr.de>; Sat,  6 Aug 2022 06:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=GzIev/yW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=GzIev/yW;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzxmD2g4Vz2xrk
	for <openbmc@lists.ozlabs.org>; Sat,  6 Aug 2022 06:20:12 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 243DF20FFE37;
	Fri,  5 Aug 2022 13:19:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 243DF20FFE37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1659730780;
	bh=xCZdqRSzikkK6tGn2IQ1d3y7nCx9H/G7gGW8BKUQyaU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GzIev/yWbirhN5hdnlixlMxVWJsSz0T0CzgQGJI9wr4yYuGBxl8hmjcRq5zlPKK/p
	 7JMduT357w1+3L7Zi6ya/FL0k3kDtyMoLuR8EnBjbyYwEZtrPTRF6HRL9M8RpnGXPo
	 E3MYqHVuXCytCJ+tKVLL3td1TBSchMOcJ8V+//co=
Message-ID: <b090805f-0387-26dc-0274-eebf0f28c432@linux.microsoft.com>
Date: Fri, 5 Aug 2022 13:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 3 - results
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
 <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
 <9922163c-3d64-48ff-a808-b4b8dcfcb32d@www.fastmail.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <9922163c-3d64-48ff-a808-b4b8dcfcb32d@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/3/2022 8:01 PM, Andrew Jeffery wrote:
> 
> 
> On Thu, 4 Aug 2022, at 04:35, Joseph Reynolds wrote:
>>
>> 4 Consider migrating this meeting to Discord > Voice channels >  Security.
>>
>> DISCUSSION:
>>
>> Three responses were: Why?  Seems okay.  Don’t like Discord.
>>
>> Access question: Can a web client access the discord voice session?
> 
> Yes, the web client can access voice sessions. I use the web client
> exclusively on my work machine.
> 
>>
>> Also, let’s use the discord #security channel.
>>
>> The direct link is
>> https://discord.com/channels/775381525260664832/1002376534377635860
>> <https://discord.com/channels/775381525260664832/1002376534377635860>
> 
> So from this the outcome of the discussion is a bit unclear.
> 
> For better or worse, discord is where a lot of OpenBMC activity takes
> place. I think something fundamental that the security working group
> needs to develop is better traction with the OpenBMC (maintainer)
> community. Problems that are discussed by the Security WG often have
> direct impacts on maintenance of the software that makes up OpenBMC,
> most of which the WG attendees are not responsible for.

Absolutely, one of the discussions around CVE / GH advisories workflow
requires repo maintainers to be involved.

> 
> Migrating the security WG calls to discord will increase regularity of
> use among WG attendees and hopefully increase interaction with other
> parts of the OpenBMC community where they need influence.

+1

> 
> We already hold weekly Technical Oversight Forum meetings and
> fortnightly PMCI get-togethers on the respective discord voice channels
> and it works very well.
> 
> IMO Joseph, you should just start hosting the calls on discord. People
> will move to it if they wish to continue to attend.

Another issue is current Webex setup is, messages are not accessible 
after meeting ends, discord channel would solve this offline access?

Thanks,
Dhananjay
