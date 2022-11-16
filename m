Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B083962C6E1
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 18:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9cZ2lPgz3f6g
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMbTIVHb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=sharad.openbmc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMbTIVHb;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9XV0rs6z3f8P
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 04:49:13 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id y16so31128167wrt.12
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 09:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tiOxRTEyjzuAOqjMhqDjIJC914MHGJvtLYIvRiZmF4A=;
        b=eMbTIVHblqpTm+ZFEw2dSJg7jUZ4cCQmtRei0KxFHCzJPbQCr2dgAIp46mZD+NhcVG
         f/b+td32RZZ3yPn+bYWxjX9gWYAdQjWJw+P+rvUIvkTVTIJXaAHjtXCswnbIrJ3DmrTn
         azk9gz1t3uVIof0PvHwSh2jjEHopaS56O37eiYfyDC6KrOcpsjFeb+1AoVpsYOqaewpA
         uYFmYnLFkPoTVgKMkQhMhn0yvN2g90CycfkNFQbXL67ZwJS14h+xHxgEcdiS0OF0RRrT
         UyzTEPrIjjmoU5JKjHXUg5ugxGz0E6KZYlUZQQRXwM+YC2BzfB8unvtDA4XSu/vuJwM/
         X2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiOxRTEyjzuAOqjMhqDjIJC914MHGJvtLYIvRiZmF4A=;
        b=ilfrL21LWGmtfbKrm1LWLiNkUiJn+9ut5pjqqsFRJ092gTRZ9RKF9YaZosr66sHivO
         dsPrz0g17NgVdfv+yiIwzMeApq85CdAXhV/IINIP97HMIiuT6rVusQmQ6MT17VAHhX6P
         vrMtPVO2gLl/Lph64bWJH0XNp3/fpuirsNIaqrhkPgdM1Tw/bQxkmLZ1Or6YB+zHv9Yp
         cFTPL1kLxMth8kbA+sf8zYqILm/axB3kaD7sTKm2ZCNVGMCDkYFaC/P8vE4vw9IRJhw3
         YplCnyNk2dZKCsUsZJOUfVyu8DanA49TenT8AF+veBkHvL8b2nW5WB76Tclcw4dDHHRB
         gNPA==
X-Gm-Message-State: ANoB5pky0n7MrbHTE0JuqRKSUSi1REiUtk7xCzMDzP9W/Fydvs0JdFKn
	FHmJTP7VGMFTM5d7pPFho2qBEL3sRuoASq3+4PWMTiylzXvRiw5c
X-Google-Smtp-Source: AA0mqf64R6Nhb69FD5GpmK6UXL4iFRRs99wTmjDTp71fNIk6zHBz/Pirb872qTZn8Uy5rHJdZIkwnzbZq0xRL1H+47s=
X-Received: by 2002:adf:f606:0:b0:236:8a0:2d76 with SMTP id
 t6-20020adff606000000b0023608a02d76mr14303472wrp.28.1668620946045; Wed, 16
 Nov 2022 09:49:06 -0800 (PST)
MIME-Version: 1.0
References: <CA+H48BRsTM4B_MHreMZG+_9abbjp5G2jcxmiMwqiPGrFytWWTg@mail.gmail.com>
 <CAH2-KxABvChOBiOPqMZfjhCfByBJj0=h0PKZ6HcATZoEoYkUqQ@mail.gmail.com>
In-Reply-To: <CAH2-KxABvChOBiOPqMZfjhCfByBJj0=h0PKZ6HcATZoEoYkUqQ@mail.gmail.com>
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Wed, 16 Nov 2022 23:18:54 +0530
Message-ID: <CA+H48BTnEp5w-LgnswBgtxxLMbkCyLPs7cL7bAOsic7Tuix=Sw@mail.gmail.com>
Subject: Re: Performance: BMCWEB prioritizing URI response in multiple redfish
 clients environment
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="000000000000c0fd1705ed9a1638"
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

