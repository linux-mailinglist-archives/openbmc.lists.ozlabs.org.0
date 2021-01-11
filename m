Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4862F1F40
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 20:26:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF3bh2z63zDqh3
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:26:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VngZ46Xk; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF3ZV1mlszDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 06:25:20 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id w3so740921otp.13
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WsOoh1FUJQSW3KzDcwNR8rfq8HcIqlZXC8t47GGUzfM=;
 b=VngZ46Xkozz8g2kj+Jadu7teI8nMSGrx1eJ2y7r+xOYKBZQ26LsyXFhGMdx+ueS7hH
 oPwTd8HCEQXi5HBdNdlsEkRlR9pJ0VGUZL4vpL+ss3FCG9T8IVWQvySpIdh8oCBWpJoO
 oQCAsLXElK6mnlBX9/z60qFV2OVQ2TUUgOM1EDNTWSxSqtxR36d75F0UZVP8Ku+4WqZu
 Z6VvVMs2F85lER6b4+jX7bPnJ6f9sq/B7M6+QtQOJh3lkuH9tHOdOTlIfzMaBcojQ+69
 6rl6fpkg/wIaW7jO1OjkiSo+YyuBJp079kLUaPDSa9NIYXAzfuPQO8MumW7sWeIPHShB
 VGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WsOoh1FUJQSW3KzDcwNR8rfq8HcIqlZXC8t47GGUzfM=;
 b=SZIjv12WIeFCSyUrwsnifI6Xnv/bQt21JH/ekEDGd69z5U7ypmIyvrN7Jqlt7dMNcv
 tugGHHNSBQY7RRRywY8e7k1E3GfDibm6E8+RIRS8a63Qg4jpO71DBz9hpqzdkjtI7eEM
 koIKrqdX5cnjdftGS3BAWGNqQfPhTnjSr0v0k39lON4fmT8ML82f4uK70bM88DDxRWW4
 uGokpArjULjKezK3RbmTAUl1cJBflfHpyhOvpo5tKbgmibrNCC+18ofhZKzz9U8chfg3
 BFBlQNrXdKk3Mcx9/YHHvUGwAkjJ2tn/QTtGlcYrDhZLsRNVxNWA9xvQvsqrkz75mYn2
 trXQ==
X-Gm-Message-State: AOAM530OoVIM0fv61UfBSdHO2BuuuC4TVlfZozXVysXF8rNMrKlv+nO8
 mVd91j90XiG3k7zNHh58Z0Eit5USiff6aHkEWk+2hJT1g1Y=
X-Google-Smtp-Source: ABdhPJyHK3ZlphNGZlkDeiR6BLCtOLMF46d5sPgROD+iBmR582FYolj/ZY32TQW4MP5qtxswAImetzCX+iaACmjANkU=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr486785ota.54.1610393116646; 
 Mon, 11 Jan 2021 11:25:16 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGOb2jRTgVxpiH_36W6c5ft5faXPkATaXApXdNiQqd0knQ@mail.gmail.com>
 <63eac02f4bed7ae42c87a938d1457cd5ef1f8b03.camel@yadro.com>
In-Reply-To: <63eac02f4bed7ae42c87a938d1457cd5ef1f8b03.camel@yadro.com>
From: Brandon Kim <brandonkim@google.com>
Date: Mon, 11 Jan 2021 11:25:05 -0800
Message-ID: <CALGRKGMHJ=wDzru1JZJpcsVSUywKW-N=WSx8P5gT6CTiVOL_Lw@mail.gmail.com>
Subject: Re: Error Reporting and Decoding from Intel-based CPU (PECI daemon)
To: Andrei Kartashev <a.kartashev@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000ab044b05b8a4dd14"
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ab044b05b8a4dd14
Content-Type: text/plain; charset="UTF-8"

Ah, thank you Xuxiao and Andrei for the guidance - I'll take a look at the
host-error-monitor daemon.

Thanks,
Brandon

On Mon, Jan 11, 2021 at 6:43 AM Andrei Kartashev <a.kartashev@yadro.com>
wrote:

> Hi Brandon,
>
> PECI-PCIe only deal with PCI bus, it doesn't man to read any
> information regarding CPU. There are number of other daemons uses PECI:
> * cpusensor from dbus-sensors reads CPU/DIMM temperature and power
> using peci/hwmon
> * CPUinfo from smbiosmdrv2 reads CPU info using PECI
> * host-error-monitor reports CPU state using GPIO and PECI
>
> I believe, last one is what you are looking for.
>
> On Wed, 2021-01-06 at 18:02 -0800, Brandon Kim wrote:
> > Hi everyone,
> >
> > I was wondering if there were any ongoing efforts for a daemon using
> > PECI for error reporting and decoding from the host CPU to the BMC
> > (possibly from Intel?).
> >
> > I see openbmc/peci-pcie which seems to be only for using PECI for
> > PCIe devices.
> >
> > Any pointers / updates would be greatly appreciated!
> >
> > Thanks,
> > Brandon
> --
> Best regards,
> Andrei Kartashev
>
>
>

--000000000000ab044b05b8a4dd14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, thank you Xuxiao and Andrei for the guidance - I&#39;l=
l take a look at the host-error-monitor daemon.<div><br></div><div>Thanks,<=
/div><div>Brandon</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Jan 11, 2021 at 6:43 AM Andrei Kartashev &lt=
;<a href=3D"mailto:a.kartashev@yadro.com">a.kartashev@yadro.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Brandon,<=
br>
<br>
PECI-PCIe only deal with PCI bus, it doesn&#39;t man to read any<br>
information regarding CPU. There are number of other daemons uses PECI:<br>
* cpusensor from dbus-sensors reads CPU/DIMM temperature and power<br>
using peci/hwmon<br>
* CPUinfo from smbiosmdrv2 reads CPU info using PECI<br>
* host-error-monitor reports CPU state using GPIO and PECI<br>
<br>
I believe, last one is what you are looking for.<br>
<br>
On Wed, 2021-01-06 at 18:02 -0800, Brandon Kim wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; I was wondering if there were any ongoing efforts for a daemon using<b=
r>
&gt; PECI for error reporting and decoding from the host CPU to the BMC<br>
&gt; (possibly from Intel?).<br>
&gt; <br>
&gt; I see openbmc/peci-pcie which seems to be only for using PECI for<br>
&gt; PCIe devices.<br>
&gt; <br>
&gt; Any pointers / updates would be greatly appreciated!<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Brandon<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</blockquote></div>

--000000000000ab044b05b8a4dd14--
