Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE61A0C68
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 23:30:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jf716x19zDrFH
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 07:30:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="svXdkNAO"; 
 dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jf620yxTzDrJt
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:30:01 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id s49so1640502edb.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BRFpm431KAhKn/nM/BFACrmqlf8v3r8RqJjstqJXGs=;
 b=svXdkNAO3esJkZo5hrOb/Q08vuTlD0j6070mkw9rI87ZxOSZghAcJRKCvN+0bKOhRb
 7iP9wn3gudbFWeDDwjzQxiGi94wTv/rG1tjWHXhxHSrDDfYBuXaxBFwiK8WvX6hCcMrJ
 mq82whnAoskT4gfSpcI6JK5OfckW1KCbarJk1nWAobuqL4emVugNvsm/+ucul7aiDe6J
 0S2OEdlB91FUXLdR7CW1i6raj2dOYbqdL9AJNEvQsRVVgbNK0gqUDRpMZXI1AJLg6/JW
 Q3YNy93J1LAwT+EFijKY+rJ5hZy66F+Vz1FoDHwp7Hdi9MGc23DElWF73lFAqcTlW6iV
 GAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BRFpm431KAhKn/nM/BFACrmqlf8v3r8RqJjstqJXGs=;
 b=XSAucbP3W9mrzDXd6yRHGTiunASjgjOc3QXfDiEaxC3ynqhVz2KFbDtMzTfwd8T24H
 KMpRkBOzj8YGg53e32N3Lao5PHnDKriwiCssFX9HnOktNedZdWtc2uDr6d5j6P+n5yYK
 FGN71kQshkE1yvOUJxcYx5C398LKjF4yjKJiVA95ODh9M4e814So4WFkoyZN6PkG2GYj
 52r0uRnKWvzzBBTrHFUlbM1u9v7thTbQCIB/CFFWmKSYa54bd9HYS8v+hYcC3ON8ne/a
 yqjZQ35RERyp4qDolfGBUSmh6bARgv20v4oLxEamYWP76IUgn0QAJrDjFRHZlsl/TXP/
 luug==
X-Gm-Message-State: APjAAAVHtgtTqqFdAIw+jmcaoD7/4gg7hmT1gOM7ClYd0LPun+Z7u6Jp
 EDh1Mpm+7yyNWC6wzRjCtsYtn/oNlVdevWQMh14cgoOkycs=
X-Google-Smtp-Source: APXvYqzNvmrD6m7zMliroc9BpCnN5WkDn1UgK6LIZUwyAGGlaIBRmjrBhe4SA6JnFxKFq5RW57+0pLczBc8zQsE5bOU=
X-Received: by 2002:aa7:d80d:: with SMTP id v13mr1102665edq.168.1567027796880; 
 Wed, 28 Aug 2019 14:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
 <CALLMt=rvTV0iUV9hUkXQyMF2yTOBQmfrpjZwqKD2X4LLV11j7A@mail.gmail.com>
In-Reply-To: <CALLMt=rvTV0iUV9hUkXQyMF2yTOBQmfrpjZwqKD2X4LLV11j7A@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 28 Aug 2019 17:29:40 -0400
Message-ID: <CABoTLcSbv4xC0X=5R6pk9vkSG3PFAuO2qHVa72AtqOrSAczZ1g@mail.gmail.com>
Subject: Re: chassis power status seems to not be changed when type command to
 shutdown OS
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000030147d059134174b"
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000030147d059134174b
Content-Type: text/plain; charset="UTF-8"

There's also quite a bit of infrastructure on the OpenBMC side that needs
to be running to be able for the BMC to actually power on / off the host.

Can you power-on / off the host using "ipmitool power on" / "off" from the
BMC? If that works, then the host should be able to do the same.

Oskar.

On Thu, Aug 22, 2019 at 11:47 AM Andrew Geissler <geissonator@gmail.com>
wrote:

> On Thu, Aug 22, 2019 at 5:01 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
> >
> > Hi Team,
> >
> > When I executed command "poweroff" or "shutdown -h" in Host OS, the
> chassis power status seems to not be changed. Is there any package could
> support update power status for this situation?
>
> Sounds like your host is not sending the inband IPMI message to
> the BMC to turn off the chassis once it completes the shutdown?
>
> > Thanks,
> >
> > Andrew
> >
> >
>

--00000000000030147d059134174b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s also quite a bit of infrastructure on the Open=
BMC side that needs to be running to be able for the BMC to actually power =
on / off the host.<div><br></div><div>Can you power-on / off the host using=
 &quot;ipmitool power on&quot; / &quot;off&quot; from the BMC? If that work=
s, then the host should be able to do the same.</div><div><br></div><div>Os=
kar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Aug 22, 2019 at 11:47 AM Andrew Geissler &lt;<a href=3D"m=
ailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 22, 2019 at 5=
:01 AM Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"=
_blank">pengms1@lenovo.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; When I executed command &quot;poweroff&quot; or &quot;shutdown -h&quot=
; in Host OS, the chassis power status seems to not be changed. Is there an=
y package could support update power status for this situation?<br>
<br>
Sounds like your host is not sending the inband IPMI message to<br>
the BMC to turn off the chassis once it completes the shutdown?<br>
<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Andrew<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000030147d059134174b--
