Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EF2A83DD
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:47:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRqDs0KtDzDr6t
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 03:47:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lP+1mvZA; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRqCq3ptzzDr4N
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 03:46:14 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id g15so1435587ybq.6
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zvB9XlJvonEkYuJne1mIHNJ4wH0jfCDREr5n4KIPT6I=;
 b=lP+1mvZAkslKwHUoRT39S/g491StUfuZMOHsKQO0l+m6t/KtXmV3Ui/YoTQE9+Ilc0
 1t8TMixSlhSz2TndjWWDD3Wn01/e3aCSBHjwbKmxANGe7QCtEuluHXWE3AsjJUGQ7hGx
 QsGcxIvuNworfdBP9qoC+RpNU0M7gwoJK47yXgJYhC1Y8lTlHmBTG1OW4K895AKdVbFZ
 gIQh0361GY2A2gNJ/3NoWZW5yhjcKLm6bqJlpEVl7qwyQH6SEkV4wKxV9b2aALzYUhHJ
 Xd/MByiuV/juBB/yxd1IHrgJaqq3j/Qm/yC95r3nFS65WkHbYugAkoSj6kr0jUZE7fXZ
 GeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zvB9XlJvonEkYuJne1mIHNJ4wH0jfCDREr5n4KIPT6I=;
 b=BjNA4S4vEMa5SVLH6fZB49apusnNRy5KRPv8L6Qv0YzfS9djUdZyRKO0/0O/yU3rJ3
 TfLw9ZMTc5KFheg7/cqo6bng9M4Tz3HJJnjwqAiLTlXZjvMwzIzCfeELS6MT7NEuONXJ
 u9fevZs9jtm+PhOLEF9gm4Olb2hN0jZWlvQx7NqbeSTJE+HN1Qy/47qftl2RcyTDWyOG
 kVNGs+bwOq+jdBuSyFiwa5DrlcsKwiISsJunrxnVmlWaiaXA7+QLnihfJMuSYADtVDum
 Pye2EQwIJnPmdeihv+zPZfhTEkoTlVvUuqMPOil/E2/B1bvSgSGIypeAPJ0LV9M4KZ9S
 VOYA==
X-Gm-Message-State: AOAM533SCU/bCbMWSzKHjJW1iwbbkNDN8VDtTdJbs2Q4COzoLucEG2sc
 aiB+gIHdzvfxGmL4IJREcEA8Qd5pjsP9ej4Eg3Gt0w==
X-Google-Smtp-Source: ABdhPJydlQWNTLGW4RfHoOnpsHZSCw5WqX3J0E4UIAxJC47w5rkz7De2CPEbfmboMp68nj54YvFjCmhFddaydJGGDvM=
X-Received: by 2002:a25:e645:: with SMTP id d66mr4416021ybh.340.1604594770605; 
 Thu, 05 Nov 2020 08:46:10 -0800 (PST)
MIME-Version: 1.0
References: <CAD+gp9B3q6A4Hp4N7f_T8CJuw0n1sk=vkCHWebx0seyuxJjx_w@mail.gmail.com>
In-Reply-To: <CAD+gp9B3q6A4Hp4N7f_T8CJuw0n1sk=vkCHWebx0seyuxJjx_w@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 5 Nov 2020 08:45:59 -0800
Message-ID: <CACWQX83iRY7g10aS2p6ioO0S9ubH+91e8tc+GhuWbFjo+NDCvQ@mail.gmail.com>
Subject: Re: How to integrate new libraray in openbmc
To: khader basha shaik <shaikkhaderbasha601@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004f94f305b35ed56c"
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

--0000000000004f94f305b35ed56c
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 2:49 AM khader basha shaik <
shaikkhaderbasha601@gmail.com> wrote:

> Hi Team,
>
> I have a custom library and need to integrate it with openbmc.The library
> provides various output related to system information.
> I need this information to show up in phosphor-webUI.
>
In my understanding we need to register it with dbus interface.
> So I need to integrate my custom library with dbus.
>
> But I do not have much information about where to start?
>
>
> Any help or information on this would be really helpful.
>
>
>
If you point us to the code for the library you're wanting to integrate, as
well as what you're hoping to see as a result we can probably give you
better advice.  As is, your request is quite vague, and I'm personally
finding it very hard to answer with non-generic advice.  The openbmc
documentation is a pretty good place to start in your case.  Once you have
some handle on it, put the code up somewhere that we can see it, and we'll
be able to give you more specific advice on where to go from there.

-Ed

--0000000000004f94f305b35ed56c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 5, 2020 at 2:49 AM khader=
 basha shaik &lt;<a href=3D"mailto:shaikkhaderbasha601@gmail.com">shaikkhad=
erbasha601@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Team,<br><div><br></div><div> =
                                                                           =
                                                                       <div=
><div><div><div><div id=3D"gmail-m_5892491771360959219gmail-show_issue"><di=
v id=3D"gmail-m_5892491771360959219gmail-discussion_bucket"><div><div><div>=
<div><div><div id=3D"gmail-m_5892491771360959219gmail-issue-731144798"><div=
><div><span disabled><table><tbody><tr><td><p>I have a custom library and n=
eed to integrate it with openbmc.The library provides various output relate=
d to system information.<br> I need this information to show up in phosphor=
-webUI.</p></td></tr></tbody></table></span></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div></div></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
<div><div><div><div><div id=3D"gmail-m_5892491771360959219gmail-show_issue"=
><div id=3D"gmail-m_5892491771360959219gmail-discussion_bucket"><div><div><=
div><div><div><div id=3D"gmail-m_5892491771360959219gmail-issue-731144798">=
<div><div><span disabled><table><tbody><tr><td><p>In my understanding we ne=
ed to register it with dbus interface.<br> So I need to integrate my custom=
 library with dbus.=C2=A0</p><p>But I do not have much information about wh=
ere to start?</p><p><br></p><p>Any help or information on this would be rea=
lly helpful.</p><p></p></td></tr></tbody></table><br></span></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></blockquote><div><br></div><div>If you point us to the code for the =
library you&#39;re wanting to integrate, as well as what you&#39;re hoping =
to see as a result we can probably give you better advice.=C2=A0 As is, you=
r request is quite vague, and I&#39;m personally finding it very hard to an=
swer with non-generic advice.=C2=A0 The openbmc documentation is a pretty g=
ood place to start in your case.=C2=A0 Once you have some handle on it, put=
 the code up somewhere that we can see it, and we&#39;ll be able to give yo=
u more specific advice on where to go from there.</div><div><br></div><div>=
-Ed</div></div></div>

--0000000000004f94f305b35ed56c--
