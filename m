Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 173361CDDA0
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:47:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LP1B28gnzDqL2
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:47:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jeMazQwj; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LL4r4GDDzDqKV
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 22:35:40 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id c12so13912625oic.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qZDldZW9hTsJd7v480yX7bErVmzzYnLkWsC8dJdDfi8=;
 b=jeMazQwjRmppVmXTaJIKOU0UGzNJV31PnVmYWCH9XzmOP5TLm/fclBrBtQlR1ZVWfT
 EOt5QImuTukGxcTCEBgB1vPZzvUMHahuIGSF0g2MsalUxyRYlUrDRc4O46QV8Pl4v1Xn
 lsM30S0QfjVBnRIAS5+8T0x9NGDbx3jHnNAluDUpoyvPNQs5VszQMempGIyuALCtIIIh
 iVzyNC6Q+ayw7yZ/yhhxG7JlE0fLh4e4B6simXmjRybM2wttA1gHJulH8LZjZ84DmBtn
 MFY18yd1uhO5i98nk4xyRDzB8pFMhD9KjZ+LscdFIuCQxMx+yujptZspjZce/5U71lqi
 /M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qZDldZW9hTsJd7v480yX7bErVmzzYnLkWsC8dJdDfi8=;
 b=rKkQho2z8smuNOgIURnFJ/hVdGZr+b9Bgu/Lg9apW7L94C2GnRuIO3RIuKXYU8vf+8
 MiuEpdtE3AaufGJTCCs2pYwsXWKlcddCdf4OmltU0/kFUYZCJJkKpLhooh+IR1fEwgXq
 jkQgxeT3W2AQpIFKaLuAoWoDRFN886nsghi9ArqBv6Us0zFQ1cy+pOfVbp98K6cqqwIH
 lUjuArkm6H23SEtkPbg1dbTKrrFemj3mc9AplAGDIxaUuEpwrGFPlrO7nIZRrMYVBfcu
 BJxlUl79Wxiy+7yAWLhsV2uqYh73Z81TOFg9TBoZBxuhwO7gm1UXyU49aYItxvmGnkMu
 odAQ==
X-Gm-Message-State: AGi0PubaBiL19EGGImyKhvM5ctiFa+R9OyyJKUajiT+rb5WYQvR1nHm3
 VP6e8EEvt+XicGpPs1LmNls=
X-Google-Smtp-Source: APiQypKkWDgZ87Ers5xqKCKRFKzoqff8T87DpgVM5xEpGBFmq38YzYuspJaKqvmcI4BFJHbeZ3yYzA==
X-Received: by 2002:aca:4d13:: with SMTP id a19mr5786941oib.158.1589200535968; 
 Mon, 11 May 2020 05:35:35 -0700 (PDT)
Received: from ?IPv6:2600:1700:19e0:3310:c096:9c45:8674:7d6f?
 ([2600:1700:19e0:3310:c096:9c45:8674:7d6f])
 by smtp.gmail.com with ESMTPSA id m189sm4610532oig.12.2020.05.11.05.35.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 05:35:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Dunfell Update Status
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <414154FE-AAEA-43DA-889A-BC79CA092ADE@fb.com>
Date: Mon, 11 May 2020 07:35:34 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3BFD8C9-657A-494B-A50B-88AB6CE19093@gmail.com>
References: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
 <16620BAA-69AD-491E-A2C3-265C53DC91F9@gmail.com>
 <0938c96f-b3ff-3a16-7ca4-53bf99488009@linux.vnet.ibm.com>
 <414154FE-AAEA-43DA-889A-BC79CA092ADE@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 8, 2020, at 5:12 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
>=20
> Do we need to install or upgrade any package in our build system to =
build this new dunfel.
> I am seeing lots of build error starting from sanity checker. My build =
machine is centos=20
> CentOS Linux release 7.7.1908.

The main thing that bit us was we needed gcc 6 or greater but that was a
pretty obvious error bitbake spit out before it started building =
anything.

If you have docker installed you could run the build-setup.sh script
that CI uses to verify all builds well with that.
=
https://github.com/openbmc/openbmc-build-scripts/blob/master/build-setup.s=
h=20

>=20
> =EF=BB=BFOn 5/5/20, 1:06 PM, "openbmc on behalf of Gunnar Mills" =
<openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of =
gmills@linux.vnet.ibm.com> wrote:
>=20
>    On 5/5/2020 12:38 PM, Andrew Geissler wrote:
>> An update on the email below. Upstream yocto (including the new =
Dunfell release)
>> went into openbmc master this morning with the following commit:
>>=20
>> =
https://github.com/openbmc/openbmc/commit/82c905dc58a36aeae40b1b273a12f63f=
b1973cf4
>>=20
>>=20
>> Now that we=E2=80=99re past the python3 migration issue, we=E2=80=99ll =
be doing rebases
>> on upstream yocto once a week again (which should prevent needing
>> big painful updates like this).
>    Awesome!
>=20
>>> On Apr 28, 2020, at 2:05 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>>>=20
>>> A fairly quick update on where we are with getting back onto =
upstream yocto.
>>>=20
>>> For those that don=E2=80=99t know, dunfell is the name of the next =
yocto release.
>>>=20
>>> The move from python2 to python3 is mostly behind us, thanks =
everyone,
>>> especially Patrick (stwcx) for all the help there.
>>>=20
>    Thank you Andrew for driving this and to everyone who helped!
>=20
>=20

