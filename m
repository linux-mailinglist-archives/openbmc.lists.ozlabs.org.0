Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E33FBDE4
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 23:06:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gz2tW6J5cz2yMD
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 07:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qNRni3mk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qNRni3mk; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gz2t06ZQlz2xZg
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 07:05:59 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id c79so21591046oib.11
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hQMbf1CRju8iVpBFQxPXC0LnaB1HOCwD51tLl7euPGg=;
 b=qNRni3mkoHbKSNIaGvV/2dQggN9ND0Kt+JHpWIMld/Jay0FiCAENHMdpuJR2NMq5EM
 orVk3PwYq3T81iVSVNo3meTZ+YGBBPYIA1x7Epm1nqdZnH7WZQGsy7pD9IVRcZIEQGet
 cQ1LNl8y/v61QZc5cXlWqLFI9CJKfrBwSQFSpF1LA/zginm6QMDWOEjYG5PiUAn48ib2
 avXpNErArz2lSj5XOiYcC+xdvoJy+CxS+c9au+SE8oD2CIdRgtD6iHz4WBPlzZ7Ui66G
 Ob+eeQy27uPuoNeIRPKNdorePjgbeyIPIncn9YsL6IGYC58rgFsXAFsf+sAPbsMfcuaq
 vstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQMbf1CRju8iVpBFQxPXC0LnaB1HOCwD51tLl7euPGg=;
 b=iKqtfR5BKjP/KsEWBXnAKaYCL00pxvM3fCQsbuEOuwy1UZG2aAIZ76aqyarx8Ykr0i
 8FEzqTumrSsw1+6/QvH1xJHVfwGAEtAwPg3tZGk9Ytrh+1ke5kRypKFfSfxpWYmwsSQ0
 2YBt/DCRoQ2U4YMtA48OVAaWjdC3rggldCzrkVIrMnmH23Pcu4qi595HjrIHpogQF5pM
 8ZFwEZbgloLTM0vr8GzbNMeY4pVmHjJGsh9nK1lx3RVZ9dxMHBJNdl6muOAxrTeJpYTC
 w72PMK+2s8uMV52eAaPGQbxp/Ld9H0dIRYAde5PwI+xpV7LnHGVr/EilpuKf9SqR9FEG
 wLOw==
X-Gm-Message-State: AOAM532ayb3CtqnX/DuHFyuPLO3iKjZNPV7Rrw+r6X43/XiJOwngvPuw
 j3RKlpjxO/YDPqrxlIUqW9RiwjTGXk0=
X-Google-Smtp-Source: ABdhPJxdlMcqsUyXUl6I2ETT9KqFy+FXMxBBJoVGXqDuuDNN7z2v+xJ6Q7gff+etnrk1/eUks+VRwA==
X-Received: by 2002:a54:438a:: with SMTP id u10mr845979oiv.131.1630357555620; 
 Mon, 30 Aug 2021 14:05:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x4sm1362875ood.2.2021.08.30.14.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:05:54 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
To: Eddie James <eajames@linux.ibm.com>, Brandon Wyman <bjwyman@gmail.com>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
 <e5916b33-8898-a483-bc69-49a08913672c@roeck-us.net>
 <e329beeb2b8efa272d2660fcd253ad5c98a37c50.camel@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8433a40f-abbb-a0a9-9227-85363c2a9201@roeck-us.net>
Date: Mon, 30 Aug 2021 14:05:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e329beeb2b8efa272d2660fcd253ad5c98a37c50.camel@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/30/21 1:11 PM, Eddie James wrote:
> On Mon, 2021-08-30 at 08:34 -0700, Guenter Roeck wrote:
>> On 8/30/21 6:50 AM, Eddie James wrote:
>>> On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
>>>> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
>>>>> The bytes for max_power_out from the ibm-cffps devices do not
>>>>> need
>>>>> to be
>>>>> swapped.
>>>>>
>>>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>>>>
>>>> Eddie, can you confirm this ?
>>>
>>> This can't be true for all the power supplies supported by this
>>> driver,
>>> no. I think we need to check the version first. Brandon, I tested
>>> this
>>> on witherspoon (which is psu version 1) and get 3148 watts. If it's
>>> not
>>> swapped, that would be 19468 watts...
>>>
>>
>> Hmm. Eddie, can you also have a look at commit 9fed8fa99334 ("hwmon:
>> (pmbus/ibm-cffps) Fix write bits for LED control") ?
>> We need to make sure that it doesn't mess up some versions of this
>> PS.
> 
> That one looks correct to me. I believe older PSUs didn't enforce this
> so I didn't catch it, but I do see that the older specifications
> mention setting bit 6 to "allow write".
> 

Great, thanks a lot for checking.

Guenter
