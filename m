Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B685178A
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 16:04:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNAg7tBG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYSRd0619z3d2S
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 02:04:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNAg7tBG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYSR32MZhz30N8
	for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 02:04:14 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-296d667e9b3so1760997a91.3
        for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2024 07:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707750249; x=1708355049; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXpKMq+aU4lcAck4H2mKzA4hw8WYcQYBST7mK2IUTUg=;
        b=TNAg7tBGfqKnE7neUp4Z76K+ihuzZMGNKCz1JWfosCM4LYSh9LPJUVw/XUhzcPA1x9
         ro5CrcoRKvtLVvxObTrxr1CWGF6tuFxgmCytiQ8dgBvDeaDAfGczgV9eBk33ci5TxX21
         WsAb0b97E8Vr1SW5/Qmv5H0WM7WL6YbNRzN2ZBqpZUMzmsWFN7BGBsNHuBxqQTGFwACj
         zcnaleZ7EFs6ZzaGNPLAYtt4Qc9ozdeB1+b8Iyed/07lHuTh9yLR3cYh3qHUMc4axxFe
         6sPiMsqxx8aDHJC8FF3HeFRHEHspDtiYyFApkF9lpVVIwtUBiQlk25OCjM56ErZuEbMg
         Yndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750249; x=1708355049;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXpKMq+aU4lcAck4H2mKzA4hw8WYcQYBST7mK2IUTUg=;
        b=m/19rhjYabeDYXJ8sQvlcQ7qLOCnI4hDo+mWbkLpdq7klxHlFPr2SwMg4It1bk7PW2
         6511N+d/Jw1nK/ORvoLpv4sb6KJkhdpPN9LcPkK7ve0Ymrq/qBZnOUaqDFYcDbBKmvb3
         WK3RmDrwirOalOWO0u542FPzKHCka8MWmam/qQpy22Hw4xJZgEAGFeqhLbQLtgoiDeo6
         2+96ZHjCVteM7aMF7gRzd8VpZrouDdcVYXTDZQ37DV0JeCzHk8VfEQUmR4tZOUuyfhQG
         P4OkbrXJQduf+jx79lYLPXeM7uW2BW1+WAJ/YLy0xqAdfWs/KkCfm0mkdxdkCHnmjHOo
         7XQg==
X-Forwarded-Encrypted: i=1; AJvYcCUVZmt7/z6gvlvdz+I36e+4DOO4dpm3wmiYAslrY1x7Jy1Y5eDaf9FDakqZmOfm7OFxUy1eWm7ddp0sVh18z92QTHaRYwCsUEs=
X-Gm-Message-State: AOJu0YzdzgGXJE0hFS0SQqMgKb1qphMwKYa3kHW1Fgig3TYek8q1rF33
	a5o0upAEuY0Lv056zTh9GAR/ThYBZrpU0z3htybvqsBNr468rPY9
X-Google-Smtp-Source: AGHT+IGFDDvhGvufvcF8e6l3xhUpc1wIduN+JJ/NbOcOUifpZNqEhlIoDgP3ZHEE5DUsq5iVpLCTtA==
X-Received: by 2002:a17:90a:f193:b0:297:22a3:43f5 with SMTP id bv19-20020a17090af19300b0029722a343f5mr2449628pjb.5.1707750249153;
        Mon, 12 Feb 2024 07:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfdaJ4Oxpfr4jZ6hNs7nGYVj3sS+F0hGgbCuAvv/Ki+CjL/R9DPOpUv5ikkgXCd483m0d+ICXI/m3/UzpcHipgDHNWxW9aNTMqWzi5YW6bD6doTZEIDawqMqe2qc1+SOl1MlUGUvE7pabwJMZrsw==
Received: from ?IPV6:2401:4900:4e5a:301b:50f5:b7f7:6e26:e7ca? ([2401:4900:4e5a:301b:50f5:b7f7:6e26:e7ca])
        by smtp.gmail.com with ESMTPSA id md7-20020a17090b23c700b0029082d10fc4sm625713pjb.39.2024.02.12.07.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:04:07 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------2qpkRB3hT2Z0MOxP7tXa8r80"
