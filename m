Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A71AAF23
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 19:09:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492TPD0FPtzDrB9
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 03:09:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492TNM07S7zDr6c
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 03:09:05 +1000 (AEST)
IronPort-SDR: kIhVx6jYAqzKWPmUOJcSmWAGiKimC2zRxBRcLgTpxtjN7s+/krKbd3747WEJKXH+Svz0LHWHNR
 NNxh7kTqvRlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 10:08:45 -0700
IronPort-SDR: iL8gO0eTNoeggkVfL54DhxTPIJOHWLsNcfxZ3XI+kLl0jF6/OAAmJmIr+7BYQUUqL3Un6MVTSO
 KTv4wlw4Uz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="253580351"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.213.184.101])
 ([10.213.184.101])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 10:08:43 -0700
Subject: Re: Call for Gardening Tasks
To: Lei YU <mine260309@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
 <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
 <d3eac624-f1a2-fd2d-6639-3290c8085abd@gmail.com>
 <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
 <20200414154801.GA443018@heinlein.lan.stwcx.xyz>
 <CAARXrtm7ex5wNcc3ggkYNw5s9qdT8rw+4F46ioiPfp-7s+GM-w@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <1e50b9d0-e0b7-682f-6a5b-356d9666d49b@linux.intel.com>
Date: Wed, 15 Apr 2020 10:08:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtm7ex5wNcc3ggkYNw5s9qdT8rw+4F46ioiPfp-7s+GM-w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/14/2020 6:58 PM, Lei YU wrote:
> On Wed, Apr 15, 2020 at 12:57 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> On Fri, Apr 10, 2020 at 11:00:48AM -0700, James Feist wrote:
>>> On 4/10/2020 7:30 AM, krtaylor wrote:
>>>> On 4/10/20 9:23 AM, Joseph Reynolds wrote:
>>>>> On 4/9/20 5:19 PM, Vijay Khemka wrote:
>>>
>>> I'd really like to see clang-tidy or other checks for style added into
>>> the build CI. The number of style violations waste lots of time in
>>> code-review for both the submitter and reviewers.
>>
>> Do we have .clang-tidy files in the repositories?  Meson has built-in
>> support for generating a 'ninja clang-tidy' so it is pretty trivial to
>> enable.
> 

There was one here: 
https://github.com/openbmc/bmcweb/blob/70ee8cbd4f3ec5b3e3c18967de221a9f3a70cd38/.clang-tidy

It wasn't perfect, but did move bmcweb over to nearly upstream style. If 
there is a .clang-tidy file we could all agree to, even if it isn't 
perfect, that would be great.


> phosphor-state-manager has .clang-tidy in the repo, and the CI will
> invoke run-clang-tidy.py to do the task.
> However, it's noticed that it's broken with
> https://github.com/openbmc/openbmc-build-scripts/commit/9e5b11f5d5069d244a2dd86b120fcc98fea66d2c
> 

Seems to be empty? Or is meson injecting dependencies somewhere? 
https://github.com/openbmc/phosphor-state-manager/blob/master/.clang-tidy