--000000000000c0fd1705ed9a1638
Content-Type: text/plain; charset="UTF-8"

Thanks for your response. Responses inline.

>  Can you elaborate on which URLs your clients are accessing?  Is this
>  on an upstream SHA1 of bmcweb?  Do said clients implement HTTP
>  keep-alive?  Keep-alive is important, because otherwise the bmc is
>  negotiating TLS for every request, which can be quite slow, especially
>  when done in parallel.

We are at the latest bmcweb upstream code.
We have 4 type of clients collecting set of URIs:
All thermals: /redfish/v1/Chassis/<str>/Thermal/
All other sensors: /redfish/v1/Chassis/<str>/Sensors/<str>/
All inventory: /redfish/v1/Chassis/<str>/ and
/redfish/v1/Systems/<str>/Processors/<str>/
Log services: /redfish/v1/Systems/<str>/LogServices/EventLog/ and
/redfish/v1/Systems/<str>/LogServices/EventLog/Entries/
/redfish/v1/Systems/<str>/LogServices/EventLog/Entries/<str>/

All clients implement keep-alive so clients avoid the TLS handshake penalty.

>  I'm not sure how a priority system would work in this case.  Can you
>  elaborate on your idea?  There is currently no queue outside of the
>  TCP kernel, and async tasks in io_context.  Which queue were you
>  planning on assigning priorities to?

We want to prioritize our thermal sensor URI.
Is there a way to prioritize HTTP requests over D-Bus response messages
in bmcweb?

Thanks,
Sharad

On Wed, 16 Nov 2022 at 21:59, Ed Tanous <edtanous@google.com> wrote:

> On Wed, Nov 16, 2022 at 5:28 AM sharad yadav <sharad.openbmc@gmail.com>
> wrote:
> >
> > Hi All,
> >
> > We are facing a delay(till 6seconds) in bmcweb URIs responses when there
> are multiple clients(4 in our case) performing GET requests in parallel on
> different URIs.
>
> Can you elaborate on which URLs your clients are accessing?  Is this
> on an upstream SHA1 of bmcweb?  Do said clients implement HTTP
> keep-alive?  Keep-alive is important, because otherwise the bmc is
> negotiating TLS for every request, which can be quite slow, especially
> when done in parallel.
>
> Can you put together an example script that reproduces the issue?
>
> > We have a very important telemetry URI, used for thermal monitoring. On
> standalone, telemetry URI response is within 200ms.
> > But with multiple clients, telemetry URI response reaches till 6seconds.
> >
> > Can we get help on how we can assign priority to our telemetry URI over
> other URIs in bmcweb?
>
> I'm not sure how a priority system would work in this case.  Can you
> elaborate on your idea?  There is currently no queue outside of the
> TCP kernel, and async tasks in io_context.  Which queue were you
> planning on assigning priorities to?
>
> >
> > Thanks,
> > Sharad
> >
> >
> >
> >
> >
> >
>

