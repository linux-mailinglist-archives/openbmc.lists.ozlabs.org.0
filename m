Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08C1DCB73
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 12:53:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SRLX3N7RzDqml
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 20:53:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D/zABjaP; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SRKq1CKpzDqCK
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 20:52:59 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id j21so2990927pgb.7
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oXJlooMWHN+BMfvR8mPJSP5a8FbDduhXiFI4eZxVUK8=;
 b=D/zABjaPmQxrjxWEvA07wLVTds/KuCaqvfeznJ0fNNcgft2pg+HDmlabu8RkaGdGWi
 PeSBbX6uJSm+uCmvQjN7IkogQ7cx44E1/R5Om6+jXKMTLpeo+YvkxxOvj9r6ogiXce8H
 Uo77a1iJd3NYRsBwNeaYACTTXjESX0Yv7Sa6tVDqO7TCy99jClh5wlqkajmcZL5Diah/
 ou+S+MedSq3Jdhe4CKds9ZUzpSgCRdC3tQemHjbIxXVCVoA9TpuhkX+npqwuUVhodjtq
 jqDPrBS5F87C0tuJSH0c1VQLYqrtdyw4PSZASlxl9Hb/T9BK1latS+odnTQoqrRPj63M
 UDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oXJlooMWHN+BMfvR8mPJSP5a8FbDduhXiFI4eZxVUK8=;
 b=MS93d+qBPCOwJs620S1SimP7FGs8gVeyV4biojqjQYRbSjapGePDgkaB9qLypInzym
 8FWlK4qwuSCsp+xquFqsKcn+yKo78o3vEv+WEgct4AZbBNcQ1jifl3gHvqYwbOlbQlNA
 33V0OmqI+SxZzyxYOo3m0SRub5jr0XXwxF/OLaRaGSkNHBDq59xNNyYmGjoszilZfYoy
 UBlSqlVngzyftVnR4Q92g9WlfJQbSaRtpzFBi8T2jOWVtMeTuqzCQ3Re5XC4lLLO++H8
 +TAPFwpzIDjfcFnumQssIbxjoJ3jSLwMosinbT48Y5lcOF0g/dYoK6gUFg8tUuNtH/sp
 9OJQ==
X-Gm-Message-State: AOAM530tCA4Gf8XAXuY1mLTNPquK8jcosiTmCg35tflRSqPLAnAFAu05
 sg63KtJ1eQwZ8bHpjal+VGZFe4tlqag=
X-Google-Smtp-Source: ABdhPJxpuyS7H9MLk2aXBj/MHRoZOkA0Sr7NssTL1mtqwuaRC+FLS3fpF4+6I6N/da7AKQJYMrGv3w==
X-Received: by 2002:a65:608c:: with SMTP id t12mr8579353pgu.46.1590058375980; 
 Thu, 21 May 2020 03:52:55 -0700 (PDT)
Received: from [192.168.1.6] ([49.205.222.75])
 by smtp.gmail.com with ESMTPSA id m14sm3911270pgt.6.2020.05.21.03.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 03:52:55 -0700 (PDT)
Subject: Re: Implement a tool of flashing EEPROM to update the VPD data
To: Andy_YF_Wang@wistron.com, openbmc@lists.ozlabs.org
References: <514e63dbddb94bfeacd1705fd98420b6@wistron.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <11774881-bae0-16b5-eb01-f82cba9eb9cd@gmail.com>
Date: Thu, 21 May 2020 16:22:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <514e63dbddb94bfeacd1705fd98420b6@wistron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: andrewg@us.ibm.com, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On 5/21/20 3:40 PM, Andy_YF_Wang@wistron.com wrote:
>
> Hello everyone,
>
> I plan to implement a tool of flashing EEPROM to update the VPD 
> data(MAC, BMC's PartNumber, BMC's SerialNumber and BMC's PrettyName) 
> recently.
>
> Then I didn’t find a similar tool or module on the existing 
> respository of openbmc.
>
> So can I create a new respository to implement this tool?
>
> Or does anyone have any other better comments or suggestions?
>
Which VPD format are you interested in updating? Assuming you are using 
the OpenPower VPD format,
there is a tool being implemented in the series of patches here:
https://gerrit.openbmc-project.xyz/c/openbmc/openpower-vpd-parser/+/30239
That can currently handle OpenPower and IBM format VPD and relies on the 
VPD being represented as
D-Bus objects, but we'd be happy to see that getting extended to just 
doing EEPROM writes.
--
Santosh
>
> Thanks!
>
> Andy YF Wang
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>
> *This email contains confidential or legally privileged information 
> and is for the sole use of its intended recipient. *
>
> *Any unauthorized review, use, copying or distribution of this email 
> or the content of this email is strictly prohibited.*
>
> *If you are not the intended recipient, you may reply to the sender 
> and should delete this e-mail immediately.*
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>
