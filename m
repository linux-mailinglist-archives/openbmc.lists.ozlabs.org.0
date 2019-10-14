Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC1D631A
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 14:52:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sJPg5qmxzDqmT
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 23:52:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJJg4z0yzDqkJ
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 23:48:34 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 600431527D5;
 Mon, 14 Oct 2019 08:48:27 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH linux dev-5.3] fsi: aspeed: Add debugfs entries
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XeTmFK92XnTvW1Skjj3y8SnaKDsPoaLoC0utQQL6KHMUA@mail.gmail.com>
Date: Mon, 14 Oct 2019 08:48:27 -0400
Message-Id: <F0FC6F8E-DB1D-4EE6-9EFF-C553112FD55C@fuzziesquirrel.com>
References: <20191014004433.28180-1-joel@jms.id.au>
 <de89b084-be95-4113-97c4-40c62d8572c9@www.fastmail.com>
 <CACPK8XeTmFK92XnTvW1Skjj3y8SnaKDsPoaLoC0utQQL6KHMUA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 9:11 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Mon, 14 Oct 2019 at 00:49, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Mon, 14 Oct 2019, at 11:14, Joel Stanley wrote:
>>> From: Eddie James <eajames@linux.ibm.com>
>>>
>>> Add debugfs entries for the FSI master registers.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> A bit ugly, but:
>>
>> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
> Yes. We will keep it around for in the 5.3 branch to aid with
> debugging, and drop it in 5.4.

I=E2=80=99m just curious.  Does the need for code like this go away after=
 FSI =20
bringup is done or when 5.4 rolls in?  Is this just a statement on how it=
 =20
was done or that it was done at all?

thx - brad
