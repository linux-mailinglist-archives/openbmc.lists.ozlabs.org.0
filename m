Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A047B01A4
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 18:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6lp3WdYzF3mF
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 02:28:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KGmX5ngk"; 
 dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T5KB2QwczF3Mf
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 01:23:57 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id o9so21056694edq.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7kQX7DQ79JfcxQNvIzBFHDbQdyH7QAvEOCXYAWnqj8=;
 b=KGmX5ngkmxNxXWq/Sl59Nd5UnwKviOWRLLmzsGZp/UJhEDez0rNe2DO+UDycvRnGPc
 fpvr5PwdHxFjjIv06uiwP0w19o6j3F68JIyTLTVo/jORKaFwTEXYoea5H2mZmVrM1STH
 ikBaLi7o6JRhMRceEpnExsQTonNi+lA/i4hiYkdBFVlGA+mkZ0nX1Ibcxdao6haiCl6w
 0raVktSH8GLkLWrlmBIx5gLqCCewiqzQYV+LFbELPe1X5ZI/UPH2sz79GIUv29+ixHso
 3lhKQfWmXEaFvBNsYVXHl6s07r/Fb0ZCnhJE3wyymhthMtW+VL1nLBICxH1bJdP1wr4J
 Ybtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7kQX7DQ79JfcxQNvIzBFHDbQdyH7QAvEOCXYAWnqj8=;
 b=NNCL9i6vPxzdApJr6K8wSVVbcvHDs9itRUeLdTu5W1UJMw5SAxVII37uuRq84DI7sH
 a29rINtV22z3Phz6s85M+4Cy2RMqAIaYdnLsa+q55SCvcVA7oBkCfhgSeqStpBcbBKEy
 rBf6MyRwJAV0gpxMxqQmuITA4aMoU+oOvxNlhhltIDFX+I/d9nog4+m/FInt1ikhYWSx
 LJH2vG2stOq+7DZoEQekuqODVsF3FwuqTIUZSzdiKpCw3FOjFH5V3MaeWu0TQ1zxJnfQ
 XJMubc8gAG3jQLWQASCm5eNJhSRgMfuT6x24RNMyaCsMOZK7lD26Vmlh6C2s0Ve+XNlG
 4FWA==
X-Gm-Message-State: APjAAAVGwGYFyJSlGpJEuCSF++Xwhqp/kAleqypBfHKGuvWBdUtzvpK9
 VA7WOTsEzZzsI0mekPS+F92+o5b8D3DW1vzRDXtaiA==
X-Google-Smtp-Source: APXvYqwW3Bl+bPxGGzXzcSIiD4o7FLk+d9v/969yGC/3rP0pZNE+5LcgBr0WOgzSOB4Fd61LhHSCHllWrtaci8lLRlc=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr29581201ejn.74.1568215433291; 
 Wed, 11 Sep 2019 08:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <2634903dafda431988ffabd873710768@lenovo.com>
 <CAO=notwLxLPEhxVj+A8Q0TcnSU2HVG_CFr5BvbwaSUU2bwgfjQ@mail.gmail.com>
In-Reply-To: <CAO=notwLxLPEhxVj+A8Q0TcnSU2HVG_CFr5BvbwaSUU2bwgfjQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 11 Sep 2019 11:23:36 -0400
Message-ID: <CABoTLcTyNDDQR4zVD2UGrj4L7r4agQeZ1oJKYb37--HZn_aPAw@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Update over eSPI interface
To: Patrick Venture <venture@google.com>, Harry Sung1 <hsung1@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000d5cdee0592489b76"
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

--000000000000d5cdee0592489b76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harry

I've done some experiments with the USB virtual NIC on the AST2500 and
found that to work rather nicely.

We're currently investigating in my team to use that interface as the
primary method for transferring data between the host and the BMC. From
what I can tell, this seems to be the fastest, most secure method. The
advantage also is that it doesn't need any low-level HW / memory access on
the host. However, the host still needs to have the USB NIC on its side
supported (driver) and configured (IP address). For our environment
(Linux), this is easy to achieve.

It should be possible to update the phosphor-ipmi-flash BMC and host side
implementation to use a USB NIC for data transfer. However, we haven't
investigated those details yet.

