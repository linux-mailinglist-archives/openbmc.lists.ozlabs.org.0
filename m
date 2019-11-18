Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34571FFCF8
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 02:56:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GX9c5vpszDqMT
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 12:56:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e/Crjplf"; 
 dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GX8y1BdzzDqSG
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 12:55:28 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id q1so14484232ile.13
 for <openbmc@lists.ozlabs.org>; Sun, 17 Nov 2019 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9WjxIU+ymSPyh1UJh6LZvQ23ogP3P+ZT8xAVzHNWFHk=;
 b=e/CrjplfGg7QZWibEXPOJS2OhVe+Fa5uNQW3MIbZ7aftEwyyK5D4H27P1ppxZZiwz3
 vZBiffyjopJCROTIAhaATps9kDiKRfy0W4e1IqErHLJ8d9gJHxLkUDQQAXLqfTks46C1
 IBodGgQfcNbgaFCUAfs9tWiNoTsmTY/kQNN3vkr93DeFhbv9avjiugiIwNCiTCsCdfWA
 lNFe320aNeNSIpMnqrt3j6ADZweIsGO8dPZatNqRTWMlqjYbX2nWMkYnIivB44h3IbjN
 Z1No1FaJKHnvsfdSu9o7NnyhAs+tFUX2W7p0YC5NykA2vBJtvvS7/Pc9AIkRn8mVDsKO
 LT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9WjxIU+ymSPyh1UJh6LZvQ23ogP3P+ZT8xAVzHNWFHk=;
 b=pLmIUOcfAnFmaNwaChV6lX77EDF2ZjBVyLnyiAE4s+rg7fnArjIkQEexwXXR9B6L2w
 4b/YO1+EhCDreosrXmxpmxXRlF0YF7tE5fKpwekTUNdjnKH6QyQThP96fMS/1GkVpwf0
 KCsvwgKtjWhg/kWwxWydn+gn0iat9AZxI35rBSTua8VN+/ZgOxeldTSMLpBOFKOlD8zj
 RW7JresqgQglgRtDslI1piD0heOy/jSo17FiCZrisEMPlncElm6gd/iSRNzxw6VZGN2S
 skWExA3A+NrMr8gQ2RlnODq5qM6eadUkxEDseGZHximamcdrDxt9k57WnDpquVEuR+D7
 rdiQ==
X-Gm-Message-State: APjAAAX6zps0fgk5gSwVrXUbd1RoXpEeiyGXOa0SRx/zmak+cnZ/Pd3D
 hobA8wQpeqbR+WeyPOJEMPjpS0jzax8m1IEoSk6wOslC
X-Google-Smtp-Source: APXvYqzQfE6tx+gWIi7M2UpizjY7dRnnYy31J/pQX+xTSViaV5HBkSUiLiq7EbAyP4ucfTP1Q9MAzymxuX9esJeTNQY=
X-Received: by 2002:a92:af19:: with SMTP id n25mr14116876ili.138.1574042125331; 
 Sun, 17 Nov 2019 17:55:25 -0800 (PST)
MIME-Version: 1.0
References: <90BAE90B-F2BF-46A0-BCC0-88223079D196@fuzziesquirrel.com>
 <CAARXrtm_JjCZqRBsnFU+LuH-Xn=4Uj9Eikp7+XKcuvZ8NWGKsQ@mail.gmail.com>
 <5FF8B18B-E4BA-4ED6-AEEF-A2C8F7839C17@fuzziesquirrel.com>
In-Reply-To: <5FF8B18B-E4BA-4ED6-AEEF-A2C8F7839C17@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 18 Nov 2019 09:55:15 +0800
Message-ID: <CAARXrt=sG-pMjs6H9z89FtUHBEDbO3kahPSbHgEPWnO-UwExBg@mail.gmail.com>
Subject: Re: meta-ibm restructuring
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 11:37 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Nov 14, 2019, at 9:06 PM, Lei YU <mine260309@gmail.com> wrote:
> >
> > On Fri, Nov 15, 2019 at 1:51 AM Brad Bishop <bradleyb@fuzziesquirrel.co=
m> wrote:
> >>
> >> the meta-witherspoon layer in meta-ibm supports a number of machine ta=
rgets beyond witherspoon.  the meta-ibm layer itself is nearly empty.
> >
> > Before the change, meta-ibm layer has below:
> >
> >  bmcweb
> >  dbus
> >  dump
> >  interfaces
> >  logging
> >  packagegroups
> >
> > I do not think it's confusing because it defines the necessary recipes
> > for ibm machines.
>
> It doesn=E2=80=99t though - there are also a number of bbappends defined =
in meta-witherspoon that are also required for ibm systems.
>
> >
> >> This is confusing to say the least, so I am doing some restructuring i=
n the meta-ibm layer such that everything will simply be in meta-ibm:
> >>
> >> https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/27263
> >>
> >> Please let me know if you have any concerns.
> >
> > The commit moves everything from meta-witherspoon to meta-ibm, which
> > makes a machine that inherits meta-ibm inherits everything from
> > meta-witherspoon.
>
> That=E2=80=99s just it - the only thing that uses meta-ibm (that I am awa=
re of anyway) are the systems in meta-witherspoon.
>
> > Is that intended?
>
> yes.
>
> > Ideally, the recipes (bbappends) in meta-witherspoon has
> > append_MACHINE so it will not impact other machines. But can we make
> > sure every single recipe has correct append_MACHINE?
>
> Yes this is generally a best practice in any bbappend.
>
> When everything is done we=E2=80=99ll have the following structure:
>
> meta-openpower:
>   recipes and bbappends for any power system
>   full support for openpower reference systems (palmetto, romulus)
>
> meta-ibm:
>   recipes and bbappends for ibm products
>   full support for all ibm products
>
> To put it another way - a minimal bblayers.conf for any openpower referen=
ce systems will look like:
>
> oe-core
> meta-openembedded
> meta-aspeed
> meta-phosphor
> meta-openpower
>
> a minimal bblayers.conf for any ibm product will look like (the same as a=
n openpower reference system but with meta-ibm added)
>
> oe-core
> meta-openembedded
> meta-aspeed
> meta-phosphor
> meta-openpower
> meta-ibm

Got it.
So the plan is to move palmetto and romulus into meta-openpower, is it?
