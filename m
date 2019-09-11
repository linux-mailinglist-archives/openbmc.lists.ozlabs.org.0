Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68BB01AC
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 18:30:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6nr5yP9zF3K5
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 02:30:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ajy7CDrL"; 
 dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T5Qm2BplzF3P7
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 01:28:48 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id p2so19828411edx.11
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rdp9RF/mzKc3KBrg6oyDWEr6f4Z+wQ0OH/+mfDujCc8=;
 b=Ajy7CDrLCVitk7Ju6KltxKky3XxzUj+YRvpdk5T3ox2UnVWE8BAFpnwhRQNqtdfBTX
 h0CJYRNxWe1xt97eeAh9jfIaQGATQabh9tg4FXNZygtZVFC78+7Y8XtQ/PqDt+E8iZ9r
 fots6MFJ950SMidBVAhQO5TkJ+hzAhKPF2bGZAiV//hCHnwFnUyxTaclPByUGxsDzSGR
 8MJnKSFvUMTIH9Wj5axAPvTGy3cx8dGQXseSgIvn9xlCUB7S+c8WLINA2NN6B571U0tQ
 sy08GVCQIs+yuDI1Du+hNiORVAusiEzFvqqq4yMUk1YsNIEfIJtN+sYcbIb613llwAQg
 5cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rdp9RF/mzKc3KBrg6oyDWEr6f4Z+wQ0OH/+mfDujCc8=;
 b=sdkAmnwoXIR1oaqOhHv3U5LCWMY+8WZtm3QIajXf3oXsQIGY1ttvE+PvQF/7xHGEny
 N+9cdqDhhADaGTB2hOAK7RZ1IOU4toNhGvsWq+wBXf9Y+WwWMclWrX2Q2b3Ub+Q1cX9o
 AlUK85TOkmv+rau35TrKv7nTWRPF7Ww6FlXAeKDZf4xz0lodXSmUSJul39MqEV2qJ9PJ
 HTvjGBg3CAgDlQ990aU4i3plHyOUpSxHfgH9aB2RSpqESr86ZoBTI3PE6K98/1fTBBL1
 IrY9s96WBZncjQrozelx+ha0JS+OSWM8xB9iReGEk6/sTxoCg4LvoI27uBAk3WHrOhR6
 HD/w==
X-Gm-Message-State: APjAAAVxlTKjGtY7rw9OTwWA1iEvfET55Cz0s3Bs/aWQikVs9sWeKEGH
 dcsZnubwlKJNNzjyuq+J2aCMm+B9el6dh+nH78gtzw==
X-Google-Smtp-Source: APXvYqxIPRU8Z1N53Wp6xCqz4YzJYxkEkCARp83Wapoz9RNb0thKnWvFwpX8TzVdzljLpE8RZY1nQqTuLyorZFk+RNw=
X-Received: by 2002:a17:906:308d:: with SMTP id
 13mr11537130ejv.207.1568215723608; 
 Wed, 11 Sep 2019 08:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
 <OF296529E4.5B358202-ON00258471.007740E2-00258471.00779A97@notes.na.collabserv.com>
 <546dbbbd-b38f-47cd-8e56-3f82ce383efb@www.fastmail.com>
In-Reply-To: <546dbbbd-b38f-47cd-8e56-3f82ce383efb@www.fastmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 11 Sep 2019 11:28:27 -0400
Message-ID: <CABoTLcRaLswO8pUQJeJ4dxoH+kbXR7J9pmRZ7ft8F2t+bQgeyA@mail.gmail.com>
Subject: Re: how to use spi flash BIOS/Host firmware??
To: Andrew Jeffery <andrew@aj.id.au>, Milton Miller II <miltonm@us.ibm.com>,
 www <ouyangxuan10@163.com>
Content-Type: multipart/alternative; boundary="00000000000023bd15059248ad1c"
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

--00000000000023bd15059248ad1c
Content-Type: text/plain; charset="UTF-8"

One option I heard of (unverified by me) is to use user-space-only
implementation (e.g. flashrom) on the BMC to dynamically access the host's
SPI "when it is safe to do so", without requiring a kernel driver on the
BMC.

The tricky part is "when it is safe to do so", but you could define certain
points in time, e.g. when the host is powered off or in reset.

Oskar.

