Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23242BE698
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:45:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dqnN2gl0zDqYj
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 06:45:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=embeddedsteve@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAQhfNrC"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dqmj2JWMzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 06:44:36 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id s22so3651otr.6
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6i++le9kzzy5r/GD76pLv10p1MP5OfsHt3f3eA7uYU=;
 b=GAQhfNrCiY0q5NBN9mgjfX3WNNlRpj6L8pc84rJkS705u5UeVzV+jJVJ9nAgysoiw4
 Dd0FNk4lhkiP09P94FAkuFztihLKIc0NdKvA2f5ny8ChF2Oc1ZU56HC9glrpEtump8ek
 UTtcVjXFEOuDfBBoEIyvHCLGrdMVfiFQ6mPQfZ88MNnKVf+7HxGTlMrpYPNbhv8sLFik
 OmuV5X+NzHYSxyv8WydIexBKjohTPTWE82P9NS7XsKTXoc1jqABoiWpg7Kc57H4RPLeZ
 IkWTKCvvL93A5kuSBwPFOJRKF7wLo3i+/9XzSCEmIx7vmEiTcVQmxnTgOWrsjiFgOHQl
 jKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6i++le9kzzy5r/GD76pLv10p1MP5OfsHt3f3eA7uYU=;
 b=M4leGQg1to63dCUXdFXBMDrR2XhsDyEgO2d0GZEO7HDddA7M0wx89cifu1wUnzIqUo
 vLxcKbKyrXLrK2ql8wlyR+q6K8QznUPYvCxVihqpgnJoE9s0uc9NYvdUq5MiTn9PsLv9
 vEqcUoP9++28x0k6AOtd25oSwIQFQ4+2zHsMCsWxVYSF50K5w2yDF3xFigyGqcbz3Mvw
 9P0mvZICVwWOG32/a5XgkF13xyIYFp4TPYT0BBaUkuI1ryXGlXP/0s5hlq+Cx8f0aYsE
 GXPCkIxmtvu5ft6YAGjA3ErhXwmY6uAiJboHmAWPdA1aedvLxFslK0FVoOao0JTq0OMA
 5KDA==
X-Gm-Message-State: APjAAAWo1uDgw7SMpTGHotu2a0iObZICjCBbavTP7DteltAvMrmXGVzS
 CDLhI1AOTiAS8LVxwk54mMrywtlJid+tyoMsuAMNlF7AUZQ=
X-Google-Smtp-Source: APXvYqxDeLgx4JwvKPb2v4WJ/hkZLIGjbERsJ9NPnrxQzurmr8+UkUhWsydMy6ylS4zk5g7f0YgIyNzM7G1JQ3feTlY=
X-Received: by 2002:a05:6830:1d97:: with SMTP id
 y23mr30231oti.103.1569444272544; 
 Wed, 25 Sep 2019 13:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
 <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
 <CAN34fowhEKe0fTv+AVN-++5GoySugobjegb=5Lghi7VYXNLmdg@mail.gmail.com>
 <a1767b7c-1769-40ff-b3d7-8e9adc7d234e@www.fastmail.com>
In-Reply-To: <a1767b7c-1769-40ff-b3d7-8e9adc7d234e@www.fastmail.com>
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 25 Sep 2019 16:44:21 -0400
Message-ID: <CAN34fow3D8f=LSY=gS51WxYAcE9Gfrk7_=7Rbppjc4zDF+Pkaw@mail.gmail.com>
Subject: Re: Unable to boot OpenBMC image in QEMU for AST2500
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="0000000000005c1f21059366b823"
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

--0000000000005c1f21059366b823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mr. Jeffery,
   Thank you for your insights and comments.
1) RE: git clone - well, for whatever reason, this worked today. . .
(internet gremlins, github trolls, who knows).
2) RE: building:  I reviewed some documentation again, and pieced together
that I had built the wrong image (again).  So, as I now have a "fresh"
clone, I set about with some different steps towards building an
ast2500-evb image.
 -  I verified that the qemu-system-arm, listed in the documentation
provided by Mr. Geissler, is indeed a 4.1.0 version, and it does contain
the necessary machine support:
sbeckwit@ubuntu:/usr/bin$ qemu-system-arm -machine help | grep ast
ast2500-evb          Aspeed AST2500 EVB (ARM1176)
ast2600-evb          Aspeed AST2600 EVB (Cortex A7)
3) after 168 minutes, I the "baking" was done and checking the
deploy/images directory, I found the ast2500-evb files: kernel, u-boot,
initramfs, mtd image, etc.  Most Excellent!
4) I then, as you suggested, reviewed the documentation (again) and crafted
some minimal parameters to running QEMU.  And Behold:
Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
evb-ast2500 ttyS4

