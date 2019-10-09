Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD12D0E2E
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 14:04:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pCYv1kv5zDqMh
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 23:04:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pCXn0DSczDqDt
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 23:03:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C72A51527FE;
 Wed,  9 Oct 2019 08:03:14 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: watchdog's patches backport from dev to 2.7/warrior
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XdDTL7YmGezNSdJWZy1erx5KAqHq1NtxYWMCp9F3_szqw@mail.gmail.com>
Date: Wed, 9 Oct 2019 08:03:14 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <E2C68E70-1358-46E1-9381-D135E2869D99@fuzziesquirrel.com>
References: <a75f96a83100994878c2ad459146b7107b5d1da8.camel@yadro.com>
 <CACPK8XfLqGqZSWqfUtOWqvxyBdOyd_PpAA7NMuUUARoNn1Gu-w@mail.gmail.com>
 <106edb5ee091ec873c0461d28fb4820856a742ba.camel@yadro.com>
 <CACPK8XdDTL7YmGezNSdJWZy1erx5KAqHq1NtxYWMCp9F3_szqw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:56 AM, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, 8 Oct 2019 at 16:56, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>> On Tue, 2019-10-08 at 06:20 +0000, Joel Stanley wrote:
>>> On Mon, 7 Oct 2019 at 16:16, Ivan Mikhaylov <i.mikhaylov@yadro.com>  
>>> wrote:
>>>> Hey Joel, Brad,
>>>>
>>>> Can we backport these patches into 2.7 warrior, please?
>>>
>>> Sure. There are two ways to achieve this:
>>>
>>>  -  apply changes as kernel patches to the kernel in the layer for your
>>> machine.
>>>   - update the kernel to a newer version by updating meta-aspeed
>>>
>>> As the kernel is not being maintained for the branch, I would suggest
>>> updating meta-aspeed is the best way to go.
>
>> Joel, we had same idea about kernel patches for our layer but meta-aspeed
>> approach is much better for us. So should I send those patches into  
>> gerrit for
>> meta-aspeed?
>
> I can handle the updating.
>
> Brad, are we happy with this approach?
>
> We will update the warrior branch to use the same kernel as master.

No concerns or issues with this approach from me.
