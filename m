Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4371AD135
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 22:37:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939xj4394zDrDY
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 06:36:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eI655q38; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939wh0C0ZzDr85
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 06:36:03 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id v9so9266748ljk.12
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJhTsqb6AYfvHspDHU0c4ac7l7HwidLVJveUQ2KQOBk=;
 b=eI655q38mT3iX/STv3Xv++/DzlWf80MGXgB8V6Ncr0dkNGICH5C/aMXRakJww7QDAx
 I1zk3iPLR2z/ltFKtT8JcGhcdEHcSX2njMTqx398vHT0VSDH+xUJL4k3Sj8iTST/lPew
 SZp6LnaJ//driSxfzJ6CvPbMcyqh8SB77mMF8SOhcJ0x5A1C+PSdUxCn4kaeFQO+nwjv
 nhtwublA+IbDB1OpEtkXbmUXW7vmbgKBcNdYXH2oJSmaGW/dX1l8wi6LLyLrStR9Hf9j
 6v1FmmRHllZOpthh5bwO2yuiIcybZ7vLzed4ZxWqYmpaw/sEMK5QzoXQspXKjn6JNLm+
 M6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJhTsqb6AYfvHspDHU0c4ac7l7HwidLVJveUQ2KQOBk=;
 b=RrliMUkuwG2ks00r1b+1I0Oc89z+Iy17+Xi7zbs0wjRtRSEekg4oWPIVcpm0Xhlgcd
 /cmPpDL7u0j5fq6Vj6X8gx3IuNyDzkfH+JIt6XKpZ5BmKjHzsBoWFlSgiDeHYHpeu/34
 RRs49hPxfmYiQk8FqoR6mRXWPV0DEbMiDxyj0FcAIpZZ+6M1oc+in15BRT8NM0H/gQdl
 Xewr0wASYKsPaLvQhyrkWD4JqUwY6SGemcZr9P5HHFN03ipdP3aaGxw1kgUV22yy11f3
 7m+J1Sc9Ea7r6V+X45QpHkAYku1SZRogy2EH+oZEekKrd0lLT+rpxCdo1SoE/PMJo7cw
 itKA==
X-Gm-Message-State: AGi0PubtCDNaWWCXmlWiu/nVZv8ssrqjy8SJ+dMBq9VeH2Bo8aGMCZKr
 HlNXkmlJjL6PafxGPrQhpscMO4rBm1w4bby9LdvF9Q==
X-Google-Smtp-Source: APiQypIkgxnMKihhct9s8YXtoxriouFXj2Zzd1q+p0lhzLWE2I+uFI+MwordDRCT/ZWIHq2Zd1xSwJD2hXGGlYTG18w=
X-Received: by 2002:a2e:8884:: with SMTP id k4mr7635396lji.267.1587069358059; 
 Thu, 16 Apr 2020 13:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
 <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
In-Reply-To: <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 16 Apr 2020 13:35:46 -0700
Message-ID: <CAH1kD+ajHbZ5vB2rLb7zN-Zrtij=EtBuiMLfLeJW4tsN7=OfxQ@mail.gmail.com>
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000052a9fb05a36e61c9"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, ratagupt <ratagupt@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000052a9fb05a36e61c9
Content-Type: text/plain; charset="UTF-8"

>
>
> Was on the Redfish call earlier and this forum thread was discussed. The
> Redfish members on the call did not totally agree with this statement.
> They believe SSDP has a wider adaption than just Windows. A wider
> adaption than mDNS.  Since SSDP is already in the Redfish specification
> and has been adapted by Redfish implementations, adding a 2nd discovery
> service would damage interoperability in Redfish.
> The members on the call really wanted to encourage OpenBMC to implement
> SSDP instead.
> Posted the same to the forum thread.
>

Well that is unfortunate.

