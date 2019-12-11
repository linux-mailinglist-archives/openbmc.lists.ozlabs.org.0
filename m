Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABBB11BEBF
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 22:01:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y8W20HBwzDqlp
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:01:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-yw1-xc31.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2SnlTnA"; 
 dkim-atps=neutral
Received: from mail-yw1-xc31.google.com (mail-yw1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y8Rb2Cq6zDqn4
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 07:58:50 +1100 (AEDT)
Received: by mail-yw1-xc31.google.com with SMTP id i126so9502002ywe.7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 12:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgdF3/+RxuFnrs9k3BqyHvwPvlYauqMi5IB0ETtj0II=;
 b=a2SnlTnAfbO/gzSIMPIUj7ReiyzSwbBS24augF7FeO+MSo64z7HWwYMB9CKWbwOtqF
 7GdhHocpTjJ/I9ptchjBAU03vedh+qN6b0MuaKucXdVW76SbeycXVPsN7AZNmufu+QdF
 VwDXS6G36B1iTfPuToJAkN5t2hi2rWzOFLzra/AOz49lfHa8kkpXW61BJT/EQml7SRg4
 34QMUKZA3o2Kfo7B9fm/OGq0Zx2Kl4o19ryhgmNw0WgSRpHSKzkB3TFIXEha3+SQ6Xl5
 XQYIGboGParVTRhw1QT27prE3F3lWNxuvzQerjn6ArnCFir/LxyY9uDUjBnu38HW/2hv
 eWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgdF3/+RxuFnrs9k3BqyHvwPvlYauqMi5IB0ETtj0II=;
 b=kwOrVGbjy9TjWsARgLfS0ZPT08y9zSOHSjID/EHf3hqKVxiiPV1Z6pStaEOix/bZT6
 LyCortM5DUWZeRPPYEUaJ+bKKaiRCC30/sg5wmOl+OX39jWRfowWy+AFmF8RF72wvkDy
 O8pA7LQnrB2kBVuQIeV9NuzIft/um9r/6Zf1hB0beZBYhXLJqcfcziihEkcE3e5fii8E
 D5TaQbevO44cLRf30TQuJO8lPRRjmmdUNkYMfsposAkLNt9f5XDYzsFnW4FtMZFnq7Cj
 o84xahJ6jEFT9kAcY8fNoxeSdGOm8QyjCTJCbs844JjZwDFRFymt41+4ZgNYqdup6dyo
 hGFA==
X-Gm-Message-State: APjAAAUd+3Jw9yScYBOGWIEHt3CdUr8JoJXMgMzUyFQ6bQKI2YjKWEWt
 xOfTbNaXd2/L4pURLa6LZ7tQKyLH+ne+PCxBmzo=
X-Google-Smtp-Source: APXvYqwPHp7UIWLNn/W1D2wfma4Ls+eUU+UGxAnYsbW9xwfsQNQX9+cYAl251bbn9mbQnLl2KYDn5ibltoCdMDwW91k=
X-Received: by 2002:a81:3e1b:: with SMTP id l27mr1381854ywa.503.1576097922994; 
 Wed, 11 Dec 2019 12:58:42 -0800 (PST)
MIME-Version: 1.0
References: <OFD864BB65.24B0BA6C-ON002584C7.007F35B7-002584C7.007F8F78@notes.na.collabserv.com>
In-Reply-To: <OFD864BB65.24B0BA6C-ON002584C7.007F35B7-002584C7.007F8F78@notes.na.collabserv.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 11 Dec 2019 14:58:32 -0600
Message-ID: <CAMTupoSUX641CPqrmekdEj4V1bE4GT-EGkxrf229jBi8O_QTbw@mail.gmail.com>
Subject: GUI Mockups - IBM proposal
To: Derick Montague <Derick.Montague@ibm.com>
Content-Type: multipart/alternative; boundary="000000000000d4d56a059973e47a"
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

--000000000000d4d56a059973e47a
Content-Type: text/plain; charset="UTF-8"

>
> - Jandra and Kathy are creating mockups of the Server LED page that will
> be used to find consensus on the differences in design of the global header
> and primary navigation components.
>


Hey Kathy,

In InVision are mockups for what IBM would like the UI to look like in an
ideal world. We mocked up Server Overview as well to make sure the text
hierarchy would work on pages with more content.

Server LED:
https://ibm.invisionapp.com/share/QANZHJKP74E#/319357713_ServerLED
<https://ibm.invisionapp.com/share/QANZHJKP74E#/319357713_ServerLED>
Server Overview:
https://ibm.invisionapp.com/share/QANZHJKP74E#/319357712_Overview
<https://ibm.invisionapp.com/share/QANZHJKP74E#/319357712_Overview>

During the workgroup last week, we discussed the out of box Bootstrap
components would need to be styled so that the UI meets industry standards,
even in the upstream branch.

We realize this is an IBM centric design, and are looking forward to seeing
what components of this we can agree on to be merged upstream, and which
will have to be left for downstream theming.

Regards,
Jandra A

--000000000000d4d56a059973e47a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">- Jandra and Kathy are creating mockups of the Server LE=
D page that will be used to find consensus on the differences in design of =
the global header and primary navigation components.<br></blockquote><div><=
br></div><div>=C2=A0</div><div>Hey Kathy,=C2=A0</div><div><br></div><div>In=
 InVision are mockups for what IBM would like the UI=C2=A0to look like in a=
n ideal world. We mocked up Server Overview as well to make sure the text h=
ierarchy would work on pages with more content.=C2=A0</div><div><br></div><=
div>Server LED: <a href=3D"https://ibm.invisionapp.com/share/QANZHJKP74E#/3=
19357713_ServerLED">https://ibm.invisionapp.com/share/QANZHJKP74E#/31935771=
3_ServerLED=C2=A0</a><br></div><div>Server Overview:=C2=A0<a href=3D"https:=
//ibm.invisionapp.com/share/QANZHJKP74E#/319357712_Overview">https://ibm.in=
visionapp.com/share/QANZHJKP74E#/319357712_Overview=C2=A0</a></div><div><br=
></div><div>During the workgroup last week, we discussed the out of box Boo=
tstrap components would need to be styled so that the UI meets industry sta=
ndards, even in the upstream branch.</div><div><br></div><div>We realize th=
is is an IBM centric design, and are looking forward to seeing what compone=
nts of this we can agree on to be merged upstream, and which will have to b=
e left for downstream theming.=C2=A0</div><div><br></div><div>Regards,</div=
><div>Jandra A</div><div><br></div></div></div>

--000000000000d4d56a059973e47a--
