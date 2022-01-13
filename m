Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8348D3E3
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 09:53:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZJ9p3qjwz2yxm
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 19:53:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4HR79HO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=logananth13.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=I4HR79HO; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZJ9N6Xwgz2yY7
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 19:52:54 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id n11so6677255plf.4
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=D9rJ/Ilp7aW9P45vRSl749+MzTdGSXcoTQDvPeSsCzQ=;
 b=I4HR79HOOvGYf6PZ5eDTHIFoqXnPHm3L3pB9UP+E37Bd4kmgttLky1EFpAxLgIMRYk
 dId+7n4gn/ZnLihFjhT15ivNXFHOytQywxInpVHRNOfTqsm1Rkc9FgtBjVI1biJFv5nv
 U6cheyu4emRU1uNH547zF+ptX4g0674hGkCvE4KP3spORWB4WvC8rsM0W9Cuy3a4MIID
 YtraxJlOqFuja8ZIoSdAUrITpTETZUy62t4NZHuemLv+lX4pI/O/j2cNNlVAgUnxjpJZ
 91Ir7iJvHDYG0oJcAy09XpKg1rLUu35zVur4bWFqVkC0oHe8MRP+yF19WHe6e+nLNPgL
 hOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=D9rJ/Ilp7aW9P45vRSl749+MzTdGSXcoTQDvPeSsCzQ=;
 b=H5KW6ioIL8Sz1QfvA1ZmDzlBrs8HcEpbdkPJmqUktyGPukYp9LS0yZl8KVu0a8bd06
 kVpz/meLaqn3MSBOhZ/mBVlt6zDfr+6n90dukUtfHfuoqE5uZyxrvEZypvw8ZFZ+B4oo
 E1SsWBc98SptE72+ZkN7V+F7FQ1w9eEndIih1QlTZStV7o/O+EakCBjE0MdSKVFTHVCC
 6G8r4FqoHtAhDcm/xV6dX/zoES50aaRZ87HX4p8w6eG1hzSukl5NQQ5SycUl7AbSW5Vm
 cfiXRc1V91DId2Mw7on6D4S5FVuk/Je7U1+rTuOR2+3A6jqOeeOTGyj7PDjhrNic8eo8
 3i4Q==
X-Gm-Message-State: AOAM532Ek5Vz63hI8xe99pt8rhpAFBxXzfsc1Pjz5VLFCW9y72jg24b0
 Pdk5rz56JT1hebVuwmooFsx1GFPKwqXiqKXcafc=
X-Google-Smtp-Source: ABdhPJyTbzBZJj7ExOnZOIciWh6s38KR8IyYCRhrFxk+rmDuNceeH3DvS3hh5TrL94cmgvWXSyBqkwD63Z6Ypd1HK6U=
X-Received: by 2002:a05:6a00:1582:b0:4bb:4bc8:7ecd with SMTP id
 u2-20020a056a00158200b004bb4bc87ecdmr3311572pfk.46.1642063971895; Thu, 13 Jan
 2022 00:52:51 -0800 (PST)
MIME-Version: 1.0
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Thu, 13 Jan 2022 14:22:40 +0530
Message-ID: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
Subject: Procedure for the send review on u-boot patch
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000be4c6805d572cfd5"
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
Cc: velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000be4c6805d572cfd5
Content-Type: text/plain; charset="UTF-8"

Hai All,

In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc

I want to send a review on this particular branch in u-boot through
upstream.
Is there any specific procedure to upstream it,
kindly provide your suggestions.


Thanks,
Logananth.s

--000000000000be4c6805d572cfd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hai All,<div><br></div><div>In openbmc/u-boot repo(branch =
- v2016.07-aspeed-openbmc)</div><div><a href=3D"https://github.com/openbmc/=
u-boot/tree/v2016.07-aspeed-openbmc" target=3D"_blank">https://github.com/o=
penbmc/u-boot/tree/v2016.07-aspeed-openbmc</a><br></div><div><br></div><div=
>I want to send a review on this particular branch in u-boot through upstre=
am.=C2=A0<br>Is there any specific procedure to upstream it,=C2=A0<br>kindl=
y provide your suggestions.</div><div><br></div><div><br></div><div>Thanks,=
</div><div>Logananth.s</div></div>

--000000000000be4c6805d572cfd5--
