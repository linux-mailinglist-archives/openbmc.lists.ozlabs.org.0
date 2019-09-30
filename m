Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9EC19F7
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 03:26:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hPqW27NyzDqNs
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 11:25:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hPpt6TWczDqN7
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 11:25:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2019 18:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; d="scan'208";a="197398661"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.61])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2019 18:25:21 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Tao Ren'" <taoren@fb.com>, "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <E3DA1B69-7DA0-4E92-A6EB-BFBB7ADC50CC@fuzziesquirrel.com>
 <7bbd7b65-9cb7-8ca5-4d60-51d48e8735d1@fb.com>
In-Reply-To: <7bbd7b65-9cb7-8ca5-4d60-51d48e8735d1@fb.com>
Subject: RE: i2c-dev wrapper
Date: Mon, 30 Sep 2019 09:25:20 +0800
Message-ID: <000701d5772d$ed76d7c0$c8648740$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKIKT5QsjSXV2it0HP1cB5yV81ikwFxnmHfpdJ7t8A=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWM3YTZlOTktZDgxOC00MDg4LWIwODUtYmY2YWQ2ZmFjNWJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYjFuR0NxZ290ZDBTYUdEQ01GY0FcL1U2N3NhZEhLWTR0S3VDaGhHV01WOVlodjltaUNmWXVpTGJQYWl4V1pPV0IifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: request-justification,no-action
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
Cc: shawnmm@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

FYI, there is an i2c Write/Read API in libpmid for ipmi commands:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/libipmid/utils=
.cpp#L403

Thanks,
Yong

-----Original Message-----
From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of Tao Ren
Sent: Monday, September 30, 2019 9:00 AM
To: Brad Bishop <bradleyb@fuzziesquirrel.com>; OpenBMC Maillist =
<openbmc@lists.ozlabs.org>
Cc: shawnmm@linux.ibm.com
Subject: Re: i2c-dev wrapper

On 9/27/19 4:54 AM, Brad Bishop wrote:
> Does anyone have a favorite i2c-dev API wrapper?  Preferably but not =
necessarily in C++?

i2c-tools (below url) provides several easy-to-use APIs. Maybe you are =
looking for more APIs?

https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/tree/include=
/i2c/smbus.h


Cheers,

Tao

