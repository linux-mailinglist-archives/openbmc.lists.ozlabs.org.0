Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E457613FB38
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 22:17:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zH885R3CzDr4r
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 08:17:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rhgEDVmz; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFmy61mtzDqlJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 07:15:30 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id r19so24011725ljg.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=VJAd5mCgPcLhqxaknDVtH3CGHLSlL8c/JEV5+c5oXsc=;
 b=rhgEDVmzdv7JhhT7LYyVHrKHC9hqRpxFarSsmp2qvNTbV09tWa4ZMskz7pyb2XmJW0
 ps/Xvyrr2IibCnPyxEk/taVvMFknbcdpQPEUW3rSui4O2Oalfx/+/oEV6k12HWyk82hl
 5kcvSVo4/LKAR0hNrR04frVPUgizw1MBOUJ0t6Op/2rZokE2p/9FFlVYF7Qytb1U+uSp
 UcRqgeiOPqKLUII+UQ6s6O4aXMBicgjmbtFP1vQ7I2sYNDAdw+QlMYD29oLSFgztMMhX
 n46hDcBkyyXkldXQ1mp8hMc7K82Yh32e0Y8eH6hBjPs6g3duFXXRGrn1FhOeKHjGVFHW
 UEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=VJAd5mCgPcLhqxaknDVtH3CGHLSlL8c/JEV5+c5oXsc=;
 b=ScwovEZysldflcrQna1dNLWBHxglG4UNP8nQNJXhnGXY3pvXCp2Qc758xiDpEhdteT
 7GBgZvDkz1C2C2cDMwyVPSbkqBIlZt5BtNHb7QbwCKBDuPhMlZjUnrskRrvDOzHE6smG
 7qNwGVKO9B5n27GFkfVrbuDJR5QyOo4eFWc9vfawiFQAfsCAltTvOLlQNG7WIc7+E3Tp
 wNTdwZiD2Ydw2s7K5Y1T9q5m1v6tRZr3wU6zM49bcrGASDny+mCc5PHz0oUIni+vGU+f
 k/AAyRG5SUQzAhz5G7lyDZNfo1BAYI0+LUSf4lhR+ESQ5GXQsTiISidJpoSevrppkRYs
 Ss7g==
X-Gm-Message-State: APjAAAW+iJKk+O0lzJRXtWaq7kUnCJkqTf2B4naSZml40scto+ikwWCz
 fG8CcV7EFDqBEWLtS/rXs6Phyb/BNbbyZCydXEZ9gw==
X-Google-Smtp-Source: APXvYqwHom1b3wf6sYof8D9icPr8tfkj1ygXi9gAWUhJuN+oex/JGfskVg3iYgzKTvEbcd4RbD/eIcmArpC4oYBiuHo=
X-Received: by 2002:a05:651c:106f:: with SMTP id
 y15mr3466340ljm.63.1579205725161; 
 Thu, 16 Jan 2020 12:15:25 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Thu, 16 Jan 2020 12:15:14 -0800
Message-ID: <CAH1kD+ZLYHqc8jVWVYjCPCRC3eanb4EZ7xgW_-sOLm2GhnSfzg@mail.gmail.com>
Subject: Summarizing Meeting on BMC Aggregation
To: Neeraj Ladkani <neladk@microsoft.com>, vishwa <vishwa@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000046efd7059c477c18"
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
Cc: Sossy Mansourian <sossy@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000046efd7059c477c18
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We had a meeting today to talk about BMC aggregation.  I wanted to
thank everyone who joined.

Below is my summary of the topics we discussed, and some of the action
items I took from the meeting.  Please let me know if there was something
important that I missed or miss-characterized.
------------------------------------------------------------------------------------------------------

There is a strong need to aggregate data and control features from multiple
BMCs into a single uniform view of a "machine."

The definition of a machine here is relatively opaque, but it can be
thought of as an atomic physical unit for management.  A machine is then
split into multiple domains, each of which is managed by some management
controller (most cases it would be a BMC).  There may be some cases where a
domain has multiple BMCs for redundancy.

Domains are relatively close to each other physically.  Sometimes they will
be in the same chassis/enclosure, while other cases they will be in an
adjacent tray.

One key point that was discussed in this meeting was that the data and
transport of these domains is relatively unconstrained.  Domains may be
connected to the aggregator via a LAN, but there is a community need to
support other transports like SMBus and PCIe.

An aggregator will likely need to be split up into three layers:

1) The lowest layer would detect, import, and transform individual domains
into a common data model.  We would need to provide a specification for
that data model and tooling for implementers to create their own instance
of a domain's data.

2) An aggregation layer would take the instances of these domain level data
models, and aggregate them into a single view or graph of the system.  This
process could be relatively automated graph manipulation.

3) A presentation layer would take that aggregate, and expose it to the
outside world.  This presentation layer could be Redfish, but there is some
divergence on that (see below). Regardless, we would need tooling to
program against the data model for implementers to modify their
presentation layers as needed.

There is fairly broad agreement that Layer 1 would need to support
multiple protocols including; Redfish, PLDM/MCTP, and legacy IPMI systems.
There would need to be support for creating custom drivers for importing
these various transports into a common data model.

