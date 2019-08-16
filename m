Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536790938
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 22:13:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469Dyj4NygzDrgC
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 06:13:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P3lLxgb+"; 
 dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469Dy60r4xzDrRH
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 06:12:29 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id m24so10621887otp.12
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h2lslwlZV5MofC3DBNqZ+Ae4QKkct/U71srsbqTxJI8=;
 b=P3lLxgb+Ndt95lVIRV0zXwaHLDj3l4ljBHjsK1Xjx6zCAeyL45QYY0ytzubXB4cTVn
 HHlhtMsxTg1ygAGO9cErVFy5PE9sjWN4V/WAHkARI0gf4X+/HPqJGNFC2p2F/79VUzzP
 I18+2jAvBorBAPW/m1bikJ5kWS0ZfhdWJ5BEeMyQXCWV6fn+F6itQTmgwwWWQOEFcMmr
 0BqWGnXE6N1IADFtPZ3YnmnAxR3xeA6Lh6bAinx/8KaBzs4oVPGLhm+HAwKZtdG3W76G
 I96SFSgpj4LThy48HT+U/P9VVwcdHvpNV6QOWXnOuTDXnBJ2dCQ4AvFYUQbDsJHgeQRJ
 dNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h2lslwlZV5MofC3DBNqZ+Ae4QKkct/U71srsbqTxJI8=;
 b=Sh6/FmBXLw0GtzlVxXZHaoJBlqs+inL/kVNuCdVih3vNCRbqwN51zdREuDPSP5IffG
 a8AkvMqFvm1CMXqm97+0kVnhgGN1uesKhqaDnoCNa/vimGKmNtkAXOGbP+xh1tJvhJjG
 QvMs8QAv89HffCN2FYOInpoqagEhvv/MJTpqDMvhai8TVlW51Mq48uayT94hMpNsaKfP
 a54WXjWIkTW1ERCgrHLnsRs2OtZSYpewEJ1gsGU82cVv2OiZ2wBVQisnD48C7fjg5TDu
 ol0tGLBfrz6Uk6hIomHjYSgPIB/EO3swembA8aD6+rOPxD7q9AmRohFn7jjr8BtnGz7q
 ZpUQ==
X-Gm-Message-State: APjAAAULIoIcmYI/MMzaWiedRFqMC2a17v9MwGZvijHp6K9pH9/padXw
 qzvADHXExwJsU2G3sMJT9ZscJWDUs95NYe93ZDjKfu13
X-Google-Smtp-Source: APXvYqy6G7qncKX0Bg5dZC+6TMJzKcb19xHVCRgFUCR51eqgJ0g6LyHQ0SZNol6tQFiRlgMlm61vBcoA8fRshdcmUPg=
X-Received: by 2002:a05:6830:15c5:: with SMTP id
 j5mr9044717otr.296.1565986346191; 
 Fri, 16 Aug 2019 13:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.545.1565898074.372.openbmc@lists.ozlabs.org>
 <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
In-Reply-To: <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 16 Aug 2019 15:12:10 -0500
Message-ID: <CALLMt=rKLg0+i=+b-Nr=+Evf6cJvSWA6qnwrpPLO1jUzKyA=Bg@mail.gmail.com>
Subject: Re: Policy on Tools Posting
To: Wilfred Smith <wilfredsmith@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 4:57 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> My manager (Sai) is asking whether there is precedence for having utiliti=
es posted outside the OpenBMC repository. Do we want 100 OpenBMC tools repo=
sitories, each managed differently or 1 harmonized repository?

We do bring in some tools, like for our openpower systems we bring in a pdb=
g
tool[1]. That tool isn't really specific to OpenBMC though, just a
useful tool that
works within OpenBMC.

The spirit behind creating https://github.com/openbmc/openbmc-tools was to
not have a bunch of the same tools being written by a bunch of different
people. So far it's only been tools run outside of OpenBMC though. I know
AndrewJ mentioned he may be open to using that repo for what's proposed her=
e.
It seems like a better fit then making some other tools repo. To me that's =
just
confusing when you go to a github project and see multiple repositories wit=
h
"tools" in the name.

[1]: https://github.com/openbmc/openbmc/blob/master/meta-openpower/recipes-=
bsp/pdbg/pdbg_2.2.bb

> Separately, is there any effort to create a =E2=80=9Ccommon core=E2=80=9D=
 for OpenBMC such that an effort akin to POSIX or the Single UNIX Specifica=
tion isn=E2=80=99t needed ten years from now? Without standard API (or at l=
east abstracted tools) for things like where FRU information is located or =
sending IPMB commands, isn=E2=80=99t the market for innovative software sti=
fled (Android software market vs iOS, or even Linux vs Windows)?

Our focus so far has been on standardizing our external interfaces,
i.e. Redfish/IPMI.
There has not been much focus on the internals (i.e. ssh) because it's a lo=
t
of work to version and standardize something and it's not something people
buying OpenBMC machines are very interested in. I think wrapper tools are o=
ur
best bet but there's been a lot of back and forth on that as well.

> Wilfred
>
