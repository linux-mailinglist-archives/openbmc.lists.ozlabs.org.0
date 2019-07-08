Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFC6284E
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 20:21:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jDKk027DzDqQM
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 04:21:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bnfNeA4r"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jDK766KYzDqGG
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 04:20:43 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id j6so37453422ioa.5
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8qP/ziT8cn8hP/TPaV99mOCJb8SKrhsnm8Sl9jtfzz8=;
 b=bnfNeA4rVbQDfsTXZ7r/cpe29APmjAYjsRAByqLlq9Bq3Oe2L/LRThFs+qLAA6AVoE
 Kd7XCj8yDb1Ge4NsbnYPOS/3oEFhOA2TcrK38OL/3AGAEJpfQG/gstGCWPgzv85nn2U+
 MiD/2sZBQnoJogNRT+0+AP48A4NS/j751vg5thbX9OD24n+2LS/OpQGO5z/giK5YcuHI
 chkRKEohNnycgqpTTItwbQOYp2XGvsvohecr4qDerHbKv8dNBDuo3YuYz8VKGCMug4AJ
 xCrDVeXmFkrkphOfPC9o0ClAOpPkej/Un6hxUKpU36BM7vuZbGRE8ojbPOdl7TWgUJJX
 p5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8qP/ziT8cn8hP/TPaV99mOCJb8SKrhsnm8Sl9jtfzz8=;
 b=kqk1GQroKu74Yoxh8elbjFN357zYL07PfNPoP+NCDZGKZuT9TObpQjju8gu32wKbow
 ZIFSt3TImS13s9BDMCuFjzqCZrJHz05Xj3I1i3fbIoICuOeBCqkQue8G3zikrzyir0W0
 Hwfou+2gEsAa7l+fLFH05CN0fo5qWHJJ4Bz82I7G29ivtv11Nni66ZAinoz20DqTXZCo
 pXUqThF4bOlWex4pzmQndJFnyyCZk9FB72I6REJiyAPc4R4iJ2uOulAyTeMdXY9Q1upE
 Gk/vB8vOOl7IpTRdg4yobIB5TcZx9wveQITx/Dw7jpmdQh2Er5SNWTR04ttRpQbRl5ZK
 tARg==
X-Gm-Message-State: APjAAAXr2hu9R/mLCYbnhK1z5zu+8wf+rlZhseZFYZoT3a76MqWyvSLW
 oCqX/CfF/PZ2PV4D8XuJp1iVbdcl
X-Google-Smtp-Source: APXvYqwzpA4pOejjOct0cEUEASQhaZHjHghlcM0dbvpV1yoZpt7oizRYhkAPKQ2uVHvsKiPL60NCQg==
X-Received: by 2002:a05:6602:c7:: with SMTP id
 z7mr1132158ioe.130.1562610040509; 
 Mon, 08 Jul 2019 11:20:40 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::32:7e])
 by smtp.gmail.com with ESMTPSA id e26sm15354240iod.10.2019.07.08.11.20.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 11:20:39 -0700 (PDT)
Subject: Re: Inspur CCLA Schedule A update 2019-07-04
To: John Wang <wangzqbj@inspur.com>
References: <CAHkHK0-M-=D+DKt1+BPe7V_OYKaB0Hy7P9KwObDALwmLtpxL2g@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F98314A49@fmsmsx118.amr.corp.intel.com>
 <CAHkHK0_-_Tu6p8WRWPZYvvCYd68=V3ngQm8GB=3=70LzcUTipA@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <35c3f031-03d3-f975-f4bf-b7d067cfa39f@gmail.com>
Date: Mon, 8 Jul 2019 13:20:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHkHK0_-_Tu6p8WRWPZYvvCYd68=V3ngQm8GB=3=70LzcUTipA@mail.gmail.com>
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
 "sunliangyong@inspur.com" <sunliangyong@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hi John,

All done. Thank you for keeping this schedule updated.

Kurt Taylor (krtaylor)

<snip>
>>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-bounces+sharad.khetan=intel.com@lists.ozlabs.org] On Behalf Of John Wang
>> Sent: Thursday, July 04, 2019 1:21 AM
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Cc: sunliangyong@inspur.com
>> Subject: Inspur CCLA Schedule A update 2019-07-04
>>
>> Hi,
>>
>> Inspur CCLA Schedule A is updated as below:
>>
>> Schedule A
>> Initial list of designated employees. NB: authorization is not tied to
>> particular Contributions.
>> Please indicate "CLA Manager" next to the name of any employees listed
>> below that are
>> authorized to add or remove designated employees from this list in the future.
>>
>> Alex Ning
>> Carter Su
>> Chicago Duan
>> George Liu
>> John Wang
>> Kiuyi Chen
>> Lewis Sun - CLA Manager
>> Xiaochao Ma
>>
>> Please help review
>> Thanks
>>
>> John