evb-ast2500 login: root
Password:
root@evb-ast2500:~# uname -a
Linux evb-ast2500 5.2.0-c01e98d #1 Wed Sep 25 16:54:08 UTC 2019 armv6l
GNU/Linux
 - I got in to this booted image under QEMU.   (not the blinking light we
Embedded FW Engineers like to see on our boards when something works, but
this will do just fine).
5) RE: runqemu script - My Python is rusty, but I'll take a gander at it,
since I will have some time here, as we are only working on an initial PoC
for this.  The next attempt will be to try and see if we can boot this on
our reference platform (AST2500 based).
 - I maybe getting back to you should I have an update on this script.

Thank you for your assistance and support.

Regards,
Stephen Beckwith



On Wed, Sep 25, 2019 at 11:52 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 25 Sep 2019, at 22:52, Stephen Beckwith wrote:
> > 2) re: qemu machine - the qemu machine being used is the one that was
> > built as part fo the opembmc project. If this qemu machine won=E2=80=99=
t work,
> > then why is it built as part of the project?
>
> Because no-one has looked at removing it from the poky build
> configurations that openbmc inherits. Regardless, removing it isn't the
> right way to deal with the issue.
>
> > Why are there 13 copies of
> > this machine scattered through out the filesystem, consuming ~ 564MB of
> > space, if it=E2=80=99s the =E2=80=9Cwrong=E2=80=9D machine?
>
> This is a question best asked of the upstream yocto project.
>
> >  - so where do I obtain the =E2=80=9CBMC-specific machine=E2=80=9D ?
>
> By running `qemu-system-arm -M ? | grep bmc`. It will give you output lik=
e:
>
> $ qemu-system-arm -M ? | grep bmc
> palmetto-bmc         OpenPOWER Palmetto BMC (ARM926EJ-S)
> rainier-bmc          Aspeed AST2600 EVB (Cortex A7)
> romulus-bmc          OpenPOWER Romulus BMC (ARM1176)
> swift-bmc            OpenPOWER Swift BMC (ARM1176)
> tacoma-bmc           Aspeed AST2600 EVB (Cortex A7)
> witherspoon-bmc      OpenPOWER Witherspoon BMC (ARM1176)
>
> You need to pick an appropriate one to run your image:
>
> ARM926EJ-S: AST2400
> ARM1176: AST2500
> Cortex A7: AST2600
>
> The remaining differences between listed machines are what peripherals
> are attached to e.g. the I2C buses.
>
> >
> > 3) if OpenBMC doesn=E2=80=99t properly integrate into the rumqemu scrip=
ts,
> > then: A) why is this script here?
>
> It is provided by the upstream yocto project.
>
> > B) why hasn=E2=80=99t anyone taken the
> > time/effort to correct the script so that it will integrate properly
> > with OpenBMC?
>
> Because no-one sees it as something worth spending time on? I've
> wanted to get it done since writing the initial QEMU support for the
> ASPEED chips, but it lives at the bottom of my todo list. I've asked
> other people asking questions like you to do it as well, but it hasn't
> been done yet by them either, so I can only assume it lives at the
> bottom of their todo lists too. I'd love it if you contributed a patch
> to fix it :)
>
> Andrew
>

--0000000000005c1f21059366b823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Mr. Jeffery,</div><div>=C2=A0=C2=A0 Thank you for you=
r insights and comments.</div><div>1) RE: git clone - well, for whatever re=
ason, this worked today. . . (internet gremlins, github trolls, who knows).=
</div><div>2) RE: building:=C2=A0 I reviewed some documentation again, and =
pieced together that I had built the wrong image (again).=C2=A0 So, as I no=
w have a &quot;fresh&quot; clone, I set about with some different steps tow=
ards building an ast2500-evb image.=C2=A0=C2=A0 <br></div><div>=C2=A0-=C2=
=A0 I verified that the qemu-system-arm, listed in the documentation provid=
ed by Mr. Geissler, is indeed a 4.1.0 version, and it does contain the nece=
ssary machine support:</div><div><span style=3D"font-family:monospace">sbec=
kwit@ubuntu:/usr/bin$ qemu-system-arm -machine help | grep ast<br>ast2500-e=
vb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Aspeed AST2500 EVB (ARM1176)<br>ast260=
0-evb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Aspeed AST2600 EVB (Cortex A7)<br><=
/span></div><div>3) after 168 minutes, I the &quot;baking&quot; was done an=
d checking the deploy/images directory, I found the ast2500-evb files: kern=
el, u-boot, initramfs, mtd image, etc.=C2=A0 Most Excellent!</div><div>4) I=
 then, as you suggested, reviewed the documentation (again) and crafted som=
