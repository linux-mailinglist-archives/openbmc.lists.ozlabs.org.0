Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A880B63F9
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 15:02:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YKrs2gYBzF4SY
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 23:02:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPvL7XZ6"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YKqV4Fx9zF4RX
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 23:01:23 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id w6so5832957oie.11
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h9X5QtDFygyTkQIe5SH4PQlKQvEg03oIM8ONBSUChaM=;
 b=HPvL7XZ6eQgSaUnEa1WjhBwg1UcNeW6gp+JX+HJg5uvQsptlD/Eh51qg8+9N4MS/GR
 fn83vrvBDdZeATx4rQuPUtO7b8X4cN62c6VOUpUkqrso2tXLhmatvq6hZuuiuduBpom4
 KLM31V1o3PAs4XoZhTaMIXaOelIrjVgUPbi1uM5lFP+FGJzeZc50fwPbdZKm+8Ex/Ac/
 1yf3zmlOMi7Jyb9YooCQXy1FCEYb3Dxmm7ZbX4fxyMJgIPqQatC77X8e5oEJqYnoXGAZ
 KFrNRJvoPJrUXgBDvo+DNmTgvYICdHV0AKQwIEaoW9WY3tTqUvaFC1hz7gwINYoCghRX
 LeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h9X5QtDFygyTkQIe5SH4PQlKQvEg03oIM8ONBSUChaM=;
 b=lAFHblyTydyoYsQvXzCazWgIo/0S0SYB695DN2MZ4vR76hZ580TPyXSj/vCSWDIrbq
 wXTrJUGZtlFaL8Y1/KwgRC5w3chS6rGn5ID26UaL56y4tOuzmh+M5l4ovlgEfjnmWMjd
 Kvw7NP+sHzKcg2prDDHEgUb/3Cl4s1rU66x/rpkN/PDYKHp9BweZnmoIJ31AzIRx9Eoz
 CS7OJAYrz3zx+kgcnJlL30XEHc0TryC8JAqtN+X3RRzRU6qbad6jGDPMKhX7NyJ5xfjU
 dLU0FjMSloyX3L8GwNI9H82rkfAUDABqdpF+iIsiuZvXcwOWCLgWbFq9kXivjVyCE3C0
 dQmA==
X-Gm-Message-State: APjAAAVirBw8krsrjk9tORYkZ/7QRsbmkYfXqvRBqKRaK/umfn+L2+ph
 OmnzF/1USRCuR/t5lUiQ3aF3l0UNIDkftIcztC0=
X-Google-Smtp-Source: APXvYqxSeo9FJDDFYvRcL9zBJUDi7BY59SSqygoz5/eHkIUTlofMdRsqyiiodxMwO0FkF3pBDXGZcOa6RblB2d0xSUo=
X-Received: by 2002:aca:ed15:: with SMTP id l21mr2137276oih.158.1568811680215; 
 Wed, 18 Sep 2019 06:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
 <e9f88063-77e0-42e4-b63d-92d5b8d8c299@www.fastmail.com>
In-Reply-To: <e9f88063-77e0-42e4-b63d-92d5b8d8c299@www.fastmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 18 Sep 2019 08:01:04 -0500
Message-ID: <CALLMt=r15qn+kFJdTWpbAzorjr+kfBoyz2mOJ3QsTwrfJKDUhw@mail.gmail.com>
Subject: Re: BitBake Apache License and Packaging for OpenBMC Components
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Andrew Geissler <andrewg@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 6:59 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> > (5) How should I handle being in a subdirectory of a repository? The
> > code I=E2=80=99m checking in will go into openbmc-tools. How does that =
work for
> > CI?
>
> There isn't any CI for openbmc-tools at the moment, as it was originally
> intended as a collection of quick hacks that made people's lives easier
> without any particular guarantees. This was done to lower the bar for
> entry and get people contributing their scripts.
>
> CI is probably something we need to think about though, so I've added
> Andrew G in To/Cc:

I know for openbmc-build-scripts I did eventually make a jenkins job
that does basic validation of the scripts it can (building docker container=
s).
We were getting some regressions which were breaking our CI so this was
a quick way to make sure the docker containers at least built when the
scripts were updated.

We could do something similar with this repo, even if it's just running --h=
elp
of the tools to ensure they execute. We could get more complex and
connect them up to a QEMU session running openbmc to validate
more. I don't have any bandwidth to do much here though so someone
else would need to drive it.

Would we want a run-ci.sh in each subdirectory where a tool owner
could configure it to setup their env and run their tests? Most of the
tools are python, is there a python CI framework we should look at?
Maybe easier to have a master script from the root dir that runs all
CI for all tools? Just throwing some thoughts out.

Andrew


>
> Cheers,
>
> Andrew
