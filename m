Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A244B1AD
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 18:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpZ726Zbfz2yg1
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 04:03:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TaZ3qLpc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TaZ3qLpc; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpZ6f1Gs1z2x9K
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 04:02:49 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id t19so4545991oij.1
 for <openbmc@lists.ozlabs.org>; Tue, 09 Nov 2021 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=D8J+ocqO/uMCt+4wTQBc9NZ05W6TlpMzPSTaACETsEE=;
 b=TaZ3qLpczRva/rDlYUCqzzITA+OSfxMU2eunwLKaa/FQiVeZNmdysPUNLdBrsXsX9W
 e2TDtFLp+AlWMcbOO4spR57crmRY+5IO6wGfXfMrS7MeSGaVhv+ZUlQo4Hxzhz1bAP8q
 ctDnHwO6/R9IsJ3xzZtT31/hnnLlq/fdA4azqRYSQsnJ/xwl8rWJWHV30IATo/HR3X3g
 TmMN9i3P+0aH6ueBVIpytMRpCrvqrzA1b29qvG7uxD+ZDjVsX7sVomNqqz5t9taBl+Re
 QoMj1+ajlXBy8Xsq8j6S3RBfQu4BRufDmQahMK0vOhO7Ms36PmuBFDp6v8qxO3h1pJhO
 FnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=D8J+ocqO/uMCt+4wTQBc9NZ05W6TlpMzPSTaACETsEE=;
 b=AzOaUfyyRXkoyAuf+x+E1sUtTWlmughvJkbDg3/SDNmXi4z5XWkkVes/eroVUg9gMu
 sMsiaWFVfais3FKwkvLyPbaZzOGXqujD0PPnnsNiPIjApQ4uAN57Bvq1W1/hN3Bx4TSX
 +LPvsyYN82S0tgZcpwqJpT/L254ZpfmGCSuiF2ycAupyDfuZN1nF0jdhaDWUBGdZnFGs
 /IIhlR74a2nZ6u857ozb6fEw+HHSdw2qCkrUKGSN71Zrql6tIJegW2BHmN5ODDpWhvng
 qeLWEjV/6K3XE/4sPCTohL666lCWhQz6nF7ZmWmWOLC0r7YxSdK/95zk69Y2SD4HXZwC
 rCDQ==
X-Gm-Message-State: AOAM532ocBQLxKl1+nr2lfyl41RKo7DzP4CyIg72HWxLzFuNjgSCx/bw
 E7K9Bbxq6wB1rrG0xDPinl1LO+fj/OI=
X-Google-Smtp-Source: ABdhPJylAwqSdUsEdQU3S5lv5xfOXt6hCTy87vV8LLKRwLSd4kvhoEx/DQBpih6wDUsl5LAieCj8mg==
X-Received: by 2002:a05:6808:6ce:: with SMTP id
 m14mr6816746oih.134.1636477365918; 
 Tue, 09 Nov 2021 09:02:45 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:7856:1a5c:bf88:e43e])
 by smtp.gmail.com with ESMTPSA id t62sm7562606oib.56.2021.11.09.09.02.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:02:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [External]  Re: Add member into Lenovo designated employees list
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <TYZPR03MB607810A7EB928481CAEF3FB5B6929@TYZPR03MB6078.apcprd03.prod.outlook.com>
Date: Tue, 9 Nov 2021 11:02:44 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <EA446CA1-7476-4BFF-9B6B-6A7FD04E73F1@gmail.com>
References: <SL2PR03MB41392EC887269BEBAF453E96B67C9@SL2PR03MB4139.apcprd03.prod.outlook.com>
 <9D88EA1B-4409-4BD8-A341-EAAC8FF0007A@gmail.com>
 <TYZPR03MB607810A7EB928481CAEF3FB5B6929@TYZPR03MB6078.apcprd03.prod.outlook.com>
To: Duke KH Du <dukh@lenovo.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Nov 9, 2021, at 1:52 AM, Duke KH Du <dukh@lenovo.com> wrote:
>=20
> Hi Andrew,
>=20
> Could you help to add AndrewPeng (pengms1@lenovo.com) for gerrit owner =
(lenovo/ci-authorized-owners)?

Sure, done

> Thanks.
>=20
> BR<
> Duke
> -----Original Message-----
> From: Andrew Geissler <geissonator@gmail.com>=20
> Sent: Wednesday, March 31, 2021 6:19 AM
> To: Duke KH Du <dukh@lenovo.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: [External] Re: Add member into Lenovo designated employees =
list
>=20
>=20
>=20
>> On Mar 31, 2021, at 2:14 AM, Duke KH Du <dukh@lenovo.com> wrote:
>>=20
>> Hi Master,
>>=20
>> I would like to add our new member in Lenovo designated employees =
list=20
>> as below=EF=BC=9F
>> Could you help on it?
>=20
> Hey Duke, I noticed Lenovo was not added to the script used by jenkins =
to validate groups so I put up a commit here for that:
> =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41738=

>=20
> Currently the Lenovo gerrit group only has one person in it:
> =
https://gerrit.openbmc-project.xyz/admin/groups/b009effba2bf2e62802e74d749=
db360d52c2a245,members
>=20
> And no one is approved to add people currently:
> =
https://gerrit.openbmc-project.xyz/admin/groups/9f33fac15a90496c21b873f5f9=
918af1a633a47b,members=20
>=20
> Could you recommend someone with a gerrit account that we can add to =
be in charge of adding new developers from your company to this group?
>=20
> It does look like ritzenyang needs to be added to the Lenovo CLA =
though before he can contribute code?
>=20
>> Thanks.
>>=20
>> ritzenyang  ryang14@lenovo.com
>=20

