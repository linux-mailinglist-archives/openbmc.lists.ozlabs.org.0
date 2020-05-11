Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11B1CE018
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 18:08:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LQpX2DKrzDr6y
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 02:08:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sIfV2+tH; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LQlS0V3gzDqTg
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 02:05:54 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id w65so4929675pfc.12
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jQl8AlPv0WA8mqpQfYz1wRhInI/2nLWkL9tRiUoekpI=;
 b=sIfV2+tHtIrMcHwfJfz26oR4EsQtk/x1zn7mvHanBnJg5uCqHh3cIcE/O6s6+fNn3/
 V766Vg8292qrM2rwa0mUZdZ1uLSpw0b1MHK95ZXx+EwhW4YIi1dmh67nBU+UvlSZSjE4
 asGMv+P5qrYBLWUy27QbquGSXul9idmEnd2ZNJ+380RrJ+xnkLyZ8m1bEKvpfB3IiQYx
 nEAcN+ORl8PGYMqxunZ1SbfwdZgu5ykqUqj+fDo+bZOkbeP7tRS2ZMMZsTL5LgOIceYg
 F0FXDGy4Rx8co34mcdDLdV+HoikGUoN5+taJuw7cMHbwJTxkkY5UA0wSMpEArcg9a+9m
 6zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jQl8AlPv0WA8mqpQfYz1wRhInI/2nLWkL9tRiUoekpI=;
 b=q6F5SwJhh5GkpTlLg1LXRAfOeIWq4k4GsAl80DcfKWJQd1XbqqBAKajtBK66zxlJmm
 tnMNF3griTYAzz7G4ksPsBBw5x5rA3wcxmBwgiMsYBH/evNQd1K9cPEEFq1yOdVud7m+
 xPLWS7q0XyxJ53S8h/IUNaGmZCqsKgMwLnK3SaazC5ckoWKwPAW5VblqvFXZ9hToQMsT
 olhqwYsZkwT2HuOX6dXcSL8cdYD4LLDhLPjeSwlKZFGhDLnS+fyhJ55oR2z0UWu+EYVu
 KN9zOlTUefmL/bslkG4Kw6yMn1NWnFLfTd9cYk7NUiYvdc/dBEEqJtGqyvEmyxAgRpsK
 oLSA==
X-Gm-Message-State: AGi0PubhjFL3QKJjWkHoszV7bQLlN/TdW6R5PUFe0FVLwgEDc3vX2Lz0
 CgVRH1dt7VDdkyKB9i++jYDNj6Uca5c=
X-Google-Smtp-Source: APiQypJ0XYVkoaxFOGAfysLogrYb+Ilq4ZY0qGha0TrVlXStzNjZ6XdMdui3BB6dg4WWFwJYYUeBdA==
X-Received: by 2002:a63:5955:: with SMTP id j21mr15733238pgm.70.1589213150277; 
 Mon, 11 May 2020 09:05:50 -0700 (PDT)
Received: from ?IPv6:2405:204:5517:3650:9956:f6e5:8f1b:c166?
 ([2405:204:5517:3650:9956:f6e5:8f1b:c166])
 by smtp.gmail.com with ESMTPSA id ev5sm24468929pjb.1.2020.05.11.09.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 09:05:49 -0700 (PDT)
Subject: Re: Storing host data on the BMC
To: Patrick Williams <patrick@stwcx.xyz>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
Date: Mon, 11 May 2020 21:35:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511120719.GA10214@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

Thanks for sharing the pointers. I was aware that there was work going 
on in this area. So was looking for your and Surya's inputs on this.

I will go through these designs from my use-case perspective.

Thanks & regards,
Sunitha


On 11-05-2020 17:37, Patrick Williams wrote:
> Hello Sunitha,
>
> Intel has already made significant progress on this problem domain and
> we seem to be fairly converged on the design direction [1,2].  Have you
> read through their design proposal?  Are there any oversights in their
> design that would affect your needs?
>
> Their design has been on-going for months now.  I don't think it is
> appropriate to start from scratch on the design discussions unless there
> is something fundamentally broken about their direction.
>
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320
> 2. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242
>
> I thought there was even some implementation started in bmcweb for this
> feature.
>
> On Mon, May 11, 2020 at 11:44:35AM +0530, Sunitha Harish wrote:
>> Hi,
>>
>> Gentle reminder for the feedback.
>>
>> Thanks & regards,
>> Sunitha
>>
>> On 06-05-2020 12:53, Sunitha Harish wrote:
>>> Hi Deepak,
>>>
>>> Please suggest which other approach you think is better here for
>>> Origin attribute?
>>>
>>> When the interface is set as DHCPEnabled=true ; similar to the Origin
>>> attribute , the IP address, SubnetMask and Gateway will be set by the
>>> host. So we would need to consider this usecase also as a candidate
>>> for the new approach.
>>>
>>> Thanks & regards,
>>> Sunitha
>>>
>>>
>>> On 05-05-2020 12:29, Deepak Kodihalli wrote:
>>>> On 05/05/20 12:12 pm, Sunitha Harish wrote:
>>>>> Hi Deepak,
>>>>>
>>>>> As mentioned , the Origin is the property which will be set by the
>>>>> host once the IP address is applied to its interface. Its a
>>>>> read-only property for the out-of-band user. But its a closely
>>>>> coupled - related attribute on the host setting/BIOS object.
>>>> Hi Sunitha,
>>>>
>>>> What I'm trying to say is - we shouldn't make this coupling. The BIOS
>>>> settings table is a group of attributes that can alter the default
>>>> behavior of the host firmware. The Origin property you describe
>>>> doesn't fit that description.
>>>>
>>>> The host "sets" several things for the BMC, for eg the host firmware
>>>> can tell us functional/presence states of FRUs which the host has
>>>> access to. Everything that the host "sets" this way isn't a BIOS
>>>> attribute. Once you decouple this, I believe we can think about
>>>> options other than the two you have suggested - since both of them
>>>> involve making the Origin property seem like a BIOS attribute, which
>>>> it clearly is not.
>>>>
>>>> Thanks,
>>>> Deepak
