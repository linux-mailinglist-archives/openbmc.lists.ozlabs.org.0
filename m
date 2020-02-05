Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224F1538EE
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 20:21:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CWdS3VMXzDqT6
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 06:21:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QU6XNM0K; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CWcf355rzDqSk
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 06:20:49 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 9so2302154lfq.10
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 11:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=c2kxHmt3Cexi8uCI7zqlAObZyl88F6C7pYglvAhyQ60=;
 b=QU6XNM0KRDGo591fH9L795xcGijWq5XAidgsmNLiS/76L4M7iCxlL3y3sRjU4/D3Qc
 LpKBNuDOJpE4bcQiBtEeCp5Ynylontzvn605N6SAFHg29MlgnT/6Fq0vgYcX94H1JJyB
 ZUWrvyXOhDXdQSQz3VjRTBG81VwpwbnTQZGxm+q5AzrZfYTOIv5Y593i7Oq78SFaJ/Y4
 zZt3ET3Srjepzg3HxffgqIEFapQNPuZzWMlpxhmVe6I6HjnEjUhK8/4pK3i5qrfeQ8zp
 nlA/haq6Cw5bcv8fGjFpA8m594CsB6p/TDOLk8aRttPQLeVDmwudPLaLB7ywEQKIjqfx
 4dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c2kxHmt3Cexi8uCI7zqlAObZyl88F6C7pYglvAhyQ60=;
 b=LR/g5cDa1eWHcx8TdEEP2wO/yLEvPyHQ0iH3af218qsfVJO/moREBnpODZqjbjx8Va
 t6xkguq8FUYdlDMVIbuh39k5K0+QUNQtFWQb4jr6PE7z2tju0o3ZGNPeYWdjVYqwWG+k
 KFu1YwyG71IAN6iz/iVRnR2OUvB6XI2sW/v6D9IcZzty4oxXe2A6O9sEXiWd8uQEnt0s
 1+iKQCP75hUP1bYgYwhLEA48wQfpmIZU/j7zv5iuFjtvk7ATfYSbO3jo20Zc5DbJEqp0
 thETh6zX5VgiWQO2uP5o/MsBlRUOvi7ouYZzU56GINm46krsfPlGDjDS5gB3QffxIQrL
 wUqA==
X-Gm-Message-State: APjAAAVvXJ0GMOpobV2S8/QLOYJoweU/jQP9ezrlaDkgopUKYs1d9snc
 ISHfPhBjWdLOMtc0VfkxHcw+P79Ms9B/xJJCHLrsEQRC
X-Google-Smtp-Source: APXvYqz3NG4qoxD4HOZyhPFQOKthdl71sLKxZAn32hceiQ0vYXn1DfQYqohWMnWcEx7Vmk62JR3NQ9JN3ZrXI9Hr4zE=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr18389103lfp.96.1580930444801; 
 Wed, 05 Feb 2020 11:20:44 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Wed, 5 Feb 2020 11:20:33 -0800
Message-ID: <CAH1kD+Yz-GLvz9kTWPKngAG77TM0CxXYc9QtVYEawQcw8W=8Sw@mail.gmail.com>
Subject: Sumarizing BMC Aggregator Review
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>, 
 vishwa <vishwa@linux.vnet.ibm.com>, Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000944b43059dd90dc5"
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

--000000000000944b43059dd90dc5
Content-Type: text/plain; charset="UTF-8"

Hi,

Yesterday we had a discussion about a BMC aggregator. I've put together a
summary of the topics we discussed.

----------------------------------------------------------------------------------------
Security

The meeting started by addressing the security model for the aggregator.
The head node of the aggregator should have some form of mutual
authentication with each of the child nodes that are being aggregated. This
authentication between nodes may be waived in cases where there is some
implicit trust in physical link (i.e. an IPMI connection over LPC or SMBUS).

Regardless of the internal authentication mechanism used, the head node
will be solely in charge of authenticating external client requests, and it
will also be in charge of assigning authorization rules.

