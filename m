Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1491136
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 17:22:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469kSY1q4zzDqsK
	for <lists+openbmc@lfdr.de>; Sun, 18 Aug 2019 01:22:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 469kRw6y3SzDq9l
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 01:21:32 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 08FCF5C08D;
 Sat, 17 Aug 2019 11:21:29 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Historical Sensor Information
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
Date: Sat, 17 Aug 2019 11:21:28 -0400
Message-Id: <F5853F9E-6FC3-434C-80AE-A0FD95BC2A74@fuzziesquirrel.com>
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
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
Cc: Neeraj Ladkani <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 7:04 PM, Wilfred Smith <wilfredsmith@fb.com> wrote:

> 	Any =E2=80=98druthers or preferences on how I might proceed such that =
my effort benefits the wider community?

Hi Wilfred

Since you asked it in this way :-) if I had my =E2=80=98druthers on how y=
ou=E2=80=99d =20
proceed to benefit me it would be prototyping collectd with the sensors =20
input plugin and the rrd output plugin.

Kun, Neeraj do you agree?

thx - brad
