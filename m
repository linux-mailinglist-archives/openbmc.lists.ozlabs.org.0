Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD485295C
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 07:45:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VRAKAZ7C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYsK341HKz3c6Q
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 17:45:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VRAKAZ7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYsJW17G5z2xTl
	for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 17:44:57 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d7858a469aso25928715ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2024 22:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707806695; x=1708411495; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH3LL9rWYEdMajb/RQNhsGCMbbu8ema0jv1KugOSwp8=;
        b=VRAKAZ7CtnoWEkWoT6jnubPwxz/GrikBZK3mS3G2uS3Xjk3QPpYL3J5vnZI+C7i0ZC
         e2Bg9pbUSeZYn6hIRF2xFI8Y2f/mR3db3e6NhrJjR2C+dyBV039jn64LYbHGmlemp/Gf
         5u2fj7ZjBp/JKEWens+O20LfAHhXqeDJz3nySYI7mIlT/XfiHxCNP0F2uLdMowZISXKO
         A8bghlmWrzH5Uy/b6DR9Vc3HLP5KG//wStWvrk9fGBn3oqKRrFGlKcSGwdx2SdbprOVk
         JiINtmhbF26+8uUQOGW7v1LnkWEs5WK0Fbe2+dTxbwx6OpeQS60Eq+Ej/CRtq+PA+A6o
         yTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707806695; x=1708411495;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lH3LL9rWYEdMajb/RQNhsGCMbbu8ema0jv1KugOSwp8=;
        b=nha7NrJ1d3q9WKkqwyBgtJaR5ZERsJL0XStU6Yi+6YIzvpvRuhKJ/JU3kRHiUpmKMs
         q4j25MtfYu9q/rgtGbF1BZVzW1GaqqRA8UZCnKlGi13PsfFeRSWf08m1XClwnhk6AULn
         HbJlTOmZWfl2x1+QSRMVLY+Fo+EDW8RNRHcNsU5EspMZvqxKStjMFmL6YQXs/wKxNa+n
         6KRxyFT8m5dmUlOZHlm03XuEYHzS3yGfYb4tB/cBMNqhyqFNWx3QNNce9USy4wvuQUS8
         3Rw3hnDtKyBkTdGVibQVLWhkrNUDYF6wFD+x/lW9V8RDlMfH9ueOFFpkdGayh+LuN8Ac
         wPww==
X-Forwarded-Encrypted: i=1; AJvYcCUe6jg4XW+ySTAGBx0Opi8zz0e2Br8ubCy3R2Z1G6OrzbKtdYTVPSVk1RwoUQvgW7a4e/UgGSY4bx2YGWo7JXzgTk49nT2meyw=
X-Gm-Message-State: AOJu0YxcBzGTbneKuHoSfy2/vf2pwdlnICXvgURGyHk95aE9TXHp+U7y
	TJG6dKjtYWxOQ0W1ILbDO4qlwT3PGVsFruTJthAhuHGIWqS4xLWI
X-Google-Smtp-Source: AGHT+IEZ7QyXUSCHD/AiWWf2X+HiweD/tUfjvNLGILzh5wfCL/cPwIpYDfoYNmjq4UQOsiGy22sV4g==
X-Received: by 2002:a17:902:6e10:b0:1d9:855a:3130 with SMTP id u16-20020a1709026e1000b001d9855a3130mr7200104plk.33.1707806694746;
        Mon, 12 Feb 2024 22:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPJBzVxEvVMhGKLFMLgPFDX1uuG/L97WjMnzir8UK3Isomd2HT1H1vzKp6chaI2BhTbbQpVt+dRCDqFcXzsiFXHKspL3IBO9002Rpq2Fw53lFnKYAEsHCB/W9+hrzYjxAo3LILdvK2I/tKbbe9uQ==
Received: from ?IPV6:2620:1f7:3d44:7c48::32:1a6? ([2620:1f7:3d44:7c48::32:1a6])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001da1ecb05f9sm1339981plb.240.2024.02.12.22.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 22:44:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ZeUu0nJkojoXGG2oMQLW0dFZ"
Message-ID: <3862c106-d0c8-4168-bf22-ec9b8fba301a@gmail.com>
Date: Tue, 13 Feb 2024 12:14:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: File Manager Service in OpenBMC
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
 <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
 <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
 <874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au>
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
--------------ZeUu0nJkojoXGG2oMQLW0dFZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 13/02/24 4:06 am, Andrew Jeffery wrote:
> Hi Sunitha,
>
> On Mon, 2024-02-12 at 20:34 +0530, Sunitha Harish wrote:
>> On 12/02/24 3:45 am, Andrew Jeffery wrote:
>>> Hi Sunitha,
>>>
>>> On Fri, 2024-02-09 at 11:23 +0530, Sunitha Harish wrote:
>>>> Thank you Andrew for the reply.
>>>>
>>>> When IBM manages a single server with multiple management
>>>> clients(redfish clients), they need to save some server related data
>>>> (host data) in the form of files at BMC's persistent file system.
>>>>
>>> What are the specific use-cases though? It seems that we've jumped
>>> straight to an implementation detail (persisted files) when it's not
>>> clear to me *what* it is that's needing to be communicated to begin
>>> with.
>> IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads and manages files on the BMC.
>> These are APIs to Create, Update, Get and Delete a file.
> These aren't what I consider use cases though, IMO they're behaviours
> you might need for an implementation of something supporting a use-
> case.
>
> Given you have files, what is their purpose? Why would someone upload
> one? Who is it that's uploading the file? What are they trying to
> achieve? What's their motivation? Can you enumerate those reasons?