Other methods for data transfer (LPC, PCIe, eSPI, SuperI/O) all seem to
open up a large security hole in the AST2500.

Oskar.

On Wed, Sep 11, 2019 at 10:45 AM Patrick Venture <venture@google.com> wrote=
:

> On Wed, Sep 11, 2019 at 1:59 AM Harry Sung1 <hsung1@lenovo.com> wrote:
> >
> >
> > > On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft <osk@google.com> wrote:
> > > >
> > > > Hi Harry
> > > >
> > > > What's the behavior on eSPI? I assume you still have the
> aspeed-lpc-ctrl
> > > enabled, right?
> > > >
> > > > Thanks
> > > > Oskar.
> >
> > Hi Oskar,
> > Yes, I still enabled the aspeed-lpc-ctrl in my build. Because
> phosphor-ipmi-flash has some mandatory actions on /dev/aspeed-lpc-ctrl
> before flash (settings for HICR5, HICR7 and HICR8) even though these
> settings are meaningless for eSPI.
> >
> > Currently, I set ESPI084 (source address) and ESPI088 (target address)
> registers manually because linux seems not have a driver can help us to s=
et
> ESPI084 and ESPI088.
> >
> > Due to the limitation of AST2500, we can only write 256 bytes in one
> write operation (write shared memory).
> > Based on the test result, it takes about 30 mins to transfer a 32MB
> image over eSPI.
>
> :( wow, that's unfortunately rather slow.
>
> >
> > Thanks,
> > Harry
> > > >
> > > > On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 <hsung1@lenovo.com>
> wrote:
> > > >>
> > > >> Hi Patrick,
> > > >>
> > > >>
> > > >>
> > > >> I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not support fla=
sh over eSPI yet.
> > > >>
> > > >> May I ask if you have any plans to support flash over eSPI?
> > > >>
> > > >>
> > > >>
> > > >> I have done a simple test about shared memory between host and BMC=
 :
> > > >>
> > > >> The shared memory is work after I set ESPI084 (source address) and
> ESPI088
> > > (target address) registers.
> > > >>
> > > >> But it has an limitation that only 256 bytes are available on each
> page (4KB).
> > > >>
> > > >>
> > > >> For example, if host address starts to write from 0xFE0B0000 (BMC
> > > >> reserved enough memory already)
> > > >>
> > > >> Writable area are:
> > > >>
> > > >> 0xFE0B0000 ~ 0xFE0B00FF
> > > >>
> > > >> 0xFE0B1000 ~ 0xFE0B10FF
> > > >>
> > > >> 0xFE0B2000 ~ 0xFE0B20FF
> > > >>
> > > >> 0xFE0B3000 ~ 0xFE0B30FF
> > > >>
> > > >> =E2=80=A6
> > > >>
> > > >> =E2=80=A6
> > > >>
> > > >> =E2=80=A6
> > > >>
> > > >>
> > > >>
> > > >>
> > > >>
> > > >> Thanks,
> > > >> Harry
> > >
> > > Harry, currently there's no plan to implement it as I have no method
> of testing
> > > it,  However, it should prove fairly straightforward to add another
> option to
> > > the transport mechanism list.  Please let me know if you run into any
> > > blockers.
> >
> > Hi Patrick,
> > Got it. The better way to set eSPI register is setting them by the
> driver, right?
> > For quick validation, I am going to use the " ipmilpc" interface and se=
t
> necessary eSPI registers manually.
>
> I don't know as much about the eSPI variation of this.  ipmilpc uses
> whatever LPC memory shared option is available (in coordination with
> the host+bmc).  If eSPI doesn't use the aspeed-lpc-ctrl driver for
> what it needs, then perhaps a new option should be added ipmiespi?
>
> >
> > Thanks,
> > Harry
>

--000000000000d5cdee0592489b76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Harry<br><div><br></div><div>I&#39;ve done some experim=
ents with the USB virtual NIC on the AST2500 and found that to work rather =
nicely.</div><div><br></div><div>We&#39;re currently investigating in my te=
am to use that interface as the primary method for transferring data betwee=
n the host and the BMC. From what I can tell, this seems to be the=C2=A0fas=
test, most secure method. The advantage also is that it doesn&#39;t need an=
y low-level HW / memory access on the host. However, the host still needs t=
o have the USB NIC on its side supported (driver) and configured (IP addres=
s). For our environment (Linux), this is easy to achieve.</div><div><br></d=
iv><div>It should be possible to update the phosphor-ipmi-flash BMC and hos=
t side implementation to use a USB NIC for data transfer. However, we haven=
&#39;t investigated those details yet.</div><div><br></div><div>Other metho=
ds for data transfer (LPC, PCIe, eSPI, SuperI/O) all seem to open up a larg=
e security hole in the AST2500.</div><div><br></div><div>Oskar.</div><div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Sep 11, 2019 at 10:45 AM Patrick Venture &lt;<a href=3D"mailto=
:venture@google.com">venture@google.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed, Sep 11, 2019 at 1:59 AM Harr=
y Sung1 &lt;<a href=3D"mailto:hsung1@lenovo.com" target=3D"_blank">hsung1@l=
enovo.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft &lt;<a href=3D"mailto:=
osk@google.com" target=3D"_blank">osk@google.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Harry<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What&#39;s the behavior on eSPI? I assume you still have the=
 aspeed-lpc-ctrl<br>
&gt; &gt; enabled, right?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; Oskar.<br>
&gt;<br>
&gt; Hi Oskar,<br>
&gt; Yes, I still enabled the aspeed-lpc-ctrl in my build. Because phosphor=
-ipmi-flash has some mandatory actions on /dev/aspeed-lpc-ctrl before flash=
 (settings for HICR5, HICR7 and HICR8) even though these settings are meani=
ngless for eSPI.<br>
&gt;<br>
&gt; Currently, I set ESPI084 (source address) and ESPI088 (target address)=
 registers manually because linux seems not have a driver can help us to se=
t ESPI084 and ESPI088.<br>
&gt;<br>
&gt; Due to the limitation of AST2500, we can only write 256 bytes in one w=
rite operation (write shared memory).<br>
&gt; Based on the test result, it takes about 30 mins to transfer a 32MB im=
age over eSPI.<br>
<br>
:( wow, that&#39;s unfortunately rather slow.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Harry<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 &lt;<a href=3D"ma=
ilto:hsung1@lenovo.com" target=3D"_blank">hsung1@lenovo.com</a>&gt; wrote:<=
br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Hi Patrick,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not s=
upport flash over eSPI yet.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; May I ask if you have any plans to support flash over eS=
PI?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I have done a simple test about shared memory between ho=
st and BMC :<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The shared memory is work after I set ESPI084 (source ad=
dress) and ESPI088<br>
&gt; &gt; (target address) registers.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; But it has an limitation that only 256 bytes are availab=
le on each page (4KB).<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; For example, if host address starts to write from 0xFE0B=
0000 (BMC<br>
&gt; &gt; &gt;&gt; reserved enough memory already)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Writable area are:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B0000 ~ 0xFE0B00FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B1000 ~ 0xFE0B10FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B2000 ~ 0xFE0B20FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B3000 ~ 0xFE0B30FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Thanks,<br>
&gt; &gt; &gt;&gt; Harry<br>
&gt; &gt;<br>
&gt; &gt; Harry, currently there&#39;s no plan to implement it as I have no=
 method of testing<br>
&gt; &gt; it,=C2=A0 However, it should prove fairly straightforward to add =
another option to<br>
&gt; &gt; the transport mechanism list.=C2=A0 Please let me know if you run=
 into any<br>
&gt; &gt; blockers.<br>
&gt;<br>
&gt; Hi Patrick,<br>
&gt; Got it. The better way to set eSPI register is setting them by the dri=
ver, right?<br>
&gt; For quick validation, I am going to use the &quot; ipmilpc&quot; inter=
face and set necessary eSPI registers manually.<br>
<br>
I don&#39;t know as much about the eSPI variation of this.=C2=A0 ipmilpc us=
es<br>
whatever LPC memory shared option is available (in coordination with<br>
the host+bmc).=C2=A0 If eSPI doesn&#39;t use the aspeed-lpc-ctrl driver for=
<br>
what it needs, then perhaps a new option should be added ipmiespi?<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Harry<br>
</blockquote></div>

--000000000000d5cdee0592489b76--
