Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19B163328
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 21:34:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MXdt62BfzDqVj
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:34:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MXdB5TyHzDqHS
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 07:34:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
Date: Tue, 18 Feb 2020 15:34:02 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <25B4F046-9688-4F23-909E-A5D929349E84@fuzziesquirrel.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
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



> On Feb 18, 2020, at 3:25 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Feb 18, 2020 at 09:40:53AM -0500, Brad Bishop wrote:
>>=20
>>=20
>>> On Feb 18, 2020, at 7:56 AM, Vishwanatha Subbanna =
<vishwa@linux.vnet.ibm.com> wrote:
>>> However, if the user changes the setting when the Host is booting, =
timemanager puts them in deferred state. Meaning, timemanager does not =
take the settings into effect until the Host is powered off.
>>=20
>> Can you elaborate on why it does this?
>>=20
>>>=20
>>> So, if someone wants to move from [Manual] to [NTP] or vice-versa, =
when the Host is [On], they need to [power-off] the Host and power it =
back on.
>>=20
>> This seems less than ideal?  Would you agree?
>>=20
>>>=20
>>> This design was chosen because we wanted to give priority to Host.
>>=20
>> What does it mean to give priority to the Host?  Are you trying to =
hide time changes in the time from the host?  Why?
>>=20
>>> Some of us are asking me if we can make a change to take the setting =
changes in effect immediately, not caring the state of the Host.
>>=20
>> Without additional background this is what seems intuitive to me.
>>=20
>=20
> Most of these design points came from considering how it might be best
> for a cloud provider, like Rackspace, we were originally designing =
some
> of this code for.
>=20
> If I'm leasing the host processor from you, I don't necessarily trust
> your time infrastructure and might want to use my own.

Agreed but what does this have to do with what is going on, on the BMC?=