e minimal parameters to running QEMU.=C2=A0 And Behold:</div><div><span sty=
le=3D"font-family:monospace">Phosphor OpenBMC (Phosphor OpenBMC Project Ref=
erence Distro) 0.1.0 evb-ast2500 ttyS4<br><br>evb-ast2500 login: root<br>Pa=
ssword: <br>root@evb-ast2500:~# uname -a<br>Linux evb-ast2500 5.2.0-c01e98d=
 #1 Wed Sep 25 16:54:08 UTC 2019 armv6l GNU/Linux</span></div><div>=C2=A0- =
I got in to this booted image under QEMU.=C2=A0=C2=A0 (not the blinking lig=
ht we Embedded FW Engineers like to see on our boards when something works,=
 but this will do just fine).</div><div>5) RE: runqemu script - My Python i=
s rusty, but I&#39;ll take a gander at it, since I will have some time here=
, as we are only working on an initial PoC for this.=C2=A0 The next attempt=
 will be to try and see if we can boot this on our reference platform (AST2=
500 based).=C2=A0 <br></div><div>=C2=A0- I maybe getting back to you should=
 I have an update on this script.</div><div><br></div><div>Thank you for yo=
ur assistance and support.</div><div><br></div><div>Regards,</div><div>Step=
hen Beckwith</div><div><br></div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 11:=
52 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
<br>
On Wed, 25 Sep 2019, at 22:52, Stephen Beckwith wrote:<br>
&gt; 2) re: qemu machine - the qemu machine being used is the one that was =
<br>
&gt; built as part fo the opembmc project. If this qemu machine won=E2=80=
=99t work, <br>
&gt; then why is it built as part of the project?<br>
<br>
Because no-one has looked at removing it from the poky build<br>
configurations that openbmc inherits. Regardless, removing it isn&#39;t the=
<br>
right way to deal with the issue.<br>
<br>
&gt; Why are there 13 copies of <br>
&gt; this machine scattered through out the filesystem, consuming ~ 564MB o=
f <br>
&gt; space, if it=E2=80=99s the =E2=80=9Cwrong=E2=80=9D machine? <br>
<br>
This is a question best asked of the upstream yocto project.<br>
<br>
&gt;=C2=A0 - so where do I obtain the =E2=80=9CBMC-specific machine=E2=80=
=9D ?<br>
<br>
By running `qemu-system-arm -M ? | grep bmc`. It will give you output like:=
<br>
<br>
$ qemu-system-arm -M ? | grep bmc<br>
palmetto-bmc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenPOWER Palmetto BMC (ARM92=
6EJ-S)<br>
rainier-bmc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Aspeed AST2600 EVB (Cortex A7=
)<br>
romulus-bmc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OpenPOWER Romulus BMC (ARM117=
6)<br>
swift-bmc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OpenPOWER Swift BMC (ARM=
1176)<br>
tacoma-bmc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Aspeed AST2600 EVB (Cort=
ex A7)<br>
witherspoon-bmc=C2=A0 =C2=A0 =C2=A0 OpenPOWER Witherspoon BMC (ARM1176)<br>
<br>
You need to pick an appropriate one to run your image:<br>
<br>
ARM926EJ-S: AST2400<br>
ARM1176: AST2500<br>
Cortex A7: AST2600<br>
<br>
The remaining differences between listed machines are what peripherals<br>
are attached to e.g. the I2C buses.<br>
<br>
&gt; <br>
&gt; 3) if OpenBMC doesn=E2=80=99t properly integrate into the rumqemu scri=
pts, <br>
&gt; then: A) why is this script here?<br>
<br>
It is provided by the upstream yocto project.<br>
<br>
&gt; B) why hasn=E2=80=99t anyone taken the <br>
&gt; time/effort to correct the script so that it will integrate properly <=
br>
&gt; with OpenBMC? <br>
<br>
Because no-one sees it as something worth spending time on? I&#39;ve<br>
wanted to get it done since writing the initial QEMU support for the<br>
ASPEED chips, but it lives at the bottom of my todo list. I&#39;ve asked<br=
>
other people asking questions like you to do it as well, but it hasn&#39;t<=
br>
been done yet by them either, so I can only assume it lives at the<br>
bottom of their todo lists too. I&#39;d love it if you contributed a patch<=
br>
to fix it :)<br>
<br>
Andrew<br>
</blockquote></div>

--0000000000005c1f21059366b823--
