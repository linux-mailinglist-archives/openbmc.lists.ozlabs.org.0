Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E759F20CF48
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 16:54:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wVrW5MQ4zDqYP
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 00:54:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rI7GeYLN; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wVqQ52rdzDqKg
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 00:53:37 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id k18so8506854ybm.13
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nryZmdnNKPJW2ZMpu73zIy10tkQOTCVNdBi/PTqijSk=;
 b=rI7GeYLNt+HEA2W2TLGQOA43+Qj+7AVWoA3Gyl+aoPKjufzNaxBcKieBW6DWEQF3CW
 AN4OYpucHoi3onZ/caGSu1PLtkonjPRwkUqyQjQaSZ8+KUhok6IAXbA03xZsBjrURrU8
 xjg/vsn3RcMbKexYowozbw1CegjJFLCI9mHr5jqSK2/kvGdCA18xaiP8NmY8wl9meMdv
 CKcJgWYDOFe+YQG3SwH7qrplUjeiehtrDaQgfTcXE0d1dMg0PG4RCg8MIiQEjtNDRo9x
 6WgN5JogN2zYzLJWPmreFAqQhDacAnWi0I0RoW9xEt5Jzq50xpImE6Si6bwPICV+vEcx
 zIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nryZmdnNKPJW2ZMpu73zIy10tkQOTCVNdBi/PTqijSk=;
 b=jrXLK1hzlh0NnxfC8x9LOZ1HAV2fxSclaPmyb6JqyGwcA+5xBPzt1kevjstxHgkxTZ
 DRa9pjoLrcWStbm6e/tcY7w7bGBA8Kxm+pyQUCof44Kgk9cNWSLxwt+ZFL2aC622QEfb
 1f8SYY0F2+uuigbEFCDtyxscCXiZvN+ITeMVfpVjyodTsavVbU2hb7a92qmClta2ILGY
 hX8WvbsNrILeXilZU4V1n3cGbQNAX4iAAfb6BYpJ0Qbxk0AGvGkiiUi0/dPzmxIRuZ3F
 CZvSc8+b2SGFUK+HF2X/4dpmW48na/iseQ7Li6H7JVu3mGBEk8eaWLL2RLdNTovCZIhY
 kw4A==
X-Gm-Message-State: AOAM530acmg2FgttYWQzom0LDXFUmODWEU4xSqFUxRiIP8y1XX6IbrkI
 lzXEFfWEajyXtM0RBDd3Sj+kcLEwmHqTEj18jjWbnQ==
X-Google-Smtp-Source: ABdhPJyTBGQaEJtLyk2EtSKRHgWWX8u1UjiBubqMH4peCX+2XggqpA5Gn8qIaXUuwWTYNs9sPWI1knmgNNFpUDNvWBw=
X-Received: by 2002:a25:384f:: with SMTP id f76mr25914434yba.170.1593442413233; 
 Mon, 29 Jun 2020 07:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
In-Reply-To: <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 29 Jun 2020 07:53:22 -0700
Message-ID: <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Alex Qiu <xqiu@google.com>
Content-Type: multipart/alternative; boundary="00000000000002dc2d05a93a3982"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>,
 Kais Belgaied <belgaied@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000002dc2d05a93a3982
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu <xqiu@google.com> wrote:
> Yes, there are some restrictions in my current demo, and I'm afraid
> that I may not have the bandwidth to cover it further alone. My point
> is that, sometimes hardwares is designed with some unexpected
> complexity on topology (EEPROM behind MUX for example).
To my understanding this case is already handled.  Assign the mux to the
parent FRU config file, and the eeprom behind it will be detected
correctly.  With that said, this type of hardware (optional mux with an
eeprom behind it) is difficult to identify automatically with no other
impact, hence needing to explicitly add it to the parent board.  Can you
think of any other examples of unexpected topology that aren't covered?


> Having the
> ability to aid the topology discovery with code, and having the
> topology info available to other functionalities can help a lot. JSON
> config files are having a hard time bearing these logics, and any
> extra logic implemented in JSON config files requires some kind of
> script parser in daemons processing them.
The majority of the config parsing is also able to be done at compile time,
it just isn't implemented today.  With that said, the config file parsing
in practice takes up very little CPU time in the last profile I did, so it
hasn't been a priority.


> Based on your replies, the
> concept for functionally extensions that I was asking for should be
> implemented as daemons either standalone or plugged onto dbus?

I'm not understanding the distinction of standalone vs plugged into dbus,
but I'll hazard a guess, and say yes, the dbus interfaces to the rest of
the system is (one of) the project's intended extension points.  You can
either manipulate them from an existing daemon, or create an all new daemon
that has exactly the behavior you want.


>
> On "reading sensors within the BMC console", I'm actually using a
> script to directly read from hwmon right now, because we are having
> sensor number limit on IPMI and performance issues with IPMI and dbus.
> We are still actively investigating these performance issues now to
> unblock the project, but based on the current findings, I think it's
> better to have this tool before the protocol layers.
Have you considered opening a review with this tool to make it available to
others?  I'd recommend opening a review to put it in here:
https://github.com/openbmc/openbmc-tools
This repo is much less formal, but gives people a place for these "might be
useful to others" type scripts.  Write up a commit message with something
to the effect of "I wrote this tool, this is how you use it, I find it
makes platform development easier because X." and get it checked in.


