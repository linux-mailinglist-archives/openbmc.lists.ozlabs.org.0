Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684D13DFCF
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 17:20:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z8Yr3FdmzDqZD
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 03:20:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z8Xz1B0RzDqXJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 03:19:46 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Redfish Dump Service Proposal
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8b26e6a2-e4cf-b4b9-845b-4172a076e50f@linux.vnet.ibm.com>
Date: Thu, 16 Jan 2020 11:19:41 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <816130E9-117A-41E2-9705-9E0BF6040570@fuzziesquirrel.com>
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <CAK7WoshJ7xMhB_E-ZEpVR+1E_AuGpZfGUFToOihoC5hZ9xyGGg@mail.gmail.com>
 <CAK7WoshsUE2+GXGEgxe99vkz4aEYTdT_ZcNE_k4Y_6x7JLWsTQ@mail.gmail.com>
 <62dc3198-40d4-b0f6-4c31-cf829d9311d6@linux.intel.com>
 <bc442056-ea92-9c65-1028-50839123e5b7@linux.vnet.ibm.com>
 <a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com>
 <62d0d9ee-ab0c-7ec9-403d-dc9487872142@linux.vnet.ibm.com>
 <1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com>
 <8b26e6a2-e4cf-b4b9-845b-4172a076e50f@linux.vnet.ibm.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 16, 2020, at 10:56 AM, Gunnar Mills <gmills@linux.vnet.ibm.com> =
wrote:
>> On 1/16/2020 5:01 AM, Ratan Gupta wrote:
>>=20
>> 	=E2=80=A2 New Properties to be introduced in the logEntry
>> 		=E2=80=A2 Size
>=20
> Redfish size properties typically have the unit in the name.

I wonder if a client could do a HEAD and just check the returned =
content-length?
