Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA19310C82
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 15:20:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXHcZ19WbzDvXW
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 01:19:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hU+Ox9jN; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXHbj2bsdzDvWr
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 01:19:09 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id j84so6902796ybg.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 Feb 2021 06:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t+B94bpqWLJrEeYaElAfnIb0T0Xe7xqST8+ZkraGkUs=;
 b=hU+Ox9jNt7jnpkAO9L3boIKGs1rs4m8CC0SBV1AM7hE8Mm9yV3PAB48LhFhUN+evBJ
 Dou0WufM/12hm+EptqXL33eVYUShrYZbhABPv1adsSssN/lETSjd4kG9sdc5X061AZMw
 X5lWcDekQb2e8/ZuO38q661v5wFIPkgFcfu3iGmcNO5IFwNDe3HTmAlC91XCibdKn4qO
 AQre1rjBjX+foPO615+pftWJoEHuHOQqenZ8C+vuaT0+ch6PmFR7uq462R21lX/n5i0t
 v01JsDzfAU+LBR4KuPoGSbAovii0iw/YDXZn2DfvOTtO86pta2a02yTBYnquyvnh8XMQ
 In/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t+B94bpqWLJrEeYaElAfnIb0T0Xe7xqST8+ZkraGkUs=;
 b=aTeDnXJnp88dwXAKsqMhv+jcRFffXtmYn6TujfL7wdRNwZOWVq/1vCr/t4b/47nt7N
 cF4dRLOBi49pV2CNw7/Sv8OgGn0458Ll7LDTt8lsC9179DqTkOgD9TJZT6Qg0zLeYZ2q
 htxIpn+HYELTKLLdMlMk22zGUlb+M3mrWUhzM+fh2Ui0G+dT4O+IV7stdTeF/UOK5J4A
 MBKgzt7D8xEO4NvgABlUN2nw3ML86vSBWM6aXNxFprgYsr7yxT0depCzjh2yzaUhO0mh
 Lx0q7dAXQQn9s0xt+RkBtwMRUFfzOw3oUO3g8lYXjxuNSXMJ7ndE4SUR4YpRouiS00mY
 yv6w==
X-Gm-Message-State: AOAM531yiolzNZoWhHXEx0cym3kdzXzB4xpd4TOH6UbtjA7f8xw2RBQc
 ZfiEy2XY23KWs3uMksEbv42Edqe8+H5OfEuBXAr64FJR54Y=
X-Google-Smtp-Source: ABdhPJw9h0PzPBqUcrJQ/C96VrH7qfZzw0gYxPj0lJcqn9STvshVOzld7vLjiuKoV9TzChdLQAAA+CA0bAT3LZgw2l0=
X-Received: by 2002:a25:1003:: with SMTP id 3mr6441256ybq.294.1612534744284;
 Fri, 05 Feb 2021 06:19:04 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Fri, 5 Feb 2021 19:48:53 +0530
Message-ID: <CAJCnuYnOW4wceOdy_vcyO_PVdw66AjNo9O3VYKsQFY-+9v1KBw@mail.gmail.com>
Subject: Requesting feedback on GUI design - TPM Required policy and Virtual
 TPM
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009f013905ba978086"
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

--0000000000009f013905ba978086
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

*We have decided to remove the TPM Required Policy from the Server Power
Operations Page and move it to the Security Panel page. *
Our findings:
* TPM Required policy is rarely required to be disabled during the power
operations.
* Only in cases of troubleshooting or if a physical TPM card is not part of
the system, is when this setting needs to be disabled.
* In all other cases, it is not advisable to disable it.
* It affects the security of the host boot process.

Similarly, we shall be *adding Virtual TPM to the security page* as well,
since it=E2=80=99s usage is the same and it affects security of the logical
partitions boot process.

Does anyone from the community have any concerns regarding this?

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--0000000000009f013905ba978086
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div><div><b>We have decided to=C2=A0r=
emove the TPM Required Policy from the Server Power Operations Page and mov=
e it to the Security Panel page. </b><br>Our findings:<br>* TPM Required po=
licy is rarely required to be disabled=C2=A0during the power operations.<br=
>* Only in cases of troubleshooting or if a physical TPM card is not part o=
f the system, is when this setting needs to be disabled.<br>* In all other =
cases, it is not advisable to disable it.<br>* It affects the security of t=
he host boot process.<br><br>Similarly, we shall be <b>adding Virtual TPM t=
o the security page</b> as well, since it=E2=80=99s usage is the same and i=
t affects security of the logical partitions boot process.<br><br>Does anyo=
ne from the community have any concerns regarding this?<br></div><div><br><=
font size=3D"2" face=3D"Georgia">Warm regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div>

--0000000000009f013905ba978086--
