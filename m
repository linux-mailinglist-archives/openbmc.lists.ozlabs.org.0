Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577D40BF15
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 06:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8SdY1Qfyz2ybC
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 14:57:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8SdG2WLCz2xtg
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 14:57:34 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0UoS.RAl_1631681834; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0UoS.RAl_1631681834) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 15 Sep 2021 12:57:15 +0800
Subject: Re: [Question] How can we use underscore "_" in sensor name?
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
Date: Wed, 15 Sep 2021 12:57:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Johnathan,

The code in dbus-sensors will translate sensor name by replacing space " 
" to "_", e.g. ADCSensor.cpp:

53     Sensor(boost::replace_all_copy(sensorName, " ", "_"),

Then in phosphor-ipmi-host dbus-sdr/sensorcommands.cpp, it will try to 
revert "_" back to " ":

  419     std::replace(name.begin(), name.end(), '_', ' ');

The first conversion does nothing for our case, but the 2nd conversion 
will unconditionally convert "_" to space " ".

If we don't really forbid to use "_" in sensor names, I think we'd 
better replace space " " with %20 in dbus-sensors, and convert %20 back 
to " " in ipmi-host.

Thanks,

Heyi

On 2021/9/13 下午10:57, Johnathan Mantey wrote:
> Heyi,
>
> On 9/13/21 3:49 AM, Heyi Guo wrote:
>> Hi all,
>>
>> Can we use underscore "_" in IPMI sensor names? Now we see that "_" 
>> in sensor names will be replaced with space in the code, even if we 
>> really use "_" for sensor names in json configuration files.
>>
>
> Which layer is translating the "_" char?
> Are you referring to D-Bus?
> IPMITool?
> Some other locatioN?
>
> It would be helpful to know.
> As an example, D-Bus translates "-" to "%2D" and back because D-Bus, 
> or one of the D-Bus consumers can't accept the hyphen character.
>
> It is likely that the underscore character has some similar naming 
> convention issue.
>
> You may want to investigate using the same scheme to translate between 
> "_" and a "%5F" combination.
>
>> The background is that we used underscore "_" in sensor names in 
>> legacy BMC, and all the OOB software uses such names to get sensor 
>> data. Therefore we want to make it compatible for switching to OpenBMC.
>>
>> Is there any way to achieve this?
>>
>> Thanks,
>>
>> Heyi
>>
>