>
> On issues like uint8_t, yes, we've noted them down, but they are still
> tech debts on our backlog, and dealing with the performance issue
> described above remains as our priority right now.

It sounds like you're swamped for time, which I can respect.  With that
said, If you start by making technical improvements on small things like
the above, you're much more likely to have feedback (and help) when you
propose more wide sweeping changes, like your python example.
If you ever get free time, and want to continue moving your proposal more
toward an actionable change we can make, I'm happy to help discuss
options.  To be clear, I think if you can resolve some of the technical
limitations of your proposal, and put together a patchset that implements
it in a language that the project can use on a majority of platforms, I
think it could be a better developer experience.  We just can't remove some
of the user facing features that are implemented and/or planned already.
-- 
-Ed

--00000000000002dc2d05a93a3982
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br>
On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@google.=
com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br>
&gt; Yes, there are some restrictions in my current demo, and I&#39;m afrai=
d<br>
&gt; that I may not have the bandwidth to cover it further alone. My point<=
br>
&gt; is that, sometimes hardwares is designed with some unexpected<br>
&gt; complexity on topology (EEPROM behind MUX for example).<br></div><div>
To my understanding this case is already handled.=C2=A0 Assign the mux to t=
he parent FRU config file, and the eeprom behind it will be detected correc=
tly.=C2=A0 With that said, this type of hardware (optional mux with an eepr=
om behind it) is difficult to identify automatically with no other impact, =
hence needing to explicitly add it to the parent board.=C2=A0 Can you think=
 of any other examples of unexpected topology that aren&#39;t covered?</div=
><div><br>
<br>
&gt; Having the<br>
&gt; ability to aid the topology discovery with code, and having the<br>
&gt; topology info available to other functionalities can help a lot. JSON<=
br>
&gt; config files are having a hard time bearing these logics, and any<br>
&gt; extra logic implemented in JSON config files requires some kind of<br>
&gt; script parser in daemons processing them.<br></div><div>
The majority of the config parsing is also able to be done at compile time,=
 it just isn&#39;t implemented today.=C2=A0 With that said, the config file=
 parsing in practice takes up very little CPU time in the last profile I di=
d, so it hasn&#39;t been a priority.</div><div><br>
<br>
&gt; Based on your replies, the<br>
&gt; concept for functionally extensions that I was asking for should be<br=
>
&gt; implemented as daemons either standalone or plugged onto dbus?<br>
<br></div><div>
I&#39;m not understanding the distinction of standalone vs plugged into dbu=
s, but I&#39;ll hazard a guess, and say yes, the dbus interfaces to the res=
t of the system is (one of) the project&#39;s intended extension points.=C2=
=A0 You can either manipulate them from an existing daemon, or create an al=
l new daemon that has exactly the behavior you want.</div><div><br>
<br>
&gt;<br>
&gt; On &quot;reading sensors within the BMC console&quot;, I&#39;m actuall=
y using a<br>
&gt; script to directly read from hwmon right now, because we are having<br=
>
&gt; sensor number limit on IPMI and performance issues with IPMI and dbus.=
<br>
&gt; We are still actively investigating these performance issues now to<br=
>
&gt; unblock the project, but based on the current findings, I think it&#39=
;s<br>
&gt; better to have this tool before the protocol layers.<br></div><div>
Have you considered opening a review with this tool to make it available to=
 others?=C2=A0 I&#39;d recommend opening a review to put it in here:<br>
<a href=3D"https://github.com/openbmc/openbmc-tools" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/openbmc/openbmc-tools</a><br>
This repo is much less formal, but gives people a place for these &quot;mig=
ht be useful to others&quot; type scripts.=C2=A0 Write up a commit message =
with something to the effect of &quot;I wrote this tool, this is how you us=
e it, I find it makes platform development easier because X.&quot; and get =
it checked in.</div><div><br>
<br>
&gt;<br>
&gt; On issues like uint8_t, yes, we&#39;ve noted them down, but they are s=
till<br>
&gt; tech debts on our backlog, and dealing with the performance issue<br>
&gt; described above remains as our priority right now.<br>
<br></div><div>
It sounds like you&#39;re swamped for time, which I can respect.=C2=A0 With=
 that said, If you start by making technical improvements on small things l=
ike the above, you&#39;re much more likely to have feedback (and help) when=
 you propose more wide sweeping changes, like your python example.<br>
If you ever get free time, and want to continue moving your proposal more t=
oward an actionable change we can make, I&#39;m happy to help discuss optio=
ns.=C2=A0 To be clear, I think if you can resolve some of the technical lim=
itations of your proposal, and put together a patchset that implements it i=
n a language that the project can use on a majority of platforms, I think i=
t could be a better developer experience.=C2=A0 We just can&#39;t remove so=
me of the user facing features that are implemented and/or planned already.=
<br>
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr">-Ed</div></div>

--00000000000002dc2d05a93a3982--
