Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04008E3B56
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 20:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbtT34ZNzDqDZ
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 05:51:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CJKbvB1t"; 
 dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZ221g9XzDqWr
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 04:27:37 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id p8so13443556ilp.2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMQBYZ98vf9sJdFWbY2UF/kdJkJxSlz+mP/Ne98ugNY=;
 b=CJKbvB1t2y2by9+WGVEO8surQcM4GVpYvzlP6dfR1yLOD1tULfc4o5edaznQ39j5Uj
 jT8usR6iSYA7QBvqXPPiJ8IYdNCumA5xdnbOs19z35J28uVSaHW2v3tCuXVJlYjVcN6P
 VCCHkgaWRnAa4h1zbRa13RcuJRVTEVA/agr8hATKoNtitBo46FPu+id16DmjatUwY605
 Aovp29Cv/bLaYlL2v/shHzLGdI/CuggLHAjAiOkIp5k/Oo9Wx2Mgjrbikz3nEdgW6T8E
 QjTb+PhhH8Lz6uCxsnO0GI1k1BtngW6tU4algWaVPpQhZBW9KYL89eHwl/Cpt7IDcfkP
 LLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMQBYZ98vf9sJdFWbY2UF/kdJkJxSlz+mP/Ne98ugNY=;
 b=oZO70dsZCVgX1F7LPslTtoUo2vlGNtlyG+jKA9JWBpsHT5+JP4WHhBuS5mjYAhAmie
 AQB+3Erz78KwCWFGXr5wOJ9WN+GKlNvmEQdJB6WmN6Lr51uAt4pklASxbu7dP7dV+xR3
 UtU8dv7/ZDg+szFMtRuo0JiQRJN+erTJs1xkgmeGCMlADDgOgMwznlg3/EsALm4F/u+p
 DYAxLnqTZyHlDlZRVxHdAf08B9K2k6m3ZPHyJPKqpGY6edDF2P7wSVg5yRSjiJxwjoCn
 L7kdZl5mbE9hMY1/FPzHzN3N2vL4equUjL2t9b2gi475YDWsZluwBfTv0b4bbbRl/mDw
 VlIA==
X-Gm-Message-State: APjAAAWla7ere7DKtQPQXsMZT/tbM1QJGMQ8khMiafKJu8Ua2uat/+LZ
 PBBxW8m/EBqYJ7DVRQgjG27v6isOIK/OLg7+nEQ23g==
X-Google-Smtp-Source: APXvYqzvbga2hkm78r29YIIVlqyxBHxBLFJ5Pm0MTWut8qCJm/C9aB9+EjXNcR44uJ9sUNpkkyboWdWmKti+cdwPQVI=
X-Received: by 2002:a92:690d:: with SMTP id e13mr4135996ilc.287.1571938052298; 
 Thu, 24 Oct 2019 10:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
In-Reply-To: <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 24 Oct 2019 10:27:05 -0700
Message-ID: <CAGMNF6UOfyzArHhoaA7H30WhdYFaHOhbHiCtUx0U7S2xeM_ngg@mail.gmail.com>
Subject: Re: multiple telemetry designs
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000037ccb20595ab5920"
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
Cc: james.mihm@intel.com, thalerj@linux.vnet.ibm.com,
 Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, piotr.matuszczak@intel.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000037ccb20595ab5920
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 10:13 AM Shawn McCarney <shawnmm@linux.vnet.ibm.com>
wrote:

> I've reviewed both designs, although I cannot say I understand them both
> in depth.
>
> With that disclaimer, here is my 2 cents:
>
> * Both proposals are thoughtful with a lot work put into them.
>
> * bmcweb has a lot of a sensor code that is quite complex that is
> dependent on the current D-Bus sensors and associations.  It would
> require a lot of work and re-testing to ensure a different interface to
> sensor data doesn't break current systems.  The code would be even more
> complex if it had to support two different sensor data interfaces.
>
> * There are sensor readings that cannot be collected by reading files in
> the file system.  Some are collected by direct I2C reads or other
> methods.  If my surface understanding of collectd is correct, plug-ins
> would need to be written to handle these "non-file" sensors.
>
> * For the reasons above, I'd prefer to see D-Bus continue to be the
> "public API" to sensor data.  D-Bus is the central data sharing
> repository on the OpenBMC.  How the sensor data gets on D-Bus is
> implementation detail and can vary by system and by project.  It can be
> obtained by hwmon, collectd, and many other ways.  As long as it is
> published on D-Bus, other applications (like bmcweb) can easily consume it.
>
> * It sounds like the RRD format would be an efficient way to store
> sensor data.  I do worry about the space and CPU required to store
> telemetry data.  The OpenBMC stack is going to be used on some big
> servers, and they are going to have a large number of sensors.
>
> * Could the two proposals be merged, with D-Bus providing the public API
> to the data?  Maybe something like the following?  1) Continue to store
> current sensor values on D-Bus using the existing architecture.  Sensor
> values come from a variety of sources.  2) An application obtains
> current sensor values from D-Bus and stores them with timestamps in RRD
> to provide efficient history/telemetry.  3) A new D-Bus interface/method
> is created to obtain the history/telemetry data.  4) bmcweb uses the
> current D-Bus interfaces for the Sensor URIs (as it does today) and uses
> the new D-Bus interface/method for Telemetry URIs?
>
> Thanks,
>
> Shawn
>
>
(author of the collectd/RRD based design here)
First of all, I have been silent on the mailing list for a while, without
any progress on collectd. There are some fires that I need to put out
first, unfortunately :(

I have discussed with Piotr in the telemetry meeting. Basically we'd like
to rephrase it as this: Piotr's design doesn't prevent future extension
such as using collectd/rrdtool as a backend to provide telemetry data, and
I reviewed the Redfish API that the design would provide, which LGTM.
Therefore I +1'ed Piotr's design, given that there is already concrete work
behind it, and collectd didn't work for his requirements.

To be able to merge the designs, either Bmcweb can use RRD library or
collectd/librrd can talk D-Bus, which is some work but not insurmountable.
Piotr maybe you want to call that out explicitly in your design doc?

Regards,
Kun

--00000000000037ccb20595ab5920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2019 at 10:13 AM Shaw=
n McCarney &lt;<a href=3D"mailto:shawnmm@linux.vnet.ibm.com">shawnmm@linux.=
vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">I&#39;ve reviewed both designs, although I cannot say I underst=
and them both <br>
in depth.<br>
<br>
With that disclaimer, here is my 2 cents:<br>
<br>
* Both proposals are thoughtful with a lot work put into them.<br>
<br>
* bmcweb has a lot of a sensor code that is quite complex that is <br>
dependent on the current D-Bus sensors and associations.=C2=A0 It would <br=
>
require a lot of work and re-testing to ensure a different interface to <br=
>
sensor data doesn&#39;t break current systems.=C2=A0 The code would be even=
 more <br>
complex if it had to support two different sensor data interfaces.<br>
<br>
* There are sensor readings that cannot be collected by reading files in <b=
r>
the file system.=C2=A0 Some are collected by direct I2C reads or other <br>
methods.=C2=A0 If my surface understanding of collectd is correct, plug-ins=
 <br>
would need to be written to handle these &quot;non-file&quot; sensors.<br>
<br>
* For the reasons above, I&#39;d prefer to see D-Bus continue to be the <br=
>
&quot;public API&quot; to sensor data.=C2=A0 D-Bus is the central data shar=
ing <br>
repository on the OpenBMC.=C2=A0 How the sensor data gets on D-Bus is <br>
implementation detail and can vary by system and by project.=C2=A0 It can b=
e <br>
obtained by hwmon, collectd, and many other ways.=C2=A0 As long as it is <b=
r>
published on D-Bus, other applications (like bmcweb) can easily consume it.=
<br>
<br>
* It sounds like the RRD format would be an efficient way to store <br>
sensor data.=C2=A0 I do worry about the space and CPU required to store <br=
>
telemetry data.=C2=A0 The OpenBMC stack is going to be used on some big <br=
>
servers, and they are going to have a large number of sensors.<br>
<br>
* Could the two proposals be merged, with D-Bus providing the public API <b=
r>
to the data?=C2=A0 Maybe something like the following?=C2=A0 1) Continue to=
 store <br>
current sensor values on D-Bus using the existing architecture.=C2=A0 Senso=
r <br>
values come from a variety of sources.=C2=A0 2) An application obtains <br>
current sensor values from D-Bus and stores them with timestamps in RRD <br=
>
to provide efficient history/telemetry.=C2=A0 3) A new D-Bus interface/meth=
od <br>
is created to obtain the history/telemetry data.=C2=A0 4) bmcweb uses the <=
br>
current D-Bus interfaces for the Sensor URIs (as it does today) and uses <b=
r>
the new D-Bus interface/method for Telemetry URIs?<br>
<br>
Thanks,<br>
<br>
Shawn<br>
<br>
</blockquote></div><div><br></div>(author of the collectd/RRD based design =
here)<div>First of all, I have been silent on the mailing list for a while,=
 without any progress on collectd. There are some fires that I need to put =
out first, unfortunately :(</div><div><br><div>I have discussed with Piotr =
in the telemetry meeting. Basically we&#39;d like to rephrase it as this: P=
iotr&#39;s design doesn&#39;t prevent future extension such as using collec=
td/rrdtool as a backend to provide telemetry data, and I reviewed the Redfi=
sh API that the design would provide,=C2=A0which LGTM. Therefore I +1&#39;e=
d Piotr&#39;s design, given that there is already concrete work behind it, =
and collectd didn&#39;t work for his requirements.</div><div><br></div><div=
>To be able to merge the designs, either Bmcweb=C2=A0can use RRD library or=
 collectd/librrd can talk D-Bus, which is some work but not insurmountable.=
 Piotr maybe you want to call that out explicitly in your design doc?</div>=
<div><div><br></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr">Regards,<div>Kun</div></div></div></div></div></div>

--00000000000037ccb20595ab5920--