Message-ID: <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
Date: Mon, 12 Feb 2024 20:34:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: File Manager Service in OpenBMC
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
 <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------2qpkRB3hT2Z0MOxP7tXa8r80
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/02/24 3:45 am, Andrew Jeffery wrote:
> Hi Sunitha,
>
> On Fri, 2024-02-09 at 11:23 +0530, Sunitha Harish wrote:
>> Thank you Andrew for the reply.
>>
>> When IBM manages a single server with multiple management
>> clients(redfish clients), they need to save some server related data
>> (host data) in the form of files at BMC's persistent file system.
>>
> What are the specific use-cases though? It seems that we've jumped
> straight to an implementation detail (persisted files) when it's not
> clear to me *what* it is that's needing to be communicated to begin
> with.

IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads and manages files on the BMC.
These are APIs to Create, Update, Get and Delete a file.
The data which needs to be persisted in the BMC are considerably big enough - that can not be modeled via DBus properties.
Moreover, the data which is stored are meant to be interpreted by the host & the client who is managing the host via this BMC.
So the preferred way of storing this is files.

>>   Here
>> BMC is used as a common persistent storage, which is accessible to all
>> connected redfish clients.
> Okay, but why is that necessary? Can you please enumerate the use-
> cases?
>
> The use-cases are what allows us to find an intersection of interests
> with others in the community.
>
> Discussions in the abstract in the context of a specific implementation
> approach feel to me like they might struggle to gain traction.

This is the primary usecase of IBM. But, if there are any other way of getting this done in a any other way, please suggest and we can work together on that.
With this email, i am actually looking for someone who may have similar usecase of providing the user a facility to manage files at BMC.

>> Additionally, for IBM usecase, BMC need not consume these files, as they
>> are targeted to be used by the host/hypervisor.
>>
> If they're not used by the BMC can you unpack why they need to be
> stored on the BMC?

Customers setup the systems such that, multiple management clients (primary & backup) can manage a single BMC. There will be some host data, which are needed in common to
both the primary and backup management consoles consumption. The best place to persist them is at BMC. Customer need not buy another trusted storage area to save the data.

>
> Andrew
--------------2qpkRB3hT2Z0MOxP7tXa8r80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/02/24 3:45 am, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">Hi Sunitha,

On Fri, 2024-02-09 at 11:23 +0530, Sunitha Harish wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thank you Andrew for the reply.

When IBM manages a single server with multiple management 
clients(redfish clients), they need to save some server related data 
(host data) in the form of files at BMC's persistent file system.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What are the specific use-cases though? It seems that we've jumped
straight to an implementation detail (persisted files) when it's not
clear to me *what* it is that's needing to be communicated to begin
with.
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads and manages files on the BMC. 
These are APIs to Create, Update, Get and Delete a file. 
The data which needs to be persisted in the BMC are considerably big enough - that can not be modeled via DBus properties. 
Moreover, the data which is stored are meant to be interpreted by the host &amp; the client who is managing the host via this BMC. 
So the preferred way of storing this is files. </pre>
    <blockquote type="cite"
cite="mid:eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> Here 
BMC is used as a common persistent storage, which is accessible to all 
connected redfish clients.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Okay, but why is that necessary? Can you please enumerate the use-
cases?

The use-cases are what allows us to find an intersection of interests
with others in the community.

Discussions in the abstract in the context of a specific implementation
approach feel to me like they might struggle to gain traction.
</pre>
    </blockquote>
    <pre>This is the primary usecase of IBM. But, if there are any other way of getting this done in a any other way, please suggest and we can work together on that. 
With this email, i am actually looking for someone who may have similar usecase of providing the user a facility to manage files at BMC.</pre>
    <blockquote type="cite"
cite="mid:eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Additionally, for IBM usecase, BMC need not consume these files, as they 
are targeted to be used by the host/hypervisor. 

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If they're not used by the BMC can you unpack why they need to be
stored on the BMC?</pre>
    </blockquote>
    <pre>Customers setup the systems such that, multiple management clients (primary &amp; backup) can manage a single BMC. There will be some host data, which are needed in common to 
both the primary and backup management consoles consumption. The best place to persist them is at BMC. Customer need not buy another trusted storage area to save the data. 
</pre>
    <blockquote type="cite"
cite="mid:eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">

Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------2qpkRB3hT2Z0MOxP7tXa8r80--
