Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7C1C2213
	for <lists+openbmc@lfdr.de>; Sat,  2 May 2020 03:03:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DW7w5rBWzDrPM
	for <lists+openbmc@lfdr.de>; Sat,  2 May 2020 11:03:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sZsgxHTL; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DW6Z2tl6zDr7f
 for <openbmc@lists.ozlabs.org>; Sat,  2 May 2020 11:01:57 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id m13so4004355otf.6
 for <openbmc@lists.ozlabs.org>; Fri, 01 May 2020 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HQ90mztC1vuOGxNS7Ai4ZfdgDT2MdRYP9F+o58e2pzE=;
 b=sZsgxHTLHYTVjFBdK3XRDjUsuoHH/0hphUZrNaCwj3V+Ycb77RjNyilbjTEvZAfyMC
 iVT1CDFrbVbDf8/NvwLOj8lqslCDG9Nakx1FViepb/4J5l+enGcNAaT37bYsUbo4J+Cp
 HYJrDkJXATsZ8i4NbT1D6k2UUpO1y3/p0rJOroPm3k/vBtipXv5+3BV32hsB8TSF/3R8
 rF1b/KRIbozfwbqnzhIYzHGOKt+fWBVGld/pvoH6fp8b10Qo5XDWp+IzPhbC47SBkBb1
 Iy5Ol6OehOjpQia0t3Xiyb44khVrlSdd4NOX8ZWc2m+nmHhCSphGVYiG9MFNQTiuyUzm
 s58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HQ90mztC1vuOGxNS7Ai4ZfdgDT2MdRYP9F+o58e2pzE=;
 b=bVm1or5I6ZxVdpNlrKDOmpuKO1MWQawejCK1DYdQwLr1YSzyI2Mo3tpUUo7qlhmPTd
 S/q+13kPnBlK/S6I2jBIBpUYlOL6s5Rrz6JHryRwqgC9UJAhnagw++038yTj5z3j03xE
 +oxfT/bgdtbFiZkV1iA6uMqwrycNA+3EhmnnN8tIecTMhry9uxEiE3keSvwHh+a/vMcd
 V/3u7t8Y3C7bzg5lUcEpqqL7ivc6Fb5XZID2XydOBa1glYbHWEAqTi0nq/NtXAMHqX+9
 0LsWVKL4GklxGi979QqT1vFCNcvZyr8Zh4/p//1SY690dWEeNxVSAFQV8bCnmNEovNIE
 h9AA==
X-Gm-Message-State: AGi0Pua8Vbgs5rt4V3Fhlc8Qfp/c5RtYNoWKhSThHpeTp7Y5YdXAgXoN
 OWERqAnUwoV5ex65KePiW26b3uzcJ1k=
X-Google-Smtp-Source: APiQypKNTsHKDdE/7Z17fFAPo2imou6NsCy/9nVSiUE3k9wxvc0yjhq+lPxFiJPiJe9Mb5Za3uAm6g==
X-Received: by 2002:a9d:412:: with SMTP id 18mr5990494otc.233.1588381313074;
 Fri, 01 May 2020 18:01:53 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 4sm1267512oog.3.2020.05.01.18.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 18:01:52 -0700 (PDT)
Subject: Re: Public security scan tools
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <f2354e18-681e-9b66-6515-33a66c81c5bf@linux.ibm.com>
 <e79a11e6-b461-1982-12e4-16c9d5ba6740@linux.ibm.com>
 <a66ab604-eed3-159c-3ba4-5cd353662e8f@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <09adf511-438b-a4a1-ae15-4c0f891823ed@gmail.com>
Date: Fri, 1 May 2020 20:01:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a66ab604-eed3-159c-3ba4-5cd353662e8f@linux.ibm.com>
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

On 4/30/20 3:28 PM, Joseph Reynolds wrote:
> On 4/30/20 3:05 PM, Joseph Reynolds wrote:
>> On 4/28/20 11:12 AM, Joseph Reynolds wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting 
>>> scheduled for this Wednesday April 29 at 10:00am PDT.
>>
> ...snip...
>>>
>> Item 8 added during the meeting:
>> 8. How do we run dynamic scan tools that are privately licensed and 
>> the output of which is copyrighted which means it cannot be shared 
>> with the OpenBMC community?
>> We shared our current practices which does allow pushing the fixes 
>> back into the project.  TODO: Joseph will document this practice and 
>> add it to the security working group wiki.
>> The we discussed if we can use tools because we are a Linux function 
>> project.   TODO: Joseph to followup with Kurt.
>>
>> - Joseph
> 
> Kurt (as OpenBMC Community Manager),
> 
> Does being a Linux Foundation Project help?  Can we get access to 
> security scan tools that normally require a license to use?
> See 
> https://github.com/openbmc/openbmc/wiki/Security-working-group#using-dynamic-security-scan-tools 

Next time, please address me specifically on the email, it is purely 
coincidence that I actually saw this message  :)

No, we do not automatically get access to any LF services except what is 
already called out in our charter. :-( It never hurts to ask, maybe it 
will be free?

If not, I would recommend that the individual companies that use these 
services as a part of their product testing, would hopefully push any 
security fixes upstream.

  - Kurt Taylor (krtaylor)


> Is there some way we can open up the process of dynamic scan testing to 
> the community?  What are the best practices?
> 
> - Joseph
> 

