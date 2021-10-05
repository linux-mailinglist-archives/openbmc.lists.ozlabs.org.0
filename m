Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E172422103
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 10:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNrgn0WD2z2ygB
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 19:42:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B1VHiMg/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=sharad.openbmc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B1VHiMg/; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNrgJ59nwz2yJM
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 19:42:19 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id s69so25192564oie.13
 for <openbmc@lists.ozlabs.org>; Tue, 05 Oct 2021 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CCqCJetBQfFt80sNrYA75WQhNzTMGy2UxbSGQ1D/bzs=;
 b=B1VHiMg/2BsBAAwq4KogUfoGPdV2IitWAC6s5pd70wVuij6xkeEYxSsFYBew8DoRjy
 1Wd57x9kTTvMSMicgXzGa2bhpPcfU1U1XvaiG5SiYTUELUP4SdfZJDGePbw+pri5qCDB
 /7/eVEqSY57gjkVfzlWR9Ve1GGSQKHPe1qUgPbOm25KEnnsfBCgCkc7lDF364yV7pb81
 HN+FrUnPVHhRg1DTeaVYIf6H9UDOo7t0p8wQNac6LOEmHysYhO/FSeKk3q47qUBC6XG+
 +IXHLk9YZdG7pkGcWb5fY03kSged3qnAZBzIwjb9m1X+mI/XRFhZO3N918o/ebWgfhje
 pkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CCqCJetBQfFt80sNrYA75WQhNzTMGy2UxbSGQ1D/bzs=;
 b=z7VQ3RPkASGlsph7+YE9XVac0AN7W6DlsSDnamZp9tgkPlk+pvMb0FOalB+UDiuWv7
 YFgLm42FHYTcp3fd54eO7bssY0p2b9iEKfLTlnMbNIGYmBbplTyskJiEa2SIb2NQ8LAy
 F9tCBezRSFAJRpuYk2ug+go2ON53DFvwiQsJHsLCECwU8gXHZYMOSkQiUmjGJukJmU1F
 RelRr75q/PvPdqADHbUhkDH4V0KXmuK3IAy8xiKpXr27obeWsdyDebUgS1Ni+0gL+3J0
 SNTe6WP7MTOp/JC2hyvswnpwLonD3FBk4FyDUXAqsja3x60olq+2C1sUKljILVtXscTe
 mXHA==
X-Gm-Message-State: AOAM5307jGtHj+7P3rf8OQeZX4Hkp4nQVCmAKDiKurNnSrrL0v3UJguT
 7AlO68VmjmZ1kd5LHRbJQy6z3BL+J1hY2qeNpsfjQxpE1Kc=
X-Google-Smtp-Source: ABdhPJxIXDKVMVNPqeq4a5WHyOBLoAUfGE3E3xHeyxJHzc4Y2435Cp/L9v5q1laoauN4NpWd8OxNq6lRaIS/B0BaqeA=
X-Received: by 2002:a05:6808:2188:: with SMTP id
 be8mr1541134oib.44.1633423335131; 
 Tue, 05 Oct 2021 01:42:15 -0700 (PDT)
MIME-Version: 1.0
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Tue, 5 Oct 2021 14:12:04 +0530
Message-ID: <CA+H48BRUkTwQ-2NtJCQZrF_RyG3p9oUFzP4cqF5iVDEy-dh39A@mail.gmail.com>
Subject: Performance issue with redfish TLS handshake
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a88e1905cd9701fd"
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

--000000000000a88e1905cd9701fd
Content-Type: text/plain; charset="UTF-8"

Hi All,

We have tried to measure redfish APIs performance benchmarking on AST2600.
On redfish GET request there is a penalty added for ~100ms on TLS handshake
at
https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L297

On trying below all methods, each request calls `async_handshake` which
adds 100ms delay
before the actual redfish handler code gets called.
*Method 1:*
curl --insecure -X POST -D headers.txt
https://${bmc}/redfish/v1/SessionService/Sessions
-d    '{"UserName":"root", "Password":"0penBmc"}'
export token=<Read X-Auth-Token from the headers.txt>
curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X
GET https://${bmc}/redfish/v1/Systems/system

