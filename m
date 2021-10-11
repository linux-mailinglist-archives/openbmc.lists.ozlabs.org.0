Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35342928B
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HShXT5HQ0z2yQm
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 01:49:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xzfj5vrA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=sharad.openbmc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Xzfj5vrA; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HShX60J8dz2xX1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 01:49:25 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id
 k2-20020a056830168200b0054e523d242aso12460395otr.6
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awLxAfKD2zFHisYCbwcOcBTF+3BnEt5Jb047QhaUp3U=;
 b=Xzfj5vrAdzxpNPBPGBPA/xwecm+PYlzQW2GcDobUAU5BRIoZWRvU3ui40K9fz0JCeX
 PYagtk81d8qeNpnZPu21zt2qDmI0vCtMx5no0mIrrGtNLGhvWx+nRXNmAfxcRj/Y/BSd
 amIecw+uwSz4z/Po3wPvlUCw3Vx6zDqxsJcBCIz0xECNx20W9samSyBMVTuzgN77FkMs
 9P7rHkZKtiJf7h6fDwcTb7lH+RY3C7UOt5mwYTswJImSEM4QudceJWR+XIkQtJzAGaXP
 GmOan+v9ZO1evKaWXxiQrLyi3wuzAORYC+uhfxGiCCqWs5nkliB+bmWCE4/2s+RFLs+1
 BQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awLxAfKD2zFHisYCbwcOcBTF+3BnEt5Jb047QhaUp3U=;
 b=AIR8ywhfG6vZr8dxH+BrtqD6dwwz0Ds4qlv6g6uW/ctf4onz0L2eAJAOkN9MKvBXd4
 BVpHE8nFsefCO4im1stBNsKPkqJ8oYL58xvn7lgFdtSIEE5VdpdTMj1+NqduyAZlM1im
 DMn/uu3V6m6IR/FvazWBGAEAZc9jYNLbgfykysSkA6zocuohq6H+mz1HYMXRULaejWBt
 6KxKw+E+I8JJrDnL50Q0kBiGMPrWEBLqj4/0TQzKVdVEhv1i/D263EIbmACg8gX5of5N
 EfxToNgm0/iJaBWpD7CQwtCw2iD6Y0nBJYBxUmZqMOxqg7aXrCSfT9VKOmibIW1WWodE
 OeqQ==
X-Gm-Message-State: AOAM532OY2cvr070yocnpnKzCdxh0MM3zHTEvGqXA08uyTs1wDq6aI79
 76UioDZQHhs1YaQYnAW7rkRuqnQuI0JBwo0khnLH0vpHsawsYA==
X-Google-Smtp-Source: ABdhPJw7vnvL8LH3bU/RzbbnF0oFabjJYmTHMNt+ScfYRksSOXwP0lVbPjvxMSjeoDsWwSPedDKGqOz1dIhpZAILh10=
X-Received: by 2002:a9d:67cf:: with SMTP id c15mr21003865otn.232.1633963762727; 
 Mon, 11 Oct 2021 07:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+H48BRUkTwQ-2NtJCQZrF_RyG3p9oUFzP4cqF5iVDEy-dh39A@mail.gmail.com>
 <CAPw1Ef-nyZB1JJax2Ca=z5hWoBxAg59WoFCKLA4TG+Ln0WyMFQ@mail.gmail.com>
 <CAH2-KxCKuUKyDdA+qc8rexiH6O5-EHk6UPmUUmPwnjn0wDLW1Q@mail.gmail.com>
In-Reply-To: <CAH2-KxCKuUKyDdA+qc8rexiH6O5-EHk6UPmUUmPwnjn0wDLW1Q@mail.gmail.com>
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Mon, 11 Oct 2021 20:19:11 +0530
Message-ID: <CA+H48BSmcBDtJ1s0mDYM-q1UD7Mf51X6GkJFHCVH044CnQO_Tg@mail.gmail.com>
Subject: Re: Performance issue with redfish TLS handshake
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="000000000000a7404705ce14d536"
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
Cc: John Broadbent <jebr@google.com>, Anuraag Bharadwaj <anuraagb@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a7404705ce14d536
Content-Type: text/plain; charset="UTF-8"