I have mentioned the purpose of this usecase already. There is no more details that i can share.

>>> Discussions in the abstract in the context of a specific implementation
>>> approach feel to me like they might struggle to gain traction.
>> This is the primary usecase of IBM.
>>
> But it's not something I'd categorise as a use-case. It's a specific
> implementation strategy for something else, where the something else is
> probably the use-case I'm asking you to describe. Use-cases should
> involve discussions of actors trying to achieve an outcome with a
> system. Who are the actors? What are the outcomes they're trying to
> achieve with the system?
>
>>   But, if there are any other way of getting this done in a any other way, please suggest and we can work together on that.
> I'm unsure, because I don't feel like I have a solid grip on what the
> use-cases are, in terms of what someone would be trying to achieve with
> the system.
>
>> With this email, i am actually looking for someone who may have similar usecase of providing the user a facility to manage files at BMC.
> I'm hoping that by clarifying what your use-cases are it's easier for
> people who may have similar use-cases to identify themselves. It would
> certainly help me be satisfied that re-implementing a filesystem on top
> of DBus is sensible, because on the surface it doesn't feel like it is.

Its not about implementing the file system on the BMC. Its implementing a systemd service, which will host the file descriptors as dbus
interfaces/properties. This will give file handler APIs to the redfish clients who are willing to do file operations on the BMC.

>
> Andrew

Regards,
Sunitha

--------------ZeUu0nJkojoXGG2oMQLW0dFZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Andrew,</pre>
    <div class="moz-cite-prefix">On 13/02/24 4:06 am, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">Hi Sunitha,

On Mon, 2024-02-12 at 20:34 +0530, Sunitha Harish wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12/02/24 3:45 am, Andrew Jeffery wrote:
</pre>
        <blockquote type="cite">
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
          <pre class="moz-quote-pre" wrap="">What are the specific use-cases though? It seems that we've jumped
straight to an implementation detail (persisted files) when it's not
clear to me *what* it is that's needing to be communicated to begin
with.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads and manages files on the BMC.
These are APIs to Create, Update, Get and Delete a file.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
These aren't what I consider use cases though, IMO they're behaviours
you might need for an implementation of something supporting a use-
case.

Given you have files, what is their purpose? Why would someone upload
one? Who is it that's uploading the file? What are they trying to
achieve? What's their motivation? Can you enumerate those reasons?
</pre>
    </blockquote>
    <pre>I have mentioned the purpose of this usecase already. There is no more details that i can share.</pre>
    <blockquote type="cite"
cite="mid:874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Discussions in the abstract in the context of a specific implementation
approach feel to me like they might struggle to gain traction.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This is the primary usecase of IBM.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But it's not something I'd categorise as a use-case. It's a specific
implementation strategy for something else, where the something else is
probably the use-case I'm asking you to describe. Use-cases should
involve discussions of actors trying to achieve an outcome with a
system. Who are the actors? What are the outcomes they're trying to
achieve with the system?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> But, if there are any other way of getting this done in a any other way, please suggest and we can work together on that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm unsure, because I don't feel like I have a solid grip on what the
use-cases are, in terms of what someone would be trying to achieve with
the system.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">With this email, i am actually looking for someone who may have similar usecase of providing the user a facility to manage files at BMC.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm hoping that by clarifying what your use-cases are it's easier for
people who may have similar use-cases to identify themselves. It would
certainly help me be satisfied that re-implementing a filesystem on top
of DBus is sensible, because on the surface it doesn't feel like it is.</pre>
    </blockquote>
    <pre>Its not about implementing the file system on the BMC. Its implementing a systemd service, which will host the file descriptors as dbus 
interfaces/properties. This will give file handler APIs to the redfish clients who are willing to do file operations on the BMC.
</pre>
    <blockquote type="cite"
cite="mid:874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">

Andrew</pre>
    </blockquote>
    <pre>Regards,
Sunitha

</pre>
  </body>
</html>

--------------ZeUu0nJkojoXGG2oMQLW0dFZ--