There is some diverging needs when it comes to the presentation layer.
Here at Google, we were planning to have the presentation layer be
primarily Redfish and the common data model would be more Redfish focused.
Neeraj pointed out that there are some needs for other presentation layers
besides Redfish.

Some other design considerations include the hardware target for this
aggregator.  This aggregator will have to run on an OpenBMC platform, but
Google has some need for an aggregator to run on host linux machines for
legacy platforms without an out of band connection.

Another consideration is the security of this aggregator.  The aggregation
layer will have the primary responsibility of adjudicating authentication
and authorization for the sub-ordinate nodes.

One of the key takeaways (for me anyways) from this meeting is that there
is a community interest in keeping this aggregator generic, and not tied to
closely to a particular protocol, transport, or presentation layer.  There
was mention of the CIM data model that may be appropriate for this
situation.

We will be having follow-up meetings because this project is going to take
some time to scope out and design.  I will be researching prior art for
existing data models that we could build a presentation layer off of.

Regards,
Richard

--00000000000046efd7059c477c18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We had a meeting today to =
talk about BMC aggregation.=C2=A0 I wanted to thank=C2=A0everyone who joine=
d.=C2=A0</div><div><br></div><div>Below is my=C2=A0summary of the topics we=
 discussed, and some of the action items I took from the meeting.=C2=A0 Ple=
ase let me know if there was something important that I missed or=C2=A0miss=
-characterized.=C2=A0</div><div>-------------------------------------------=
-----------------------------------------------------------</div><div><br><=
/div><div>There is a strong need to aggregate data and control features fro=
m multiple BMCs into a single=C2=A0uniform view of a &quot;machine.&quot;=
=C2=A0=C2=A0</div><div><br></div><div>The definition of a machine here is r=
elatively opaque, but it can be thought of as an atomic physical=C2=A0unit =
for management.=C2=A0 A machine is then split into multiple domains, each o=
f which is managed by some management controller (most cases it would be a =
BMC).=C2=A0 There may be some cases where a domain has multiple BMCs for re=
dundancy.</div><div><br></div><div>Domains are relatively close to each oth=
er physically.=C2=A0 Sometimes they will be in the same chassis/enclosure, =
while other cases they will be in an adjacent tray.</div><div><br></div><di=
v>One key point that was discussed in this meeting was that the data and tr=
ansport of these domains is relatively unconstrained.=C2=A0 Domains may be =
connected to the aggregator via a LAN, but there is a community=C2=A0need=
=C2=A0to support other transports like SMBus and PCIe.</div><div><br></div>=
<div>An aggregator will likely need to be split up into three layers:</div>=
<div><br></div><div>1) The lowest layer would detect, import, and transform=
 individual domains into a common data model.=C2=A0 We would need to provid=
e a specification for that data model and tooling for implementers to creat=
e their own instance of a domain&#39;s data.</div><div><br></div><div>2) An=
 aggregation layer would take the instances of these domain level data mode=
ls, and aggregate them into a single view or graph of the system.=C2=A0 Thi=
s process could be relatively automated graph manipulation.</div><div><br><=
/div><div>3) A presentation layer would take that aggregate, and expose it =
to the outside world.=C2=A0 This presentation layer could be Redfish, but t=
here is some divergence on that (see below). Regardless, we would need tool=
ing to program against the data model for implementers to modify their pres=
entation layers as needed.</div><div><br></div><div>There is fairly broad=
=C2=A0agreement that Layer 1 would need to support multiple=C2=A0protocols =
including; Redfish, PLDM/MCTP, and legacy IPMI systems.=C2=A0 There would n=
eed to be support for creating custom drivers for importing these various t=
ransports into a common data model.</div><div><br></div><div>There is some =
diverging needs when it comes to the presentation layer.=C2=A0 Here at Goog=
le, we were planning to have the presentation layer be primarily Redfish an=
d the common data model would be more Redfish focused.=C2=A0 Neeraj pointed=
 out that there are some needs for other presentation layers besides Redfis=
h.</div><div><br></div><div>Some other design considerations include the ha=
rdware target for this aggregator.=C2=A0 This aggregator will have to run o=
n an OpenBMC platform, but Google has some need for an aggregator to run on=
 host linux machines for legacy platforms without an out of band connection=
.=C2=A0=C2=A0</div><div><br></div><div>Another consideration is the securit=
y of this aggregator.=C2=A0 The aggregation layer will have the primary res=
ponsibility of adjudicating=C2=A0authentication and authorization for the s=
ub-ordinate nodes.</div><div><br></div><div>One of the key takeaways (for m=
e anyways) from this meeting is that there is a community interest in keepi=
ng this aggregator generic, and not tied to closely to a particular protoco=
l, transport, or presentation layer.=C2=A0 There was mention of the CIM dat=
a model that may be appropriate for this situation.</div><div><br></div><di=
v>We will be having follow-up meetings because this project is going to tak=
e some time to scope out and design.=C2=A0 I will be researching prior art =
for existing data models that we could build a presentation layer off of.</=
div><div><br></div><div>Regards,</div><div>Richard</div></div>

--00000000000046efd7059c477c18--