On Tue, Sep 10, 2019 at 7:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 11 Sep 2019, at 07:16, Milton Miller II wrote:
> > On September 10, 2019, Byron <ouyangxuan10@163.com> wrote:
> >
> > >Dear all,
> > >
> > >    I want to ask a question about how to spi driver flash host/bios
> > >firmware? I don't want use mtd mode flash it, because the mtd mode
> > >need read spi-id when BMC load spi driver, may be it is risky, it
> > >need switch the  system spi to BMC when the host running, It may
> > >break host startup. Do we have other solutions to solve this problem?
> > >
> >
> > Indeed, we did have some initial hand-off issues especially as the
> > Linux kernel spi nor layer matured.  Over time the assumptions that
> > the bios had that the chip would be set to 4-byte addressing by
> > default were not met by the kernel driver which switched to using
> > 4-byte specific read and write commands.
> >
> > You probably have a few options:
> >
> > If you host is read-only, you can allocate a block of dram
> > and point the lpc window to the dram.  The aspeed lpc
> > controller drivers has ioctl calls for this.
> >
> > If you host is directly connected to the chip and you are
> > using the spi mode mux, then you would need to handshake
> > with your bios.
> >
> > If your host is using lpc to the aspeed chip and programming
> > the controller directly, you probably have given full overtake
> > of your bmc to the host.
>
> This is the case for ASPEED BMCs, so be conscious of threat models.
>
> >
> > In Openpower systems, we have implemented a protocol to map
> > sections of the SPI rom into memory, and use IPMI messages
> > to page in and out windows from this access window in memory
> > to the backing SPI chip. We also have a method.
>
> That sentence looks incomplete :)
>
> Anyway, yes, in OpenPOWER platform designs the BMC owns the flash
> and we provide an abstract means for the host to access flash data such
> that the BMC always remains in control. If you have questions on what
> we've done there, don't hesitate to ask me.
>
> Any other mechanisms will require an explicit handshake as Milton
> mentions and there may be some corner cases in the event of ungraceful
> shutdowns of the host.
>
> Andrew
>

--00000000000023bd15059248ad1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One option I heard of (unverified by me) is to use user-sp=
ace-only implementation (e.g. flashrom) on the BMC to dynamically access th=
e host&#39;s SPI &quot;when it is safe to do so&quot;, without requiring=C2=
=A0a kernel driver on the BMC.<div><br></div><div>The tricky part is &quot;=
when it is safe to do so&quot;, but you could define certain points in time=
, e.g. when the host is powered off or in reset.</div><div><br></div><div>O=
skar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Sep 10, 2019 at 7:56 PM Andrew Jeffery &lt;<a href=3D"ma=
ilto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On Wed, 11 Sep 2019, at 07:16, Milton Miller II wrote:<br>
&gt; On September 10, 2019, Byron &lt;<a href=3D"mailto:ouyangxuan10@163.co=
m" target=3D"_blank">ouyangxuan10@163.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;Dear all,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 I want to ask a question about how to spi driver fla=
sh host/bios<br>
&gt; &gt;firmware? I don&#39;t want use mtd mode flash it, because the mtd =
mode<br>
&gt; &gt;need read spi-id when BMC load spi driver, may be it is risky, it<=
br>
&gt; &gt;need switch the=C2=A0 system spi to BMC when the host running, It =
may<br>
&gt; &gt;break host startup. Do we have other solutions to solve this probl=
em?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Indeed, we did have some initial hand-off issues especially as the <br=
>
&gt; Linux kernel spi nor layer matured.=C2=A0 Over time the assumptions th=
at <br>
&gt; the bios had that the chip would be set to 4-byte addressing by <br>
&gt; default were not met by the kernel driver which switched to using <br>
&gt; 4-byte specific read and write commands.<br>
&gt; <br>
&gt; You probably have a few options:<br>
&gt; <br>
&gt; If you host is read-only, you can allocate a block of dram <br>
&gt; and point the lpc window to the dram.=C2=A0 The aspeed lpc <br>
&gt; controller drivers has ioctl calls for this.<br>
&gt; <br>
&gt; If you host is directly connected to the chip and you are <br>
&gt; using the spi mode mux, then you would need to handshake <br>
&gt; with your bios.<br>
&gt; <br>
&gt; If your host is using lpc to the aspeed chip and programming <br>
&gt; the controller directly, you probably have given full overtake <br>
&gt; of your bmc to the host.<br>
<br>
This is the case for ASPEED BMCs, so be conscious of threat models.<br>
<br>
&gt; <br>
&gt; In Openpower systems, we have implemented a protocol to map <br>
&gt; sections of the SPI rom into memory, and use IPMI messages <br>
&gt; to page in and out windows from this access window in memory <br>
&gt; to the backing SPI chip. We also have a method.<br>
<br>
That sentence looks incomplete :)<br>
<br>
Anyway, yes, in OpenPOWER platform designs the BMC owns the flash<br>
and we provide an abstract means for the host to access flash data such<br>
that the BMC always remains in control. If you have questions on what<br>
we&#39;ve done there, don&#39;t hesitate to ask me.<br>
<br>
Any other mechanisms will require an explicit handshake as Milton<br>
mentions and there may be some corner cases in the event of ungraceful<br>
shutdowns of the host.<br>
<br>
Andrew<br>
</blockquote></div>

--00000000000023bd15059248ad1c--