*Method 2:*
export token=`curl -k -H "Content-Type: application/json" -X POST
https://${bmc}/login
-d '{"username" : "root", "password" : "0penBmc"}' | grep token | awk
'{print $2;}' | tr -d '"'`
curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X
GET https://${bmc}/redfish/v1/Systems/system

*Method 3:*
curl https://${bmc}/redfish/v1/Systems/system --insecure -u root:0penBmc -L

We want to avoid this ~100ms delay for better performance.
Please suggest if there is a way to skip the `async_handshake` call by
modifying the requests method?

Thanks,
Sharad

--000000000000a88e1905cd9701fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>We have tried to measure redfis=
h APIs performance benchmarking=C2=A0on AST2600.</div><div>On redfish GET r=
equest there is a penalty added for ~100ms on TLS handshake at</div><div><a=
 href=3D"https://github.com/openbmc/bmcweb/blob/master/http/http_connection=
.hpp#L297">https://github.com/openbmc/bmcweb/blob/master/http/http_connecti=
on.hpp#L297</a><br></div><div><br></div><div>On trying below all methods, e=
ach request calls `<span style=3D"background-color:rgb(255,248,197);color:r=
gb(5,80,174);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Me=
nlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-spa=
ce:pre">async_handshake</span>` which adds 100ms delay</div><div>before the=
 actual redfish handler code gets called.</div><div><b>Method 1:</b></div><=
div>curl --insecure -X POST -D headers.txt https://${bmc}/redfish/v1/Sessio=
nService/Sessions -d=C2=A0=C2=A0=C2=A0=C2=A0&#39;{&quot;UserName&quot;:&quo=
t;root&quot;, &quot;Password&quot;:&quot;0penBmc&quot;}&#39;<br></div><div>=
export token=3D&lt;Read=C2=A0<span style=3D"background-color:rgba(175,184,1=
93,0.2);color:rgb(36,41,47);font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:13.6px">X-Auth-Token</span>=C2=A0from the headers.txt&gt;</div><div><span =
style=3D"font-size:11pt;font-family:Calibri">curl -k -H &quot;X-Auth-Token:=
 $token&quot; -H &quot;Content-Type: application/json&quot; -X GET https://=
${bmc}/redfish/v1/Systems/system</span><br></div><div><br></div><div><b>Met=
hod 2:</b></div><div><span style=3D"font-size:11pt;color:rgb(36,41,46);font=
-family:Calibri">export token=3D`curl -k -H &quot;Content-Type: application=
/json&quot; -X POST https://${bmc}/login -d &#39;{&quot;username&quot; : &q=
uot;root&quot;, &quot;password&quot; : &quot;0penBmc&quot;}&#39; | grep tok=
en | awk &#39;{print $2;}&#39; | tr -d &#39;&quot;&#39;`</span><br></div><d=
iv><span style=3D"font-family:Calibri;font-size:14.6667px">curl -k -H &quot=
;X-Auth-Token: $token&quot; -H &quot;Content-Type: application/json&quot; -=
X GET https://${bmc}/redfish/v1/Systems/system</span><span style=3D"font-si=
ze:11pt;color:rgb(36,41,46);font-family:Calibri"><br></span></div><div><br>=
</div><div><b>Method 3:</b></div><div><span style=3D"font-size:11pt;color:r=
gb(36,41,46);font-family:Calibri">curl https://${bmc}/redfish/v1/Systems/sy=
stem --insecure -u root:0penBmc -L</span></div><div><br></div><div>We want =
to avoid this ~100ms delay for=C2=A0better performance.</div><div>Please su=
ggest if there is a way to skip the `<span style=3D"background-color:rgb(25=
5,248,197);color:rgb(5,80,174);font-family:ui-monospace,SFMono-Regular,&quo=
t;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-s=
ize:12px;white-space:pre">async_handshake` </span>call by modifying the req=
uests method?</div><div><br></div><div>Thanks,</div><div>Sharad</div></div>

--000000000000a88e1905cd9701fd--
