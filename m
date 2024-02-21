Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98A85CF90
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 06:27:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5zA/Ljv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TflCf0WS5z3cPX
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 16:27:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5zA/Ljv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TflC44LYYz3btc
	for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2024 16:27:10 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e48ec75944so163741b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2024 21:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708493225; x=1709098025; darn=lists.ozlabs.org;
        h=mime-version:subject:references:in-reply-to:message-id:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLvvtG9cS80lVHLWFQeiQSou96t8hN+OrLLAoPlf424=;
        b=b5zA/Ljvcgo7cOfkCHUiWiGaWyCryWCylqXcwH+TUMxHbi0ub8bADfQcNNDPAHXLOM
         NzUUZ4iLAhkbcZ0DlMRbWRhbOlehB7GCbRw6opyZYYGv3XBpLeQkIDZ7PXBFNRzVwTU1
         7YJIbCAFsB45P5KSLLq8Yfg1NFBcVq0JmTW8l8/WBGwSO1FIUACAgcDPeAIIGAln9j3o
         gXhRg/lLPN4ORsUppCpBz3Pw5+9MVlr7jM61aDW16DLJ1n61TV7cneVzePADKEqgFAfV
         7lYiWWDNTsM/Smp+CES+Kb16ixMn1ve12KF348JjLzHtpnp43wEy4c5qsgT1EEqu9ecC
         Zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708493225; x=1709098025;
        h=mime-version:subject:references:in-reply-to:message-id:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLvvtG9cS80lVHLWFQeiQSou96t8hN+OrLLAoPlf424=;
        b=jfgC5ktuHinjf+08MCz7BT7c4jOkOyYMTkkYEonDXPpeD3sUaFuo5/R3JcVlQ6y6OD
         KgNywOXlUUxmqBxXZFzdam8Y2JmUMCuU0ArD7pcJC1enxP9nDJ7pfOFR3ywIQOF0Nb1k
         wT70GKW46wSWXuzc5NGsiNoZPdtJrX2IYrQ8o7s/tCDv/ex9YZXNRBpEwEJaaM3i5rkO
         Jc2dPG3Fxp62LfXrLUR8nOHYzpP0D2EYLuIQPb3Wv0wl2zEUlxHbDsJUR/ZJpxNwn1Q4
         P9Y34kpffiH9s56Ry02rLFxQqap9HmzbIhMnmCDEBcVchq0p9ouSKX8bkku7oWSxRWyy
         fDKw==
X-Forwarded-Encrypted: i=1; AJvYcCUY67Xta9RbUW393lKzzFd50U/cYsLWnxNNCcZkSZfFY8hW7uZmxeTwBHWGksWVXMnbQF0TChLUdQQqimZ6xs9w8FgGpfH1b1E=
X-Gm-Message-State: AOJu0YxkIHUQJ+zNNC6MvC/EwI2KwCMm9XU9/l6zpi0JLxVVtZb1u9Qs
	nXktk6xFjcqUyOxqxVs55btQqi6oHZy1BYcBAORAP2VghLxCMJOHsj6+jZRZ
X-Google-Smtp-Source: AGHT+IFq6cocmTeqRt8nzbrYpEcvXetqdTIYKPdKQsN3r2T7lSmiRbXd4MxoZ4Ft5QWi2cFasVqE8A==
X-Received: by 2002:a05:6a00:9294:b0:6e4:7a93:b626 with SMTP id jw20-20020a056a00929400b006e47a93b626mr5161721pfb.20.1708493225280;
        Tue, 20 Feb 2024 21:27:05 -0800 (PST)
Received: from [192.168.29.219] ([49.37.249.80])
        by smtp.gmail.com with ESMTPSA id fc7-20020a056a002e0700b006e144ec8eafsm7907813pfb.119.2024.02.20.21.27.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 21:27:04 -0800 (PST)
Date: Wed, 21 Feb 2024 10:56:56 +0530
From: manojkiran.eda@gmail.com
To: Swetha Nagapuri <swethuu.n@gmail.com>, openbmc@lists.ozlabs.org
Message-ID: <6e03e9e5-f02e-480c-a4ea-3dd72d645766@Spark>
In-Reply-To: <CAKHO_vLYUYfW=sZ-j8iWgfrRpcBSeji5OmnMwWWH5VEfFnH_xA@mail.gmail.com>
References: <CAKHO_vLYUYfW=sZ-j8iWgfrRpcBSeji5OmnMwWWH5VEfFnH_xA@mail.gmail.com>
Subject: Re: Queries reg OpenBMC contribution
X-Readdle-Message-ID: 6e03e9e5-f02e-480c-a4ea-3dd72d645766@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65d589a5_26f28d92_2687"
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

