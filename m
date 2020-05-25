Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F11E0E86
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 14:36:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VxRR217bzDqJC
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 22:36:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VxQM11GCzDqGL
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 22:35:38 +1000 (AEST)
IronPort-SDR: Cdz+ihwlGsx1KbIU5O5uRS5jLoUSjx6Tt9f4/lJBQb4wzQV2ZLefNdAM4ZJi4IcRnNXY1fhDsw
 xpKkoXZvph0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 05:35:35 -0700
IronPort-SDR: ZbTixJ24JBa72p5UXhJigKli3OrJwkxW+PuOIAo7qOOy5fHOXdSZFYF7n3N1Yhmt2XS18RwogA
 bbYfyItpWF2w==
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="441716868"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.25.232])
 ([10.213.25.232])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 05:35:33 -0700
Subject: Re: Upstream Yocto Bringing in GCC 10
To: Andrew Geissler <geissonator@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
Date: Mon, 25 May 2020 14:35:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 5/22/2020 o 02:36, Andrew Geissler pisze:
> 
> 
>> On May 17, 2020, at 7:08 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> On Sun, May 17, 2020 at 12:19:39PM -0500, Andrew Geissler wrote:
>>> Ready or not, this weeks upstream update brought in GCC 10 (along with the normal slew of new packages).
>>
>> Alright!  The great thing about GCC 10.x is that it brings in support
>> for most of C++20, including co-routines.  Looking forward to playing
>> around with it.
Is it allowed in OpenBMC to base the functionality on experimental 
implementations?

> 
> It took a few more patches but GCC 10 is now in openbmc master.
> Our unit test CI framework has also been updated to run with GCC 10.
> 
> We also migrated from clang-8 to clang-10 in CI so you may want
> to take a look at a recommended clang format update in this commit:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32696
> 
> You may see some new CI fails with your existing code. It could be
> the clang format noted above or some code that is not exercised
> as a part of our normal machine builds. If you hit an issue, it’s
> probably been fixed somewhere in our code base already so
> browse over this commit list for your issue:
> https://gerrit.openbmc-project.xyz/q/topic:%22upstream%22+(status:open%20OR%20status:merged)
> 
> There were a lot of include related issues where you just need
> to include the needed header files.
> 
> Andrew
> 
>>
>> -- 
>> Patrick Williams
> 
Great progress :)

Regards,
Adrian
