Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970272B4501
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 14:52:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZVr762yQzDqLc
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 00:52:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZVnv3f1GzDqKh
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 00:50:26 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: I just want to join the openbmc developer community
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <196c13b1-92cd-48eb-83a3-8accdee838f6.moyan.yyb@alibaba-inc.com>
Date: Mon, 16 Nov 2020 08:50:22 -0500
Message-Id: <0C51A5DC-F31B-42C3-898A-7F12272D3435@fuzziesquirrel.com>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <0647d5b3912534e4cb81d7e4953a26799851e857.camel@fuzziesquirrel.com>
 <cc0cc576-62d0-4c63-93d2-11d585b557a6.moyan.yyb@alibaba-inc.com>
 <F137C3AA-8FA4-4404-831F-C8BDA5B1465F@fuzziesquirrel.com>
 <196c13b1-92cd-48eb-83a3-8accdee838f6.moyan.yyb@alibaba-inc.com>
To: =?utf-8?B?IuadqOWLh+WFtSjmnKvlsqkpIg==?= <moyan.yyb@alibaba-inc.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?B?IuW4uOeQsyjnibnnnb8pIg==?= <terui.cl@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?utf-8?B?Iuadjue+vyjkuYnlpKkpIg==?= <yitian.ly@alibaba-inc.com>,
 =?utf-8?B?IuadjuW/l+WFtSjovrnojZIpIg==?= <zhibing.lzb@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:46 AM, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9) <moyan.yyb@al=
ibaba-inc.com> wrote:

> Hi Brad,
>     I see the meta-alibaba has been create, that's greats, thank you. B=
ut while i send the file to the Repository,it has some question as below.=
 If am i have no Authority=EF=BC=9F
> Thank.

Please make sure you=E2=80=99ve gone through the setup instructions here:=
 =20
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges-via-gerrit-server-to-openbmc

After doing the setup described there let us know if there are any =20
additional problems.

thanks - brad
