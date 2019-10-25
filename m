Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAFE4AC1
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 14:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4702vY104FzDqkZ
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 23:08:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4702td5BJXzDqjl
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 23:07:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 60DB36E201;
 Fri, 25 Oct 2019 08:07:49 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: multiple telemetry designs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
Date: Fri, 25 Oct 2019 08:07:49 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
To: piotr.matuszczak@intel.com
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: Justin Thaler <thalerj@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>, "Mihm,
 James" <james.mihm@intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Oct 24, 2019, at 12:14 PM, James Feist =
<james.feist@linux.intel.com> wrote:
>=20
> On 10/24/19 1:48 AM, Matuszczak, Piotr wrote:
>>=20
>> As for the implementation, we have monitoring service and Redfish =
telemetry service implemented (currently without triggers support), =
however it require some refactoring to be production code quality.
>=20
> Is there a WIP review somewhere?

I have this same question.  I wouldn=E2=80=99t mind being able to have a =
look.  Is there anything you need from the community to be able to do =
your work in the open?=
