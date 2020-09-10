Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0692647DF
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 16:20:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnLd66VSszDqRM
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 00:20:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qSlN/ZoC; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnLYP4hdyzDqdn
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 00:16:57 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id z1so1474106ooj.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7vbI096pjVDn6oMRxWB8t5fXFFL+VDJ1WUryL0zuSts=;
 b=qSlN/ZoC8ACvd1eUfvM1V18jeKyW+xFbWBZAhetpFI6GovdX3LjN7Nl9+RqwpmykUf
 5VmLn68gydz0bGSE7rLZVlc/E5qo34KwRfmJVlh5nzLwmHIGTaK2ubg+sn7W29vkg1nW
 iCX0+mxOCahOk6zrhZKg9u3sN4F4BClFg+1Uh+/snjNf4Nl5Jq++IJeAqvSSUyGV1sP2
 ceDURGHMGQamqnAf1FF7FJVJmcjLsae3+5Dmtm3d39LemY+WqwnSN/FZaSTPmbz4PlWl
 T0lnWyXvgjf4h6tdLA4LWq7LbMEAm33xGPS89ei+EZLp7Y4QX7gIw0PKdjE9b7OqBa/j
 iV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vbI096pjVDn6oMRxWB8t5fXFFL+VDJ1WUryL0zuSts=;
 b=c96lMI8hDcpVIMvrwHZEt3dp7uP62LecIiQqQcpIIg0jPKrBRgRK/FitNqUkDHrex6
 bJ1H1jtm9gFd9G1IsgF0MBh4ka/q5vT75y1FaaQW1KeYShjonq9PRsG6mEDL58jv44x9
 wHpt5+xj1fZJOE1kRb1os/PrXWwr3SVXQhusyqlip8iD+iKFDiN1DZ4Q92eD8tCJzNTy
 Vko8ANYnsMxJDKmc1SglZ5Ouc+dllU4x+F1yk2scqEMZQH1/UOnva32l3xdGbEGQjt2Q
 URc4brzDta9uZ+hzxdtOo7DS2WIv1I+0eKkWWymmSPbBO31xTt+lhoPlJodZqlbebyRg
 2Kuw==
X-Gm-Message-State: AOAM532U29L2RfPkuXH43BH+PJeyPiwHzxD2qf0sbWRUbkJAKxhqy5jo
 9fyoTZQiwmy6KLdpdz58ScZ5GTPDdpLOmQ==
X-Google-Smtp-Source: ABdhPJyuOYMfPNS8/iB53wmjLNlrP9hCy0Skoi4md2Gdkf+naU7h14rWgZJcph1BKARPkMcJD0HCbg==
X-Received: by 2002:a4a:986d:: with SMTP id z42mr4631648ooi.65.1599747414351; 
 Thu, 10 Sep 2020 07:16:54 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h28sm678416ote.28.2020.09.10.07.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:16:53 -0700 (PDT)
Subject: Re: How to comprehensively search the OpenBMC Archives
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <daf3b7b4-1fa6-21b1-622f-d9064c4846a6@gmail.com>
Date: Thu, 10 Sep 2020 09:16:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
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

On 9/8/20 5:22 PM, Muggeridge, Matt wrote:
> I am impressed Joseph!  Thank you.  That certainly highlights the lengths others have gone to for a comprehensive search feature.
> 
> There is a lot of very valuable content locked up in these archives.  I'm hopeful admins will agree that comprehensive searching of the archives needs to be made easier and more accessible to the masses.

As always, feel free to add wish list items for future services to this 
page, we can vet potential services there. (I have added this one)

https://docs.google.com/document/d/1QCFRGCRofcR3K8clSLtJHw10-Cu9zkp0dvwXPWzQSCc/edit?usp=sharing

Kurt Taylor (krtaylor)

> Matt.
> 
>> -----Original Message-----
>> From: Joseph Reynolds <jrey@linux.ibm.com>
>> Sent: Wednesday, 9 September 2020 7:25 AM
>> To: Gunnar Mills <gmills@linux.vnet.ibm.com>; Muggeridge, Matt
>> <matt.muggeridge2@hpe.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: How to comprehensively search the OpenBMC Archives
>>
>> On 9/8/20 1:51 PM, Gunnar Mills wrote:
>>> On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
>>>>
>>>> Is there a more comprehensive/reliable way to search through these
>>>> mamil archives?
>>>>
>>
>> I used the following (bash) script to download the entire openbmc email
>> archive to my workstation's storage.  (And then I use my local search
>> capability (grep,  spotlight search, Windows-f, etc.) to locate the desired
>> content.
>>
>> - Joseph
>>
>> wget --no-check-certificate
>> INVALID URI REMOVED
>> 3A__lists.ozlabs.org_pipermail_openbmc&d=DwID-
>> g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
>> 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
>> OhYZN2fNFoROxHeM&s=oUgen4rG7u90Uby5812hA_y0dDnG41oD1ZuA4K7K
>> NiU&e=
>> set -x
>> for f in $(grep '<td>.*.txt.gz' index.html | cut -d\" -f2); do
>>     wget --no-check-certificate
>> INVALID URI REMOVED
>> 3A__lists.ozlabs.org_pipermail_openbmc_-24f&d=DwID-
>> g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
>> 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
>> OhYZN2fNFoROxHeM&s=AVV8sFghgocf1nC9Vf7UGQtg9m1A63Yeux7DAywt
>> cRs&e=
>>     gunzip "$f"
>> done
>>
>>
>>> +1. Could we look at moving to Mailman v3 and like
>>> INVALID URI REMOVED
>> 3A__docs.mailman3.org_projects_hyperkitty_en_latest_&d=DwID-
>> g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
>> 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
>> OhYZN2fNFoROxHeM&s=HWwrQzEzVNtANfa8DBfvdGnK_2nRlSp-
>> peNmEl1y6n0&e=  ?
>>>
>>>
>>>> I have been using google to search the archives, but have noticed the
>>>> results are not complete.
>>>>
>>>>
>>>
> 

