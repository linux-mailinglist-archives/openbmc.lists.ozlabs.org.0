Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0138B7A37
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 15:12:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yy1h4hTYzF56d
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 23:12:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Yy0s6lFxzF55y
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 23:11:40 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 659F26DECB;
 Thu, 19 Sep 2019 09:11:36 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: src-uri-bad in flashd and chassisd recipes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <BE45DB48-278B-4D7A-AEA4-4D227484788A@fb.com>
Date: Thu, 19 Sep 2019 09:11:36 -0400
Message-Id: <0757A8A6-6E11-4D79-A881-876DFB948751@fuzziesquirrel.com>
References: <1558DF2D-BC3C-489C-AC4A-9DF7F8332E01@fb.com>
 <277CCA1F-5D7F-4CC1-B7D3-4D7CAAA9593F@fuzziesquirrel.com>
 <BE45DB48-278B-4D7A-AEA4-4D227484788A@fb.com>
To: Wilfred Smith <wilfredsmith@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 6:43 PM, Wilfred Smith <wilfredsmith@fb.com> wrote:

> It would be good for their authors/maintainers to check that I haven=E2=
=80=99t =20
> done anything stupid during the code review.

That would be me.  I will certainly do that.
