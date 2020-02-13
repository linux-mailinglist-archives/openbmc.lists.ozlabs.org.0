Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ABB15CA93
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 19:40:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JQL02cxvzDqS5
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 05:40:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JQKD6qdmzDqRZ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 05:39:27 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: skeleton
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3
In-Reply-To: <-3ba5uk-q8utwbge8025-qgehlm-fki8rr7khfu1-p6nczl-6suqdm-6kinuh-56lojropdia6g2uvvm-yjw858-7vs2zw-7n6ouz-c58rf1jalry2-ykhwcn-gv83n533ioofq6fq28-2f5aeoa69232-g6kqx5.1581420554253@email.android.com>
Date: Thu, 13 Feb 2020 13:39:23 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2ABDDF61-AF88-4777-9D51-1D5FA65293B6@fuzziesquirrel.com>
References: <-3ba5uk-q8utwbge8025-qgehlm-fki8rr7khfu1-p6nczl-6suqdm-6kinuh-56lojropdia6g2uvvm-yjw858-7vs2zw-7n6ouz-c58rf1jalry2-ykhwcn-gv83n533ioofq6fq28-2f5aeoa69232-g6kqx5.1581420554253@email.android.com>
To: =?utf-8?B?4oCq4oCq4oCq4oCqSmVmZiBDaGFu4oCs4oCs4oCs4oCs?=
 <ckimchan17@gmail.com>
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



> On Feb 11, 2020, at 6:29 AM, =E2=80=AA=E2=80=AA=E2=80=AA=E2=80=AAJeff =
Chan=E2=80=AC=E2=80=AC=E2=80=AC=E2=80=AC <ckimchan17@gmail.com> wrote:
>=20
> Hi,
> As the description in skeleton github, it will be replaced with proper =
implementation, what's the up to date implementation? where can I find =
those docs or samples?
>=20
> Jeff

Hi Jeff

Most of skeleton has been rewritten.  skeleton covers a lot of BMC =
functions - which one in particular are you interested in?

thx -brad=
