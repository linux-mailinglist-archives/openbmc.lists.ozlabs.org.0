Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 402DF8005B
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 20:47:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460bjz4by6zDrBy
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 04:47:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sPWfRi5X"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460bj44S0PzDqx9
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 04:46:15 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id k20so1079166ios.10
 for <openbmc@lists.ozlabs.org>; Fri, 02 Aug 2019 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iypsLYzstpvkivs8L6BLvTaowJ/r8XwT+90gnp/yOXI=;
 b=sPWfRi5XXGsf3/CB4qY7+Yy5qSn7CMgQ/0JPtr2IYEaZniHZF+pVj1CWvJuPU7YWem
 QlXFB/QHmvbdNaiFPSzoQDo9owpVzsMIqtf1sF65CGpi7+xBzXQ1R9KvkpnK5OyBG4EH
 MC5VcJXDdNdtEwbulyjCMBF25zXl/2lI6xxLcvLjhdzzHpHbpAS2OrLaXtKISpMxx3P1
 JFGKnq3ZB3Ndxr/cYtByUYSuzEfZ3nvKQaA7ddg1Wjjmko2BdgEJgDeOY+h3y1Gaxj+4
 q1fre6fRFdp5QnZhSQfAaPjcvifW3jSt+frsboCThQT83hhGuB1TVp1mhi6LlpSv7+Ul
 QkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iypsLYzstpvkivs8L6BLvTaowJ/r8XwT+90gnp/yOXI=;
 b=juZoKm/GXfWbGlsfMg1h+sLU3SaWlcpr0/eHMAURn9JChjRu31b2aOFtjiyMgoTRsY
 IE/ZpX2J8RTuMo8qW7Z6HKY4O/zJ7JpPH/ybAGGISag65ffbTLutE/6/E8GKN5qSO9as
 iYO12n0XanAJmfEcgnfhbuKGhxjgvbbBmVJSfacGP6Y3JkMqgwUhhSUA0RbwPbmMM013
 dUZvEmboa8IqfiJK51YbgNUpvYY9q7eU6OJ7c7R0QDm1ZiTChmENVzHkHyX8umt2KQ4d
 LklZYZ5ibcB6LFHsMLtxTsXArJ2IscjRZ1JtPHCxGkyhGpTG6yrOdckPQaIJ/MmKtrDl
 o9EQ==
X-Gm-Message-State: APjAAAUmVkYKTbX49XbF/UzEXgKPMyXtRaGey+PxEPQMy7viXuY3EO53
 ctX3ZSnRI8MpR/zyG9UooYITqkxS
X-Google-Smtp-Source: APXvYqxzELknNL2s+1uG1d03GIHLauya1GwpDEpJXh4QLwrlLVBgESZOvY58XNazWApori3QNoJ48Q==
X-Received: by 2002:a5e:9e0a:: with SMTP id i10mr4214331ioq.44.1564771572548; 
 Fri, 02 Aug 2019 11:46:12 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::32:be])
 by smtp.gmail.com with ESMTPSA id l5sm135901761ioq.83.2019.08.02.11.46.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 11:46:12 -0700 (PDT)
Subject: Re: Signed CCLA from Vertiv
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <MWHPR13MB1360C410A284A04C167D7397EDD90@MWHPR13MB1360.namprd13.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <8ccde7bc-5991-209e-1fd9-3240f6b80cb9@gmail.com>
Date: Fri, 2 Aug 2019 13:46:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <MWHPR13MB1360C410A284A04C167D7397EDD90@MWHPR13MB1360.namprd13.prod.outlook.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/1/19 9:14 PM, Troy.Lee@vertiv.com wrote:
> Hi,
> 
> This is a friendly reminder.
> Please let us know if there is any of information missing.

I guess I missed this because of vacation.

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)

> 
> 
> Thanks,
> Troy Lee
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+troy.lee=vertiv.com@lists.ozlabs.org> On Behalf Of Troy.Lee@vertiv.com
> Sent: Sunday, July 21, 2019 3:18 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: [ExternalEmail] Signed CCLA from Vertiv
> 
> Greetings,
> 
> This is Troy Lee from Vertiv.
> Please find signed CCLA from Vertiv/Avocent attached.
> Please help to accept it.
> 
> Thanks,
> Troy Lee
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are intended solely for the use of the individual or entity to whom they are addressed and may contain confidential and privileged information protected by law. If you received this e-mail in error, any review, use, dissemination, distribution, or copying of the e-mail is strictly prohibited. Please notify the sender immediately by return e-mail and delete all copies from your system.
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are intended solely for the use of the individual or entity to whom they are addressed and may contain confidential and privileged information protected by law. If you received this e-mail in error, any review, use, dissemination, distribution, or copying of the e-mail is strictly prohibited. Please notify the sender immediately by return e-mail and delete all copies from your system.
> 

