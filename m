Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678E100F64
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 00:22:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H4k70W5xzDqbD
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 10:22:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EZn266LC"; 
 dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H4jM3yDSzDqZ2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 10:21:56 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id f18so2963602lfj.6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 15:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2p5lideLSaaH0duIipCJvJUFhjwCwp/2WfHsn7G6Sgs=;
 b=EZn266LCxsgRn8ZAoESfXC7hsftsLY2jNe94UZ4iHptk7aZ5eU4sFqmCm7SIB7e3KL
 KwcAeapFyL/wQGSpGQ3jvHLvTvR3th7E3IMXKu1aHmC07k663vOLd5TlcSJ+dowDQhQM
 ihXKA1D6Vhz5ZDWErSSC23xKApQJ9b7zJviqCFmW38mRi1KrjT+g70u4XrtFaC+/w9iT
 SjKlg2LeO8M5bCCfSh8kZPaLwYyq5LnxhhTrNYYqvTesvcyHvMuRu7RvZ94CeTW30027
 92jt7b//Et9oHx1UqpyUrhWVvqKSqbNN/lQazFabMnmkFBxI+aQP/uPzAz5EyA4VRkCO
 CIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2p5lideLSaaH0duIipCJvJUFhjwCwp/2WfHsn7G6Sgs=;
 b=QoKfzu0pdz9kAcJSCKmG2GH+GWwA0Os+tgvkbsNvu7O0IIqsy7BGgTQBgy7sPI+2gF
 NsmQAB6kp+BJ/cX/g2IBKExlR6JeijPid0tcgy0Rvzzc2sTKbRONMwZxXksmAgge6dAX
 uAF5fpksil34JIdhKBCY4diUnfYzaBp5xS+hVucG3xrmtAoq+WkIUabdGMGs8LZ5rdWx
 uF6H49RN8LihLUzBRjNT7ufoHLymP/4Pxnn1zi3iI0w6BR18+2pUvnA7gBcukAHMgxX8
 Whfs/EFkt4msGHq9/luySUDYuSWPXQowSXFUeje7nviqiWK6v6tXok1fPV+PWKhtKzpN
 bRXg==
X-Gm-Message-State: APjAAAW2jQ/Xh1E7+yB29cvRy5Sm+P7CqiitsLeiFUf3sL2KpN+v6yt/
 i0lsYp49FlqooNjuqfk1kw8bMUnuXHkjo2jQIkWFw2iv
X-Google-Smtp-Source: APXvYqy9IcPNAo4oJi2E4DAILLU+PuQK5Ch8s+RLajXtT2IBGrTKz7p0+kIz7PIFLRFGQFOKFCuY6MXAGboOTcXAYrQ=
X-Received: by 2002:ac2:5395:: with SMTP id g21mr1336210lfh.50.1574119311250; 
 Mon, 18 Nov 2019 15:21:51 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Mon, 18 Nov 2019 15:21:40 -0800
Message-ID: <CAH1kD+YoUr47P-rvCBd8YxKsd-WXtHuqR0pDHFAUSWT+rihmyg@mail.gmail.com>
Subject: Redfish Aggregator vs. RDE over PLDM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000061f1550597a7364c"
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

--00000000000061f1550597a7364c
Content-Type: text/plain; charset="UTF-8"

Hi,

A few weeks ago I wrote a posting about creating a Redfish aggregator.
Here is a brief summary of the use case I am looking to design around:

*In the medium term future, we will need to support hardware that has
multiple management controllers on the same "machine."   This simplest
version of this is a system with a management shared between a BMC and a
Host.  More complex versions will have multiple expansion/accelerator cards
attached to the motherboard.  Each of these expansion cards may have an
instance of open-bmc on them, along with a bmc on the motherboard.  Our end
goal is to have a centralized Redfish service on the motherboard bmc that
acts as the main communication to the outside world.  This motherboard
service would have to take external requests and forward them to the other
on-board management controllers.*

