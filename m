Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B47C4D1B
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 10:27:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8SIfhPL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S55VX3Tw2z3cCc
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 19:27:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8SIfhPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=raviteja28031990@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S55Tw12bfz2yTx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 19:26:59 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5827f6d60aaso4258245a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697012816; x=1697617616; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qyYxjyCIaAZ9Xxjpqb4VYPizYAbOKkVUZjGMaiG2lLU=;
        b=S8SIfhPLKOHIXT8Hzob8kfxS2HuNSC+vVc9K2NQvjcftcdc7xDf/x6PtrW8S8iHHfp
         oHhig/gFG82XtO8yWw6XdR/lyMJgroDjvZy87RFcoPm+QZXKFJ72KS7bd/ZKmQ2LoQK3
         nJkIw4R74PSE5llBVKQ3NGuZ/sqMQZXZ/1ObyvKKD8JRZylfbMa4zH6rgmUI03TUBhGu
         aW4NcsH1FYayMO8o//qHFHtdlQ/xT+K0enbu0YMUq+S3VYbuGwVK/1NCgctJOYrmc7xz
         6/pWsKKc0UXsJAlBV3vAkEox/Rti31TADEjC5S86MjJ4l5acbUGhzpuOWE2X7i6pdaBT
         bYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012816; x=1697617616;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qyYxjyCIaAZ9Xxjpqb4VYPizYAbOKkVUZjGMaiG2lLU=;
        b=pd8D03taHJ9vIGMRbI5SPb6ksLT1hTaUrIbbqBTpUmAhxNEZzhVRMJ6iwl4qrJyq2V
         LaVyckx6jrOd74nA4oW3+Vkl/tVxIP8XF2k6gqq1VFYGUvTTH3zNVeasZtKrxS6LdltO
         ayz1STW37kvT7hV5zz9lw8aX+tUBtvr5/bjQmqayq937qVZNQv/B1qjrxvj95v3tvMwx
         H5Ms8adL+DJkrUq63rc2aIcfGAb8pbAhZ/uJ61K7aZwpFNaY9ehLhQGAvXpHUoX9lmIn
         wOI5wcEuGrY8OJg3sVHnu77L9IbpLEgjwvqXINGhKt9+wNh1PMc4/Xyt1Et9JRxoEgNs
         6Dpw==
X-Gm-Message-State: AOJu0YxwGB4hrhbLvRoN7UurwdQg3htvHhaHeUA4edt7PxEBYl+/1wbU
	G+0VKGPO1PM6GU2Q6/IaZ/9A+loXcqDTq0+d+Gl0tG7D9Ro=
X-Google-Smtp-Source: AGHT+IFNolhaGxDj734kCe45+e83qolzGZLCxOo8DN6xSC5j4XOfSEcS28TvAdupW0ZsmBWp1gMmunAsotGPgkP09zI=
X-Received: by 2002:a17:90a:348d:b0:273:e8c0:f9b with SMTP id
 p13-20020a17090a348d00b00273e8c00f9bmr17292773pjb.15.1697012816140; Wed, 11
 Oct 2023 01:26:56 -0700 (PDT)
MIME-Version: 1.0
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Wed, 11 Oct 2023 13:56:44 +0530
Message-ID: <CAM4DKZnvnb=XMvxVhrfE13vvb+braB6J2TOhKMRxm+T09u88Fg@mail.gmail.com>
Subject: Add network RoutingPolicyRules at OpenBMC Networkd
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ratan Gupta <ratankgupta31@gmail.com>, wak@google.com, 
	Sunitha Harish <sunithaharish04@gmail.com>, johnathanx.mantey@intel.com
Content-Type: multipart/alternative; boundary="00000000000015dd9f06076c9631"
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

--00000000000015dd9f06076c9631
Content-Type: text/plain; charset="UTF-8"

Hi Team

We have noticed network routing issues when the same subnet IP addresses
configured on both eth0 and eth1 ethernet interfaces, this issue applies to
all types of addresses like static, DHCP and LinkLocal address
configuration.

Currently IPv4 LinkLocal addressing is enabled on both interfaces, so both
interfaces come up with the same subnet Link local IP addresses
(169.254.x.y), but only one link local address will be reachable due to
these same subnet routes on both interfaces.

Here is the systemd issue https://github.com/systemd/systemd/issues/28814
I have discussed in the systemd community and explored systemd's
RoutingPolicyRules configuration as suggested by the systemd community and
it works.

To solve this problem we are proposing to make changes in phosphor-networkd
to configure/populate systemd-networkd RoutingPolicyRule for each IP
address configured on each interface, there is no user intervention or user
interface changes needed. phosphor-networkd internally takes care of
updating the systemd-networkd configuration as required

Here is the example of additional systemd configuration required for each
IP address configured on the interface.
Example:
[Route]
PreferredSource=169.254.202.113
Destination=169.254.202.113/16
Table=11
[Route]
Gateway=169.254.0.0
Table=11
[RoutingPolicyRule]
Table=11
To=169.254.202.113/16
[RoutingPolicyRule]
Table=11
From=169.254.202.113/16

Please share your views on the same.

Regards,
Raviteja

--00000000000015dd9f06076c9631
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team<br><br>We have noticed network routing issues when=
 the same subnet IP addresses configured on both eth0 and eth1 ethernet int=
erfaces, this issue applies to all types of addresses like static, DHCP and=
 LinkLocal address configuration.<br><br>Currently IPv4 LinkLocal addressin=
g is enabled on both interfaces, so both interfaces come up with the same s=
ubnet Link local IP addresses (169.254.x.y), but only one link local addres=
s will be reachable due to these same subnet routes on both interfaces.<br>=
<br>Here is the systemd issue <a href=3D"https://github.com/systemd/systemd=
/issues/28814">https://github.com/systemd/systemd/issues/28814</a> <br>I ha=
ve discussed in the systemd community and explored systemd&#39;s RoutingPol=
icyRules configuration as suggested by the systemd=C2=A0community and it wo=
rks.<br><br>To solve this problem we are proposing to make changes in phosp=
hor-networkd to configure/populate systemd-networkd RoutingPolicyRule for e=
ach IP address configured on each interface, there is no user intervention =
or user interface changes needed. phosphor-networkd internally takes care o=
f updating the systemd-networkd configuration as required<br><br>Here is th=
e example of additional systemd configuration required for each IP address =
configured on the interface.<br>Example:<br>[Route]<br>PreferredSource=3D16=
9.254.202.113<br>Destination=3D<a href=3D"http://169.254.202.113/16">169.25=
4.202.113/16</a><br>Table=3D11<br>[Route]<br>Gateway=3D169.254.0.0<br>Table=
=3D11<br>[RoutingPolicyRule]<br>Table=3D11<br>To=3D<a href=3D"http://169.25=
4.202.113/16">169.254.202.113/16</a><br>[RoutingPolicyRule]<br>Table=3D11<b=
r>From=3D<a href=3D"http://169.254.202.113/16">169.254.202.113/16</a><br><b=
r>Please share your views on the same.<div><br></div><div>Regards,</div><di=
v>Raviteja</div></div>

--00000000000015dd9f06076c9631--
