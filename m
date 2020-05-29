Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8741EB2E0
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:09:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bYq870gfzDqNK
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:09:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=98.137.68.83;
 helo=sonic306-20.consmr.mail.gq1.yahoo.com;
 envelope-from=geissonator@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=acIiw9K7; dkim-atps=neutral
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YZvD5WyvzDqg3
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 05:51:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590781866; bh=BS0ZEu8SGm/VLdbENG+oegS1Y2syadw5Ft3Wm9HwZRQ=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From:Subject;
 b=acIiw9K7tzewMNDHdN+gXfJsiXpX47BCLvTPcw0pKvuOyqMJBeltc54SuNajnYrJrrwa3Pmk/G/+tdLGWd9lbcXDO1s+G7H2s9PJWgf/lvXm3iLRub4cE1TyR/6t/0qfPeKOzcTDYIsWJWbguMZxsb8iUA8VHHtyy5+ypKpR3LEfJIFmWV5JEgsWzOUyCN0qSX6xG2VOxSfN99wvq6lOuX5nWLe4qWPm+MQTEO7K6UH0QFkuZTVMA1QKZ9sOee6ipmDFWZKkebRXs/41vqD4A9PO7Yvr28Kdc1J69s4Tvv1z/upc0QXYWPheB53YcPEkZEah5yBYIIwBQu4y8n5KLA==
X-YMail-OSG: lqG1K.EVM1lYrcm8PWQAy96EMUo2S446HOiRRwn.JCZUF4iO0VXSt2yeuSi8gRV
 YmuRPZM5n_BMJwu809Idojk4yqCeEiGQSSaWqDD2chjBVc5eFsOt_9S9TLIRrPn2LsFwMZ953H3E
 2mKaF_snx1ePFILclsT1aiZZFbjHA1J3tiNEZhXhcZ8OpHM0f7377jpqT24PsuxrMp_SxsAnFAFg
 ica4lmKcMxvnmLoqnv8omsQnpYKqgUuYzMI_zr14b0XLI4EeVYfxpnrdn9PRd0oz8hw.7HRQ4uSM
 9R8YoUvTXGThs6dRsM4XeYmYyb0EkQXQuIPDIGS6nvO.Z.am01W1Cp.BcJ6mfAcSFxXhRyv8zzDK
 24BwpDGWZMVssspHxP6slpcN3Y25UbMSI4SoiEGUKq910J_B1ZL3pEMKSlnxsTjQitqqL_A9lenT
 4bYxS.nGhVuEw2O_.Y2yrEYbYSOlpQtZu30gdzvdwYGgxjyBoi2jng7BG_WCHK89rzem1vZm.DID
 _ixC0OoK5zmAFlPhl_UClaFVQaXYBUZG0bEGqVz3KR.AcQEoDrok30L9VekOY2.svr3dLh_VfIWj
 2yPh1VrKaWARSxb1G5t.8RxFhZGrhYLIfpNQDu4_I7BYEMKJHnlK7iL2cMtVtc9rUixaEZtSYQ0v
 FzNnwpX.pBSS2k_8r74StzedQD6XSXYB8PNqUuzPE7PzAiMLRCtypEfpl72Og.VAnhQ.rLWTq6E4
 9TYulUAEdtw1QHfAnLTBC2jnSiK8hBvIwF0ax_smkgkUKvvnpDaMxQ9CGUCgDGMEl5hW5BkjM0K.
 msWseFvIHeS5pzNRAEyErDp1LLPyLaZXqGUk3MkS4RSuHJBy7z9PqwwWiTfF93qJSj6pUEPsaTc4
 9csbCmgIa7liCIGk.4VqHdlslIBgpdzYFCJsrjdmg3ATZaZmKkFKxEQY6J3qY6fXbKUlMmekJ4ri
 ryxhfK1peo7XxCFbbZNtXis.W.erw6_CPnDruOkdL9cSYpBnNSGpwlFJGyG4UxY9Cz.f2K07CRBC
 qzJ9PI3QLvMWNv3aNq6M_O5Te9DZ_Y6zRll2_FuANuxWak.b8xLuOW.Y9bSSV1j.BhHl6_U_ughy
 krIWalmCgPFuLNW6ah6AzkwefnoHXB5Z7rPqI5Icw9fzxatGXd6hZLHSGxBc.kNuvfauhxiiHv8v
 KpVYEpFipxjLCgZzfWOa9UL7R06b9QlxXIntVYtUlfXTjeIfJFaNVVJi1c5YB80S43A4247lXamQ
 _4wo.yMB1M5.lSnWyiWvJZCshl9HMHEu6Ms8_MStVxngjJKJZQ92ZWOe89_H4_irWRQ79uhDvARa
 mSTi.5eKNC.orKPlQYxeQJkdWpW2aJDFIEzl24eUPDhWDfu7T5kotky4ca2ZEqU13z95UiDTqqN3
 JP.YO2kxM4M4ot8HBB8c-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 29 May 2020 19:51:06 +0000
Received: by smtp426.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 53cfee890207c30095a9ad13d800c398; 
 Fri, 29 May 2020 19:51:03 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: request to add pfr-manager repo to CI
From: Andrew Geissler <geissonator@yahoo.com>
In-Reply-To: <63ac8cfd-86b9-43fe-91a0-60f60b4469ee@linux.intel.com>
Date: Fri, 29 May 2020 14:51:01 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5A32CFD-5E30-41C3-AA91-C0918DD79195@yahoo.com>
References: <63ac8cfd-86b9-43fe-91a0-60f60b4469ee@linux.intel.com>
To: "Puli, Apparao" <apparao.puli@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 02 Jun 2020 11:08:13 +1000
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
 vikram.bodireddy@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 29, 2020, at 10:33 AM, Puli, Apparao =
<apparao.puli@linux.intel.com> wrote:
>=20
> Hi Andrew,
>=20
>    Can you please add "pfr-manager" repo to CI builds?

Hey Apparao, sure, done.

>=20
> https://github.com/openbmc/pfr-manager
>=20
> https://gerrit.openbmc-project.xyz/#/q/project:openbmc/pfr-manager
>=20
>=20
> Thanks,
>=20
> -Appu
>=20

