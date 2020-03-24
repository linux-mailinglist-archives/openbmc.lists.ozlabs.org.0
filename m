Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757E191629
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 17:21:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mxMh4VD7zDqfN
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 03:21:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mxLx6wwlzDqZR
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 03:20:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: corosync?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200324160659.GB23988@patrickw3-mbp>
Date: Tue, 24 Mar 2020 12:20:54 -0400
Message-Id: <318AF56E-3DC0-4B3E-9B41-E49C51A1F3B3@fuzziesquirrel.com>
References: <AA561FEC-E514-41F1-800F-B1085C05D6C2@fuzziesquirrel.com>
 <20200324160659.GB23988@patrickw3-mbp>
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 12:06 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Mar 24, 2020 at 11:33:23AM -0400, Brad Bishop wrote:
>> Is anyone using corosync/pacemaker on a BMC?  Is that a crazy idea? :-=
)
>>
>> thx - brad
>
> Can you elaborate on what you'd be trying to accomplish?

Thanks Patrick.  Yes I will definitely do that at some point.  I=E2=80=99=
m not =20
ready to do this right now though simply because I myself am not sure wha=
t =20
I am trying to accomplish.

In this moment I=E2=80=99m just curious if anyone has any experience with=
 it, or =20
similar tools or frameworks, in a "BMC-like" distributed system, and the =
=20
sorts of problems that were solved with it/them.

thx - brad
