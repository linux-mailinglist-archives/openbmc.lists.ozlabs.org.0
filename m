Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA61FEA64
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 06:50:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nTyK2wGbzDqFY
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 14:50:17 +1000 (AEST)
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
 header.s=20161025 header.b=gZTQYcAR; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nR6d1sdMzDqZS
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 12:42:16 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id n23so5361810ljh.7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 19:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/zikI/Skrwl+JnneIEAIDho7kQvMVidcmx2QgCYW+U=;
 b=gZTQYcARfUr1rO7uCHwekCJX4KOqt57+IZlSaYwS2NWUanoOD7FgqQeGcDQwQnAd4g
 jt0Y8zCX3F33kygEIgGuygLkLNeuURWhjYOlNIo0DhXyhTEXCZidetz+g8kj2xK1USoa
 XaCKE2OIQ4HgqonPUFyzNWAjlM3mwjOCUMogWgmmfsmpV0zqeSuYk2i1HnJLNkLFEGoT
 csCyzkM2JINWhks0TrkSeuuCWLQaT5c47EkB4YW217nLgjOgfH/+hLeHeKGiwpsuuuG+
 axcymasPltK88GB6Yrpy+aL+BaB0sKL81By5ejzR30qnd9rH9uC9bZ7rvwm/usR12Xuj
 3tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/zikI/Skrwl+JnneIEAIDho7kQvMVidcmx2QgCYW+U=;
 b=WmouVY7MeOdMDOCSAObwJS6dbWbAY59lqK+j+Mj4eBbLGnLvBlAWR6W9h50TN3sehI
 u5Tn5q7Tqxit4Xnwx5FoqYtF/VE84zsolOkhhPsDWZw/VNTdkJof7u4Dh/ahf1uJpsa+
 FXCaU33q+D9FNRPha6lekGSJe6HWEzB0LyqivkwNrV2H4YKoDJS8NzPUj0msO35TX3lN
 4xpLULwbH5qUaYX4BGndySTVIPOPui9NADL5+ZOufcs/vu7+tIfbMXF7xB0xC6lVnw2f
 LW/PYQo23szkGQjmNawAS5ENfnJ8BaOgFWY7g4H0sxqjIaXkkqAuMErRd8WRbBpJHATr
 ac9g==
X-Gm-Message-State: AOAM533QYSFOU8/jHGhqicSA79i3yEtc4UAZTjO34IIkBYSXkPjJl9Jz
 ug4u/Nr5YHtPcIwrdpTjE2x8w+pwlS89YcGNtCObiQ==
X-Google-Smtp-Source: ABdhPJzgZpJFlQMUqBCIszEf0mPMeT6wIiyzpH5O7QV9P2oocFpck3NzqRfjTGbUEDGWrJDGBn10SzDQw9vfp22fZIw=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr1202874ljj.465.1592448130655; 
 Wed, 17 Jun 2020 19:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
 <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
 <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
 <187e72f2-3ecb-2693-4467-3da3752efde8@linux.intel.com>
 <cd4f6a11-2150-38b9-46a2-2319a3ef574f@linux.intel.com>
In-Reply-To: <cd4f6a11-2150-38b9-46a2-2319a3ef574f@linux.intel.com>
From: Richard Hanley <rhanley@google.com>
Date: Wed, 17 Jun 2020 19:41:59 -0700
Message-ID: <CAH1kD+YAVb0tDzRQRY==OSth8Jt689iMePpwQRewjHuKOn8RNg@mail.gmail.com>
Subject: Re: [EXTERNAL] how to get pci config space
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary="00000000000027116b05a852b96b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000027116b05a852b96b
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

I guess I missed this conversation when it first started. We have some
interest in getting PCIe metadata forwarded to the BMC. I kind of assumed
that the only way was to use a side-band channel, but I getting it through
PECI would be very interesting.

Nancy should have a better idea what we'd be looking for.

- Richard

On Wed, Jun 17, 2020 at 4:38 PM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