Thanks for the help. It worked out with the client setting keepalive=true.
Though curl is pre-enabled with keepalive=true. Below curl command worked
out to avoid TLS handshake in subsequent calls.
curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X
GET https://${bmc}/redfish/v1/Systems/system https://${bmc}/redfish/v1/Syst
ems/system

Thanks,
Sharad

On Wed, 6 Oct 2021 at 00:23, Ed Tanous <edtanous@google.com> wrote:

> On Tue, Oct 5, 2021 at 11:48 AM John Broadbent <jebr@google.com> wrote:
> >
> >
> >
> > On Tue, Oct 5, 2021 at 1:42 AM sharad yadav <sharad.openbmc@gmail.com>
> wrote:
> >>
> >> Hi All,
> >>
> >> We have tried to measure redfish APIs performance benchmarking on
> AST2600.
> >> On redfish GET request there is a penalty added for ~100ms on TLS
> handshake at
>
> This is a little higher than I would've expected, but not outside the
> realm of reasonable.  Can you triage what cipher suite you're
> negotiating between the client and server?  Are you using a DH+EC key
> cipher?  That should be faster than RSA.
>
> >>
> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L297
> >>
> >> On trying below all methods, each request calls `async_handshake` which
> adds 100ms delay
> >> before the actual redfish handler code gets called.
> >> Method 1:
> >> curl --insecure -X POST -D headers.txt https://${bmc}/redfish/v1/SessionService/Sessions
> -d    '{"UserName":"root", "Password":"0penBmc"}'
> >> export token=<Read X-Auth-Token from the headers.txt>
> >> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json"
> -X GET https://${bmc}/redfish/v1/Systems/system
> >>
> >> Method 2:
> >> export token=`curl -k -H "Content-Type: application/json" -X POST
> https://${bmc}/login -d '{"username" : "root", "password" : "0penBmc"}' |
> grep token | awk '{print $2;}' | tr -d '"'`
> >> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json"
> -X GET https://${bmc}/redfish/v1/Systems/system
> >>
> >> Method 3:
> >> curl https://${bmc}/redfish/v1/Systems/system --insecure -u
> root:0penBmc -L
> >>
> >> We want to avoid this ~100ms delay for better performance.
> >> Please suggest if there is a way to skip the `async_handshake` call by
> modifying the requests method?
> >>
> >> Thanks,
> >> Sharad
> >
> >
> >
> >
> > There is logic in the crow::connection object that should allow you to
> use tcp keep-alive and avoid the handshake in start.
> >
> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L694
> >
> > I have looked at the connection class in bmcweb before, and found it
> difficult to understand.
> > However, this is a simplified version of the states within the
> connection class:
> >
> > start->doReadHeaders->doRead->handle->completeRequest->doWrite[if keep
> alive]->doReadHeaders
> >
> > The async_handshake is in the start, so if you are able to use the same
> connection, you should only pay for the handshake once.
> > Ed Tanous and Gunnar Mills are the definitive experts.
>
> Yep, John got this exactly right.  Make sure whatever client you're
> using is taking advantage of keepalive, and you will only take this
> TLS performance hit for the first request.
>
> >
> >
> > Let us know what you find.
> > Thank you
>

