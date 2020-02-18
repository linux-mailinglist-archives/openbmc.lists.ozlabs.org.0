Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A9163064
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 20:42:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MWTk0tkqzDqQL
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 06:42:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MWMg3gP1zDqZl
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 06:37:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Redfish message registries, plus translation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <e86e411c-c071-03be-6813-3ec16b38513b@linux.intel.com>
Date: Tue, 18 Feb 2020 14:37:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8095B70B-D625-49C7-AE04-45D3FDDD41C5@fuzziesquirrel.com>
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
 <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
 <d0d215d3-708e-34b7-ba6e-047016b3fd38@linux.ibm.com>
 <e86e411c-c071-03be-6813-3ec16b38513b@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 18, 2020, at 2:25 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
>=20
>=20
> On 2/17/2020 5:53 PM, Joseph Reynolds wrote:
>> On 2/16/20 5:37 PM, Andrew Jeffery wrote:
>>>=20
>>> On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
>>>> Hi James,
>>>>=20
>>>> It's looking like in our future we will have to provide:
>>>>=20
>>>> 1) Redfish logs using multiple message registries that probably =
can't be
>>>>      hardcoded into hpp files and checked in.
>>>>      - For example, a registry for our host firmware and hypervisor =
errors,
>>>>        as our BMC handles displaying logs for them, that we would =
pick up
>>>>        during our build process.
>>>> and
>>>>=20
>>>> 2) Message registry text in multiple languages
>>>>=20
>>>> Those being my goals, I have a few questions:
>>>>=20
>>>> In general, is the multi-language strategy to just provide a =
standalone
>>>> registry array for each language which the code then selects based =
on the
>>>> Language property?
>>>>=20
>>>> To support both of the above, would you be open to having =
functionality
>>>> added
>>>> to read in registries from data files, including based on language? =
Or,
>>>> would you
>>>> have any other ideas for how to support these items?
>>> Bit of a drive-by question, but shouldn't we be using GNU gettext[1] =
to
>>> handle translation?
>> Matt's proposal is for BMCWeb to have two languages:
>> 1. The implementation language.  When BMCWeb writes internal log =
entries, these will be in English.  The BMCWeb developers will use these =
to understand what is going on,  and the BMC admin may be able to read =
the, but they are not for BMC users.
>> We can certainly use gettext to internationalize this. But it is not =
what Matt is asking about.
>> 2. The languages used for Redfish messages.  These message are added =
to the HTTP response body.  These are meant to be read by any BMC REST =
API user.  For example, messages from the Redfish "Base" message =
registry Base.1.7.0.json within DSP8011.  BMCWeb has a hard-coded =
version of a subset of these messages, for example, the AccountModified =
message in =
https://github.com/openbmc/bmcweb/blob/master/redfish-core/src/error_messa=
ges.cpp These messages are defined in English and meant to be =
translated. That's what Matt is asking about.
>> Here's my drive-by response.
>> The current implementation is locked into English-only.  BMCWeb code =
sends messages like this:
>> 1. #include =
https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/error_m=
essages.hpp 2. Write code like: propertyValueModified(res, "myProperty", =
myModifiedValue);
>> This calls the function in error_messages.cpp which is hard-coded =
English.
>> Having hard-coded function calls and hard-coded implementations helps =
with BMCWeb's goal for performance and startup times.
>> https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md
>> However, IMHO, the development process to add new Redfish messages to =
BMCWeb is cumbersome.  It should be as easy as copying Redfish's new =
JSON file.
> To ease this, there is a script in bmcweb that is designed to parse =
the JSON message registries into the header file. =20

So I=E2=80=99m a total bmcweb noob - but any reason why the runtime =
can=E2=80=99t just parse the json?  Why does it have to get converted to =
a header?=