One point that was made was that if the aggregator ever lives "off" the
machine that may break this security model, since it would force all of the
child nodes to be aware of the external network

----------------------------------------------------------------------------------------------
Supported Protocols and Data Models

We had a discussion about the supported protocols.  There is a pretty
diverse set of protocols that we may want to support as inputs into the
aggregator.  There will need to be a process/daemon that is in charge of
importing child nodes, and converting them to the aggregator data model.

One point that was made in the meeting is that having many processes each
doing their own protocol transformations is a performance risk. This risk
can be mitigated if we assume that an aggregator is only aggregating a
single protocol at a time.

----------------------------------------------------------------------------------------------
Presentation

When it comes to the presentation of the aggregator, there will most likely
be a Redfish frontend and an IPMI frontend.  However, there may be use
cases in the future with upcoming protocols (e.g. RDE over PLDM).

Because there may be a number of disparate requirements for exposing the
aggregator to the outside world, it is very important that the aggregator
provides a rich data model that other applications can program against.

----------------------------------------------------------------------------------------------
Next Steps

At this point I think we have gotten a lot of feedback on use cases and
requirements.  The next step is to iterate on designing a data model.  I
will be putting together a first pass at the data model for us to discuss.

Regards,
Richard

--000000000000944b43059dd90dc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Yesterday we had a discussion about=
 a BMC aggregator. I&#39;ve put together a summary of the topics we discuss=
ed.</div><div><br></div><div>----------------------------------------------=
------------------------------------------</div><div>Security</div><div><br=
></div><div>The meeting started by addressing the security model for the ag=
gregator.=C2=A0 The head node of the aggregator should have some form of mu=
tual authentication with each of the child nodes that are being aggregated.=
 This authentication between nodes may be waived in cases where there is so=
me implicit trust in physical link (i.e. an IPMI connection over LPC or SMB=
US).</div><div><br></div><div>Regardless of the internal authentication mec=
hanism used, the head node will be solely in charge of authenticating exter=
nal client requests, and it will also be in charge of assigning authorizati=
on rules.</div><div><br></div><div>One point that was made was that if the =
aggregator ever lives &quot;off&quot; the machine that may break this secur=
ity model, since it would force all of the child nodes to be aware of the e=
xternal network</div><div><br></div><div>----------------------------------=
------------------------------------------------------------</div><div>Supp=
orted Protocols and Data Models</div><div><br></div><div>We had a discussio=
n about the supported protocols.=C2=A0 There is a pretty diverse set of pro=
tocols that we may want to support as inputs into the aggregator.=C2=A0 The=
re will need to be a process/daemon that is in charge of importing child no=
des, and converting them to the aggregator data model.</div><div><br></div>=
<div>One point that was made in the meeting is that having many processes e=
ach doing their own protocol transformations is a performance risk. This ri=
sk can be mitigated if we assume that an aggregator is only aggregating a s=
ingle protocol at a time.=C2=A0</div><div><br></div><div>------------------=
---------------------------------------------------------------------------=
-</div><div>Presentation</div><div><br></div><div>When it comes to the pres=
entation of the aggregator, there will most likely be a Redfish frontend an=
d an IPMI frontend.=C2=A0 However, there may be use cases in the future wit=
h upcoming protocols (e.g. RDE over PLDM).</div><div><br></div><div>Because=
 there may be a number of disparate requirements for exposing the aggregato=
r to the outside world, it is very important that the aggregator provides a=
 rich data model that other applications can program against.</div><div><br=
></div><div>---------------------------------------------------------------=
-------------------------------</div><div>Next Steps</div><div><br></div><d=
iv>At this point I think we have gotten a lot of feedback on use cases and =
requirements.=C2=A0 The next step is to iterate on designing a data model.=
=C2=A0 I will be putting together a first pass at the data model for us to =
discuss.</div><div><br></div><div>Regards,</div><div>Richard</div></div>

--000000000000944b43059dd90dc5--
