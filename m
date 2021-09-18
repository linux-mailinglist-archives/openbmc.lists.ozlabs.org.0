Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF941030D
	for <lists+openbmc@lfdr.de>; Sat, 18 Sep 2021 04:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBFQF0nG6z304R
	for <lists+openbmc@lfdr.de>; Sat, 18 Sep 2021 12:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBFPv47cCz2yJL
 for <openbmc@lists.ozlabs.org>; Sat, 18 Sep 2021 12:38:57 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UojvBlV_1631932728; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0UojvBlV_1631932728) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 18 Sep 2021 10:38:49 +0800
Subject: Re: [Question] How can we use underscore "_" in sensor name?
To: Ed Tanous <edtanous@google.com>, Patrick Williams <patrick@stwcx.xyz>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
 <CABoTLcTznKtVLT1LdXKiGRO0Gnov=kSJfTDTe2bfeVGHCRdPHw@mail.gmail.com>
 <YUId8mvBHn6DOzHu@heinlein>
 <CAH2-KxB9aW7Aj6JjrAAZLPW=OVJe4FTUoAXszR6dTBCF7LYK4Q@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <dc805c26-8dde-02de-57bb-612602cec3b7@linux.alibaba.com>
Date: Sat, 18 Sep 2021 10:38:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAH2-KxB9aW7Aj6JjrAAZLPW=OVJe4FTUoAXszR6dTBCF7LYK4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Tom Joseph <rushtotom@gmail.com>, Oskar Senft <osk@google.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

That's great, and I'll be glad to test the patches on our platforms.

Thanks,

Heyi

On 2021/9/16 上午12:35, Ed Tanous wrote:
> On Wed, Sep 15, 2021 at 9:23 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Wed, Sep 15, 2021 at 09:54:47AM -0400, Oskar Senft wrote:
>>> +1 to using something more explicit, like %20 instead of "_" for
>>> replacing " " for D-bus names.
>> Ed had previously added code to sdbusplus to consistently do conversions like
>> this, in the same way that systemd tends to do conversions.  I think we just
>> need to convert the affected repositories here to use these sdbusplus
>> object_path types rather than creating their own strings.
>>
>> https://github.com/openbmc/sdbusplus/blob/master/src/message/native_types.cpp#L53
>>
>> If paths are encoded this way, we are able to clearly differentiate between a
>> desired space and an underscore because the spaces become encoded as something
>> like `_20`, similar to the proposal here.
> For what it's worth, I added this code to solve this exact problem
> (although in my case I wanted to use dashes in sensor names) I just
> haven't pushed the final sets of patches yet to turn it on.  I'm glad
> to see all the interest in this;  I think the bulk of the hard work is
> done, and all we should need is changesets pushed to bmcweb,
> dbus-sensors, and ipmi-dynamic to use the operator/ and filename()
> methods to construct the dbus paths.  Keep in mind, IPMI will need
> some escaping, as IPMI SDRs assume ASCII, and bmcweb will need to be
> flushed through the urlencode method to ensure we're encoding our URIs
> properly.
>
> If this is important to people, feel free to push and test the
> patches, otherwise it's still on my list to get done and I'll CC this
> thread when any new patchsets are pushed.
>
>> --
>> Patrick Williams
