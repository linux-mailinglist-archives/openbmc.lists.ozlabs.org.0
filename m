Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD7BD33F
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 22:02:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBv21WmrzDqWy
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:02:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBbh0m0GzDqc1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:49:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D3FB81483A;
 Tue, 24 Sep 2019 15:49:32 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 linux dev-5.3 1/4] dt-bindings: lpc: add aspeed-g6
 compatible strings
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <e7171298-e99d-4d22-aeeb-b08d530cc9ee@www.fastmail.com>
Date: Tue, 24 Sep 2019 15:49:32 -0400
Message-Id: <247461E8-9B9B-4CE0-9FF9-43049A3224A3@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-7-bradleyb@fuzziesquirrel.com>
 <e56e19b0-6483-a351-cc6e-8bc2ce7e74aa@linux.vnet.ibm.com>
 <e7171298-e99d-4d22-aeeb-b08d530cc9ee@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:30 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

Thanks Andrew, Eddie for the review.

>
>
> On Fri, 20 Sep 2019, at 01:55, Eddie James wrote:
>> On 9/19/19 10:23 AM, Brad Bishop wrote:
>>> Assume The AST2600 SoCs contain the same LPC devices as the AST2500.
>
> Has anyone validated the assumption?

They have the same register set in the LPC space.  This is about as far a=
s =20
I=E2=80=99ve gotten.

>
>> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>>
>>
>>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>> ---
>>>   .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt   | 3 ++-
>>>   Documentation/devicetree/bindings/mfd/aspeed-lpc.txt      | 8 +++++=
++-
>
> This should be split in two for upstream as the IPMI changes will need =
to =20
> go
> via Corey while the MFD changes go through Lee.

Split in two in v3.