> Hi Brad,
>
> On 4/30/2020 2:14 PM, Bills, Jason M wrote:
> >
> >
> > On 12/19/2019 12:45 AM, Neeraj Ladkani wrote:
> >> It depends on requirements like in our use case, our PCIe devices are
> >> fixed so we can preprogram a array in JSON file to include all PCI
> >> functions from a device but for someone else for example OEM who is
> >> selling the servers, it not possible to predict all PCI device can be
> >> connected on PCIe slot so we can let system firmware send this
> >> information or do RdPCIRd via PECI.
> >
> > Sorry for not replying earlier.  I had some legal questions that I was
> > waiting to be resolved.
> >
> > Intel has a downstream solution that uses PECI to get the PCIe
> > information onto D-Bus which is then published to Redfish.  I can now
> > share what we have upstream if there is interest.
> >
> > If so, I guess I'd need a new 'peci-pcie' repo to check into?
> Not sure if anyone saw this or if there is just no interest. :)
>
> Could you please create a peci-pcie repo for this application?
>
> Thanks!
> -Jason
>
> >
> > Thanks,
> > -Jason>
> >> I am not aware of any standards on "Implementation". I have seen
> >> typical implementations where system firmware sends post PCIe data (
> >> exact schema) to BMC using redfish and BMC produces this data over
> >> redfish ( just act like passthrough).
> >>
> >> Neeraj
> >>
> >> -----Original Message-----
> >> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >> Sent: Wednesday, December 18, 2019 4:35 AM
> >> To: Neeraj Ladkani <neladk@microsoft.com>
> >> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> >> Subject: Re: [EXTERNAL] how to get pci config space
> >>
> >> Thanks Neeraj
> >>
> >>> On Dec 18, 2019, at 2:18 AM, Neeraj Ladkani <neladk@microsoft.com>
> >>> wrote:
> >>>
> >>> IMO, we only need DeviceID and VendorID fields from PCIe Config space
> >>
> >> This would probably meet my need to dynamically tune fan control
> >> parameters.  Is it possible to populate instances of the pciedevice
> >> schema based on devid and vendorid alone?
> >>
> >>> and we can let system firmware send this information during boot
> >>
> >> This is how it works on Power systems before OpenBMC, but we have a
> >> custom protocol with a proprietary implementation.  The purpose of my
> >> note was to find out if there are typical implementations or even
> >> standards out there for doing this.
> >>
> >>> or preprogram the information to BMC using EntityManager.
> >>
> >> Can you elaborate on how this would work?  Given the number of pcie
> >> devices out there this seems like it would be hard to do it this way
> >> without a huge database of some kind on the bmc?
> >>
> >>> Regarding BMC-CPU(via PECI), BMC needs to send PECI command to CPU.
> >>> CPU should support RdPCICfg as supported PECI command and thus
> >>> respond with data.
> >>
> >> Ok - that sounds like its all in hardware.  But above it sounded like
> >> you suggest we skip RdPCICfg and instead let system firmware push this
> >> information down to the BMC - do I have it right?  If so why do you
> >> prefer that mechanism?
> >>
> >> thx!
> >>
> >> -brad
> >>
>

--00000000000027116b05a852b96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<div><br></div><div>I guess I missed this convers=
ation when it first started. We have some interest in getting PCIe metadata=
 forwarded to the BMC. I kind of assumed that the only way was to use a sid=
e-band channel, but I getting=C2=A0it through PECI would=C2=A0be very=C2=A0=
interesting.</div><div><br></div><div>Nancy should have a better idea what =
we&#39;d be looking for.</div><div><br></div><div>- Richard</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ju=
n 17, 2020 at 4:38 PM Bills, Jason M &lt;<a href=3D"mailto:jason.m.bills@li=
nux.intel.com">jason.m.bills@linux.intel.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Brad,<br>
<br>
On 4/30/2020 2:14 PM, Bills, Jason M wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 12/19/2019 12:45 AM, Neeraj Ladkani wrote:<br>
&gt;&gt; It depends on requirements like in our use case, our PCIe devices =
are <br>
&gt;&gt; fixed so we can preprogram a array in JSON file to include all PCI=
 <br>
&gt;&gt; functions from a device but for someone else for example OEM who i=
s <br>
&gt;&gt; selling the servers, it not possible to predict all PCI device can=
 be <br>
