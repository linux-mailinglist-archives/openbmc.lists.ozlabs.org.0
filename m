Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFF15822C
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 19:22:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GZ566TgXzDqMd
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 05:22:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Pxbkvp4j; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GZ4S1fszzDq9H
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 05:22:00 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id n18so8363670ljo.7
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXLcvXHc78XUmTwfkS1EOwFq64hqUWQC9qzM+MJ0dxo=;
 b=Pxbkvp4jPxosKCnA9U0x31LGtnwrn5IpBLXhTc5Vh0hFQHg0OGIduOcq4QVSPJ5N8h
 Fw4Iu/hSk+dkkGjttvS9hUIDzBaBQqimdQi7B1BVDbPU1oIe2N1pPqxrTtYH3n/GGXP+
 fMJr3zApYbwmWjjRwgJ58GlV+8SVipPlochvju7pw/lPpLWEiLI9VfN20YPxYQIB0j1O
 U8Oj/co/KCLsaysQEFxjZGJmSjQpWBv5ETpWHK6q3zy3lQf0+E9ThdByK1sqgyWK5eCr
 Nc5cLhhcpHK4My81pc145o8vjh1rVlHZfvPuPqoobDS2J8M8yC7YiS93zqS/qssD89Q4
 gCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXLcvXHc78XUmTwfkS1EOwFq64hqUWQC9qzM+MJ0dxo=;
 b=qDvcJTZns1NEMWRzYpXM+XkUfOSxJ94Dwwy2E966to9LJ1rYJpoAJdi91iCnqfgfwl
 TbTUGEH/WyBv0eTzgirVS26QLW7klYL1dLN3ITRtCiBgwxKISYKYm0Mto5XhhE5D0B1W
 Fue8jx+5GBtOt0/FV6BWw+wUkfjeVOApVft6uN3+/qMhAO+y60yJx0zIF5LH7bau2Zic
 5spCLzVGpKMKSK+w2RXnDWvwR80qI9VRXK5dxG7hwhTlb3yb4wi+ZhZbY/DjVqGeZa9p
 kdAdcWDv/bAnSyZiXDqTOnv/a+VSpBJW5BMYJ8Dk+8qLc7B9fYs34PY4688h+p1NRI1Z
 GQrw==
X-Gm-Message-State: APjAAAVMkUHKDR51dmKTG4kFiPNFon9+DugWwPScvakr7A96E+WjyYHK
 wVN2mbxcNbhRwyGgjWi537Mw/X4ALqHnaE/0hm6+Iw==
X-Google-Smtp-Source: APXvYqzNCtBe4+3D7Vr3t21AyLZLYD0lJc8/wTEHf711huF8dkZpuqLWnr5Y+rTBTTnrfO5TpPxJDDKG+NZ9Th+yp8c=
X-Received: by 2002:a05:651c:232:: with SMTP id
 z18mr1756135ljn.85.1581358913826; 
 Mon, 10 Feb 2020 10:21:53 -0800 (PST)
MIME-Version: 1.0
References: <fe46c534-7e23-bc54-2ae9-0057866d6be0@linux.ibm.com>
In-Reply-To: <fe46c534-7e23-bc54-2ae9-0057866d6be0@linux.ibm.com>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 10 Feb 2020 10:21:42 -0800
Message-ID: <CAH1kD+aMerQJmUox1sDtuRFNAFUchyum3w1sbbfyKYfOon_P2A@mail.gmail.com>
Subject: Re: Redfish security question (user enumeration)
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000526836059e3cd058"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000526836059e3cd058
Content-Type: text/plain; charset="UTF-8"

Joseph,

I agree that it is not a good idea to expose usernames in this context.

One possible compromise is to make the account collection discoverable, but
only put the users account into the response (unless it is an admin user).

-Richard

On Mon, Feb 10, 2020 at 9:36 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

> The Redfish spec recently changed to allow users with the Login
> privilege to enumerate all BMC users.  Previously only the admin user
> could do this.  I disagree with this change and believe it is an
> unnecessary information exposure.  Details are in the Redfish forum post.
>
>
> https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration
>
> Are we okay with this?  Do we ask Redfish to change it back?  Please
> reply to this email or to the forum with your thoughts.
>
> Thanks,
> - Joseph
>
> References:
>
> The change was made to Redfish version 2019.4 > DSP2046 >
> Redfish-1.0.4-PrivilegeRegistry > ManagerAccountCollection > GET:
> https://www.dmtf.org/standards/redfish
>
> OpenBMC has the corresponding implementation change pending here:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881
>
> This was discussed in the 2020-02-05 OpenBMC security working group
> meeting as agenda item 3.  Minutes:
>
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
>

--000000000000526836059e3cd058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Joseph,<div><br></div><div>I agree that it is not a good i=
dea to expose usernames in this context.=C2=A0=C2=A0</div><div><br></div><d=
iv>One possible compromise is to make the account collection discoverable, =
but only put the users account into the response (unless it is an admin use=
r).</div><div><br></div><div>-Richard</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2020 at 9:36 AM =
Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com">jrey@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The Redfish spec recently changed to allow users with the Login <br>
privilege to enumerate all BMC users.=C2=A0 Previously only the admin user =
<br>
could do this.=C2=A0 I disagree with this change and believe it is an <br>
unnecessary information exposure.=C2=A0 Details are in the Redfish forum po=
st.<br>
<br>
<a href=3D"https://redfishforum.com/thread/281/manageraccountcollection-cha=
nge-allows-account-enumeration" rel=3D"noreferrer" target=3D"_blank">https:=
//redfishforum.com/thread/281/manageraccountcollection-change-allows-accoun=
t-enumeration</a><br>
<br>
Are we okay with this?=C2=A0 Do we ask Redfish to change it back?=C2=A0 Ple=
ase <br>
reply to this email or to the forum with your thoughts.<br>
<br>
Thanks,<br>
- Joseph<br>
<br>
References:<br>
<br>
The change was made to Redfish version 2019.4 &gt; DSP2046 &gt; <br>
Redfish-1.0.4-PrivilegeRegistry &gt; ManagerAccountCollection &gt; GET:<br>
<a href=3D"https://www.dmtf.org/standards/redfish" rel=3D"noreferrer" targe=
t=3D"_blank">https://www.dmtf.org/standards/redfish</a><br>
<br>
OpenBMC has the corresponding implementation change pending here:<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881" rel=
=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/open=
bmc/bmcweb/+/28881</a><br>
<br>
This was discussed in the 2020-02-05 OpenBMC security working group <br>
meeting as agenda item 3.=C2=A0 Minutes:<br>
<a href=3D"https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xo=
JRQvLxxsDUWmAOI" rel=3D"noreferrer" target=3D"_blank">https://docs.google.c=
om/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI</a><br>
<br>
</blockquote></div>

--000000000000526836059e3cd058--
