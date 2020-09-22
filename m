Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DF274790
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 19:36:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwpQD3TpTzDqVq
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 03:36:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZNV/aY5/; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwpPK2c4rzDqN8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 03:35:47 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id x14so21918946oic.9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VOJn7Ml0/XojSpUFaJFp7KdYeaDly+xBmZ8CqptFXfA=;
 b=ZNV/aY5/q8eEK/rh54dJuUWpEszkWSa4bAqqKsFTZsh5R95pJeWTMwv/KorHzuXoN4
 niFBn6XQtUDGPWCI1x1aL4n2wDuBbuDfzJTiV0NNFfzBl4wC+2ZJ6EluNGcw0UwezASz
 zRemJP2/sYJ4DVHOpOkUp3yCOWzWMFCRZljztVqQP746B/lvBi2aEVZgGe8OORQE7Exs
 fLJFVWjyM9w5VuTzuWV3Ra19RrwvmdM14w/RyBUjtDCc1beMevcPW9lq5xH0LuXqLSy2
 TB061ly8MLQS9LflJgoIN/0j5JQWOBBEjhdAWrAccHkOSVt81WmZqwN0f/m/Vt7VTLUN
 eUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VOJn7Ml0/XojSpUFaJFp7KdYeaDly+xBmZ8CqptFXfA=;
 b=RMVFuiAk6PwuYS03OxscvC2waAjAjN6H42T7E/x2bcKSTXu8u0Cal/MRFVZb3q0hYB
 gS4OH+4SJJeJBp7HyP7evx7ja7BkcmDnmCKKYgVMENvtVqBlPSxlXQGMTZOm0I302WXW
 lPtBL8BykH/hG0I8gxc98q4EBXbM/n//JOLH6fsE/9NaYHW6UI5RIw0IKFb8GwifmYrp
 nozqKy1gc1S8rLdckaCYGJbKJYrxu07fgAzyM51ABqcLl1b1PwH48SWrGxBLPc+5G6vH
 Iw47wZ26B5uaJyl+wZwnxIrLOVIb5fMAk9zZsz5VLNCvs0Y1/QByJ4GEWCf08uuI5QYX
 w2VA==
X-Gm-Message-State: AOAM532abm4ajLTvqHxcXT5qm2xSZ23rufuAT2MbMX4A897EnpoQ0MKB
 y2IH/rfaoW+nwlFLdw6nXf5J5KR9tfbRwA==
X-Google-Smtp-Source: ABdhPJxyw01Dt74Yhpdc3+0pNAwdBGmcaY7Bf/qKFScGg1/rOKPnWF1qlje2dy/Awvwe8V7YYFx4Cw==
X-Received: by 2002:a05:6808:6c8:: with SMTP id
 m8mr3448121oih.142.1600796141996; 
 Tue, 22 Sep 2020 10:35:41 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id u2sm7619393oig.48.2020.09.22.10.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 10:35:41 -0700 (PDT)
Subject: Re: Mailing list archive on lore.kernel.org/openbmc
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
 <CACPK8XczcDAiuTK7FhazysaN=Sotd5BEJSdJ5wAEUOK_h_5wMA@mail.gmail.com>
 <CACPK8XdWozzt=n2tpyqnncTSGSjRxnNpnb_Sa_z4rjS2A=NNEw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <f3d5a1ed-40b0-ae2e-769c-843ba5fce670@gmail.com>
Date: Tue, 22 Sep 2020 12:35:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdWozzt=n2tpyqnncTSGSjRxnNpnb_Sa_z4rjS2A=NNEw@mail.gmail.com>
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

On 9/22/20 1:01 AM, Joel Stanley wrote:
> On Fri, 11 Sep 2020 at 03:47, Joel Stanley <joel@jms.id.au> wrote:
>>> Maybe we should set up a public-inbox instance?
>>>
>>> https://public-inbox.org/README.html
>>>
>>> lore.openbmc.org?
>>
>> I was thinking about this the other day. Given qemu is hosted on
>> lore.kernel.org, I think we could do the same.
>>
>> I'll contact the lore-man about it.
> 
> We now have the openbmc list archived at
> https://lore.kernel.org/openbmc. This contains all of the history, and
> will receive all future email.

Thanks Joel!

Kurt Taylor (krtaylor)

> Have a read about lore to learn about the features it offers. Most
> importantly, it has a super fast web interface for searching.
> 
>   https://www.kernel.org/lore.html
> 
> Cheers,
> 
> Joel
> 

