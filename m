Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B689112A
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 17:16:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469kL01ZthzDrgK
	for <lists+openbmc@lfdr.de>; Sun, 18 Aug 2019 01:16:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 469kKC4wdqzDrfc
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 01:15:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8E3415C08D;
 Sat, 17 Aug 2019 11:15:37 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Historical Sensor Information
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
Date: Sat, 17 Aug 2019 11:15:37 -0400
Message-Id: <5AD86B24-1CD6-49EF-B9DD-C67058DB9C94@fuzziesquirrel.com>
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
To: Emily Shaffer <emilyshaffer@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 10:51 PM, Emily Shaffer <emilyshaffer@google.com> wrote:

> On Wed, Aug 14, 2019 at 4:05 PM Wilfred Smith <wilfredsmith@fb.com> wro=
te:
>> I presume most vendors desire the ability to query historical sensor =20
>> information from the BMC.
>>         Has this feature been implemented already? If so, please direc=
t me.
>>         If not, has someone already begun development?
>>         Is there an existing specification or write-up?
>>         Any =E2=80=98druthers or preferences on how I might proceed su=
ch that my effort benefits the wider community?
>>
>> Wilfred
>
> I think that the space constriction on many BMCs has left folks to
> instead query over IPMI/Redfish and compile historical information
> elsewhere. Can you tell a little more about the use case and indicate
> why you would rather save history on the BMC than off the BMC?

Hi Emily.  FWIW, some of IBMs customers also have the desire to get =20
historical sensor information from the BMC.  In our existing server =20
products this is something we=E2=80=99ve offered them and will continue t=
o offer =20
going forward.

-brad
