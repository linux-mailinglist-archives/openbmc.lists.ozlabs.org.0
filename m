Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 086CB8335D
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 15:54:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462x2m3nF0zDr1Q
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 23:54:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 462x116jjHzDqyn
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 23:53:07 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7B80C6DC94;
 Tue,  6 Aug 2019 09:53:03 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] ARM: dts: aspeed: Add Mihawk BMC platform
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9071e58e-8eda-4358-a8dd-d72033eda5e2@www.fastmail.com>
Date: Tue, 6 Aug 2019 09:53:03 -0400
Message-Id: <9D8E97FD-B06C-441C-98D5-4AD19AC2528F@fuzziesquirrel.com>
References: <20190718100229.27585-1-Ben_Pai@wistron.com>
 <9071e58e-8eda-4358-a8dd-d72033eda5e2@www.fastmail.com>
To: Ben Pai <Ben_Pai@wistron.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben

There were a number of fixes requested by Andrew here:
https://lists.ozlabs.org/pipermail/openbmc/2019-July/017123.html

Can you please respond to his note?  I=E2=80=99d really like to get the M=
ihawk =20
device tree added to the kernel.

Thanks! -brad