--000000000000a7404705ce14d536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the help. It worked out with the client setting=
=C2=A0keepalive=3Dtrue.<div>Though curl is pre-enabled with keepalive=3Dtru=
e. Below curl command worked out to avoid TLS handshake in subsequent=C2=A0=
calls.</div><div><span style=3D"color:rgb(80,0,80)">curl -k -H &quot;X-Auth=
-Token: $token&quot; -H &quot;Content-Type: application/json&quot; -X GET h=
ttps://${bmc}/redfish/v1/Syst</span><span style=3D"color:rgb(80,0,80)">ems/=
system=C2=A0</span><span style=3D"color:rgb(80,0,80)">https://${bmc}/redfis=
h/v1/Syst</span><span style=3D"color:rgb(80,0,80)">ems/system</span><br></d=
iv><div><br></div><div>Thanks,</div><div>Sharad</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Oct 2021 a=
t 00:23, Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com">edtanous@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Oct 5, 2021 at 11:48 AM John Broadbent &lt;<a href=3D"mailto:=
jebr@google.com" target=3D"_blank">jebr@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 5, 2021 at 1:42 AM sharad yadav &lt;<a href=3D"mailto:shar=
ad.openbmc@gmail.com" target=3D"_blank">sharad.openbmc@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; We have tried to measure redfish APIs performance benchmarking on =
AST2600.<br>
&gt;&gt; On redfish GET request there is a penalty added for ~100ms on TLS =
handshake at<br>
<br>
This is a little higher than I would&#39;ve expected, but not outside the<b=
r>
realm of reasonable.=C2=A0 Can you triage what cipher suite you&#39;re<br>
negotiating between the client and server?=C2=A0 Are you using a DH+EC key<=
br>
cipher?=C2=A0 That should be faster than RSA.<br>
<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/http/http=
_connection.hpp#L297" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/bmcweb/blob/master/http/http_connection.hpp#L297</a><br>
&gt;&gt;<br>
&gt;&gt; On trying below all methods, each request calls `async_handshake` =
which adds 100ms delay<br>
&gt;&gt; before the actual redfish handler code gets called.<br>
&gt;&gt; Method 1:<br>
&gt;&gt; curl --insecure -X POST -D headers.txt https://${bmc}/redfish/v1/S=
essionService/Sessions -d=C2=A0 =C2=A0 &#39;{&quot;UserName&quot;:&quot;roo=
t&quot;, &quot;Password&quot;:&quot;0penBmc&quot;}&#39;<br>
&gt;&gt; export token=3D&lt;Read X-Auth-Token from the headers.txt&gt;<br>
&gt;&gt; curl -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Type:=
 application/json&quot; -X GET https://${bmc}/redfish/v1/Systems/system<br>
&gt;&gt;<br>
&gt;&gt; Method 2:<br>
&gt;&gt; export token=3D`curl -k -H &quot;Content-Type: application/json&qu=
ot; -X POST https://${bmc}/login -d &#39;{&quot;username&quot; : &quot;root=
&quot;, &quot;password&quot; : &quot;0penBmc&quot;}&#39; | grep token | awk=
 &#39;{print $2;}&#39; | tr -d &#39;&quot;&#39;`<br>
&gt;&gt; curl -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Type:=
 application/json&quot; -X GET https://${bmc}/redfish/v1/Systems/system<br>
&gt;&gt;<br>
&gt;&gt; Method 3:<br>
&gt;&gt; curl https://${bmc}/redfish/v1/Systems/system --insecure -u root:0=
penBmc -L<br>
&gt;&gt;<br>
&gt;&gt; We want to avoid this ~100ms delay for better performance.<br>
&gt;&gt; Please suggest if there is a way to skip the `async_handshake` cal=
l by modifying the requests method?<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Sharad<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; There is logic in the crow::connection object that should allow you to=
 use tcp keep-alive and avoid the handshake in start.<br>
&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/http/http_con=
nection.hpp#L694" rel=3D"noreferrer" target=3D"_blank">https://github.com/o=
penbmc/bmcweb/blob/master/http/http_connection.hpp#L694</a><br>
&gt;<br>
&gt; I have looked at the connection class in bmcweb before, and found it d=
ifficult to understand.<br>
&gt; However, this is a simplified version of the states within the connect=
ion class:<br>
&gt;<br>
&gt; start-&gt;doReadHeaders-&gt;doRead-&gt;handle-&gt;completeRequest-&gt;=
doWrite[if keep alive]-&gt;doReadHeaders<br>
&gt;<br>
&gt; The async_handshake is in the start, so if you are able to use the sam=
e connection, you should only pay for the handshake once.<br>
&gt; Ed Tanous and Gunnar Mills are the definitive experts.<br>
<br>
Yep, John got this exactly right.=C2=A0 Make sure whatever client you&#39;r=
e<br>
using is taking advantage of keepalive, and you will only take this<br>
TLS performance hit for the first request.<br>
<br>
&gt;<br>
&gt;<br>
&gt; Let us know what you find.<br>
&gt; Thank you<br>
</blockquote></div>

--000000000000a7404705ce14d536--
