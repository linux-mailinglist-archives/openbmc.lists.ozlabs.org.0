Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F005B1B60B6
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:23:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497N084JgdzDqdh
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:23:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Mx823BbzDqcX
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 02:20:59 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Proposal: how to make incompatible changes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
Date: Thu, 23 Apr 2020 12:20:53 -0400
Message-Id: <DA097328-158E-48DA-9F8F-6CD0C7FC4DDE@fuzziesquirrel.com>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
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

at 8:11 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:

> Internally, for inter-process dbus communication the interface version =
=20
> could be checked during compile time to prevent problems that couldn't =
be =20
> detected by compiler/linker automatically.

I like the idea of a stable, versioned DBus API.  Does anyone else?

In the past there was opposition to that.  I=E2=80=99m not sure if there =
still is.

-brad
