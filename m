Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3C5333E9
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 01:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L79QF3K0dz3blR
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 09:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R7wL0dn5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=prashantsbemail@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R7wL0dn5; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6kRY570Rz2yK6
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 16:14:00 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id i74so10720112ioa.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Nn0uaERy6CzXx+jXttzQbcnT+W72HO5CRSZP1OHItJE=;
 b=R7wL0dn5DFaASGhP1pTI0Soj3xsOMEPqiFeRqQIBDvxOXL+GRmACCy/lct38fRNOlB
 VZ+F7CXMrO5mz/p4E6nCgmAgo2GU+JwsiCrxx3JjLNoKujgO9LgOBIGTAHX6tswYAG57
 X0nrUYP22F11ufHOW0ycW0qALafuY2wekuVQ1tUtReQ+j9jVYM9hCDXsuVEwhSM1t1Kq
 YTJR/0fFiQwgxDItxUnf7PWWJnukWecN7Ly8mDvGavVo2P4bqy5K6ZwcP+ZBDGgvun+H
 xnPgeXJwFRG6AfPhGpe/xVKCZFofVfYKCDPsjcO5haeDUDL4MHGBtudqic8DyKv8+ILP
 NZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Nn0uaERy6CzXx+jXttzQbcnT+W72HO5CRSZP1OHItJE=;
 b=CUqAB0knUOXnvpcOosTi3OTS9rjjAHkRH7aQgMK7PUW4ugtBwtUUL/ewKsIXcpN0QN
 oUt93KVtHBOLhxgJWXtjMX5NvMm1vDZYenZM8TUf2Ht1dhtjUn3hq5TzgQITuEdgGoiT
 7H7aUl/LvmQd+7i7+kE88EnsyOo/G/NDDHhRGm4dQfPNLU4tO55NDY4KHdYmCcV3Vl9K
 M+YkI/fvDWfITM4eFogBWHk/yY4LPTKotigE6WjLVxdbJvoh0tOricfXc+BiV3MegtIs
 qbExoyIvucnyc1pMGfVlwCqBoB+lB/zbvLPstHCu0sowFx5jw+4lJVQs2NBTLD6SuQQF
 ffew==
X-Gm-Message-State: AOAM530WuZ1JoGGgtisjVpSqJD4253+qOCgatyNkO3HqDBu5DtnYV3b0
 SwVqws1AW0Ghgb1DA0Gg6bh9is2EE/c351LFlM8SOVtqoRaPQg==
X-Google-Smtp-Source: ABdhPJyMjkywwzviR9nT2LxrRO15ukBNMJYB6P+r3zo5Qe20QTrGjqDioIbWHVBLdaq/lc04QtY8EatsaCX9vZ1tdt0=
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr12910000jal.228.1653372836618; Mon, 23
 May 2022 23:13:56 -0700 (PDT)
MIME-Version: 1.0
From: Prashant Badsheshi <prashantsbemail@gmail.com>
Date: Tue, 24 May 2022 11:43:45 +0530
Message-ID: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
Subject: Need help in creating Namespace Journal logging
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009ba83e05dfbbdc68"
X-Mailman-Approved-At: Wed, 25 May 2022 09:28:20 +1000
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

--0000000000009ba83e05dfbbdc68
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working on a yocto based openbmc project, I am trying to add namespace
journal logging.

Can anyone share the steps to create a namespace journal logging in the
yocto based openbmc project.

Also it would be helpful if we have any examples implemented for namespace
journals.



Thanks,

Prashant

--0000000000009ba83e05dfbbdc68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><p class=3D"MsoNormal" style=3D"margin:0in;font-s=
ize:11pt;font-family:Calibri,sans-serif">Hi,</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">I am working on a yocto based openbmc project, I am trying t=
o add
namespace journal logging.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Can anyone share the steps to create a namespace journal
logging in the yocto based openbmc project.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Also it would be helpful if we have any examples implemented
for namespace journals.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Thanks,</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Prashant</p></div></div>

--0000000000009ba83e05dfbbdc68--
