Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1107ADD93
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 18:54:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RvQp3sJHzDqNB
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 02:54:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I+ptTIfU"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RvPz3CgczDqMG
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 02:53:57 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 4so8122261pgm.12
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LIXRLFX11EuX2k/EwINPohfMXimYQCiUmDi3czs+6y8=;
 b=I+ptTIfUiQQiBV2PGAt/8aVeTwM8UfJ2bs3qi+JXUAa6iv3vvXTqlFwaakrkuNNgUs
 Gz0OewRZ/ruaLJVAIrvZM4R+YgDxSDMS6k19laVUkN+h+ZNvFP3lkNAbHlrWqiyyNqGF
 RzDdEXb5yW0DKdvS3DajcdnvawLBaeelOaxpD3WHl0bIfOU3fkFLxRP190+Puz3NCfEJ
 E8wnCv+fHkiwSp4Rnr2bxQYi6cVmEyNaTMF9i3WvIbpBpgiq9ijRFBD3wcPBAQXosrKm
 5YRonb6kytQGKVFbCZVPNNR4CC9Tx2Fl6g+bOQ5QlUaqdLEjwLfFdNT6bXfLQfClv9uD
 sPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LIXRLFX11EuX2k/EwINPohfMXimYQCiUmDi3czs+6y8=;
 b=Q9hwbaXy6Lts4CDP456D1HS2kBryTC2ZVpFPCR7rsWOMbJqHW4sXo71BrMolslRE1y
 2nIvgClaQgPnUR+Kef9sTOQmRwfG/ZG5JlO52G/5bwfaG+K7iPYVZY3Hvq2ffb3D1PbN
 /aZtg1HaqtC4x9h7XSlE7124pVYm5o4E3VxXLUzuj8JAz4JlRjK2DJLWXBLq++4BQjRF
 uDo491YyYuvckaxlUj6uj14eLqXGwC7LJ0FoB0H0rAYI8bCyoX/aecmwDe98D+1/juHO
 Us1S6U0i3WNwAw4I1q0a0d0Ij+ZpgfJXO7a00IiF8Ysk17SmEFgPmoIf4/fD1C+hiYEY
 PAag==
X-Gm-Message-State: APjAAAXkX4pz+cxA3RHfXHwSIvwGYa9SQJaoC+QuG6hppoSDYKOPrhr1
 GPMGj8+NLZUKQeoUStejR1o2cOc1usRCitfrp4YLzw==
X-Google-Smtp-Source: APXvYqwSDm6JxCmxC7umCxvnSJ/LfMr+Vr7AhoYc+Q4R6IERjO+kn5JDifSjyNpzne+XZQ8q4xRTNA4JputNpNCvWJk=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr22302212pgf.353.1568048033510; 
 Mon, 09 Sep 2019 09:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <befd14ce992e47dba06d993e04cec647@lenovo.com>
 <CABoTLcRrd2sgxa6qN9bQQxyfX4E4fWpX=xmxFVeiksU8sk9tbw@mail.gmail.com>
In-Reply-To: <CABoTLcRrd2sgxa6qN9bQQxyfX4E4fWpX=xmxFVeiksU8sk9tbw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 09:53:42 -0700
Message-ID: <CAO=notzkEnR3xP2GEwWZE+ZNtfVp09bKhi6oeiCT0G_ZuFe26A@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Update over eSPI interface
To: Oskar Senft <osk@google.com>
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Harry Sung1 <hsung1@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft <osk@google.com> wrote:
>
> Hi Harry
>
> What's the behavior on eSPI? I assume you still have the aspeed-lpc-ctrl =
enabled, right?
>
> Thanks
> Oskar.
>
> On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 <hsung1@lenovo.com> wrote:
>>
>> Hi Patrick,
>>
>>
>>
>> I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not support flash ove=
r eSPI yet.
>>
>> May I ask if you have any plans to support flash over eSPI?
>>
>>
>>
>> I have done a simple test about shared memory between host and BMC :
>>
>> The shared memory is work after I set ESPI084 (source address) and ESPI0=
88 (target address) registers.
>>
>> But it has an limitation that only 256 bytes are available on each page =
(4KB).
>>
>>
>> For example, if host address starts to write from 0xFE0B0000 (BMC reserv=
ed enough memory already)
>>
>> Writable area are:
>>
>> 0xFE0B0000 ~ 0xFE0B00FF
>>
>> 0xFE0B1000 ~ 0xFE0B10FF
>>
>> 0xFE0B2000 ~ 0xFE0B20FF
>>
>> 0xFE0B3000 ~ 0xFE0B30FF
>>
>> =E2=80=A6
>>
>> =E2=80=A6
>>
>> =E2=80=A6
>>
>>
>>
>>
>>
>> Thanks,
>> Harry

Harry, currently there's no plan to implement it as I have no method
of testing it,  However, it should prove fairly straightforward to add
another option to the transport mechanism list.  Please let me know if
you run into any blockers.