&gt;&gt; connected on PCIe slot so we can let system firmware send this <br=
>
&gt;&gt; information or do RdPCIRd via PECI.<br>
&gt; <br>
&gt; Sorry for not replying earlier.=C2=A0 I had some legal questions that =
I was <br>
&gt; waiting to be resolved.<br>
&gt; <br>
&gt; Intel has a downstream solution that uses PECI to get the PCIe <br>
&gt; information onto D-Bus which is then published to Redfish.=C2=A0 I can=
 now <br>
&gt; share what we have upstream if there is interest.<br>
&gt; <br>
&gt; If so, I guess I&#39;d need a new &#39;peci-pcie&#39; repo to check in=
to?<br>
Not sure if anyone saw this or if there is just no interest. :)<br>
<br>
Could you please create a peci-pcie repo for this application?<br>
<br>
Thanks!<br>
-Jason<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Jason&gt;<br>
&gt;&gt; I am not aware of any standards on &quot;Implementation&quot;. I h=
ave seen <br>
&gt;&gt; typical implementations where system firmware sends post PCIe data=
 ( <br>
&gt;&gt; exact schema) to BMC using redfish and BMC produces this data over=
 <br>
&gt;&gt; redfish ( just act like passthrough).<br>
&gt;&gt;<br>
&gt;&gt; Neeraj<br>
&gt;&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.co=
m" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<br>
&gt;&gt; Sent: Wednesday, December 18, 2019 4:35 AM<br>
&gt;&gt; To: Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" tar=
get=3D"_blank">neladk@microsoft.com</a>&gt;<br>
&gt;&gt; Cc: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.or=
g" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;&gt; Subject: Re: [EXTERNAL] how to get pci config space<br>
&gt;&gt;<br>
&gt;&gt; Thanks Neeraj<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Dec 18, 2019, at 2:18 AM, Neeraj Ladkani &lt;<a href=3D"mai=
lto:neladk@microsoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt; <b=
r>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; IMO, we only need DeviceID and VendorID fields from PCIe Confi=
g space<br>
&gt;&gt;<br>
&gt;&gt; This would probably meet my need to dynamically tune fan control <=
br>
&gt;&gt; parameters.=C2=A0 Is it possible to populate instances of the pcie=
device <br>
&gt;&gt; schema based on devid and vendorid alone?<br>
&gt;&gt;<br>
&gt;&gt;&gt; and we can let system firmware send this information during bo=
ot<br>
&gt;&gt;<br>
&gt;&gt; This is how it works on Power systems before OpenBMC, but we have =
a <br>
&gt;&gt; custom protocol with a proprietary implementation.=C2=A0 The purpo=
se of my <br>
&gt;&gt; note was to find out if there are typical implementations or even =
<br>
&gt;&gt; standards out there for doing this.<br>
&gt;&gt;<br>
&gt;&gt;&gt; or preprogram the information to BMC using EntityManager.<br>
&gt;&gt;<br>
&gt;&gt; Can you elaborate on how this would work?=C2=A0 Given the number o=
f pcie <br>
&gt;&gt; devices out there this seems like it would be hard to do it this w=
ay <br>
&gt;&gt; without a huge database of some kind on the bmc?<br>
&gt;&gt;<br>
&gt;&gt;&gt; Regarding BMC-CPU(via PECI), BMC needs to send PECI command to=
 CPU. <br>
&gt;&gt;&gt; CPU should support RdPCICfg as supported PECI command and thus=
 <br>
&gt;&gt;&gt; respond with data.<br>
&gt;&gt;<br>
&gt;&gt; Ok - that sounds like its all in hardware.=C2=A0 But above it soun=
ded like <br>
&gt;&gt; you suggest we skip RdPCICfg and instead let system firmware push =
this <br>
&gt;&gt; information down to the BMC - do I have it right?=C2=A0 If so why =
do you <br>
&gt;&gt; prefer that mechanism?<br>
&gt;&gt;<br>
&gt;&gt; thx!<br>
&gt;&gt;<br>
&gt;&gt; -brad<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000027116b05a852b96b--
