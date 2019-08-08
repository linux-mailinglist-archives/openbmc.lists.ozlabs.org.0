Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C748580E
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 04:19:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463sWk2nBtzDqVJ
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 12:19:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UUAf8wJr"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463sW82fwhzDqS5
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 12:18:59 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id d17so112599231oth.5
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DGCj3kNAYdLSKxjlM/RH78WLYmNeClMgz3mSVuw6W9Y=;
 b=UUAf8wJrVBDo3qnrlSawKN05qdAO6h+OaJH+gzAZGOEaIy/hmXa4mtggFEDAw0at/+
 5Es3baOnTKKAy+R28e3LmxgC18oBRRk7lGSA3ovcGDXnHDcEmkyJuXTzkalXTgCMdtbf
 LNXxNSCc67iOmA9qLDp8Y2hLjHbeizzPXlCCfPWNM6JCm/EHMtmLU9T2WIc+k+JqeMKc
 XhHPGCi02BZ3sbs5xM/LvxVMIe86u4Bqseyrq7CClPXKxjf6Xm+156TbVYwZfsKBZeYJ
 Vplr23bUH7OyXLc6F5AeKqUYEiu/5oPYMype1NdlFBlvq9mav4Ux6XF/6E+Q8CbfaT+t
 AUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DGCj3kNAYdLSKxjlM/RH78WLYmNeClMgz3mSVuw6W9Y=;
 b=MyApfXlqJ56XSm6qYgmYahAAM85lK2JoXkTa//2GCj7f2BEOC7vcuUF2hS0Y5e3Mls
 3QSwe8TNTG8Bs+AEQBh1PYrQt7X7uNmrL0T5HaeusjtY4MI1/Q/XMrsQL6l+UtIMz77f
 +C9EKYo6Bj2VBRWRKNq35R9VE7uCMwQno6SE4ZUjL4PtNMBBYy5NmzDMh1B470FgUT8I
 lbaGPbuT0i7LfOY/ppcn7mwlOfyMJydg2Ml0bHEdhEV0n31pO2o2CbH8VTdAepx3NJTy
 52XoxOta0h8LaWwj99JGMVdD3djdSySGZ8XeB/DpV30VjGVz6hqZkCLaY1u1Fifqoxvz
 Y0lw==
X-Gm-Message-State: APjAAAWBSdfc6uHbvBpgqlc554KcqdQZLvJSFXvgH4hHRQFFXmPLxp8h
 ObVUZDP6tFxzzvVNAwssWaovaGCstWeIehXN/DA=
X-Google-Smtp-Source: APXvYqyzEQOof5pIUw1HlLGUb3Fc5lBr5SpTdP2n3hyIYAaBZqZjIk1yEr+Z0XNrvMbm0JAQioo3qqz8TBODy7EVuQI=
X-Received: by 2002:a6b:4101:: with SMTP id n1mr13139198ioa.138.1565230735325; 
 Wed, 07 Aug 2019 19:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <932AC0A3-C535-4C66-B28B-350ECABBDA5E@fb.com>
 <396fed2a-f2d6-42ea-855b-4a36d4b38868@www.fastmail.com>
 <CAJoAoZnpaumBPz27TUoC8PoeTY8gcPMncHBY_qjXMszGrb8Nmg@mail.gmail.com>
In-Reply-To: <CAJoAoZnpaumBPz27TUoC8PoeTY8gcPMncHBY_qjXMszGrb8Nmg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 8 Aug 2019 10:18:44 +0800
Message-ID: <CAARXrtnV=5a0VuQ5cL6NTWX_6KL60D==mOL7e=JWF0AZx4eyPA@mail.gmail.com>
Subject: Re: Unit Tests, Documentation and Mocks (oh my!)
To: Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I always prefer to run unit test in local build, that being said, run
the unit test without a docker but in an SDK environment.

The basic steps are:
1. Build and install a x86-64 SDK (refer to [cheatsheet.md][1])
2. Setup the SDK environment, typically
   ```
   . /opt/openbmc/oecore-x86_64/environment-setup-core2-64-openbmc-linux
   ```
3. For repos with autotools:
   ```
   ./bootstrap
   ./configure ${CONFIGURE_FLAGS} --enable-oe-sdk
   make check
   ```
4. For repos with meson, I do not have a perfect solution, but there
is an example at
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-psu-code-mgmt/+/24=
155/3
   and then you could:
   ```
   meson -Doe-sdk=3Denabled -Dtests=3Denabled build
   ninja -C build/
   ./build/test/utest
   ```

Unfortunately, the unit test within SDK does not work for all repos.
* Some repos depends on packages that are not installed in SDK;
* Some repos' unit tests fail for unknown (yet) reason in SDK, but run
OK in docker.

I really wish to improve this so the unit test could be done locally
without docker.

[1]: https://github.com/openbmc/docs/blob/master/cheatsheet.md#building-the=
-openbmc-sdk

On Thu, Aug 8, 2019 at 8:21 AM Emily Shaffer <emilyshaffer@google.com> wrot=
e:
>
>
>
> On Wed, Aug 7, 2019 at 5:11 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Wilfred,
>>
>> On Thu, 8 Aug 2019, at 05:16, Wilfred Smith wrote:
>> > Please pardon my ignorance, but I=E2=80=99ve searched and come up empt=
y-handed.
>> > A URL would be greatly appreciated.
>> >
>> > Where are the unit tests,
>>
>> Unit tests sit in the application repositories alongside the code. OpenB=
MC
>> has historically been poor on unit testing, though this is improving.
>
>
> I'll add that phosphor-host-ipmid has documentation on how to run unit te=
sts locally using Docker here:
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/docs/testing.m=
d
>
> This setup likely applies to a few other areas of the project (although I=
 haven't tested it). It's very similar to the continuous integration test s=
uite.
>
>  - Emily