>
> >>> I want to allow the BMC admin to enable and disable the mDNS discovery
> >>> service.  How can this be done?  Options:
> >>> 1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
> >>> 2. Move OpenBMC to SSDP and away from mDNS.
> >>> 3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protocol.
> >> I don't see a strong reason to "move away" from mDNS, but I certainly
> >> think that *any* network service should be able to be disabled by an
> >> administrator to reduce the security footprint if the service is unused.
> >>
> >> So, either #1 or #3 seems best to me.  Adding optional SSDP support
> >> would
> >> be reasonable, but likely only to be added by someone who cares about
> >> discovery in a Windows environment.
> >
> > I've appended the thread to re-ask Redfish if they would support
> > ManagerNetworkProtocol.mDNS.
> > https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol
> >
> If think we are down to #1 or #2.
>

I'm trying to put myself in the mind of an administrator here, and I'd
expect most are relatively inflexible. Most hyperscalars probably have
their own discovery system, and are likely supporting that regardless of
our decision here.  Likewise smaller operations probably aren't super
interested in migrating here.

Can anyone speak to the merits of the two protocols? Is there are
technical benefit to moving to SSDP.

--00000000000052a9fb05a36e61c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
Was on the Redfish call earlier and this forum thread was discussed. The <b=
r>
Redfish members on the call did not totally agree with this statement. <br>
They believe SSDP has a wider adaption than just Windows. A wider <br>
adaption than mDNS.=C2=A0 Since SSDP is already in the Redfish specificatio=
n <br>
and has been adapted by Redfish implementations, adding a 2nd discovery <br=
>
service would damage interoperability in Redfish.<br>
The members on the call really wanted to encourage OpenBMC to implement <br=
>
SSDP instead.<br>
Posted the same to the forum thread.<br></blockquote><div><br></div><div>We=
ll that is unfortunate.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt;<br>
&gt;&gt;&gt; I want to allow the BMC admin to enable and disable the mDNS d=
iscovery<br>
&gt;&gt;&gt; service.=C2=A0 How can this be done?=C2=A0 Options:<br>
&gt;&gt;&gt; 1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.<br>
&gt;&gt;&gt; 2. Move OpenBMC to SSDP and away from mDNS.<br>
&gt;&gt;&gt; 3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protoco=
l.<br>
&gt;&gt; I don&#39;t see a strong reason to &quot;move away&quot; from mDNS=
, but I certainly<br>
&gt;&gt; think that *any* network service should be able to be disabled by =
an<br>
&gt;&gt; administrator to reduce the security footprint if the service is u=
nused.<br>
&gt;&gt;<br>
&gt;&gt; So, either #1 or #3 seems best to me.=C2=A0 Adding optional SSDP s=
upport <br>
&gt;&gt; would<br>
&gt;&gt; be reasonable, but likely only to be added by someone who cares ab=
out<br>
&gt;&gt; discovery in a Windows environment.<br>
&gt;<br>
&gt; I&#39;ve appended the thread to re-ask Redfish if they would support <=
br>
&gt; ManagerNetworkProtocol.mDNS.<br>
&gt; <a href=3D"https://redfishforum.com/thread/267/add-avahi-managernetwor=
kprotocol" rel=3D"noreferrer" target=3D"_blank">https://redfishforum.com/th=
read/267/add-avahi-managernetworkprotocol</a><br>
&gt;<br>
If think we are down to #1 or #2.<br></blockquote><div><br></div><div>I&#39=
;m trying to put myself in the mind of an administrator here, and I&#39;d e=
xpect most are relatively inflexible. Most hyperscalars=C2=A0probably have =
their=C2=A0own discovery system, and are likely supporting that regardless =
of our decision here.=C2=A0 Likewise smaller operations probably aren&#39;t=
 super interested in migrating here.</div><div><br></div><div>Can anyone sp=
eak to the merits of the two protocols? Is there are technical=C2=A0benefit=
 to moving to SSDP.</div></div></div>

--00000000000052a9fb05a36e61c9--
