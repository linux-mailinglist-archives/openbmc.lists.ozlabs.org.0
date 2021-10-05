Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D40423055
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 20:48:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP66P1zRfz2yw6
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 05:48:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fVQTNX2f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=fVQTNX2f; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP65z75dxz2yZv
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 05:47:49 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id b20so20609lfv.3
 for <openbmc@lists.ozlabs.org>; Tue, 05 Oct 2021 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Vs+/zl3JlB34k3XVtSBZ0PqvplR5B6SKhNQ2MzWRd6Q=;
 b=fVQTNX2fANmnRkiaNzL0QfnoLpaaa+HQFRTyyD3mC5Cb7eUXPE6e741bzO26Za8x2M
 IK9icJ9mO925RzOy9+8l61sEZ/Q2PokT6oyb3NA8VsGaKT8jttDZuXHyWXjaj5iK3p1n
 TdeXe2rVgG2WHgMut003BjTizsEbFvvArY7/rhmylB+lQl3u6zv7m4b0b0bj39lReGfH
 SqUilnz+IBnJkMiEquvVlvQ1dniMHND6BG4YPEhLJSqYwNhNM+imYhgtHqIT4dWklw73
 xAjnPbDfdVpWmPde5jOBMGETcDaZs4c0XiEvUD2XKdC4dfiCexb/AON+zj25BITDaE7D
 UZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Vs+/zl3JlB34k3XVtSBZ0PqvplR5B6SKhNQ2MzWRd6Q=;
 b=kGdLev1MP0fwLxY6IxF0O0noG7t6kxd/6bvW62hf6eMRCuZDrGB053KPJ7FJRWM9U7
 uHVafjVRwC4H6UlAhXalz4p/hipkJERuKeUxLb5KxNJkjibtJxdhx/lESQ0KszBrT7Kn
 SMi4NA8HL+4cxK4bUUPTWxd6XzRtBTFYhWhzryGrTm/TxfEkCmfq1isPzSLtMuElCdjb
 lkfw/iQFVo+VSTYSIpVzZLWED+cPBJTndFjdkibYK2n2g+SNz2srBej05pukkiWIPtzE
 seVG+OVJSzYye2C3gq80v7QyUMeXbyNzO2pFCHFTiM8bMVERyWIfaRsO65MrG2WLEOwz
 d6JA==
X-Gm-Message-State: AOAM532MY6DMcv575QhYi5Gv4yQ4mTAO7tPCS6DS3vsBPFAQNVUmJgxW
 KdKgLGT3vlL/BsD/F/uwO8cp8J9MhTEokJs5KOiLtw==
X-Google-Smtp-Source: ABdhPJy3QbVf7EW0nHyXkWNv2CHytQsrfTqmthBe02nz8NZw4W2L8SwUrdjq0gICI8dEo7WrfGuYl7LdJdUHX8m9XHY=
X-Received: by 2002:a2e:1404:: with SMTP id u4mr24125078ljd.269.1633459662562; 
 Tue, 05 Oct 2021 11:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+H48BRUkTwQ-2NtJCQZrF_RyG3p9oUFzP4cqF5iVDEy-dh39A@mail.gmail.com>
In-Reply-To: <CA+H48BRUkTwQ-2NtJCQZrF_RyG3p9oUFzP4cqF5iVDEy-dh39A@mail.gmail.com>
From: John Broadbent <jebr@google.com>
Date: Tue, 5 Oct 2021 11:47:31 -0700
Message-ID: <CAPw1Ef-nyZB1JJax2Ca=z5hWoBxAg59WoFCKLA4TG+Ln0WyMFQ@mail.gmail.com>
Subject: Re: Performance issue with redfish TLS handshake
To: sharad yadav <sharad.openbmc@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Anuraag Bharadwaj <anuraagb@google.com>
Content-Type: multipart/alternative; boundary="000000000000f1c35605cd9f76de"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f1c35605cd9f76de
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 1:42 AM sharad yadav <sharad.openbmc@gmail.com>
wrote:

> Hi All,
>
> We have tried to measure redfish APIs performance benchmarking on AST2600.
> On redfish GET request there is a penalty added for ~100ms on TLS
> handshake at
> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L297
>
> On trying below all methods, each request calls `async_handshake` which
> adds 100ms delay
> before the actual redfish handler code gets called.
> *Method 1:*
> curl --insecure -X POST -D headers.txt https://${bmc}/redfish/v1/SessionService/Sessions
> -d    '{"UserName":"root", "Password":"0penBmc"}'
> export token=<Read X-Auth-Token from the headers.txt>
> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X
> GET https://${bmc}/redfish/v1/Systems/system
>
> *Method 2:*
> export token=`curl -k -H "Content-Type: application/json" -X POST https://${bmc}/login
> -d '{"username" : "root", "password" : "0penBmc"}' | grep token | awk
> '{print $2;}' | tr -d '"'`
> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X
> GET https://${bmc}/redfish/v1/Systems/system
>
> *Method 3:*
> curl https://${bmc}/redfish/v1/Systems/system --insecure -u root:0penBmc
> -L
>
> We want to avoid this ~100ms delay for better performance.
> Please suggest if there is a way to skip the `async_handshake` call by
> modifying the requests method?
>
> Thanks,
> Sharad
>