--65d589a5_26f28d92_2687
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Swetha,

> Hi Manojkiran,
>
> Nice to connect with you over=C2=A0email. I am Swetha Nagapuri currentl=
y exploring OpenBMC mctp and PLDM stacks. I am planning to contribute to =
OpenBMC mctp and pldm code bases but have below queries.
>
> 1. How can I contribute to OpenBMC=3F Please let me know the steps if y=
ou have.
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md should help y=
ou with the steps to contribute to openbmc.
> 2 I can't see any=C2=A0=C2=A0source code for mctp over smbus. Can you p=
lease help me to understand why this is not part of openbmc yet=3F I am p=
lanning to raise a couple of gerrits to support this. How can I do that=3F=

Specs like MCTP and PLDM e.t.c are not openbmc specific, they are generic=
 protocols which can be used as a communication means between embedded sy=
stems, There is no need to have mctp/pldm in openbmc. But with that said =
i believe there is support for MCTP over i2c. Look at https://codeconstru=
ct.com.au/docs/mctp-on-linux-introduction/ for more information on what's=
 being supported.
> 3. In PLDM code, I am planning to read sensor data from sysfs nodes dir=
ectly=C2=A0instead of some dbus methods. Can I proceed with this approach=
=3F
>
This question is very vague, and cannot be answered without details. =46e=
el free to come up with a design document capturing what you are planning=
 to do or pitch it in =23pmci discord channel for quick feedback from the=
 community.
> Any response would be appreciated
Please send emails to the community mailing list openbmc=40lists.ozlabs.o=
rg rather than send them personally, questions like these could help othe=
rs too.
> Thanks,
> Swetha

Thanks,
Manoj

--65d589a5_26f28d92_2687
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Hi Swetha,<br /></div>
</div>
<div name=3D=22messageReplySection=22>
<div dir=3D=22auto=22><br /></div>
<blockquote style=3D=22border-left: thin solid rgb(26, 188, 156); margin:=
 5px; padding-left: 10px;=22>Hi Manojkiran,<br />
<br />
Nice to connect with you over&=23160;email. I am Swetha Nagapuri currentl=
y exploring OpenBMC mctp and PLDM stacks. I am planning to contribute to =
OpenBMC mctp and pldm code bases but have below queries.<br />
<br />
1. How can I contribute to OpenBMC=3F Please let me know the steps if you=
 have.&=23160;</blockquote>
<div dir=3D=22auto=22>https://github.com/openbmc/docs/blob/master/CONTRIB=
UTING.md should help you with the steps to contribute to openbmc.</div>
<blockquote style=3D=22border-left: thin solid rgb(26, 188, 156); margin:=
 5px; padding-left: 10px;=22>2 I can't see any&=23160;&=23160;source code=
 for mctp over smbus. Can you please help me to understand why this is no=
t part of openbmc yet=3F I am planning to raise a couple of gerrits to su=
pport this. How can I do that=3F</blockquote>
<div dir=3D=22auto=22>Specs like MCTP and PLDM e.t.c are not openbmc spec=
ific, they are generic protocols which can be used as a communication mea=
ns between embedded systems, There is no need to have mctp/pldm in openbm=
c. But with that said i believe there is support for MCTP over i2c. Look =
at https://codeconstruct.com.au/docs/mctp-on-linux-introduction/ for more=
 information on what's being supported.</div>
<blockquote style=3D=22border-left: thin solid rgb(26, 188, 156); margin:=
 5px; padding-left: 10px;=22>3. In PLDM code, I am planning to read senso=
r data from sysfs nodes directly&=23160;instead of some dbus methods. Can=
 I proceed with this approach=3F<br />
<br /></blockquote>
<div dir=3D=22auto=22>This question is very vague, and cannot be answered=
 without details. =46eel free to come up with a design document capturing=
 what you are planning to do or pitch it in =23pmci discord channel for q=
uick feedback from the community.<br /></div>
<blockquote style=3D=22border-left: thin solid rgb(26, 188, 156); margin:=
 5px; padding-left: 10px;=22>Any response would be appreciated</blockquot=
e>
<div dir=3D=22auto=22>Please send emails to the community mailing list op=
enbmc=40lists.ozlabs.org rather than send them personally, questions like=
 these could help others too.<br /></div>
<blockquote style=3D=22border-left: thin solid rgb(26, 188, 156); margin:=
 5px; padding-left: 10px;=22>Thanks,<br />
Swetha</blockquote>
<div dir=3D=22auto=22><br />
Thanks,<br />
Manoj<br /></div>
</div>
</body>
</html>

--65d589a5_26f28d92_2687--

