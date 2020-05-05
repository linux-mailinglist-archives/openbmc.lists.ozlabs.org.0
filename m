Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 818371C4E71
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 08:43:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GVYC4rFRzDqWm
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 16:43:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c3uyjVQD; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GVXT613DzDqSv
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 16:42:49 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d184so425724pfd.4
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=b6IRI7eUlk9xw5/HLzgCDMsDSEHbpxpByn4FFC9rdrw=;
 b=c3uyjVQDbwugWHY5Gke6yJxX/smtboJXa8Shnfgd8KPFi4kIGaJjnbwVk9Qz3O1ZWV
 0UyNZMTDQ7A65+iUD76Bo+z3Ji55HzURvqz2T+XMo5ALXUs2t7eS2Nwzd0/AngvNatFJ
 WQBsBqRZDGfkEM0NWja6UXxPPPxj2xN5eV2x07nftZeLEjXPstqOiNJpjilRvJ0I0ZKN
 1yn29jE4ijkxpJ717UYzdn/9EYjOO0MlJkIWiuBiBEp4vFuZbjqeFnKi2FyTchIp5r5I
 0YAKVpVL0ooSHU4VJbKUQ8TDYm+3nGghiD5GLqjS/4NUcdF6LTVN5c2UDhSu2j9UDwxt
 +piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b6IRI7eUlk9xw5/HLzgCDMsDSEHbpxpByn4FFC9rdrw=;
 b=JWVQ3Q7GD3v8XXFJ8jna00ZDQmI00FDNtU6AkZz3juWwPQ7vaQAc7ZOaI5fTKgtBt0
 9sEj+EsPCm90Ns9tmHBT7HM0MYySxeS7bkswtzLE2ueKH/pfkCoTXbkSFKu5XLZFMK+c
 SmQbM8hBtfPUkj+1XuX2gwwlVvU7Yt+M7UahkMfgtL188z4ImJJUneyvfE7qfXvKtKOC
 CI81YJDhTITLh5sw7P/1mIp0otpo0oyUd1V26LblBs11wnCpWjytJnpbYUgmexMNADMw
 pATg8nK5pGQXbJ1ke+72KAQJKPpMC5YDbJSyqHBzb23STI/Z35w0zdMgqYuXSZXpk8hC
 R9+Q==
X-Gm-Message-State: AGi0Pua/Rsu8wr9CxzRleKA+WqEpY1VY3cRgmTciOJ4oATN9CvDpEvBA
 RE27fsr255ePF9KdB8qlptQsc2uuKmGZ5A==
X-Google-Smtp-Source: APiQypK+UymEvpQ94YtT61Ofi2S4aIEfHxLiozKYBe7dTonO1qruJeiodoGG2eFo6dih0TG/LvuYVA==
X-Received: by 2002:a63:7214:: with SMTP id n20mr1744179pgc.437.1588660964193; 
 Mon, 04 May 2020 23:42:44 -0700 (PDT)
Received: from ?IPv6:2405:204:52a5:be69:7cff:3b37:b36a:493c?
 ([2405:204:52a5:be69:7cff:3b37:b36a:493c])
 by smtp.gmail.com with ESMTPSA id r21sm917783pjo.2.2020.05.04.23.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 23:42:43 -0700 (PDT)
Subject: Re: Storing host data on the BMC
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, patrick@stwcx.xyz,
 dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com,
 openbmc <openbmc@lists.ozlabs.org>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
Date: Tue, 5 May 2020 12:12:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
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

Hi Deepak,

As mentioned , the Origin is the property which will be set by the host 
once the IP address is applied to its interface. Its a read-only 
property for the out-of-band user. But its a closely coupled - related 
attribute on the host setting/BIOS object.

I am looking for the opinion on the two approaches proposed ; so that we 
can handle these kind of scenarios.

Thanks & regards,
Sunitha


On 04-05-2020 21:26, Deepak Kodihalli wrote:
> On 04/05/20 8:22 pm, Sunitha Harish wrote:
>> Hi,
>>
>> We have some user defined host settings which we are presently 
>> keeping it in phosphor-settings-manager and the associated pldm bios 
>> attributes are there in the pldm BIOS table. Few properties in the 
>> object hosted by the phosphor-settings-manager are read-only for out 
>> of band but through in-band it can be changed.
>>
>> For example; the IP origin (static/dhcp) in the below commit.
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/
>
> Is the Origin property here a host setting/BIOS attribute? I don't 
> believe it is. From a PLDM perspective, this is a sensor that the host 
> can update and notify the BMC via an event, for eg. Even if you make 
> it read-only, it is not a setting for the host firmware - which is 
> what BIOS attributes are meant for.
>
> Thanks,
> Deepak