--000000000000c0fd1705ed9a1638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for your response. Responses inline.</div><div=
><br></div><font color=3D"#e06666">&gt;=C2=A0 Can you elaborate on which UR=
Ls your clients are accessing?=C2=A0 Is this<br>&gt;=C2=A0 on an upstream S=
HA1 of bmcweb?=C2=A0 Do said clients implement HTTP<br>&gt;=C2=A0 keep-aliv=
e?=C2=A0 Keep-alive is important, because otherwise the bmc is<br>&gt;=C2=
=A0 negotiating TLS for every request, which can be quite slow, especially<=
br>&gt;=C2=A0 when done in parallel.</font><br><div><br></div><div>We are a=
t the latest bmcweb upstream code.</div><div>We have 4 type of clients coll=
ecting set of URIs:</div><div>All thermals:=C2=A0<span style=3D"color:rgb(1=
0,48,105);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:=
pre">/redfish/v1/Chassis/&lt;str&gt;/Thermal/</span></div><div>All other se=
nsors:=C2=A0<span style=3D"color:rgb(10,48,105);font-family:ui-monospace,SF=
Mono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;=
,monospace;font-size:12px;white-space:pre">/redfish/v1/Chassis/&lt;str&gt;/=
Sensors/&lt;str&gt;/</span><br></div><div>All inventory: /<span style=3D"co=
lor:rgb(10,48,105);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&qu=
ot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;whi=
te-space:pre">redfish/v1/Chassis/&lt;str&gt;/ and </span><span style=3D"col=
or:rgb(10,48,105);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quo=
t;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;whit=
e-space:pre">/redfish/v1/Systems/&lt;str&gt;/Processors/&lt;str&gt;/</span>=
</div><div>Log services:=C2=A0<span style=3D"color:rgb(10,48,105);font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:12px;white-space:pre">/redfish/v1/Sy=
stems/&lt;str&gt;/LogServices/EventLog/ and </span><span style=3D"color:rgb=
(10,48,105);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Men=
lo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-spac=
e:pre">/redfish/v1/Systems/&lt;str&gt;/LogServices/EventLog/Entries/</span>=
</div><div><span style=3D"color:rgb(10,48,105);font-family:ui-monospace,SFM=
ono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,=
monospace;font-size:12px;white-space:pre">/redfish/v1/Systems/&lt;str&gt;/L=
ogServices/EventLog/Entries/&lt;str&gt;/</span></div><div><br></div><div>Al=
l clients implement keep-alive so clients avoid the=C2=A0TLS handshake pena=
lty.</div><div><br></div><div><font color=3D"#e06666">&gt;=C2=A0 I&#39;m no=
t sure how a priority system would work in this case.=C2=A0 Can you<br>&gt;=
=C2=A0 elaborate on your idea?=C2=A0 There is currently no queue outside of=
 the<br>&gt;=C2=A0 TCP kernel, and async tasks in io_context.=C2=A0 Which q=
ueue were you<br>&gt;=C2=A0 planning on assigning priorities to?</font><br>=
</div><div><br></div><div>We want to prioritize our thermal sensor URI.</di=
v><div>Is there a way to prioritize HTTP requests over D-Bus response messa=
ges in=C2=A0bmcweb?</div><div><br></div><div>Thanks,</div><div>Sharad</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, 16 Nov 2022 at 21:59, Ed Tanous &lt;<a href=3D"mailto:edtanous@goog=
le.com">edtanous@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, Nov 16, 2022 at 5:28 AM sharad yadav &lt=
;<a href=3D"mailto:sharad.openbmc@gmail.com" target=3D"_blank">sharad.openb=
mc@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt; We are facing a delay(till 6seconds) in bmcweb URIs responses when the=
re are multiple clients(4 in our case) performing GET requests in parallel =
on different URIs.<br>
<br>
Can you elaborate on which URLs your clients are accessing?=C2=A0 Is this<b=
r>
on an upstream SHA1 of bmcweb?=C2=A0 Do said clients implement HTTP<br>
keep-alive?=C2=A0 Keep-alive is important, because otherwise the bmc is<br>
negotiating TLS for every request, which can be quite slow, especially<br>
when done in parallel.<br>
<br>
Can you put together an example script that reproduces the issue?<br>
<br>
&gt; We have a very important telemetry URI, used for thermal monitoring. O=
n standalone, telemetry URI response is within 200ms.<br>
&gt; But with multiple clients, telemetry URI response reaches till 6second=
s.<br>
&gt;<br>
&gt; Can we get help on how we can assign priority to our telemetry URI ove=
r other URIs in bmcweb?<br>
<br>
I&#39;m not sure how a priority system would work in this case.=C2=A0 Can y=
ou<br>
elaborate on your idea?=C2=A0 There is currently no queue outside of the<br=
>
TCP kernel, and async tasks in io_context.=C2=A0 Which queue were you<br>
planning on assigning priorities to?<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Sharad<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000c0fd1705ed9a1638--