After doing some research I think there are two main paths to accomplishing
this.

*Redfish Aggregator*
In this approach all of the management agents are running a Redfish
service.  The core motherboard service would act as a web based
proxy/translator for all requests.

*Redfish Device Enablement*
When talking to Jeff Autor about a way to implement this, he pointed me to
the recently completed RDE spec.  RDE is a specification that allows
devices to implement portions of a Redfish service over PLDM.  It allows
devices to support Redfish even if they don't have an HTTP stack.

*Thoughts and Questions*
Is RDE on the open-bmc roadmap at the moment?  Are there any other
companies looking into adding support for RDE?  Does anyone have any strong
feelings on this issue?

I think that in the long term a solid implementation of RDE offers a lot
more flexibility than a http aggregator.  However, I'd also expect it's
significantly more effort to get up and running.  Hence why I am asking how
the community feels about this subject.

I'm also interested in hearing what people's experience working with MCTP
or PLDM have been.  Has anyone here used them in production? Are there any
particular highlights or lowlights with the protocols?

Any feedback you have is really appreciated.

Thanks,
Richard

--00000000000061f1550597a7364c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>A few weeks ago I wrote a posting a=
bout creating a Redfish aggregator.=C2=A0 Here is a brief summary of the us=
e case I am looking to design around:</div><div><br></div><div><i>In the me=
dium term future, we will need to support hardware that has multiple=C2=A0m=
anagement controllers on the same &quot;machine.&quot;=C2=A0 =C2=A0This sim=
plest version of this is a system with a management shared between a BMC an=
d a Host.=C2=A0 More complex versions will have multiple expansion/accelera=
tor cards attached to the motherboard.=C2=A0 Each of these expansion=C2=A0c=
ards may have an instance of open-bmc on them, along with a bmc on the moth=
erboard.=C2=A0 Our end goal is to have a centralized Redfish service on the=
 motherboard bmc that acts as the main communication to the outside world.=
=C2=A0 This motherboard service would have to take external requests and fo=
rward them to the other on-board management controllers.</i></div><div><i><=
br></i></div><div>After doing some research I think there are two main path=
s to accomplishing this.=C2=A0=C2=A0</div><div><br></div><div><b>Redfish Ag=
gregator</b></div><div>In this approach all of the management=C2=A0agents a=
re running a Redfish service.=C2=A0 The core motherboard service would act =
as a web based proxy/translator for all requests.=C2=A0=C2=A0</div><div><br=
></div><div><b>Redfish Device Enablement</b></div><div>When talking to Jeff=
 Autor about a way to implement this, he pointed me to the recently complet=
ed RDE spec.=C2=A0 RDE is a specification that allows devices to implement =
portions of a Redfish service over PLDM.=C2=A0 It allows devices to support=
 Redfish even if they don&#39;t have an HTTP stack.</div><div><br></div><di=
v><b>Thoughts and Questions</b></div><div>Is RDE on the open-bmc roadmap at=
 the moment?=C2=A0 Are there any other companies looking into adding suppor=
t for RDE?=C2=A0 Does anyone have any strong feelings on this issue?</div><=
div><br></div><div>I think that in the long term a solid implementation of =
RDE offers a lot more flexibility than a http aggregator.=C2=A0 However, I&=
#39;d also expect it&#39;s significantly more effort to get up and running.=
=C2=A0 Hence why I am asking how the community=C2=A0feels about this subjec=
t.=C2=A0</div><div><i><br></i></div><div>I&#39;m also interested in hearing=
 what people&#39;s experience working with MCTP or PLDM have been.=C2=A0 Ha=
s anyone here used them in production? Are there any particular highlights =
or lowlights with the protocols?</div><div><br></div><div>Any feedback you =
have is really appreciated.</div><div><br></div><div>Thanks,</div><div>Rich=
ard</div></div>

--00000000000061f1550597a7364c--
