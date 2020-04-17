Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840D1AD3B7
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 02:43:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493HQK37MlzDrcN
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 10:43:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gizthNxj; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493HPX1kvxzDr3B
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 10:42:55 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id u10so346730lfo.8
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 17:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=es/u4G9wBtiInlA4rZ20lpvnChW9DjV1sLSmQFNVFhk=;
 b=gizthNxjcOrkZTfiWTa4eX0x4UqVFdk5lKQk+VuE5jG7Xc83A8ic7oGcnOETwWBDRX
 ZjBvcKdpeHsaSkmlptRsY54TqnnGno9Csq8f7eg01EUk6Mb/ZTzmjjR8SaQdMyGKlPkB
 kPqlP1suA7mvwql9Bq6BEi0cRmmnmcyXKxIFPutN168CUB+jtS/Cc9I/qMF/VLErpg69
 RMH/TOqsQDjEbNS5F+HhEyH/ECnoHvs2QZghjg2FgcMTymff2IWQjny4yjWlVnG4HQsq
 UJEOLXcvpl5aAC1yUbEj2nuFqy7nDLIpWoB4sIXx2dRwq6JO8cn69qg7aZHQ4lf4wVU6
 0T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=es/u4G9wBtiInlA4rZ20lpvnChW9DjV1sLSmQFNVFhk=;
 b=k2IWaHAUrs+W6LHe0Z+c5Vld58w08gOVBnsuEC24DNSKy90Ve9l7Ty4pp9mGK6EhRm
 U12dZxaSB7hzXpJ9HwFQEbqOUA2D+T0GeVXUASoyjHCumAvbt4H1DvOLQPWg9TWlrike
 CD++CFKMsG3KTIIGQokXpSJlus++kUPpF8whGxbYCjl0qSR7ardFzHeqaVoktZDhJZ5z
 ZxcfNHypyH4ztRUVr71rkCTynxEhzwEZTjff8RFcrUlDXsStJR4Lfw0zHQdSENZC3hMu
 07oJMDOqm4fUhHwC05kCztCNkBD9CqxxbSr8Nxdf5FLweC4CG8F25wl2TzYALgrYsfuE
 BwhQ==
X-Gm-Message-State: AGi0PuYOriIlm0sDksz9pVLyuQhsVcNzjBlzxFTSpIZw/1r7GAsm9Vky
 5g/r1F6xWBdPu1/g3Vf8tQihyg7BrBmly9ScA4YLDA==
X-Google-Smtp-Source: APiQypKvLCYlokc7te3s5Ins+b3xfPLuomFmyusffxB4j3NqEoaFavAzk3DKqNJkwZXKr8pxz8n020qD9kIEpJMP32k=
X-Received: by 2002:a2e:8884:: with SMTP id k4mr439001lji.267.1587084169331;
 Thu, 16 Apr 2020 17:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
 <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
 <20200416204010.GD443018@heinlein.lan.stwcx.xyz>
In-Reply-To: <20200416204010.GD443018@heinlein.lan.stwcx.xyz>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 16 Apr 2020 17:42:37 -0700
Message-ID: <CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com>
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000024b96705a371d4a6"
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000024b96705a371d4a6
Content-Type: text/plain; charset="UTF-8"

>
>
> > >> mDNS is used more in the UNIX world, SSDP is used more in Windows.
> > >>
> > Was on the Redfish call earlier and this forum thread was discussed. The
> > Redfish members on the call did not totally agree with this statement.
> > They believe SSDP has a wider adaption than just Windows. A wider
> > adaption than mDNS.  Since SSDP is already in the Redfish specification
> > and has been adapted by Redfish implementations, adding a 2nd discovery
> > service would damage interoperability in Redfish.
>
> I'm not really interested in a debate on this point, but I'm not finding
> much evidence to back it up.  Can anyone point to well-used OSS
> implementation of SSDP?  The only thing I can find is gssdp, which seems
> to require a lot of Gnome components; not something we could easily pull
> in on the BMC.
>
> The only thing besides gssdp is this
https://github.com/troglobit/ssdp-responder, but that's only one
(presumably easier) half.


> > The members on the call really wanted to encourage OpenBMC to implement
> > SSDP instead.
>
> It probably isn't a bad thing to be able to support SSDP, don't get me
> wrong, but "instead"?  Why would we want to take away service
> advertisement functionality, unless someone wants to explicitly disable it?
>
> I can understand if they don't want to document, in the standard, a way to
> advertise the Redfish service over mDNS, but isn't that a different
> problem from what we're asking for?  Aren't we asking for a method to
> manage the enablement of services on the BMC, specifically our mDNS
> service?  So, if we still have mDNS, don't we need a way to configure it
> through Redfish?
>
> I see your point here.  I guess there might be some implicit assumption
that adding it to a schema implies endorsement elsewhere.
Discovery is probably an area where supporting a diversity of protocols is
better than making a single choice.

--00000000000024b96705a371d4a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
&gt; &gt;&gt; mDNS is used more in the UNIX world, SSDP is used more in Win=
dows.<br>
&gt; &gt;&gt;<br>
&gt; Was on the Redfish call earlier and this forum thread was discussed. T=
he <br>
&gt; Redfish members on the call did not totally agree with this statement.=
 <br>
&gt; They believe SSDP has a wider adaption than just Windows. A wider <br>
&gt; adaption than mDNS.=C2=A0 Since SSDP is already in the Redfish specifi=
cation <br>
&gt; and has been adapted by Redfish implementations, adding a 2nd discover=
y <br>
&gt; service would damage interoperability in Redfish.<br>
<br>
I&#39;m not really interested in a debate on this point, but I&#39;m not fi=
nding<br>
much evidence to back it up.=C2=A0 Can anyone point to well-used OSS<br>
implementation of SSDP?=C2=A0 The only thing I can find is gssdp, which see=
ms<br>
to require a lot of Gnome components; not something we could easily pull<br=
>
in on the BMC.<br>
<br></blockquote><div>The only thing besides gssdp is this=C2=A0<a href=3D"=
https://github.com/troglobit/ssdp-responder">https://github.com/troglobit/s=
sdp-responder</a>, but that&#39;s only one (presumably easier) half.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; The members on the call really wanted to encourage OpenBMC to implemen=
t <br>
&gt; SSDP instead.<br>
<br>
It probably isn&#39;t a bad thing to be able to support SSDP, don&#39;t get=
 me<br>
wrong, but &quot;instead&quot;?=C2=A0 Why would we want to take away servic=
e <br>
advertisement functionality, unless someone wants to explicitly disable it?=
<br>
<br>
I can understand if they don&#39;t want to document, in the standard, a way=
 to<br>
advertise the Redfish service over mDNS, but isn&#39;t that a different<br>
problem from what we&#39;re asking for?=C2=A0 Aren&#39;t we asking for a me=
thod to<br>
manage the enablement of services on the BMC, specifically our mDNS<br>
service?=C2=A0 So, if we still have mDNS, don&#39;t we need a way to config=
ure it<br>
through Redfish?<br><br></blockquote><div>I see your point here.=C2=A0 I gu=
ess there might be some implicit assumption that adding it to a schema impl=
ies endorsement elsewhere.=C2=A0</div><div>Discovery is probably an area wh=
ere supporting a diversity of protocols is better than making a single choi=
ce.</div></div></div>

--00000000000024b96705a371d4a6--
