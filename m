Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE6203E74
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 19:52:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rH6r3c9ZzDqWn
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 03:52:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Jhhcqt7T; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rH636mTLzDqVn
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 03:51:32 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id s1so9508432ybo.7
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xYGgcD8HjozkC/GhRa3WqiAmHMo/5TQgj9jJJHSmONw=;
 b=Jhhcqt7TnnoUvvIcQDlYQP3StZE8tyjxF2BXmiwLV5ztToUCMb6dlUDBT/GJk0y7Y7
 4J2y/ozanI4eb+7gPMiRoEm989FrRruRu6Q2sR2Lq2HTibcOLXG97EeSfbidWLncEQT/
 woe5R1bkF44f4vQ/vK2Y9DSHZDTBZlUTAMAhcCsjWsVsldFTw0gBq4+Gj/BCicoLuwsW
 Kg7jcbJ/ax2x8xI+CD/c65iRmr2lf0jZioDzpDR6Mo6Soqv3j6OaTDWxbfCXgTCLHz64
 Dm79h4dp8o/zzTrnJ/iZg8U1aXc+iOvADiNGcUbrgzAGqiViQmBpnUFo5Ti8vMgobk8Z
 vgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xYGgcD8HjozkC/GhRa3WqiAmHMo/5TQgj9jJJHSmONw=;
 b=lU1paaNUCecKc0TzRqntYNxby5oH1ml5PH3JGcL3EGPxVnWJhUKOd5/dFDevLOpGyE
 rYYSLupTBzI7e55XIl8kaDQgDXZ26H97ZFhfUTeIUS+w3BDZwFNclCXs6RaZgIgFGEnn
 esoF54HcieDijm5tv8mRVdUlaUl8WxtqyOf3hik6zmqa19o40gjeEAcxRO2GvmLjBdET
 O+RLmZug+DN3cs+d8rhc8K6ZpSvEduPiJ4GbOFszJPE3L4nVvDZcIHtk9tSGIgw+eSht
 8h1RDpWpVEVQxbDWK/f39uHVXyf3GtUHaPwnvWDuV0NbYUVNvrRIgdPrf3Oo1m7p0ppB
 H4gg==
X-Gm-Message-State: AOAM530S7g6PeREDY5tSp6L6zXowMp6EUJ6NJPCecbPswB4npzYXPAeG
 WEe6BjdA/ebv84GiC0V1SpOdRx9d/6rbqN+3+ICKuYEs
X-Google-Smtp-Source: ABdhPJxEJQwgc9PH6mmj82X3UGmKhtqzom2lTMrEphJAFGBDTyMyKx2mXKfovT3r1Ckc/x02vKPWY5ijE2d556EaYtg=
X-Received: by 2002:a25:3c82:: with SMTP id
 j124mr28382621yba.228.1592848288262; 
 Mon, 22 Jun 2020 10:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
 <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
 <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
 <187e72f2-3ecb-2693-4467-3da3752efde8@linux.intel.com>
 <cd4f6a11-2150-38b9-46a2-2319a3ef574f@linux.intel.com>
 <e2e4299776eb50f472da743835362ba3b1e7314a.camel@fuzziesquirrel.com>
In-Reply-To: <e2e4299776eb50f472da743835362ba3b1e7314a.camel@fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 22 Jun 2020 10:50:51 -0700
Message-ID: <CADfYTpF6rgNAF=bK1v5xApGWrw-c_yAL9a6Raa2sbYUEshpVGA@mail.gmail.com>
Subject: Re: [EXTERNAL] how to get pci config space
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="00000000000067b95805a8afe4d3"
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000067b95805a8afe4d3
Content-Type: text/plain; charset="UTF-8"

Oops, I followed this thread a while back, but I lost track of it.

Jason, I have some use cases for getting PCIe information from the BMC.
Some systems where the PCIe configuration isn't static on a given system,
they will have different combinations of cards.  If the BMC can detect
which cards are plugged in, then the BMC can take card-specific action.
Thank you for sharing your code!

----------
Nancy


On Mon, Jun 22, 2020 at 8:48 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Wed, 2020-06-17 at 16:37 -0700, Bills, Jason M wrote:
> > Hi Brad,
> >
> > Not sure if anyone saw this or if there is just no interest. :)
> >
> > Could you please create a peci-pcie repo for this application?
>
> Hi Jason.  peci-pcie created!
>
> thx - brad
>
>

--00000000000067b95805a8afe4d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oops, I followed this thread a while back, but I lost trac=
k of it.<div><br></div><div>Jason, I have some use cases for getting PCIe i=
nformation from the BMC.=C2=A0 Some systems where the PCIe configuration is=
n&#39;t static on a given system, they will have different combinations of =
cards.=C2=A0 If the BMC can detect which cards are plugged in, then the BMC=
 can take=C2=A0card-specific action.=C2=A0 Thank you for sharing your code!=
<div><br><div>----------<div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">Nancy</div></div><br></div></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Jun 22, 2020 at 8:48 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzz=
iesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-06-17 at 16:37 -070=
0, Bills, Jason M wrote:<br>
&gt; Hi Brad,<br>
&gt; <br>
&gt; Not sure if anyone saw this or if there is just no interest. :)<br>
&gt; <br>
&gt; Could you please create a peci-pcie repo for this application?<br>
<br>
Hi Jason.=C2=A0 peci-pcie created!<br>
<br>
thx - brad<br>
<br>
</blockquote></div>

--00000000000067b95805a8afe4d3--
