Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299BD2E2B
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 17:52:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pwZS4RQDzDqQy
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 02:52:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=ryanarnellibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lg8dK8tH"; 
 dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pwYn4MSVzDqKf
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 02:51:36 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id m7so6760724lji.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cXXfTtpvQhWnqy5InSLqxKcMWF4pgAblF/KdVhCy5sA=;
 b=lg8dK8tHPdJJoEPGfCsfqAq340NQEbVdcVRK8EVpnJ73BAItzNPBD8M3CIhMf4BhCw
 6THa57ohCxYfioXCF7Dz48hxiA/ASJzh8pbyaMFQ7b6oQWcYjGjy8s023dNdeMi1qD/X
 jvJj/1VBGIWXAKcgYIS7ZXSLwZr1tS55w8osRfF8dU7guuFjww/DGHzCsLgxh2i/0tve
 ZHxcC4SESrQY/tHj5qvnjbA4LUVRp5EfgTmLbSNsJJI+1LBnLywJ6m3JOOd0Q2p80Fjr
 RfEKleMsGJtnCQ+svZfkB1a568l+smrflYEvSpSy2PO4lxyuSYwmw/qqEKG9yTWWPvvL
 CqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cXXfTtpvQhWnqy5InSLqxKcMWF4pgAblF/KdVhCy5sA=;
 b=Ic3tEOdLP3DSzmnPPcCSkebIWDzU8xpfEmjsJqF7hdCiX7Qyk9YURNoBAVR72JAtMA
 QC2/FRD+zGAdz+hdLnrYtyH24N87aB6lf7MdrZAqSqPNgefYUI86yKKOA96OF7iTm5ac
 i/IhMsWrhgZFV50Hvv+LoRgY3NMAxRxTXYVBv6xG6WpraUSCLwBC66+x4G3cEgmFdtoP
 UvuHJ6dWolt1BYRs2gzsxEO1GxoH5bHUs6cmOJs4zS1TduTLb1b6ZChVkspg61StOt+g
 /SdHJADfqkPBWVm4EiBp62ozv0FDi5Jb+ssspeOHKYxYsaABHW2Y8g31sWTAK5Q53hf4
 keZg==
X-Gm-Message-State: APjAAAUZxSQEKY6dXMv3sRVmgaJ00qbJLNqezmz8sgAyujU9j68HeqFI
 m7SWalAsDLAGf55kYCzEx3x5qikiREUnoun9DlfmUMZy
X-Google-Smtp-Source: APXvYqwKlpUFARS614K1jMW8J4ZrOOhTPZG4KUL1IV+sb7f9ufr9M/kODLMxyRbAQoRFfq30vKVNpcLwpnbzkPoEmZ8=
X-Received: by 2002:a2e:a166:: with SMTP id u6mr6781796ljl.209.1570722690713; 
 Thu, 10 Oct 2019 08:51:30 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Arnell <ryanarnellibm@gmail.com>
Date: Thu, 10 Oct 2019 10:51:19 -0500
Message-ID: <CAH3qHnbZVuwJSCixhhdftym0=U7keyfDz7MgV1JqS1-AkBsYOQ@mail.gmail.com>
Subject: GUI: Manage Power Usage page update
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000054d1a059490603a"
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

--000000000000054d1a059490603a
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
We have a slightly new design for our *Manage Power Usage *page. Now it is
a little more organized and we are displaying min max power operations.
Please feel free to leave your comments in the prototype here -
https://ibm.invisionapp.com/share/QKNZAGECYNF#/319278728_01-Min-Max

Also you can leave your feedback here-
https://github.com/openbmc/phosphor-webui/issues/95

Thank you!

*Ryan Arnell  *
UX Engineer | IBM Design | IBM Studios Austin

--000000000000054d1a059490603a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<div>We have a slightly new design for our =
<b>Manage Power Usage </b>page. Now it is a little more organized and we ar=
e displaying min max power operations. Please feel free to leave your comme=
nts in the prototype here - <br><a href=3D"https://ibm.invisionapp.com/shar=
e/QKNZAGECYNF#/319278728_01-Min-Max">https://ibm.invisionapp.com/share/QKNZ=
AGECYNF#/319278728_01-Min-Max</a><br><div><br></div><div>Also you can leave=
 your feedback here-</div><div><a href=3D"https://github.com/openbmc/phosph=
or-webui/issues/95">https://github.com/openbmc/phosphor-webui/issues/95</a>=
<br></div></div><div><br></div><div>Thank you!</div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;font-famil=
y:Verdana"><b style=3D"">Ryan Arnell=C2=A0=C2=A0</b>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
UX Engineer | IBM=C2=A0Design=C2=A0|=C2=A0IBM Studios Austin</p></div></div=
>

--000000000000054d1a059490603a--
