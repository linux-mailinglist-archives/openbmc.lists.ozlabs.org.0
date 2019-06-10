Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545C3B840
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 17:24:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mxkt6pC6zDqPM
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 01:24:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2f; helo=mail-yw1-xc2f.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EXky6J7G"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2f.google.com (mail-yw1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MxkN03NqzDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 01:24:11 +1000 (AEST)
Received: by mail-yw1-xc2f.google.com with SMTP id u134so3933239ywf.6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TT74comd67EJ9Zns6WjqPQEfzWY1Yrktf8V2baY897Q=;
 b=EXky6J7GUtw4ya7LoH2m7Tn+d9Pgno2rValw3j8Y81ESnXNTOBjhV+60srJ+yjulB/
 2yO1SibQOZaxyMMwvAHUj2iUNRiyxPW5xGCeB8X26HT1TP1r4mfkUODy6aBqf2NEDwzX
 GRxFybt/BDyws1hEMYmxHxsc/iAq6LCMEV6MQL+845nmo3WOyhG1rFHfCoqWykHgkI/V
 +V0xwMrttG9OQj25N/7O6qpLhHxMBq81x3coaUWyLry3GXhAxMf+iwndygsFLPixgJBk
 ZJfbkzitBcF+22cipZq5aP5DDz44oif2u6gP5Yiao7fqUTErJr044F1W4vKOna1CJXi4
 cI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TT74comd67EJ9Zns6WjqPQEfzWY1Yrktf8V2baY897Q=;
 b=Zo+6Z2+824FDk2ZjbGjhmmjGmx89h2/eKNQLrk66U2i4jCgJUA4uyu61bRMVuTXbQC
 ftpmLOxOMeYkEMJxFgsGLunKXTaLpJaJAJ/3HbetM8tpiJR1V6kmbsbGvL10Wx8bhWkl
 HjWuA7Qj183XnRFXnAhRaUQoAbqLsOShyb8hjpvsbrSRqUkquT90pcq9lYdEdkoout6M
 a+sybR8ANt6aVF7t0Du09GFV8yhN+UP/zseioraaUSe/BWUOcURpbCilFhyGA5C1rWEY
 HQRc2JUlVfjaZ3obRngJ38b73qAJl+9aehzrPTrfxR0UkhMVhXm32GQYLLiF6V+/uwMS
 LjyA==
X-Gm-Message-State: APjAAAX6ULIpURS6E1jlYClxVnN5OwGvD/UFI4C9qd5ve5ZXz7zAPbCK
 9QSBy170dXIZX1dZL0W/Mk4Nsv7DOHETu4BrUJwOvS5c
X-Google-Smtp-Source: APXvYqwlcYotTHcHMiawKphqXwcl0qCFuFOa8DBWxZzYns9Uqecu1B0gByHTHYnoHh2KoE0iwrUdG31wD8f9yjMKYvg=
X-Received: by 2002:a81:a10b:: with SMTP id y11mr21472839ywg.103.1560180247715; 
 Mon, 10 Jun 2019 08:24:07 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 10 Jun 2019 10:23:57 -0500
Message-ID: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
Subject: Network Settings GUI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000736413058af9c55f"
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

--000000000000736413058af9c55f
Content-Type: text/plain; charset="UTF-8"

Hello all,

Here is the proposal for the Network Settings GUI:
https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical
To navigate, click on any flashing blue rectangles or use the right and
left keyboard arrows.

The design is based on the needs found by our research with stakeholders
and users.

With the GUI, a user is able to assign a Fully Qualified Domain Name
(FQDN), and choose either DHCP or static configuration, for any selected
interface.

If DHCP is chosen, the GUI will reflect the appropriate default gateway,
DNS server, and IP address assigned by the DHCP server. If static is
selected, users manually assign the default gateway, as well as multiple
DNS servers and a single IP address (not including the one assigned by
zeroconf).

Despite the type of configuration selected (DHCP or static),
zero-configuration is always on to protect the user and ensure there is
always an IP address assigned. However, once an interface has a non
zeroconf IP address assigned, users have the flexibility to permanently
delete that address. Currently, users can only temporarily delete these
using CLI; once they reboot, the addresses come back. Permanently removing
IP addresses assigned by zero-configuration is important to customers who
need to account for every single IP address.


NOTE: The reason for limiting to a single IP address per interface is that
our research from users and stakeholders indicates that multiple would
never be used and in fact it could make it easy to make a mistake, so for
this reason we will not support it in the GUI. Additionally, there will be
no support for VLAN as it was not expected by users and added unnecessary
confusion.

Regards,
Jandra Aranguren

--000000000000736413058af9c55f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><div><br></div><div>Here is the proposal for=
 the Network Settings GUI:=C2=A0<a href=3D"https://ibm.invisionapp.com/shar=
e/8ENYRVXAPFD#/319115961_Physical">https://ibm.invisionapp.com/share/8ENYRV=
XAPFD#/319115961_Physical</a>=C2=A0<br>To navigate, click on any flashing b=
lue rectangles or use the right and left keyboard arrows.</div><div><br></d=
iv><div>The design is based on the needs found by our research with stakeho=
lders and users.=C2=A0</div><div><br></div><div>With the GUI, a user is abl=
e to assign a Fully Qualified Domain Name (FQDN), and choose either DHCP or=
 static configuration, for any selected interface.</div><div><br></div><div=
>If DHCP is chosen, the GUI will reflect the appropriate default gateway, D=
NS server, and IP address assigned by the DHCP server. If static is selecte=
d, users manually assign the default gateway, as well as multiple DNS serve=
rs and a single IP address (not including the one assigned by zeroconf).=C2=
=A0</div><div><br></div><div>Despite the type of configuration selected (DH=
CP or static), zero-configuration is always on to protect the user and ensu=
re there is always an IP address assigned. However, once an interface has a=
 non zeroconf IP address assigned, users have the flexibility to permanentl=
y delete that address. Currently, users can only temporarily delete these u=
sing CLI; once they reboot, the addresses come back. Permanently removing I=
P addresses assigned by zero-configuration is important to customers who ne=
ed to account for every single IP address.=C2=A0</div><div><br></div><div><=
br></div><div>NOTE: The reason for limiting to a single IP address per inte=
rface is that our research from users and stakeholders indicates that multi=
ple would never be used and in fact it could make it easy to make a mistake=
, so for this reason we will not support it in the GUI. Additionally, there=
 will be no support for VLAN as it was not expected by users and added unne=
cessary confusion.=C2=A0<br></div><div><br></div><div>Regards,</div><div>Ja=
ndra Aranguren</div><div><br></div><div><br></div></div>

--000000000000736413058af9c55f--
