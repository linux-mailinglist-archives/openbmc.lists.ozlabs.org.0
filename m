Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D14188E6D
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 20:56:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hkSW3q2WzDqlr
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 06:56:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hkRs2HfJzDqlg
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 06:55:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Updates for phosphor-debug-collector interfaces
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAK7WosgjqxpsfP9FUV5oTYyf_dKYWOXC4FUVEd4Oci5ndz1Zvg@mail.gmail.com>
Date: Tue, 17 Mar 2020 15:55:32 -0400
Message-Id: <7D628E56-7231-49AB-8727-DC1FBB11B4C2@fuzziesquirrel.com>
References: <CAK7WosgjqxpsfP9FUV5oTYyf_dKYWOXC4FUVEd4Oci5ndz1Zvg@mail.gmail.com>
To: dhruvaraj S <dhruvaraj@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 12:05 PM, dhruvaraj S <dhruvaraj@gmail.com> wrote:

> Proposing these updates to the existing phosphor-debug-collector DBus
> interfaces to support dumps that get created and stored in the host
> but notified and offloaded through BMC. looking for inputs from the
> team.
>
> Design doc: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28260
>
> Update dump entry and add Notify method :
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+=
/28621
>
> InitiateOffload method for the dump entry:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+=
/28784/7
>
> --------------
> Dhruvaraj S


Hi Dhruv

I merged these today before I saw this because they had been open for qui=
te =20
some time, already had a couple +1s, and there wasn=E2=80=99t any push-ba=
ck.

For anyone watching - any feedback would still be welcome=E2=80=A6

thx - brad
