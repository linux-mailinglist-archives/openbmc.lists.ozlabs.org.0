Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6A854277
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 06:40:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WH0kxjey;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZRqy5gqdz3cM5
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 16:40:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WH0kxjey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZRqP5BWbz30Dg
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 16:40:16 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e0aa4bb62fso1296147b3a.1
        for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 21:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707889214; x=1708494014; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mafBs6PalViiNAtumgPAbOEcjrK5r6F5Qb4tH7wyAtU=;
        b=WH0kxjeyil8tzJqQuvMPQluhGbutuBlP/mSyKqP+ZMP0Ey8hb3L1oJH8T4p8xaJEEp
         5vNW6cZx3sJaIikKrVUyZEOuJNoNUwF0q5Z+48p9xIfzVCUGaMRavsz5rAohF6J7Wh8T
         Hajvxn/Itw8QMkGSyyKQq8yDrvMExbiydcadu6jeGs14Vq+LtZspSDzHodTLNpShO8/3
         1N3SQryOVTrAxmWtdLiAHukDM0ht5VRheKu+eErgwRkoyBInMNcuLwkOJEJh/nb4hVhV
         /LD3UJaoJOxZ18sObFLzvqWPBHReec2/94W331oqmWxTDyFs3kS5DppiFjlU6xP/iDu+
         K07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707889214; x=1708494014;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mafBs6PalViiNAtumgPAbOEcjrK5r6F5Qb4tH7wyAtU=;
        b=I8fewWqCk4oufUMsyNZ0o/v5H1kGfByPJkr96BKl1luebh1OzTm/F/xizUKRSsENKI
         sVzoxY5KR8gHQ5hojoZUx3ryEri1C3A/OcSX7bZsD06bnkxJ6ECQwnX5HdSnaVHLR7p/
         1Wj9PBo/zd6wSt9xTNvTI6vAzn8by3TMzkcoAGa2G1rmtvA3bAn3IwxAEx6In5niAWjr
         K+PGKZ4oroTbBy/77B2EOxX7BnJ+aaNacDw2zuYeZYBYrfBQsw2JkaFdvGi+hp1IjSLJ
         rt7b9R9K0ANF36joy1MZILHvjP0EzEN1popC1+x80SG0uC6ZoQT3LQvDCudIe65qNplk
         oEWw==
X-Gm-Message-State: AOJu0YyPEGM36bRCoVImpVP/z2WsCWE4il3dDuCZGWVrm0qv6QxEjUhT
	sjCuN9Lnhm1y7iIWpqZUkTtfQpouPVTQA6ne3fRwukSGwPMJj+zCeRgi0E9POos=
X-Google-Smtp-Source: AGHT+IEsfsR42JiLX0HFyvcVg75XqrCDvgHsF9/EayFB2khtDScv7cJzQl0+Zng0KEEsfcax98ikDg==
X-Received: by 2002:aa7:9e86:0:b0:6e0:a025:feb2 with SMTP id p6-20020aa79e86000000b006e0a025feb2mr1409892pfq.11.1707889213497;
        Tue, 13 Feb 2024 21:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM9Mz/NHBpe9xYngmJJKmnYtGGkEvHAJ4c5u0u5SLc2TQFgUdUstiCt2VNKfTsPXpuBN4KfJtUNFVeXws1h/i/bLCxa0DBjbJbopY3nD6gK1IGcp20KXa4AY8ihBkgcw0n9+NU1wGq
Received: from [192.168.0.102] ([106.51.171.185])
        by smtp.gmail.com with ESMTPSA id r12-20020aa79ecc000000b006e10bfd6a88sm399065pfq.69.2024.02.13.21.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 21:40:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LAixv05ugNiDNqrrMOiLq0GS"
Message-ID: <150b6256-3a2c-48dc-a806-186ad5a6b366@gmail.com>
Date: Wed, 14 Feb 2024 11:10:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: File Manager Service in OpenBMC
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net>
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
Cc: gmills@us.ibm.com, openbmc@lists.ozlabs.org, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------LAixv05ugNiDNqrrMOiLq0GS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 13/02/24 8:05 pm, Patrick Williams wrote:
> On Thu, Feb 08, 2024 at 12:52:11PM +0530, Sunitha Harish wrote:
>> This usecase is being re-designed, to stop
>> bmcweb from modifying and accessing BMC file system directly.
> Why?  What motivated this?

This is being worked due to Ed's concern over the bmcweb design of IBM Management console APIs.
We will be removing the current bmcweb implementation and moving towards a dbus app based file
operations to make the design in-line with any other BMC features.

>> To achieve this, a dbus & backend application is needed. This should
>> provide APIs to Create, Update, Get and Delete a file. This application
>> should also take care of security aspects of the File upload usecases,
>> before letting the BMC file system updated. Please share your views on
>> adding this application.
> What are the "security aspects"?  This is a very broad statement and
> feels a bit hand-wavy.

Security aspects include the storage path, size and the directory & file sizes, contents, permissions etc.

> I'm not really sure what views you expected anyone to give.  There are
> basically 2 sentences of details here.  My gut reaction is "this sounds
> like a CVE waiting to happen", but, if you want to write a design
> document proposal go ahead.
>
Agree, this app would allow the file uploads to the BMC. Thus a threat model and validations of the incoming data should be in place.

There is no DMTF schema available to do the file operations.
I have initiated a thread at DMTF athttps://redfishforum.com/thread/1014/file-collection-resource  
Current plan is to retain IBM OEM REST path /ibm/v1; which will invoke the APIs provided by this file manager.

--------------LAixv05ugNiDNqrrMOiLq0GS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13/02/24 8:05 pm, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 08, 2024 at 12:52:11PM +0530, Sunitha Harish wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This usecase is being re-designed, to stop 
bmcweb from modifying and accessing BMC file system directly.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why?  What motivated this?
</pre>
    </blockquote>
    <pre>This is being worked due to Ed's concern over the bmcweb design of IBM Management console APIs.
We will be removing the current bmcweb implementation and moving towards a dbus app based file
operations to make the design in-line with any other BMC features.
</pre>
    <blockquote type="cite"
      cite="mid:Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">To achieve this, a dbus &amp; backend application is needed. This should 
provide APIs to Create, Update, Get and Delete a file. This application 
should also take care of security aspects of the File upload usecases, 
before letting the BMC file system updated. Please share your views on 
adding this application.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What are the "security aspects"?  This is a very broad statement and
feels a bit hand-wavy.
</pre>
    </blockquote>
    <pre>Security aspects include the storage path, size and the directory &amp; file sizes, contents, permissions etc.</pre>
    <blockquote type="cite"
      cite="mid:Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">
I'm not really sure what views you expected anyone to give.  There are
basically 2 sentences of details here.  My gut reaction is "this sounds
like a CVE waiting to happen", but, if you want to write a design
document proposal go ahead.

</pre>
    </blockquote>
    <pre>Agree, this app would allow the file uploads to the BMC. Thus a threat model and validations of the incoming data should be in place.

There is no DMTF schema available to do the file operations.  
I have initiated a thread at DMTF at <a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/1014/file-collection-resource">https://redfishforum.com/thread/1014/file-collection-resource</a> 
Current plan is to retain IBM OEM REST path /ibm/v1; which will invoke the APIs provided by this file manager.

</pre>
  </body>
</html>

--------------LAixv05ugNiDNqrrMOiLq0GS--
