Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCA261739
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 19:28:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmBvb1F0gzDqSn
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 03:28:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kyMwFnOv; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmBpx2MtczDqBj
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 03:24:39 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id w16so17217402oia.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2020 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZksapLG8qaNNrR8YjjkylMsuaVb/v8mHDFl9sbQNqi4=;
 b=kyMwFnOv2sbQDVLKVfv26Q72QALoRTjm/xVS1JasZupNfkt5WtD9Fr3X8YEYwSIReu
 F/TsG8mSDA7+5YZQ3iq0HMTPbovdlOw7qFzPqRcKBDeOBVASYb/ZMA6wu4+bVayFV7k3
 oCoREy+pYNwHPrUn+OuXuwg72KaPD3Iyw+0r6Z5TyQT7o17i3p0VM467x158/8pduvB2
 HJ/JbjT77Lrf4D4CZlI1xIuq3bUQFSmHMl+df/vNOJIbGFzCpgkzmwqE8MswYe9cSmGC
 Ih3SucY7kq8JKfoxY2IaEABXc/daW6pv95Got6EKYGIn1ocrHAfB+iL64W/fKouX2kTU
 on7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZksapLG8qaNNrR8YjjkylMsuaVb/v8mHDFl9sbQNqi4=;
 b=bqeyNxtsL76XfzFJs0qKHbze+E9JJ/Qai5hW4RL8/kxglRNP6nabIRNBKzKUmXgJaU
 jo13Podb5DccQv3Z2jKcFB1dyLC70ln4i3nRVmSx8p7Ba8VxfN8kalqaqy1wotSIjPGC
 Xo3IMOgn2heSZmqD/4mvZjcc2knKyn661HWvchg5YSGGaeHhWT7MNCFBb+G51UYbGVUK
 LcmybhygWyy6G1AGhlINLZxiBPX9WcOviOk5YhdtyhffdrBgPM+ZUJB3RIFbHPcGCoxt
 EasFCu35FM+RfkclHC/tlyV1+kWuu8M4zoLwxWhf1SfhEiiN09YldmrQlQhm9OuwCkYq
 oBkw==
X-Gm-Message-State: AOAM530RcMe5tkBADPp7M5EJFIshsMvSJCYgirKUPQKwkamClx8dS7oq
 6MxYXOs5uuv8nTBN0idskR7WvvN4HBWIJw==
X-Google-Smtp-Source: ABdhPJzgGd64rx9RvAfGIdvYggdemON7iDJecVy3Nmp2jVk6ntzubhB2fMiiGat0QwawqMwWdvLAAA==
X-Received: by 2002:aca:4d89:: with SMTP id a131mr131675oib.69.1599585874360; 
 Tue, 08 Sep 2020 10:24:34 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id x38sm3626699ota.72.2020.09.08.10.24.33
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 10:24:33 -0700 (PDT)
Subject: Public forks (Re: PECI patchset status)
To: openbmc@lists.ozlabs.org
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <da62c2ca-0499-5051-2a7a-93453952fd00@gmail.com>
Date: Tue, 8 Sep 2020 12:24:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903171556.GA32795@mauery.jf.intel.com>
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

On 9/3/20 12:15 PM, Vernon Mauery wrote:
> On 03-Sep-2020 10:27 AM, Patrick Williams wrote:
>> On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
>>> Thank you Joel for carrying this patchset, and Intel does have an 
>>> interest in getting our patchsets upstreamed.
>>>
>>> Since Intel has a large set of patches that need to be upstreamed our 
>>> plan is to fork the kernel in github/intel-bmc and apply the intel 
>>> patchsets. Upstream recipes can then pull the kernel from the intel 
>>> fork with the intel patches. Intel will ensure that this fork tracks 
>>> the openbmc kernel version and maintain the intel patchsets while in 
>>> the process of getting them upstreamed.
>>
>> Rather than create a separate fork of the kernel, is there something
>> that could be done here to have someone from Intel work with Joel on
>> preparing the patches?  When a new kernel comes out, Joel can ensure it
>> works on the base AST2xxx system design and before we move all the
>> systems to it, someone from Intel can rebase the non-upstreamed patches
>> they are carrying?  This hopefully reduces some of the burden on Joel
>> and stops us from further fragmenting the community.
> 
> Keep in mind that Intel does not plan to keep the fork around 
> indefinitely. The hope is to fully upstream all of the patches that we 
> have outstanding. Our intention is not to fragment the community, but to 
> provide a mechanism to continue to move forward while still providing a 
> way for other users to build the intel-platforms target.


In 20+ years of open source development I have never seen a fork like 
this actually improve anything for anyone involved.

It fragments the community and winds up being a PITA for the company 
that forked since they now have to figure out how to reconcile the two 
trees.

As I said from day one with this fork, if there is a problem with the 
speed of the community ("moving forward"), then the problem is probably 
with planning and transparency. If we are not talking about n+1 release 
features, then it is already too late.

Open source really does work, it starts with an commitment from everyone 
to look out for the community first.

All IMHO,
Kurt Taylor (krtaylor)

> As an added feature, having our full kernel source in a publicly 
> available tree will allow us to upstream more features that depend on 
> kernel support that is not currently available.
> 
> --Vernon

