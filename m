Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F01DDF7A
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 07:45:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SwT04cPbzDqvK
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 15:45:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JyzkdVUg; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SwSC1pMLzDqSv
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:45:14 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id x10so3951572plr.4
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 22:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Z82hdyixHl+TA0hqSxvgmzpoK9dtu3zqF2723zgXs1g=;
 b=JyzkdVUguYFtv3S1ksbKgHkxH5PnRn/HLYmgNdRupHXz4U1qQE6pGAlj34b+ysRY9w
 ahds/QMQVezDKWHF5J/eh01EKLO/ZGkrQCf3IDqFP2KikCn92ACv/YGtoZdPqcqKnJSA
 NykNIWfqomMkcwhTOJ5CBS9RWnLdz6VZiMYmeVV29GpsPJZ5T2coQ08FMdf++k3LXdVm
 GCXLmqfQox67TqJYroAI7/c+BuILXaMml/t38j7BUBHprhyVR5+U1NB/CQ6JzWMyPHca
 Fra6KLzw8ciKZJeySk7SVcoL4mFE9bTVxNfKtAM6+TfJ3HrdUqqCbKp8tFwG5gpr156G
 E1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Z82hdyixHl+TA0hqSxvgmzpoK9dtu3zqF2723zgXs1g=;
 b=TRrmgy0nF2r38gCAWX/e+TU7i1+ETa6px8SiKp8eXULWN8gGlzlpKCbE/XnnWxETz+
 nhxcswdolfY5pG/IYHh9F+Q1hFFa0eiGxvpVR2iciASsEcnh/ZUpBegTCbetn3qifUoV
 rc93L292VsqsIlKmpDWiyFtKTQfZZX4CeRGt2QB8zTOu4exS7ECc61s48s7v6UXzzRkv
 Mnm3vruu4kUJf6lLDYstAz8KnrxCEZJDpe2PCshbr+VVnWTGILqCQZDXy4U2OIHwztE6
 deW4+TGRguPXQ0VclanQaUI+STkwUagB7O27Qw7y7y974Fq0i7Ny5hzZuGAvQNxv7gry
 n1iQ==
X-Gm-Message-State: AOAM5314KXgkLCowJzEn7oQLj4h+e4pyBUGDJ+XFDp/NXeA3PXqVEiOc
 mnDRrBMc7nhCkxb9BrmDDr/tTUx0
X-Google-Smtp-Source: ABdhPJy2WKK8TjwbPvPJl8veSBs1bodR/CdQkSDpRqqapixXSiKHDxAkqAiy8cpPG7892RMMFjTGnA==
X-Received: by 2002:a17:902:aa8c:: with SMTP id
 d12mr12955077plr.265.1590126310592; 
 Thu, 21 May 2020 22:45:10 -0700 (PDT)
Received: from ?IPv6:2409:4071:e12:ff20:80b:9988:5778:c978?
 ([2409:4071:e12:ff20:80b:9988:5778:c978])
 by smtp.gmail.com with ESMTPSA id d124sm5803920pfa.98.2020.05.21.22.45.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 22:45:10 -0700 (PDT)
Subject: Re: Introducing IBM OEM for Redfish
From: Sunitha Harish <sunithaharish04@gmail.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <477b1d3a-214f-0e25-2062-c2f69f06279f@gmail.com>
Message-ID: <14e7b911-1574-f0cd-ad1e-da6468e9271f@gmail.com>
Date: Fri, 22 May 2020 11:15:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <477b1d3a-214f-0e25-2062-c2f69f06279f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<<updated the title>>

The intent is to add the Oem-IBM at the redfish interface schema.

Thanks & regards,
Sunitha


On 22-05-2020 11:02, Sunitha Harish wrote:
> Hi,
>
> IBM's management console has some requirements , which are only 
> specific to IBM. For these, we will need to add some OEM parameters. 
> These usecases IBM specific. Since these are not in the interest of 
> the community , we are planning to introduce the "Oem-IBM" - similar 
> to the "Oem-OpenBMC".
>
> Any feedback is welcome.
>
> Thanks & regards,
> Sunitha
>
>