There is logic in the crow::connection object that should allow you to use
tcp keep-alive and avoid the handshake in start.
https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L694

I have looked at the connection class in bmcweb before, and found it
difficult to understand.
However, this is a simplified version of the states within the connection
class:

start->doReadHeaders->doRead->handle->completeRequest->doWrite[if keep
alive]->doReadHeaders

The async_handshake is in the start, so if you are able to use the same
connection, you should only pay for the handshake once.
Ed Tanous and Gunnar Mills are the definitive experts.

Let us know what you find.
Thank you

--000000000000f1c35605cd9f76de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 1:42 AM sharad=
 yadav &lt;<a href=3D"mailto:sharad.openbmc@gmail.com">sharad.openbmc@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr">Hi All,<div><br></div><div>We have tried to measure re=
dfish APIs performance benchmarking=C2=A0on AST2600.</div><div>On redfish G=
ET request there is a penalty added for ~100ms on TLS handshake at</div><di=
v><a href=3D"https://github.com/openbmc/bmcweb/blob/master/http/http_connec=
tion.hpp#L297" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/mas=
ter/http/http_connection.hpp#L297</a><br></div><div><br></div><div>On tryin=
g below all methods, each request calls `<span style=3D"background-color:rg=
b(255,248,197);color:rgb(5,80,174);font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:12px;white-space:pre-wrap">async_handshake</span>` which adds 100ms=
 delay</div><div>before the actual redfish handler code gets called.</div><=
div><b>Method 1:</b></div><div>curl --insecure -X POST -D headers.txt https=
://${bmc}/redfish/v1/SessionService/Sessions -d=C2=A0=C2=A0=C2=A0=C2=A0&#39=
;{&quot;UserName&quot;:&quot;root&quot;, &quot;Password&quot;:&quot;0penBmc=
&quot;}&#39;<br></div><div>export token=3D&lt;Read=C2=A0<span style=3D"back=
ground-color:rgba(175,184,193,0.2);color:rgb(36,41,47);font-family:ui-monos=
pace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mon=
o&quot;,monospace;font-size:13.6px">X-Auth-Token</span>=C2=A0from the heade=
rs.txt&gt;</div><div><span style=3D"font-size:11pt;font-family:Calibri">cur=
l -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Type: application=
/json&quot; -X GET https://${bmc}/redfish/v1/Systems/system</span><br></div=
><div><br></div><div><b>Method 2:</b></div><div><span style=3D"font-size:11=
pt;color:rgb(36,41,46);font-family:Calibri">export token=3D`curl -k -H &quo=
t;Content-Type: application/json&quot; -X POST https://${bmc}/login -d &#39=
;{&quot;username&quot; : &quot;root&quot;, &quot;password&quot; : &quot;0pe=
nBmc&quot;}&#39; | grep token | awk &#39;{print $2;}&#39; | tr -d &#39;&quo=
t;&#39;`</span><br></div><div><span style=3D"font-family:Calibri;font-size:=
14.6667px">curl -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Typ=
e: application/json&quot; -X GET https://${bmc}/redfish/v1/Systems/system</=
span><span style=3D"font-size:11pt;color:rgb(36,41,46);font-family:Calibri"=
><br></span></div><div><br></div><div><b>Method 3:</b></div><div><span styl=
e=3D"font-size:11pt;color:rgb(36,41,46);font-family:Calibri">curl https://$=
{bmc}/redfish/v1/Systems/system --insecure -u root:0penBmc -L</span></div><=
div><br></div><div>We want to avoid this ~100ms delay for=C2=A0better perfo=
rmance.</div><div>Please suggest if there is a way to skip the `<span style=
=3D"background-color:rgb(255,248,197);color:rgb(5,80,174);font-family:ui-mo=
nospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation =
Mono&quot;,monospace;font-size:12px;white-space:pre-wrap">async_handshake` =
</span>call by modifying the requests method?</div><div><br></div><div>Than=
ks,</div><div>Sharad</div></div></blockquote><div><br></div><div><br></div>=
<br>There is logic in the crow::connection object that should allow you to =
use tcp keep-alive and avoid the handshake in start.<br><a href=3D"https://=
github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L694">https:=
//github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L694</a><b=
r>=C2=A0<br>I have looked at the connection class in bmcweb before, and fou=
nd it difficult to understand. <br>However, this is a simplified version of=
 the states within the connection class:<br>=C2=A0<br>start-&gt;doReadHeade=
rs-&gt;doRead-&gt;handle-&gt;completeRequest-&gt;doWrite[if keep alive]-&gt=
;doReadHeaders<br>=C2=A0<br>The async_handshake is in the start, so if you =
are able to use the same connection, you should only pay for the handshake =
once. <br><div>Ed Tanous and Gunnar Mills are the definitive experts.=C2=A0=
</div><div><br></div><div>Let us know what you find.=C2=A0</div><div>Thank =
you</div></div></div>

--000000000000f1c35605cd9f76de--
