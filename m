Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED159D04D
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 07:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBcWq5VdMz3bxC
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 15:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=FZmsNLJq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=FZmsNLJq;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBcWP04spz306K
	for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 15:01:04 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.35.69.86])
	by linux.microsoft.com (Postfix) with ESMTPSA id 99A762174E29;
	Mon, 22 Aug 2022 22:00:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 99A762174E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1661230833;
	bh=MwLkQtpUaed7uAB3pxHuC8dVD+Qq7depNAWJaKqT7ew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZmsNLJq1fxL7l1cU1odybXQrINAudK0z08fWWuAGxOiYOdJeRnATyxdbbXPcu9hC
	 34ReX35pvtDy2aka1W2pUMRE4WHm7pSJl1GsOmQ1IqyKWFSQxCmXzK7deUrbuePqWT
	 WY34o9X/C33NZykBr9J3HJC1eLD9wkGrpYozzpvU=
Message-ID: <38205463-5a74-2444-4f0c-2d2cae011e67@linux.microsoft.com>
Date: Mon, 22 Aug 2022 22:00:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Removing machines using old u-boot tree
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com>
 <7c9df7e6-3ad4-e9bc-278d-ff32ae945023@linux.microsoft.com>
 <CACPK8XefOyAdfoJ3G1ae3=sWmdZWRY-30+=697+5NsNGL9XiEg@mail.gmail.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <CACPK8XefOyAdfoJ3G1ae3=sWmdZWRY-30+=697+5NsNGL9XiEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/22/2022 9:35 PM, Joel Stanley wrote:
> On Tue, 23 Aug 2022 at 04:18, Dhananjay Phadke
> <dphadke@linux.microsoft.com> wrote:
>>
>> On 8/22/2022 6:13 PM, Joel Stanley wrote:
>>> Hello machine maintainers,
>>>
>>> The following (see end of email) OpenBMC machines are using the old
>>> v2016.07 u-boot fork. I would like to see machines updated to use the
>>> new fork so we can reduce the maintenance burden of u-boot.
>>>
>>> We have two options: move to the newer u-boot fork, or retiring
>>> (removing) systems that lack the maintenance effort to stay up to
>>> date.
>>>
>>> The v2019.04 u-boot fork supports both NCSI and direct-PHY network
>>> configurations. For most systems the steps required to update are:
>>>
>>
>> 2019.04 is still old to sustain with backports, e.g. files in common/
>> were moved around in upstream u-boot.
> 
> Yes I agree.
> 
>> Looks like much of Aspeed stuff (other than ast2400 and spi driver) has
>> been upstreamed already. When can openbmc switch to modern upstream tag,
>> say v2022.07 and stage anything not upstream on top of it in u-boot
>> mirror?
> 
> That's a great point. The project's goal is to move to a branch based
> on the latest tag (or even using upstream directly, one day).

Sometimes it's better to be at par or not far ahead of poky
u-boot recipes, as the classes/recipes are dependent on
the u-boot codebase they use.

Recently ran into issues u-boot-sign in other project, using
yocto dunfell (which is at v2020.01) + v2022.04 u-boot tree.

yocto kirkstone is v2022.01.

> 
> There's enough support upstream for booting a direct-phy attached
> device on the 2500 and 2600. We lack:
> 
>   - NCSI integration (patches from myself on the list and reviewed)
>   - SPI flash driver (patches from Chin-Ting on list)
>   - eMMC booting support for the 2600 (I made some changes recently,
> but they are not sufficient)
>   - 2400 support
> 
> I have a WIP tree here with the pending patches:
> https://github.com/shenki/u-boot/commits/aspeed-queue
> 
> With the NCSI and SPI changes merged, we could support the 2500
> platforms with upstream.
> 
> Once eMMC booting support is merged, we could support 2600.
> 
> There are some other requirements beyond booting. For instance, the
> IBM P10 ast2600 machines require the otp command for manufacturing. I
> suspect there are other hidden requirements that we will need to shake
> out.
> 
> I welcome efforts from anyone willing to help reduce our delta to upstream.

Thanks for summarizing the status, hope to spend some time and help.

Regards,
Dhananjay
