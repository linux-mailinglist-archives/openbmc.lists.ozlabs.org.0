Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C415F37
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 10:18:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ystJ5zV9zDqN1
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 18:18:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uEu5oZ21"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yssQ2pMgzDqJM
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 18:17:11 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c13so7915865pgt.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:in-reply-to:references:subject:mime-version;
 bh=hPtGHl7E45d4QxNyrbT2MKl+cGW33j93OLReeD2FSXA=;
 b=uEu5oZ219btL6bEEoyYMm0CHuxCQ6KImQlSLfA+tBcDvud5Fw6wbK0gQVVM/iyqvfd
 neZ5YoGmzb+3BxziZlb/tPDVfnFaXZyMq+xqLZvlf89gu+pU/b+fYMR+iMRVLsaje5Gt
 CoflF0Cgmj+iQVxIyJxN11J4DVq7VXXT38/0+5fpjMqwcFJaH4RFDPXXOkEri7Mc87x9
 oE1EnYMkwV7q54SqIJhTo+NUrutaT88i1PsTBI+41sc+26ZWLN++lc2A9mLCIgEWdlRU
 3cCSfDXS0CnqvpShydQ0+Hf0MnX502gE6NrrVdGY+tlVVNWMj0TeyU1ZG4GI9WOBbqya
 TZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
 :subject:mime-version;
 bh=hPtGHl7E45d4QxNyrbT2MKl+cGW33j93OLReeD2FSXA=;
 b=kOop0CZQUlSYL5C8mLsSvukfdNQzN4o1lazshJJclNnGkADsWDMTy59V5KOCgCayRC
 275Lwi+UAduhoecSDv24QMSZRpBkh6dkQyzhszgbDt9fLPSgxcYZWiRRQPJXdEg9w2V3
 K6Me1IlWDuWEK3jm5uYh/geO7j8inLUnxRX/qdS3NZT1LG2qJqIOa0sklD0Sz8w8bHYQ
 I96f2rMRsu5THScH9ILPPI8pjv0yWpywAUJRR2BsABOGTDAb6G3LWes4LuyRk8AG80Ct
 435lFFy6xeR9rhLIDNjBG1gqVk78V2GgyfIq/krr0CKV2Nvx4Xm7vlc/qQ7N/IP5NyC5
 6ZJQ==
X-Gm-Message-State: APjAAAXZ6BBG+hjTqMFNSWSuHKrXchnmp6lUbbaiYYCAHiMw7xFuCww8
 dLlXl9Y5Ic4mg7SLiiGD0mseu8hCdbU=
X-Google-Smtp-Source: APXvYqzgcHKXGunABykhdqGZkIfKIy6Lt5VmEESwk14o4CBhEnT32eMbpNqGVUWx6pQCtlQwcMhHgg==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr35379667pfk.239.1557217026829; 
 Tue, 07 May 2019 01:17:06 -0700 (PDT)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id g10sm33749190pfg.153.2019.05.07.01.17.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:17:06 -0700 (PDT)
Date: Tue, 7 May 2019 16:16:58 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: openbmc@lists.ozlabs.org, Brad Chou <chou.brad@gmail.com>
Message-ID: <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
In-Reply-To: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
Subject: Re: How to set GPIOs to pre-defined value
X-Readdle-Message-ID: acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5cd13eff_721da317_706"
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

--5cd13eff_721da317_706
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Brad,

You could pre-define GPIOs setting on linux kernel device tree when loadi=
ng kernel.
I=E2=80=99m not sure which SoC you used. Maybe you could direct apply you=
 wanted on linux/arch/arm/boot/dts folder or custom create once. Hope the=
 information could help you.

Thanks,

Samuel Jiang
On May 7, 2019, 2:47 PM +0800, Brad Chou <chou.brad=40gmail.com>, wrote:
> Hi All,
> Is there a way to set ALL GPIOs to a pre-defined initial in/out directi=
on and high/low value =3F
> I see there is a gpio=5Fdefs.json, but seems only the direction can be =
set, ie. In or out, not high / low settings.
> Now, I am using a shell script with gpioset utility to do the job.
> But I know using shell to do it is a bad idea.
> Does anyone have better ideas =3F
>
> Thanks.

--5cd13eff_721da317_706
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>
<div dir=3D=22auto=22>Hi Brad,
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>You could pre-define GPIOs setting on linux kernel =
device tree when loading kernel.</div>
<div dir=3D=22auto=22>I=E2=80=99m not sure which SoC you used. Maybe you =
could direct apply you wanted on linux/arch/arm/boot/dts folder or custom=
 create once. Hope the information could help you.</div>
</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Thanks,
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22><br style=3D=22font-size: 14px; font-family: -ap=
ple-system, BlinkMacSystem=46ont, sans-serif;=22 /></div>
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22>Samuel Jiang</div>
</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On May 7, 2019,=
 2:47 PM +0800, Brad Chou &lt;chou.brad=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>Hi=
 All,<br />
Is there a way to set ALL GPIOs to a pre-defined initial in/out direction=
 and high/low value =3F<br />
I see there is a gpio=5Fdefs.json, but seems only the direction can be se=
t, ie. In or out, not high / low settings.<br />
Now, I am using a shell script with gpioset utility to do the job.<br />
But I know using shell to do it is a bad idea.<br />
Does anyone have better ideas =3F<br />
<br />
Thanks.</blockquote>
</div>
</body>
</html>

--5cd13eff_721da317_706--

