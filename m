Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F31EFFE6
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 20:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49drpZ35nhzDqx5
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 04:32:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bU6AYZ/9; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49drnk5DnKzDqdW
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jun 2020 04:31:22 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id 18so2180826ooy.3
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jun 2020 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SAIpyVr3ugKC7BA/9m2f1VEHfWu398s4nRtOW6qKUTU=;
 b=bU6AYZ/9aEn8cjVk6KsR6hLIkO5sFfoT809Rn4cUcMqNFM6/9Pd0Jvrlc6USfNssLt
 qklkpoXAQRq3LNdLrbuUsSOFcIgc5Fr78oL3AjEdxYUfpB+fem4mWwVmJrvuNx+JqpGN
 W6w6nafCYO0c8j9IAy07caukvFCB8CJciwNnGZQb2TAE7bLfYigDRflTa15ztz3OKZtY
 OQok3zNt6Fhk/LKi3km8DeVJ5M+kVnCW/ez63MytDnAuZLisNF0TTFdFX1CHIWeRwk90
 T4/A58LBttEFJyUES8VrQj/7kidlBUPAMrwQyNBFI33qvNHWXtiAoqIyrtq3tk6ZIjyW
 kfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SAIpyVr3ugKC7BA/9m2f1VEHfWu398s4nRtOW6qKUTU=;
 b=EquxxPMpQ93i5/QbUs+AEr1eVDBR2GXXXTUlRAwtiXy0sZocB3sXMXhzP5iapgFrSS
 KKavtMQaW53pkDkttWGyE8p9uSIAZwQ9SoNajBkqLQvmz3OHKWlWA4I5apaIYy2uRlZZ
 YF6DwKV2/OG8Pevi73nAaUMCcVU5KOloxiF90fn9GHQSCeVne+o77P6irkjyUK7N8wqQ
 +qmiH+5/qyBJHDhIH8xR4T02JEmig6WK4Lly4joWGie2aqijHjiDjd8TzdMRhujEh7mK
 DahTjG17fXNQih4EY8KSz5P9JfWqNm6napZq7f72M1drOGaEtd8+F+4lkJA5LHdlgUf/
 Rqhg==
X-Gm-Message-State: AOAM533vDHIdcOrnDXYd+gXnQnFMdRm4pTjYNken3MB7g16si+SmPZOY
 Kv7BHhseMi4gquZ7F8F93Wu/T9KUB3s=
X-Google-Smtp-Source: ABdhPJxTR8qjPhBC4e8nHREYF5iQsnsJDCQr+S0hpKdpGEGu+iOacg7yLENNI4M9Q9XEJGACYpp9MA==
X-Received: by 2002:a4a:bf14:: with SMTP id r20mr8825296oop.18.1591381878768; 
 Fri, 05 Jun 2020 11:31:18 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id i25sm834124oii.15.2020.06.05.11.31.17
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 11:31:17 -0700 (PDT)
Subject: Re: Hello to OpenBMC Team
To: openbmc@lists.ozlabs.org
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <bc9c9610-2b8d-a239-41c0-f9daf167a444@gmail.com>
Date: Fri, 5 Jun 2020 13:31:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 6/2/20 3:56 PM, Garrett, Mike (HPE Server Firmware) wrote:
> Hello OpenBMC team,
> 
> My name is Mike Garrett and I work with a team at Hewlett Packard 
> Enterprise creating a port of OpenBMC on our server hardware.  We have 
> just signed the CCLA (attached) and uploaded it.  We look forward to 
> working with the OpenBMC community.

Welcome HPE!

I've worked with several great HPE engineers over the years, most 
recently on OpenStack (Bruno with Redfish).

Thanks for uploading your CCLA, it looks fine and saves me having to do 
it. :)

Kurt Taylor (krtaylor)

> 
> To introduce myself, I am a firmware architect in HPE’s compute group 
> with a background in BIOS and BMC firmware.  There will be a few other 
> folks on our team working with me, all with BMC development experience.
> 
> The team has created a port of OpenBMC for our DL360 2-socket 1U rack 
> server that runs in place of our iLO 5 firmware.  This has been shown as 
> a proof of concept at a few venues including most recently the OCP 
> Virtual Summit a couple of weeks ago.  Jean-Marie Verdun has used this 
> proof of concept as the underlying hardware for an Open Source Firmware 
> CI system.  We hope to the upstream the OpenBMC work soon.
> 
> I believe the next request is to ask for team members to be added to the 
> gerrit system?
> 
> Here is our HPE team (at this point):
> 
> Mike Garrett – mike.garrett@hpe.com <mailto:mike.garrett@hpe.com>
> 
> Jorge Cisneros – jorge.cisneros@hpe.com <mailto:jorge.cisneros@hpe.com>
> 
> Gilbert Chen - gilbert.chen@hpe.com <mailto:gilbert.chen@hpe.com>
> 
> John Chung - john.chung@hpe.com <mailto:john.chung@hpe.com>
> 
> Edward Newman - edward.newman@hpe.com <mailto:edward.newman@hpe.com>
> 
> Renee Rodgers - renee.rodgers@hpe.com <mailto:renee.rodgers@hpe.com>
> 
> Jean-Marie Verdun - jean-marie.verdun@hpe.com 
> <mailto:jean-marie.verdun@hpe.com>
> 
> Please let me know if there is anything else needed.
> 
> Regards,
> 
> Mike Garrett
> 

