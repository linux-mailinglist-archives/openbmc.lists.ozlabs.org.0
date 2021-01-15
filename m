Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C22F7DE8
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 15:16:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHNWh3mgnzDsgr
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 01:16:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VvpURxcy; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHNRf6jH6zDsgX
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 01:12:29 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id n186so1763097oia.5
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WnN40OJlwyD423KDpfZQ6UEvCB+BOdUEDiIkq2GfFOU=;
 b=VvpURxcyxUynXdFxJQKEvXt9zt1KIpZHjzyRA6KKDI6kBzzNEOZ6N5tk9UypQciNZJ
 /jrE77YSbx63PKHPA/7I2aBTIFIXEvb4ynu6X/a1Wy1BhmhWfdziG0uWA31tdWn8U+Ml
 VH/gGI3q6kKaip/olvOPWRYqIME3OUteBV5Z4oHZnB5fiVGIwur6gCbA9XQxkEQMxyf4
 oWIyTg/3Jc8OFDaMisbEL4WPt8/FgAxA/Dc/PQRqJWIiBZ9YLT5C77f1FV6Kvpcj8gas
 GGvIcDKvYueBRPV/7Uq8KYaWOXN+3umK6FCOOba75e6PxLM2mW2zV2NzZHfGmQpwGTUo
 bmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WnN40OJlwyD423KDpfZQ6UEvCB+BOdUEDiIkq2GfFOU=;
 b=IBA0KRt4pVtEa0MxTEtbFxz6cCBAp2YKBgsKdgBa1Rb8E0eh17DwG6m1RndTUk2eYH
 hZFIHbpsZrIqIm3p5NyJPWtIDU4z94Qw2Ec75ko7ot7NjCejRTP9scJ+qiacPfH08cQA
 X90FhtJwxSrfK3wvkxQNrDeDs9QdYEgphzhsl5FFtYfLdY4zlubIz7pTH61WYntSTumw
 i0iEfTHWoBgZcfKOG9q4e+kA7IM1PVqVMp4AZUgyTfloOZ5YhUmQ7dzHbp925Q5ZWt5W
 X2uElhGkwKKlrYl1WKwcrTEKSOGqbRnDxhrisDDUk9DUORBRFicUGh6Pr/XG1/FYjD0t
 3P0A==
X-Gm-Message-State: AOAM531Sn3uv7mzFBV8BIv+7lapPv9oHE0dnpu267AKVaJCGKpLReMWt
 idLP73wA/D0dXpCmVtxRy28=
X-Google-Smtp-Source: ABdhPJz4o2vqiAm9UHauo2cKDpT81QpDSC6XvLJsluU46Y+DRSssPiENAKx8PyYYYbDKtRBs6icJ8A==
X-Received: by 2002:aca:4813:: with SMTP id v19mr5728578oia.119.1610719945312; 
 Fri, 15 Jan 2021 06:12:25 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:6856:6d5b:4835:5613])
 by smtp.gmail.com with ESMTPSA id o64sm1656792oif.43.2021.01.15.06.12.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 06:12:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: CI build for yosemitev2
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
Date: Fri, 15 Jan 2021 08:12:23 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B81C083-4FD8-46EC-AA8B-F472EF8CB9BE@gmail.com>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
 <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 15, 2021, at 7:26 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Sun, Jan 03, 2021 at 07:27:06PM -0600, Andrew Geissler wrote:
>>=20
>>=20
>>> On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech =
<velumanit@hcl.com> wrote:
>>>=20
>>> Could you please help us to add the Yosemitev2 machine in the CI =
build verification.=20
>>=20
>> Hi Velumani, glad to see a new system added to openbmc!
>>=20
>> Getting a new system into CI doesn=E2=80=99t have the most defined =
process but
>> I think in general it has to fall under one of these due to our =
constraints
>> in compute power for CI[1]:
>>=20
>> 2) Donate a jenkins compute node to openbmc CI
>=20
> Facebook will allocate a few compute nodes to the Jenkins pool.  =
Andrew,
> I'll work with you to get them online and integrated with Jenkins.  =
Once
> that is done, we can enable Yv2?

Nice! Sounds good to me.

>=20
> --=20
> Patrick Williams

